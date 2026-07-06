/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Deterministic FFT Spectrum Analyzer - Complete Buildable
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "string.h"
#include <stdio.h>
#include <math.h>
#include "arm_math.h"

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef struct {
    uint8_t data[1056]; /* 4 header + 1024 payload, padded to 32-byte align */
    volatile uint8_t ready;
} TxPacket_t;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define ADC_BUFFER_SIZE      1024U
#define ADC_HALF_BUFFER      (ADC_BUFFER_SIZE / 2U)
#define FFT_SIZE             512U
#define FFT_MAG_SIZE         (FFT_SIZE / 2U)

/* Actual sample rate: 96MHz / (2247+1) = 42704.8 Hz */
#define ACTUAL_SAMPLE_RATE   42704.8f
#define FREQ_PER_BIN         (ACTUAL_SAMPLE_RATE / (float)FFT_SIZE)

/* Post-FFT normalization: Hann gain(2) × single-sided(2) / N */
#define FFT_NORM_FACTOR      (4.0f / (float)FFT_SIZE)

/* Ring buffer depth */
#define TX_QUEUE_DEPTH       4U

/* UART packet sizes */
#define PKT_RAW_SIZE         (4U + FFT_MAG_SIZE * sizeof(float32_t)) /* 1028 */
#define PKT_ALIGNED_SIZE     ((PKT_RAW_SIZE + 31U) & ~31U)           /* 1056 */

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
/* USER CODE END PD */

/* Private variables ---------------------------------------------------------*/
#if defined(__ICCARM__)
#pragma location=0x2007c000
ETH_DMADescTypeDef DMARxDscrTab[ETH_RX_DESC_CNT];
#pragma location=0x2007c0a0
ETH_DMADescTypeDef DMATxDscrTab[ETH_TX_DESC_CNT];
#elif defined(__CC_ARM)
__attribute__((at(0x2007c000))) ETH_DMADescTypeDef DMARxDscrTab[ETH_RX_DESC_CNT];
__attribute__((at(0x2007c0a0))) ETH_DMADescTypeDef DMATxDscrTab[ETH_TX_DESC_CNT];
#elif defined(__GNUC__)
ETH_DMADescTypeDef DMARxDscrTab[ETH_RX_DESC_CNT] __attribute__((section(".RxDecripSection")));
ETH_DMADescTypeDef DMATxDscrTab[ETH_TX_DESC_CNT] __attribute__((section(".TxDecripSection")));
#endif

ETH_TxPacketConfig TxConfig;
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;
ETH_HandleTypeDef heth;
TIM_HandleTypeDef htim2;
UART_HandleTypeDef huart2;
UART_HandleTypeDef huart3;
DMA_HandleTypeDef hdma_usart3_tx;
PCD_HandleTypeDef hpcd_USB_OTG_FS;

/* USER CODE BEGIN PV */
/* ADC DMA buffer - MUST be in SRAM1 for DMA access */
uint16_t adc_buffer[ADC_BUFFER_SIZE] __attribute__((aligned(32), section(".dma_buffer")));

/* Double-buffered staging area - copy happens IN ISR before DMA overwrites */
static uint16_t adc_staging_A[FFT_SIZE] __attribute__((aligned(32)));
static uint16_t adc_staging_B[FFT_SIZE] __attribute__((aligned(32)));

/* Flags set by ISR, consumed by main loop */
static volatile uint8_t buf_A_ready = 0;
static volatile uint8_t buf_B_ready = 0;

/* FFT working buffers - all 32-byte aligned */
static float32_t fft_in[FFT_SIZE]      __attribute__((aligned(32)));
static float32_t fft_out[FFT_SIZE]     __attribute__((aligned(32)));
static float32_t fft_mag[FFT_MAG_SIZE] __attribute__((aligned(32)));
static float32_t hann_lut[FFT_SIZE]    __attribute__((aligned(32)));
static arm_rfft_fast_instance_f32 fft_inst;

/* UART TX ring buffer with 32-byte aligned packets */
static TxPacket_t tx_queue[TX_QUEUE_DEPTH];
static volatile uint8_t tx_head = 0;
static volatile uint8_t tx_tail = 0;
static volatile uint8_t uart_busy = 0;

/* Diagnostic counters */
static volatile uint32_t diag_half_cnt = 0;
static volatile uint32_t diag_full_cnt = 0;
static volatile uint32_t diag_overrun  = 0;
static volatile uint32_t diag_uart_err = 0;

/* Heartbeat state */
static uint32_t hb_tick = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MPU_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ETH_Init(void);
static void MX_USB_OTG_FS_PCD_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM2_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_USART3_UART_Init(void);
/* USER CODE BEGIN PFP */
static void FFT_Init(void);
static void FFT_Process(const uint16_t *src);
static void Build_Binary_Packet(void);
static void UART_Service(void);
static void Heartbeat_Task(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* ═══════════════════════ ADC DMA Callbacks ══════════════════════ */
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef *hadc)
{
    if (hadc->Instance == ADC1) {
        diag_half_cnt++;
        SCB_InvalidateDCache_by_Addr((uint32_t *)&adc_buffer[0],
                                     ADC_HALF_BUFFER * sizeof(uint16_t));
        memcpy(adc_staging_A, &adc_buffer[0], FFT_SIZE * sizeof(uint16_t));
        buf_A_ready = 1;
    }
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc)
{
    if (hadc->Instance == ADC1) {
        diag_full_cnt++;
        SCB_InvalidateDCache_by_Addr((uint32_t *)&adc_buffer[ADC_HALF_BUFFER],
                                     ADC_HALF_BUFFER * sizeof(uint16_t));
        memcpy(adc_staging_B, &adc_buffer[ADC_HALF_BUFFER], FFT_SIZE * sizeof(uint16_t));
        buf_B_ready = 1;
    }
}

void HAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc)
{
    (void)hadc;
}

/* ═══════════════════════ UART DMA Callbacks ═══════════════════════ */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART3) {
        uart_busy = 0;
    }
}

void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART3) {
        diag_uart_err++;
        uart_busy = 0;
        __HAL_UART_CLEAR_PEFLAG(huart);
        if (tx_tail != tx_head) {
            tx_tail = (tx_tail + 1) % TX_QUEUE_DEPTH;
        }
    }
}

/* ══════════════════════ FFT Engine ═════════════════════════════ */
static void FFT_Init(void)
{
    /* PURE Hann window - no gain baked in */
    for (uint32_t i = 0; i < FFT_SIZE; i++) {
        hann_lut[i] = 0.5f * (1.0f - cosf(2.0f * M_PI * (float)i / (float)(FFT_SIZE - 1U)));
    }

    arm_status s = arm_rfft_fast_init_f32(&fft_inst, FFT_SIZE);
    if (s != ARM_MATH_SUCCESS) {
        Error_Handler();
    }
}

static void FFT_Process(const uint16_t *src)
{
    /* Pass 1: True DC mean */
    float32_t sum = 0.0f;
    for (uint32_t i = 0; i < FFT_SIZE; i++) {
        sum += (float32_t)src[i];
    }
    float32_t mean = sum / (float32_t)FFT_SIZE;

    /* Pass 2: Convert + subtract mean + PURE Hann window */
    for (uint32_t i = 0; i < FFT_SIZE; i++) {
        fft_in[i] = ((float32_t)src[i] - mean) * hann_lut[i];
    }

    /* Real FFT */
    arm_rfft_fast_f32(&fft_inst, fft_in, fft_out, 0);

    /* Correct packed output per CMSIS docs */
    fft_mag[0] = fabsf(fft_out[0]) * FFT_NORM_FACTOR;
    arm_cmplx_mag_f32(&fft_out[2], &fft_mag[1], FFT_MAG_SIZE - 1U);

    /* Single scalar normalization for all AC bins */
    for (uint32_t i = 1; i < FFT_MAG_SIZE; i++) {
        fft_mag[i] *= FFT_NORM_FACTOR;
    }

    /* Sanity check */
    for (uint32_t i = 0; i < FFT_MAG_SIZE; i++) {
        if (!isfinite(fft_mag[i])) fft_mag[i] = 0.0f;
    }
}

/* ═════════════════════ Binary Packet Builder ═════════════════ */
static void Build_Binary_Packet(void)
{
    uint8_t idx = tx_head;
    uint8_t *pkt = tx_queue[idx].data;

    pkt[0] = 0xAA;
    pkt[1] = 0x55;
    pkt[2] = (uint8_t)(FFT_MAG_SIZE & 0xFF);
    pkt[3] = (uint8_t)((FFT_MAG_SIZE >> 8) & 0xFF);

    memcpy(&pkt[4], fft_mag, FFT_MAG_SIZE * sizeof(float32_t));

    tx_queue[idx].ready = 1;
}

/* ═══════════════════════ UART Service (Main Loop) ═══════════════ */
static void UART_Service(void)
{
    if (uart_busy != 0) return;

    uint8_t idx = tx_tail;
    if (tx_queue[idx].ready == 0) return;

    uart_busy = 1;
    SCB_CleanDCache_by_Addr((uint32_t *)tx_queue[idx].data, PKT_ALIGNED_SIZE);

    if (HAL_UART_Transmit_DMA(&huart3, tx_queue[idx].data, PKT_RAW_SIZE) != HAL_OK) {
        uart_busy = 0;
        tx_queue[idx].ready = 0;
        tx_tail = (tx_tail + 1) % TX_QUEUE_DEPTH;
    } else {
        tx_queue[idx].ready = 0;
        tx_tail = (tx_tail + 1) % TX_QUEUE_DEPTH;
    }
}

/* ═══════════════════════ Heartbeat Diagnostics ═════════════════ */
static void Heartbeat_Task(void)
{
    if ((HAL_GetTick() - hb_tick) >= 500U) {
        hb_tick = HAL_GetTick();
        HAL_GPIO_TogglePin(LD1_GPIO_Port, LD1_Pin);

        static uint32_t last_check = 0;
        if ((HAL_GetTick() - last_check) >= 1000U) {
            last_check = HAL_GetTick();
            if (diag_half_cnt == 0 && diag_full_cnt == 0) {
                for (int i = 0; i < 5; i++) {
                    HAL_GPIO_TogglePin(LD3_GPIO_Port, LD3_Pin);
                    HAL_Delay(50);
                }
            }
            diag_half_cnt = 0;
            diag_full_cnt = 0;
        }
    }
}
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  HAL_Init();
  SystemClock_Config();
  MPU_Config();
  SCB_EnableICache();
  SCB_EnableDCache();

  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ETH_Init();
  MX_USB_OTG_FS_PCD_Init();
  MX_ADC1_Init();
  MX_TIM2_Init();
  MX_USART2_UART_Init();
  MX_USART3_UART_Init();

  memset(adc_buffer, 0, sizeof(adc_buffer));
  memset(tx_queue, 0, sizeof(tx_queue));

  FFT_Init();

  /* Startup UART test */
  {
      const char *msg = "USART3 VCP Test OK\r\n";
      HAL_UART_Transmit(&huart3, (uint8_t *)msg, strlen(msg), 1000);
      HAL_GPIO_WritePin(LD1_GPIO_Port, LD1_Pin, GPIO_PIN_SET);
      HAL_Delay(200);
      HAL_GPIO_WritePin(LD1_GPIO_Port, LD1_Pin, GPIO_PIN_RESET);
  }

  if (HAL_ADC_Start_DMA(&hadc1, (uint32_t *)adc_buffer, ADC_BUFFER_SIZE) != HAL_OK) {
      Error_Handler();
  }
  if (HAL_TIM_Base_Start(&htim2) != HAL_OK) {
      Error_Handler();
  }

  while (1)
  {
      if (buf_A_ready) {
          buf_A_ready = 0;
          FFT_Process(adc_staging_A);
          uint8_t next_head = (tx_head + 1) % TX_QUEUE_DEPTH;
          if (next_head == tx_tail) {
              diag_overrun++;
              tx_tail = (tx_tail + 1) % TX_QUEUE_DEPTH;
          }
          Build_Binary_Packet();
          tx_head = next_head;
      }

      if (buf_B_ready) {
          buf_B_ready = 0;
          FFT_Process(adc_staging_B);
          uint8_t next_head = (tx_head + 1) % TX_QUEUE_DEPTH;
          if (next_head == tx_tail) {
              diag_overrun++;
              tx_tail = (tx_tail + 1) % TX_QUEUE_DEPTH;
          }
          Build_Binary_Packet();
          tx_head = next_head;
      }

      UART_Service();
      /* In main.c while(1) loop, after UART_Service() */
//      static uint32_t sync_counter = 0;
//      if (++sync_counter >= 100) {
//          sync_counter = 0;
//          if (!uart_busy) {
//              static const uint8_t RESYNC_MARKER[4] = {0xAA, 0x55, 0xFF, 0xFF};
//              uart_busy = 1;
//              SCB_CleanDCache_by_Addr((uint32_t *)RESYNC_MARKER, 32);
//              HAL_UART_Transmit_DMA(&huart3, (uint8_t *)RESYNC_MARKER, 4);
//          }
//      }
      Heartbeat_Task();
  }
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 96;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) Error_Handler();
  if (HAL_PWREx_EnableOverDrive() != HAL_OK) Error_Handler();

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK) Error_Handler();
}

static void MX_ADC1_Init(void)
{
  ADC_ChannelConfTypeDef sConfig = {0};
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
  hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T2_TRGO;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DMAContinuousRequests = ENABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK) Error_Handler();

  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_144CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) Error_Handler();
}

static void MX_ETH_Init(void)
{
   static uint8_t MACAddr[6] = {0x00, 0x80, 0xE1, 0x00, 0x00, 0x00};
  heth.Instance = ETH;
  heth.Init.MACAddr = &MACAddr[0];
  heth.Init.MediaInterface = HAL_ETH_RMII_MODE;
  heth.Init.TxDesc = DMATxDscrTab;
  heth.Init.RxDesc = DMARxDscrTab;
  heth.Init.RxBuffLen = 1524;
  if (HAL_ETH_Init(&heth) != HAL_OK) Error_Handler();
  memset(&TxConfig, 0, sizeof(ETH_TxPacketConfig));
  TxConfig.Attributes = ETH_TX_PACKETS_FEATURES_CSUM | ETH_TX_PACKETS_FEATURES_CRCPAD;
  TxConfig.ChecksumCtrl = ETH_CHECKSUM_IPHDR_PAYLOAD_INSERT_PHDR_CALC;
  TxConfig.CRCPadCtrl = ETH_CRC_PAD_INSERT;
}

static void MX_TIM2_Init(void)
{
  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 0;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 2247;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK) Error_Handler();
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK) Error_Handler();
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK) Error_Handler();
}

static void MX_USART2_UART_Init(void)
{
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 2000000;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK) Error_Handler();
}

static void MX_USART3_UART_Init(void)
{
  huart3.Instance = USART3;
  huart3.Init.BaudRate = 2000000;
  huart3.Init.WordLength = UART_WORDLENGTH_8B;
  huart3.Init.StopBits = UART_STOPBITS_1;
  huart3.Init.Parity = UART_PARITY_NONE;
  huart3.Init.Mode = UART_MODE_TX_RX;
  huart3.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart3.Init.OverSampling = UART_OVERSAMPLING_16;
  huart3.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart3.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart3) != HAL_OK) Error_Handler();
}

static void MX_USB_OTG_FS_PCD_Init(void)
{
  hpcd_USB_OTG_FS.Instance = USB_OTG_FS;
  hpcd_USB_OTG_FS.Init.dev_endpoints = 6;
  hpcd_USB_OTG_FS.Init.speed = PCD_SPEED_FULL;
  hpcd_USB_OTG_FS.Init.dma_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.phy_itface = PCD_PHY_EMBEDDED;
  hpcd_USB_OTG_FS.Init.Sof_enable = ENABLE;
  hpcd_USB_OTG_FS.Init.low_power_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.lpm_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.vbus_sensing_enable = ENABLE;
  hpcd_USB_OTG_FS.Init.use_dedicated_ep1 = DISABLE;
  if (HAL_PCD_Init(&hpcd_USB_OTG_FS) != HAL_OK) Error_Handler();
}

static void MX_DMA_Init(void)
{
  __HAL_RCC_DMA2_CLK_ENABLE();
  __HAL_RCC_DMA1_CLK_ENABLE();
  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);
}

static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();

  HAL_GPIO_WritePin(GPIOB, LD1_Pin|LD3_Pin|LD2_Pin, GPIO_PIN_RESET);
  HAL_GPIO_WritePin(USB_PowerSwitchOn_GPIO_Port, USB_PowerSwitchOn_Pin, GPIO_PIN_RESET);

  GPIO_InitStruct.Pin = USER_Btn_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(USER_Btn_GPIO_Port, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = LD1_Pin|LD3_Pin|LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = USB_PowerSwitchOn_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(USB_PowerSwitchOn_GPIO_Port, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = USB_OverCurrent_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(USB_OverCurrent_GPIO_Port, &GPIO_InitStruct);
}

/* USER CODE BEGIN 4 */
static void MPU_Config(void)
{
  MPU_Region_InitTypeDef MPU_InitStruct = {0};
  HAL_MPU_Disable();
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER0;
  MPU_InitStruct.BaseAddress = 0x20020000;
  MPU_InitStruct.Size = MPU_REGION_SIZE_512KB;
  MPU_InitStruct.SubRegionDisable = 0x00;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
  MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
  HAL_MPU_ConfigRegion(&MPU_InitStruct);
  HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
}

void Error_Handler(void)
{
  __disable_irq();
  while (1) {}
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t *file, uint32_t line) {}
#endif
/* USER CODE END 4 */
