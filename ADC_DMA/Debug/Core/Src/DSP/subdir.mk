################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/DSP/arm_abs_f32.c \
../Core/Src/DSP/arm_abs_q15.c \
../Core/Src/DSP/arm_abs_q31.c \
../Core/Src/DSP/arm_abs_q7.c \
../Core/Src/DSP/arm_add_f32.c \
../Core/Src/DSP/arm_add_q15.c \
../Core/Src/DSP/arm_add_q31.c \
../Core/Src/DSP/arm_add_q7.c \
../Core/Src/DSP/arm_bitreversal.c \
../Core/Src/DSP/arm_cfft_f32.c \
../Core/Src/DSP/arm_cfft_q15.c \
../Core/Src/DSP/arm_cfft_q31.c \
../Core/Src/DSP/arm_cfft_radix2_f32.c \
../Core/Src/DSP/arm_cfft_radix2_init_f32.c \
../Core/Src/DSP/arm_cfft_radix2_init_q15.c \
../Core/Src/DSP/arm_cfft_radix2_init_q31.c \
../Core/Src/DSP/arm_cfft_radix2_q15.c \
../Core/Src/DSP/arm_cfft_radix2_q31.c \
../Core/Src/DSP/arm_cfft_radix4_f32.c \
../Core/Src/DSP/arm_cfft_radix4_init_f32.c \
../Core/Src/DSP/arm_cfft_radix4_init_q15.c \
../Core/Src/DSP/arm_cfft_radix4_init_q31.c \
../Core/Src/DSP/arm_cfft_radix4_q15.c \
../Core/Src/DSP/arm_cfft_radix4_q31.c \
../Core/Src/DSP/arm_cfft_radix8_f32.c \
../Core/Src/DSP/arm_cmplx_conj_f32.c \
../Core/Src/DSP/arm_cmplx_conj_q15.c \
../Core/Src/DSP/arm_cmplx_conj_q31.c \
../Core/Src/DSP/arm_cmplx_dot_prod_f32.c \
../Core/Src/DSP/arm_cmplx_dot_prod_q15.c \
../Core/Src/DSP/arm_cmplx_dot_prod_q31.c \
../Core/Src/DSP/arm_cmplx_mag_f32.c \
../Core/Src/DSP/arm_cmplx_mag_q15.c \
../Core/Src/DSP/arm_cmplx_mag_q31.c \
../Core/Src/DSP/arm_cmplx_mag_squared_f32.c \
../Core/Src/DSP/arm_cmplx_mag_squared_q15.c \
../Core/Src/DSP/arm_cmplx_mag_squared_q31.c \
../Core/Src/DSP/arm_cmplx_mult_cmplx_f32.c \
../Core/Src/DSP/arm_cmplx_mult_cmplx_q15.c \
../Core/Src/DSP/arm_cmplx_mult_cmplx_q31.c \
../Core/Src/DSP/arm_cmplx_mult_real_f32.c \
../Core/Src/DSP/arm_cmplx_mult_real_q15.c \
../Core/Src/DSP/arm_cmplx_mult_real_q31.c \
../Core/Src/DSP/arm_common_tables.c \
../Core/Src/DSP/arm_const_structs.c \
../Core/Src/DSP/arm_copy_f32.c \
../Core/Src/DSP/arm_copy_q15.c \
../Core/Src/DSP/arm_copy_q31.c \
../Core/Src/DSP/arm_copy_q7.c \
../Core/Src/DSP/arm_dct4_f32.c \
../Core/Src/DSP/arm_dct4_init_f32.c \
../Core/Src/DSP/arm_dct4_init_q15.c \
../Core/Src/DSP/arm_dct4_init_q31.c \
../Core/Src/DSP/arm_dct4_q15.c \
../Core/Src/DSP/arm_dct4_q31.c \
../Core/Src/DSP/arm_dot_prod_f32.c \
../Core/Src/DSP/arm_dot_prod_q15.c \
../Core/Src/DSP/arm_dot_prod_q31.c \
../Core/Src/DSP/arm_dot_prod_q7.c \
../Core/Src/DSP/arm_fill_f32.c \
../Core/Src/DSP/arm_fill_q15.c \
../Core/Src/DSP/arm_fill_q31.c \
../Core/Src/DSP/arm_fill_q7.c \
../Core/Src/DSP/arm_float_to_q15.c \
../Core/Src/DSP/arm_float_to_q31.c \
../Core/Src/DSP/arm_float_to_q7.c \
../Core/Src/DSP/arm_mean_f32.c \
../Core/Src/DSP/arm_mult_f32.c \
../Core/Src/DSP/arm_mult_q15.c \
../Core/Src/DSP/arm_mult_q31.c \
../Core/Src/DSP/arm_mult_q7.c \
../Core/Src/DSP/arm_negate_f32.c \
../Core/Src/DSP/arm_negate_q15.c \
../Core/Src/DSP/arm_negate_q31.c \
../Core/Src/DSP/arm_negate_q7.c \
../Core/Src/DSP/arm_offset_f32.c \
../Core/Src/DSP/arm_offset_q15.c \
../Core/Src/DSP/arm_offset_q31.c \
../Core/Src/DSP/arm_offset_q7.c \
../Core/Src/DSP/arm_q15_to_float.c \
../Core/Src/DSP/arm_q15_to_q31.c \
../Core/Src/DSP/arm_q15_to_q7.c \
../Core/Src/DSP/arm_q31_to_float.c \
../Core/Src/DSP/arm_q31_to_q15.c \
../Core/Src/DSP/arm_q31_to_q7.c \
../Core/Src/DSP/arm_q7_to_float.c \
../Core/Src/DSP/arm_q7_to_q15.c \
../Core/Src/DSP/arm_q7_to_q31.c \
../Core/Src/DSP/arm_rfft_f32.c \
../Core/Src/DSP/arm_rfft_fast_f32.c \
../Core/Src/DSP/arm_rfft_fast_init_f32.c \
../Core/Src/DSP/arm_rfft_init_f32.c \
../Core/Src/DSP/arm_rfft_init_q15.c \
../Core/Src/DSP/arm_rfft_init_q31.c \
../Core/Src/DSP/arm_rfft_q15.c \
../Core/Src/DSP/arm_rfft_q31.c \
../Core/Src/DSP/arm_scale_f32.c \
../Core/Src/DSP/arm_scale_q15.c \
../Core/Src/DSP/arm_scale_q31.c \
../Core/Src/DSP/arm_scale_q7.c \
../Core/Src/DSP/arm_shift_q15.c \
../Core/Src/DSP/arm_shift_q31.c \
../Core/Src/DSP/arm_shift_q7.c \
../Core/Src/DSP/arm_sub_f32.c \
../Core/Src/DSP/arm_sub_q15.c \
../Core/Src/DSP/arm_sub_q31.c \
../Core/Src/DSP/arm_sub_q7.c 

S_UPPER_SRCS += \
../Core/Src/DSP/arm_bitreversal2.S 

OBJS += \
./Core/Src/DSP/arm_abs_f32.o \
./Core/Src/DSP/arm_abs_q15.o \
./Core/Src/DSP/arm_abs_q31.o \
./Core/Src/DSP/arm_abs_q7.o \
./Core/Src/DSP/arm_add_f32.o \
./Core/Src/DSP/arm_add_q15.o \
./Core/Src/DSP/arm_add_q31.o \
./Core/Src/DSP/arm_add_q7.o \
./Core/Src/DSP/arm_bitreversal.o \
./Core/Src/DSP/arm_bitreversal2.o \
./Core/Src/DSP/arm_cfft_f32.o \
./Core/Src/DSP/arm_cfft_q15.o \
./Core/Src/DSP/arm_cfft_q31.o \
./Core/Src/DSP/arm_cfft_radix2_f32.o \
./Core/Src/DSP/arm_cfft_radix2_init_f32.o \
./Core/Src/DSP/arm_cfft_radix2_init_q15.o \
./Core/Src/DSP/arm_cfft_radix2_init_q31.o \
./Core/Src/DSP/arm_cfft_radix2_q15.o \
./Core/Src/DSP/arm_cfft_radix2_q31.o \
./Core/Src/DSP/arm_cfft_radix4_f32.o \
./Core/Src/DSP/arm_cfft_radix4_init_f32.o \
./Core/Src/DSP/arm_cfft_radix4_init_q15.o \
./Core/Src/DSP/arm_cfft_radix4_init_q31.o \
./Core/Src/DSP/arm_cfft_radix4_q15.o \
./Core/Src/DSP/arm_cfft_radix4_q31.o \
./Core/Src/DSP/arm_cfft_radix8_f32.o \
./Core/Src/DSP/arm_cmplx_conj_f32.o \
./Core/Src/DSP/arm_cmplx_conj_q15.o \
./Core/Src/DSP/arm_cmplx_conj_q31.o \
./Core/Src/DSP/arm_cmplx_dot_prod_f32.o \
./Core/Src/DSP/arm_cmplx_dot_prod_q15.o \
./Core/Src/DSP/arm_cmplx_dot_prod_q31.o \
./Core/Src/DSP/arm_cmplx_mag_f32.o \
./Core/Src/DSP/arm_cmplx_mag_q15.o \
./Core/Src/DSP/arm_cmplx_mag_q31.o \
./Core/Src/DSP/arm_cmplx_mag_squared_f32.o \
./Core/Src/DSP/arm_cmplx_mag_squared_q15.o \
./Core/Src/DSP/arm_cmplx_mag_squared_q31.o \
./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.o \
./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.o \
./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.o \
./Core/Src/DSP/arm_cmplx_mult_real_f32.o \
./Core/Src/DSP/arm_cmplx_mult_real_q15.o \
./Core/Src/DSP/arm_cmplx_mult_real_q31.o \
./Core/Src/DSP/arm_common_tables.o \
./Core/Src/DSP/arm_const_structs.o \
./Core/Src/DSP/arm_copy_f32.o \
./Core/Src/DSP/arm_copy_q15.o \
./Core/Src/DSP/arm_copy_q31.o \
./Core/Src/DSP/arm_copy_q7.o \
./Core/Src/DSP/arm_dct4_f32.o \
./Core/Src/DSP/arm_dct4_init_f32.o \
./Core/Src/DSP/arm_dct4_init_q15.o \
./Core/Src/DSP/arm_dct4_init_q31.o \
./Core/Src/DSP/arm_dct4_q15.o \
./Core/Src/DSP/arm_dct4_q31.o \
./Core/Src/DSP/arm_dot_prod_f32.o \
./Core/Src/DSP/arm_dot_prod_q15.o \
./Core/Src/DSP/arm_dot_prod_q31.o \
./Core/Src/DSP/arm_dot_prod_q7.o \
./Core/Src/DSP/arm_fill_f32.o \
./Core/Src/DSP/arm_fill_q15.o \
./Core/Src/DSP/arm_fill_q31.o \
./Core/Src/DSP/arm_fill_q7.o \
./Core/Src/DSP/arm_float_to_q15.o \
./Core/Src/DSP/arm_float_to_q31.o \
./Core/Src/DSP/arm_float_to_q7.o \
./Core/Src/DSP/arm_mean_f32.o \
./Core/Src/DSP/arm_mult_f32.o \
./Core/Src/DSP/arm_mult_q15.o \
./Core/Src/DSP/arm_mult_q31.o \
./Core/Src/DSP/arm_mult_q7.o \
./Core/Src/DSP/arm_negate_f32.o \
./Core/Src/DSP/arm_negate_q15.o \
./Core/Src/DSP/arm_negate_q31.o \
./Core/Src/DSP/arm_negate_q7.o \
./Core/Src/DSP/arm_offset_f32.o \
./Core/Src/DSP/arm_offset_q15.o \
./Core/Src/DSP/arm_offset_q31.o \
./Core/Src/DSP/arm_offset_q7.o \
./Core/Src/DSP/arm_q15_to_float.o \
./Core/Src/DSP/arm_q15_to_q31.o \
./Core/Src/DSP/arm_q15_to_q7.o \
./Core/Src/DSP/arm_q31_to_float.o \
./Core/Src/DSP/arm_q31_to_q15.o \
./Core/Src/DSP/arm_q31_to_q7.o \
./Core/Src/DSP/arm_q7_to_float.o \
./Core/Src/DSP/arm_q7_to_q15.o \
./Core/Src/DSP/arm_q7_to_q31.o \
./Core/Src/DSP/arm_rfft_f32.o \
./Core/Src/DSP/arm_rfft_fast_f32.o \
./Core/Src/DSP/arm_rfft_fast_init_f32.o \
./Core/Src/DSP/arm_rfft_init_f32.o \
./Core/Src/DSP/arm_rfft_init_q15.o \
./Core/Src/DSP/arm_rfft_init_q31.o \
./Core/Src/DSP/arm_rfft_q15.o \
./Core/Src/DSP/arm_rfft_q31.o \
./Core/Src/DSP/arm_scale_f32.o \
./Core/Src/DSP/arm_scale_q15.o \
./Core/Src/DSP/arm_scale_q31.o \
./Core/Src/DSP/arm_scale_q7.o \
./Core/Src/DSP/arm_shift_q15.o \
./Core/Src/DSP/arm_shift_q31.o \
./Core/Src/DSP/arm_shift_q7.o \
./Core/Src/DSP/arm_sub_f32.o \
./Core/Src/DSP/arm_sub_q15.o \
./Core/Src/DSP/arm_sub_q31.o \
./Core/Src/DSP/arm_sub_q7.o 

S_UPPER_DEPS += \
./Core/Src/DSP/arm_bitreversal2.d 

C_DEPS += \
./Core/Src/DSP/arm_abs_f32.d \
./Core/Src/DSP/arm_abs_q15.d \
./Core/Src/DSP/arm_abs_q31.d \
./Core/Src/DSP/arm_abs_q7.d \
./Core/Src/DSP/arm_add_f32.d \
./Core/Src/DSP/arm_add_q15.d \
./Core/Src/DSP/arm_add_q31.d \
./Core/Src/DSP/arm_add_q7.d \
./Core/Src/DSP/arm_bitreversal.d \
./Core/Src/DSP/arm_cfft_f32.d \
./Core/Src/DSP/arm_cfft_q15.d \
./Core/Src/DSP/arm_cfft_q31.d \
./Core/Src/DSP/arm_cfft_radix2_f32.d \
./Core/Src/DSP/arm_cfft_radix2_init_f32.d \
./Core/Src/DSP/arm_cfft_radix2_init_q15.d \
./Core/Src/DSP/arm_cfft_radix2_init_q31.d \
./Core/Src/DSP/arm_cfft_radix2_q15.d \
./Core/Src/DSP/arm_cfft_radix2_q31.d \
./Core/Src/DSP/arm_cfft_radix4_f32.d \
./Core/Src/DSP/arm_cfft_radix4_init_f32.d \
./Core/Src/DSP/arm_cfft_radix4_init_q15.d \
./Core/Src/DSP/arm_cfft_radix4_init_q31.d \
./Core/Src/DSP/arm_cfft_radix4_q15.d \
./Core/Src/DSP/arm_cfft_radix4_q31.d \
./Core/Src/DSP/arm_cfft_radix8_f32.d \
./Core/Src/DSP/arm_cmplx_conj_f32.d \
./Core/Src/DSP/arm_cmplx_conj_q15.d \
./Core/Src/DSP/arm_cmplx_conj_q31.d \
./Core/Src/DSP/arm_cmplx_dot_prod_f32.d \
./Core/Src/DSP/arm_cmplx_dot_prod_q15.d \
./Core/Src/DSP/arm_cmplx_dot_prod_q31.d \
./Core/Src/DSP/arm_cmplx_mag_f32.d \
./Core/Src/DSP/arm_cmplx_mag_q15.d \
./Core/Src/DSP/arm_cmplx_mag_q31.d \
./Core/Src/DSP/arm_cmplx_mag_squared_f32.d \
./Core/Src/DSP/arm_cmplx_mag_squared_q15.d \
./Core/Src/DSP/arm_cmplx_mag_squared_q31.d \
./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.d \
./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.d \
./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.d \
./Core/Src/DSP/arm_cmplx_mult_real_f32.d \
./Core/Src/DSP/arm_cmplx_mult_real_q15.d \
./Core/Src/DSP/arm_cmplx_mult_real_q31.d \
./Core/Src/DSP/arm_common_tables.d \
./Core/Src/DSP/arm_const_structs.d \
./Core/Src/DSP/arm_copy_f32.d \
./Core/Src/DSP/arm_copy_q15.d \
./Core/Src/DSP/arm_copy_q31.d \
./Core/Src/DSP/arm_copy_q7.d \
./Core/Src/DSP/arm_dct4_f32.d \
./Core/Src/DSP/arm_dct4_init_f32.d \
./Core/Src/DSP/arm_dct4_init_q15.d \
./Core/Src/DSP/arm_dct4_init_q31.d \
./Core/Src/DSP/arm_dct4_q15.d \
./Core/Src/DSP/arm_dct4_q31.d \
./Core/Src/DSP/arm_dot_prod_f32.d \
./Core/Src/DSP/arm_dot_prod_q15.d \
./Core/Src/DSP/arm_dot_prod_q31.d \
./Core/Src/DSP/arm_dot_prod_q7.d \
./Core/Src/DSP/arm_fill_f32.d \
./Core/Src/DSP/arm_fill_q15.d \
./Core/Src/DSP/arm_fill_q31.d \
./Core/Src/DSP/arm_fill_q7.d \
./Core/Src/DSP/arm_float_to_q15.d \
./Core/Src/DSP/arm_float_to_q31.d \
./Core/Src/DSP/arm_float_to_q7.d \
./Core/Src/DSP/arm_mean_f32.d \
./Core/Src/DSP/arm_mult_f32.d \
./Core/Src/DSP/arm_mult_q15.d \
./Core/Src/DSP/arm_mult_q31.d \
./Core/Src/DSP/arm_mult_q7.d \
./Core/Src/DSP/arm_negate_f32.d \
./Core/Src/DSP/arm_negate_q15.d \
./Core/Src/DSP/arm_negate_q31.d \
./Core/Src/DSP/arm_negate_q7.d \
./Core/Src/DSP/arm_offset_f32.d \
./Core/Src/DSP/arm_offset_q15.d \
./Core/Src/DSP/arm_offset_q31.d \
./Core/Src/DSP/arm_offset_q7.d \
./Core/Src/DSP/arm_q15_to_float.d \
./Core/Src/DSP/arm_q15_to_q31.d \
./Core/Src/DSP/arm_q15_to_q7.d \
./Core/Src/DSP/arm_q31_to_float.d \
./Core/Src/DSP/arm_q31_to_q15.d \
./Core/Src/DSP/arm_q31_to_q7.d \
./Core/Src/DSP/arm_q7_to_float.d \
./Core/Src/DSP/arm_q7_to_q15.d \
./Core/Src/DSP/arm_q7_to_q31.d \
./Core/Src/DSP/arm_rfft_f32.d \
./Core/Src/DSP/arm_rfft_fast_f32.d \
./Core/Src/DSP/arm_rfft_fast_init_f32.d \
./Core/Src/DSP/arm_rfft_init_f32.d \
./Core/Src/DSP/arm_rfft_init_q15.d \
./Core/Src/DSP/arm_rfft_init_q31.d \
./Core/Src/DSP/arm_rfft_q15.d \
./Core/Src/DSP/arm_rfft_q31.d \
./Core/Src/DSP/arm_scale_f32.d \
./Core/Src/DSP/arm_scale_q15.d \
./Core/Src/DSP/arm_scale_q31.d \
./Core/Src/DSP/arm_scale_q7.d \
./Core/Src/DSP/arm_shift_q15.d \
./Core/Src/DSP/arm_shift_q31.d \
./Core/Src/DSP/arm_shift_q7.d \
./Core/Src/DSP/arm_sub_f32.d \
./Core/Src/DSP/arm_sub_q15.d \
./Core/Src/DSP/arm_sub_q31.d \
./Core/Src/DSP/arm_sub_q7.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/DSP/%.o Core/Src/DSP/%.su Core/Src/DSP/%.cyclo: ../Core/Src/DSP/%.c Core/Src/DSP/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -D__FPU_PRESENT=1 -DARM_MATH_CM7 -DUSE_HAL_DRIVER -DSTM32F767xx -c -I../Core/Inc -I"/home/anon/STM32CubeIDE/workspace_1.19.0/ADC_DMA/Core/Src/DSP" -I../Drivers/STM32F7xx_HAL_Driver/Inc -I/home/anon/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.4/Drivers/CMSIS/DSP/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/DSP/%.o: ../Core/Src/DSP/%.S Core/Src/DSP/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Src-2f-DSP

clean-Core-2f-Src-2f-DSP:
	-$(RM) ./Core/Src/DSP/arm_abs_f32.cyclo ./Core/Src/DSP/arm_abs_f32.d ./Core/Src/DSP/arm_abs_f32.o ./Core/Src/DSP/arm_abs_f32.su ./Core/Src/DSP/arm_abs_q15.cyclo ./Core/Src/DSP/arm_abs_q15.d ./Core/Src/DSP/arm_abs_q15.o ./Core/Src/DSP/arm_abs_q15.su ./Core/Src/DSP/arm_abs_q31.cyclo ./Core/Src/DSP/arm_abs_q31.d ./Core/Src/DSP/arm_abs_q31.o ./Core/Src/DSP/arm_abs_q31.su ./Core/Src/DSP/arm_abs_q7.cyclo ./Core/Src/DSP/arm_abs_q7.d ./Core/Src/DSP/arm_abs_q7.o ./Core/Src/DSP/arm_abs_q7.su ./Core/Src/DSP/arm_add_f32.cyclo ./Core/Src/DSP/arm_add_f32.d ./Core/Src/DSP/arm_add_f32.o ./Core/Src/DSP/arm_add_f32.su ./Core/Src/DSP/arm_add_q15.cyclo ./Core/Src/DSP/arm_add_q15.d ./Core/Src/DSP/arm_add_q15.o ./Core/Src/DSP/arm_add_q15.su ./Core/Src/DSP/arm_add_q31.cyclo ./Core/Src/DSP/arm_add_q31.d ./Core/Src/DSP/arm_add_q31.o ./Core/Src/DSP/arm_add_q31.su ./Core/Src/DSP/arm_add_q7.cyclo ./Core/Src/DSP/arm_add_q7.d ./Core/Src/DSP/arm_add_q7.o ./Core/Src/DSP/arm_add_q7.su ./Core/Src/DSP/arm_bitreversal.cyclo ./Core/Src/DSP/arm_bitreversal.d ./Core/Src/DSP/arm_bitreversal.o ./Core/Src/DSP/arm_bitreversal.su ./Core/Src/DSP/arm_bitreversal2.d ./Core/Src/DSP/arm_bitreversal2.o ./Core/Src/DSP/arm_cfft_f32.cyclo ./Core/Src/DSP/arm_cfft_f32.d ./Core/Src/DSP/arm_cfft_f32.o ./Core/Src/DSP/arm_cfft_f32.su ./Core/Src/DSP/arm_cfft_q15.cyclo ./Core/Src/DSP/arm_cfft_q15.d ./Core/Src/DSP/arm_cfft_q15.o ./Core/Src/DSP/arm_cfft_q15.su ./Core/Src/DSP/arm_cfft_q31.cyclo ./Core/Src/DSP/arm_cfft_q31.d ./Core/Src/DSP/arm_cfft_q31.o ./Core/Src/DSP/arm_cfft_q31.su ./Core/Src/DSP/arm_cfft_radix2_f32.cyclo ./Core/Src/DSP/arm_cfft_radix2_f32.d ./Core/Src/DSP/arm_cfft_radix2_f32.o ./Core/Src/DSP/arm_cfft_radix2_f32.su ./Core/Src/DSP/arm_cfft_radix2_init_f32.cyclo ./Core/Src/DSP/arm_cfft_radix2_init_f32.d ./Core/Src/DSP/arm_cfft_radix2_init_f32.o ./Core/Src/DSP/arm_cfft_radix2_init_f32.su ./Core/Src/DSP/arm_cfft_radix2_init_q15.cyclo ./Core/Src/DSP/arm_cfft_radix2_init_q15.d ./Core/Src/DSP/arm_cfft_radix2_init_q15.o ./Core/Src/DSP/arm_cfft_radix2_init_q15.su ./Core/Src/DSP/arm_cfft_radix2_init_q31.cyclo ./Core/Src/DSP/arm_cfft_radix2_init_q31.d ./Core/Src/DSP/arm_cfft_radix2_init_q31.o ./Core/Src/DSP/arm_cfft_radix2_init_q31.su ./Core/Src/DSP/arm_cfft_radix2_q15.cyclo ./Core/Src/DSP/arm_cfft_radix2_q15.d ./Core/Src/DSP/arm_cfft_radix2_q15.o ./Core/Src/DSP/arm_cfft_radix2_q15.su ./Core/Src/DSP/arm_cfft_radix2_q31.cyclo ./Core/Src/DSP/arm_cfft_radix2_q31.d ./Core/Src/DSP/arm_cfft_radix2_q31.o ./Core/Src/DSP/arm_cfft_radix2_q31.su ./Core/Src/DSP/arm_cfft_radix4_f32.cyclo ./Core/Src/DSP/arm_cfft_radix4_f32.d ./Core/Src/DSP/arm_cfft_radix4_f32.o ./Core/Src/DSP/arm_cfft_radix4_f32.su ./Core/Src/DSP/arm_cfft_radix4_init_f32.cyclo ./Core/Src/DSP/arm_cfft_radix4_init_f32.d ./Core/Src/DSP/arm_cfft_radix4_init_f32.o ./Core/Src/DSP/arm_cfft_radix4_init_f32.su ./Core/Src/DSP/arm_cfft_radix4_init_q15.cyclo ./Core/Src/DSP/arm_cfft_radix4_init_q15.d ./Core/Src/DSP/arm_cfft_radix4_init_q15.o ./Core/Src/DSP/arm_cfft_radix4_init_q15.su ./Core/Src/DSP/arm_cfft_radix4_init_q31.cyclo ./Core/Src/DSP/arm_cfft_radix4_init_q31.d ./Core/Src/DSP/arm_cfft_radix4_init_q31.o ./Core/Src/DSP/arm_cfft_radix4_init_q31.su ./Core/Src/DSP/arm_cfft_radix4_q15.cyclo ./Core/Src/DSP/arm_cfft_radix4_q15.d ./Core/Src/DSP/arm_cfft_radix4_q15.o ./Core/Src/DSP/arm_cfft_radix4_q15.su ./Core/Src/DSP/arm_cfft_radix4_q31.cyclo ./Core/Src/DSP/arm_cfft_radix4_q31.d ./Core/Src/DSP/arm_cfft_radix4_q31.o ./Core/Src/DSP/arm_cfft_radix4_q31.su ./Core/Src/DSP/arm_cfft_radix8_f32.cyclo ./Core/Src/DSP/arm_cfft_radix8_f32.d ./Core/Src/DSP/arm_cfft_radix8_f32.o ./Core/Src/DSP/arm_cfft_radix8_f32.su ./Core/Src/DSP/arm_cmplx_conj_f32.cyclo ./Core/Src/DSP/arm_cmplx_conj_f32.d ./Core/Src/DSP/arm_cmplx_conj_f32.o ./Core/Src/DSP/arm_cmplx_conj_f32.su ./Core/Src/DSP/arm_cmplx_conj_q15.cyclo ./Core/Src/DSP/arm_cmplx_conj_q15.d ./Core/Src/DSP/arm_cmplx_conj_q15.o ./Core/Src/DSP/arm_cmplx_conj_q15.su ./Core/Src/DSP/arm_cmplx_conj_q31.cyclo ./Core/Src/DSP/arm_cmplx_conj_q31.d ./Core/Src/DSP/arm_cmplx_conj_q31.o ./Core/Src/DSP/arm_cmplx_conj_q31.su ./Core/Src/DSP/arm_cmplx_dot_prod_f32.cyclo ./Core/Src/DSP/arm_cmplx_dot_prod_f32.d ./Core/Src/DSP/arm_cmplx_dot_prod_f32.o ./Core/Src/DSP/arm_cmplx_dot_prod_f32.su ./Core/Src/DSP/arm_cmplx_dot_prod_q15.cyclo ./Core/Src/DSP/arm_cmplx_dot_prod_q15.d ./Core/Src/DSP/arm_cmplx_dot_prod_q15.o ./Core/Src/DSP/arm_cmplx_dot_prod_q15.su ./Core/Src/DSP/arm_cmplx_dot_prod_q31.cyclo ./Core/Src/DSP/arm_cmplx_dot_prod_q31.d ./Core/Src/DSP/arm_cmplx_dot_prod_q31.o ./Core/Src/DSP/arm_cmplx_dot_prod_q31.su ./Core/Src/DSP/arm_cmplx_mag_f32.cyclo ./Core/Src/DSP/arm_cmplx_mag_f32.d ./Core/Src/DSP/arm_cmplx_mag_f32.o ./Core/Src/DSP/arm_cmplx_mag_f32.su ./Core/Src/DSP/arm_cmplx_mag_q15.cyclo ./Core/Src/DSP/arm_cmplx_mag_q15.d ./Core/Src/DSP/arm_cmplx_mag_q15.o ./Core/Src/DSP/arm_cmplx_mag_q15.su ./Core/Src/DSP/arm_cmplx_mag_q31.cyclo ./Core/Src/DSP/arm_cmplx_mag_q31.d ./Core/Src/DSP/arm_cmplx_mag_q31.o ./Core/Src/DSP/arm_cmplx_mag_q31.su ./Core/Src/DSP/arm_cmplx_mag_squared_f32.cyclo ./Core/Src/DSP/arm_cmplx_mag_squared_f32.d ./Core/Src/DSP/arm_cmplx_mag_squared_f32.o ./Core/Src/DSP/arm_cmplx_mag_squared_f32.su ./Core/Src/DSP/arm_cmplx_mag_squared_q15.cyclo ./Core/Src/DSP/arm_cmplx_mag_squared_q15.d ./Core/Src/DSP/arm_cmplx_mag_squared_q15.o ./Core/Src/DSP/arm_cmplx_mag_squared_q15.su ./Core/Src/DSP/arm_cmplx_mag_squared_q31.cyclo ./Core/Src/DSP/arm_cmplx_mag_squared_q31.d ./Core/Src/DSP/arm_cmplx_mag_squared_q31.o ./Core/Src/DSP/arm_cmplx_mag_squared_q31.su ./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.cyclo ./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.d ./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.o ./Core/Src/DSP/arm_cmplx_mult_cmplx_f32.su ./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.cyclo ./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.d ./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.o ./Core/Src/DSP/arm_cmplx_mult_cmplx_q15.su ./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.cyclo ./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.d
	-$(RM) ./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.o ./Core/Src/DSP/arm_cmplx_mult_cmplx_q31.su ./Core/Src/DSP/arm_cmplx_mult_real_f32.cyclo ./Core/Src/DSP/arm_cmplx_mult_real_f32.d ./Core/Src/DSP/arm_cmplx_mult_real_f32.o ./Core/Src/DSP/arm_cmplx_mult_real_f32.su ./Core/Src/DSP/arm_cmplx_mult_real_q15.cyclo ./Core/Src/DSP/arm_cmplx_mult_real_q15.d ./Core/Src/DSP/arm_cmplx_mult_real_q15.o ./Core/Src/DSP/arm_cmplx_mult_real_q15.su ./Core/Src/DSP/arm_cmplx_mult_real_q31.cyclo ./Core/Src/DSP/arm_cmplx_mult_real_q31.d ./Core/Src/DSP/arm_cmplx_mult_real_q31.o ./Core/Src/DSP/arm_cmplx_mult_real_q31.su ./Core/Src/DSP/arm_common_tables.cyclo ./Core/Src/DSP/arm_common_tables.d ./Core/Src/DSP/arm_common_tables.o ./Core/Src/DSP/arm_common_tables.su ./Core/Src/DSP/arm_const_structs.cyclo ./Core/Src/DSP/arm_const_structs.d ./Core/Src/DSP/arm_const_structs.o ./Core/Src/DSP/arm_const_structs.su ./Core/Src/DSP/arm_copy_f32.cyclo ./Core/Src/DSP/arm_copy_f32.d ./Core/Src/DSP/arm_copy_f32.o ./Core/Src/DSP/arm_copy_f32.su ./Core/Src/DSP/arm_copy_q15.cyclo ./Core/Src/DSP/arm_copy_q15.d ./Core/Src/DSP/arm_copy_q15.o ./Core/Src/DSP/arm_copy_q15.su ./Core/Src/DSP/arm_copy_q31.cyclo ./Core/Src/DSP/arm_copy_q31.d ./Core/Src/DSP/arm_copy_q31.o ./Core/Src/DSP/arm_copy_q31.su ./Core/Src/DSP/arm_copy_q7.cyclo ./Core/Src/DSP/arm_copy_q7.d ./Core/Src/DSP/arm_copy_q7.o ./Core/Src/DSP/arm_copy_q7.su ./Core/Src/DSP/arm_dct4_f32.cyclo ./Core/Src/DSP/arm_dct4_f32.d ./Core/Src/DSP/arm_dct4_f32.o ./Core/Src/DSP/arm_dct4_f32.su ./Core/Src/DSP/arm_dct4_init_f32.cyclo ./Core/Src/DSP/arm_dct4_init_f32.d ./Core/Src/DSP/arm_dct4_init_f32.o ./Core/Src/DSP/arm_dct4_init_f32.su ./Core/Src/DSP/arm_dct4_init_q15.cyclo ./Core/Src/DSP/arm_dct4_init_q15.d ./Core/Src/DSP/arm_dct4_init_q15.o ./Core/Src/DSP/arm_dct4_init_q15.su ./Core/Src/DSP/arm_dct4_init_q31.cyclo ./Core/Src/DSP/arm_dct4_init_q31.d ./Core/Src/DSP/arm_dct4_init_q31.o ./Core/Src/DSP/arm_dct4_init_q31.su ./Core/Src/DSP/arm_dct4_q15.cyclo ./Core/Src/DSP/arm_dct4_q15.d ./Core/Src/DSP/arm_dct4_q15.o ./Core/Src/DSP/arm_dct4_q15.su ./Core/Src/DSP/arm_dct4_q31.cyclo ./Core/Src/DSP/arm_dct4_q31.d ./Core/Src/DSP/arm_dct4_q31.o ./Core/Src/DSP/arm_dct4_q31.su ./Core/Src/DSP/arm_dot_prod_f32.cyclo ./Core/Src/DSP/arm_dot_prod_f32.d ./Core/Src/DSP/arm_dot_prod_f32.o ./Core/Src/DSP/arm_dot_prod_f32.su ./Core/Src/DSP/arm_dot_prod_q15.cyclo ./Core/Src/DSP/arm_dot_prod_q15.d ./Core/Src/DSP/arm_dot_prod_q15.o ./Core/Src/DSP/arm_dot_prod_q15.su ./Core/Src/DSP/arm_dot_prod_q31.cyclo ./Core/Src/DSP/arm_dot_prod_q31.d ./Core/Src/DSP/arm_dot_prod_q31.o ./Core/Src/DSP/arm_dot_prod_q31.su ./Core/Src/DSP/arm_dot_prod_q7.cyclo ./Core/Src/DSP/arm_dot_prod_q7.d ./Core/Src/DSP/arm_dot_prod_q7.o ./Core/Src/DSP/arm_dot_prod_q7.su ./Core/Src/DSP/arm_fill_f32.cyclo ./Core/Src/DSP/arm_fill_f32.d ./Core/Src/DSP/arm_fill_f32.o ./Core/Src/DSP/arm_fill_f32.su ./Core/Src/DSP/arm_fill_q15.cyclo ./Core/Src/DSP/arm_fill_q15.d ./Core/Src/DSP/arm_fill_q15.o ./Core/Src/DSP/arm_fill_q15.su ./Core/Src/DSP/arm_fill_q31.cyclo ./Core/Src/DSP/arm_fill_q31.d ./Core/Src/DSP/arm_fill_q31.o ./Core/Src/DSP/arm_fill_q31.su ./Core/Src/DSP/arm_fill_q7.cyclo ./Core/Src/DSP/arm_fill_q7.d ./Core/Src/DSP/arm_fill_q7.o ./Core/Src/DSP/arm_fill_q7.su ./Core/Src/DSP/arm_float_to_q15.cyclo ./Core/Src/DSP/arm_float_to_q15.d ./Core/Src/DSP/arm_float_to_q15.o ./Core/Src/DSP/arm_float_to_q15.su ./Core/Src/DSP/arm_float_to_q31.cyclo ./Core/Src/DSP/arm_float_to_q31.d ./Core/Src/DSP/arm_float_to_q31.o ./Core/Src/DSP/arm_float_to_q31.su ./Core/Src/DSP/arm_float_to_q7.cyclo ./Core/Src/DSP/arm_float_to_q7.d ./Core/Src/DSP/arm_float_to_q7.o ./Core/Src/DSP/arm_float_to_q7.su ./Core/Src/DSP/arm_mean_f32.cyclo ./Core/Src/DSP/arm_mean_f32.d ./Core/Src/DSP/arm_mean_f32.o ./Core/Src/DSP/arm_mean_f32.su ./Core/Src/DSP/arm_mult_f32.cyclo ./Core/Src/DSP/arm_mult_f32.d ./Core/Src/DSP/arm_mult_f32.o ./Core/Src/DSP/arm_mult_f32.su ./Core/Src/DSP/arm_mult_q15.cyclo ./Core/Src/DSP/arm_mult_q15.d ./Core/Src/DSP/arm_mult_q15.o ./Core/Src/DSP/arm_mult_q15.su ./Core/Src/DSP/arm_mult_q31.cyclo ./Core/Src/DSP/arm_mult_q31.d ./Core/Src/DSP/arm_mult_q31.o ./Core/Src/DSP/arm_mult_q31.su ./Core/Src/DSP/arm_mult_q7.cyclo ./Core/Src/DSP/arm_mult_q7.d ./Core/Src/DSP/arm_mult_q7.o ./Core/Src/DSP/arm_mult_q7.su ./Core/Src/DSP/arm_negate_f32.cyclo ./Core/Src/DSP/arm_negate_f32.d ./Core/Src/DSP/arm_negate_f32.o ./Core/Src/DSP/arm_negate_f32.su ./Core/Src/DSP/arm_negate_q15.cyclo ./Core/Src/DSP/arm_negate_q15.d ./Core/Src/DSP/arm_negate_q15.o ./Core/Src/DSP/arm_negate_q15.su ./Core/Src/DSP/arm_negate_q31.cyclo ./Core/Src/DSP/arm_negate_q31.d ./Core/Src/DSP/arm_negate_q31.o ./Core/Src/DSP/arm_negate_q31.su ./Core/Src/DSP/arm_negate_q7.cyclo ./Core/Src/DSP/arm_negate_q7.d ./Core/Src/DSP/arm_negate_q7.o ./Core/Src/DSP/arm_negate_q7.su ./Core/Src/DSP/arm_offset_f32.cyclo ./Core/Src/DSP/arm_offset_f32.d ./Core/Src/DSP/arm_offset_f32.o ./Core/Src/DSP/arm_offset_f32.su ./Core/Src/DSP/arm_offset_q15.cyclo ./Core/Src/DSP/arm_offset_q15.d ./Core/Src/DSP/arm_offset_q15.o ./Core/Src/DSP/arm_offset_q15.su ./Core/Src/DSP/arm_offset_q31.cyclo ./Core/Src/DSP/arm_offset_q31.d ./Core/Src/DSP/arm_offset_q31.o ./Core/Src/DSP/arm_offset_q31.su ./Core/Src/DSP/arm_offset_q7.cyclo ./Core/Src/DSP/arm_offset_q7.d ./Core/Src/DSP/arm_offset_q7.o ./Core/Src/DSP/arm_offset_q7.su ./Core/Src/DSP/arm_q15_to_float.cyclo ./Core/Src/DSP/arm_q15_to_float.d ./Core/Src/DSP/arm_q15_to_float.o ./Core/Src/DSP/arm_q15_to_float.su ./Core/Src/DSP/arm_q15_to_q31.cyclo ./Core/Src/DSP/arm_q15_to_q31.d ./Core/Src/DSP/arm_q15_to_q31.o ./Core/Src/DSP/arm_q15_to_q31.su ./Core/Src/DSP/arm_q15_to_q7.cyclo ./Core/Src/DSP/arm_q15_to_q7.d ./Core/Src/DSP/arm_q15_to_q7.o ./Core/Src/DSP/arm_q15_to_q7.su ./Core/Src/DSP/arm_q31_to_float.cyclo ./Core/Src/DSP/arm_q31_to_float.d ./Core/Src/DSP/arm_q31_to_float.o ./Core/Src/DSP/arm_q31_to_float.su ./Core/Src/DSP/arm_q31_to_q15.cyclo ./Core/Src/DSP/arm_q31_to_q15.d ./Core/Src/DSP/arm_q31_to_q15.o
	-$(RM) ./Core/Src/DSP/arm_q31_to_q15.su ./Core/Src/DSP/arm_q31_to_q7.cyclo ./Core/Src/DSP/arm_q31_to_q7.d ./Core/Src/DSP/arm_q31_to_q7.o ./Core/Src/DSP/arm_q31_to_q7.su ./Core/Src/DSP/arm_q7_to_float.cyclo ./Core/Src/DSP/arm_q7_to_float.d ./Core/Src/DSP/arm_q7_to_float.o ./Core/Src/DSP/arm_q7_to_float.su ./Core/Src/DSP/arm_q7_to_q15.cyclo ./Core/Src/DSP/arm_q7_to_q15.d ./Core/Src/DSP/arm_q7_to_q15.o ./Core/Src/DSP/arm_q7_to_q15.su ./Core/Src/DSP/arm_q7_to_q31.cyclo ./Core/Src/DSP/arm_q7_to_q31.d ./Core/Src/DSP/arm_q7_to_q31.o ./Core/Src/DSP/arm_q7_to_q31.su ./Core/Src/DSP/arm_rfft_f32.cyclo ./Core/Src/DSP/arm_rfft_f32.d ./Core/Src/DSP/arm_rfft_f32.o ./Core/Src/DSP/arm_rfft_f32.su ./Core/Src/DSP/arm_rfft_fast_f32.cyclo ./Core/Src/DSP/arm_rfft_fast_f32.d ./Core/Src/DSP/arm_rfft_fast_f32.o ./Core/Src/DSP/arm_rfft_fast_f32.su ./Core/Src/DSP/arm_rfft_fast_init_f32.cyclo ./Core/Src/DSP/arm_rfft_fast_init_f32.d ./Core/Src/DSP/arm_rfft_fast_init_f32.o ./Core/Src/DSP/arm_rfft_fast_init_f32.su ./Core/Src/DSP/arm_rfft_init_f32.cyclo ./Core/Src/DSP/arm_rfft_init_f32.d ./Core/Src/DSP/arm_rfft_init_f32.o ./Core/Src/DSP/arm_rfft_init_f32.su ./Core/Src/DSP/arm_rfft_init_q15.cyclo ./Core/Src/DSP/arm_rfft_init_q15.d ./Core/Src/DSP/arm_rfft_init_q15.o ./Core/Src/DSP/arm_rfft_init_q15.su ./Core/Src/DSP/arm_rfft_init_q31.cyclo ./Core/Src/DSP/arm_rfft_init_q31.d ./Core/Src/DSP/arm_rfft_init_q31.o ./Core/Src/DSP/arm_rfft_init_q31.su ./Core/Src/DSP/arm_rfft_q15.cyclo ./Core/Src/DSP/arm_rfft_q15.d ./Core/Src/DSP/arm_rfft_q15.o ./Core/Src/DSP/arm_rfft_q15.su ./Core/Src/DSP/arm_rfft_q31.cyclo ./Core/Src/DSP/arm_rfft_q31.d ./Core/Src/DSP/arm_rfft_q31.o ./Core/Src/DSP/arm_rfft_q31.su ./Core/Src/DSP/arm_scale_f32.cyclo ./Core/Src/DSP/arm_scale_f32.d ./Core/Src/DSP/arm_scale_f32.o ./Core/Src/DSP/arm_scale_f32.su ./Core/Src/DSP/arm_scale_q15.cyclo ./Core/Src/DSP/arm_scale_q15.d ./Core/Src/DSP/arm_scale_q15.o ./Core/Src/DSP/arm_scale_q15.su ./Core/Src/DSP/arm_scale_q31.cyclo ./Core/Src/DSP/arm_scale_q31.d ./Core/Src/DSP/arm_scale_q31.o ./Core/Src/DSP/arm_scale_q31.su ./Core/Src/DSP/arm_scale_q7.cyclo ./Core/Src/DSP/arm_scale_q7.d ./Core/Src/DSP/arm_scale_q7.o ./Core/Src/DSP/arm_scale_q7.su ./Core/Src/DSP/arm_shift_q15.cyclo ./Core/Src/DSP/arm_shift_q15.d ./Core/Src/DSP/arm_shift_q15.o ./Core/Src/DSP/arm_shift_q15.su ./Core/Src/DSP/arm_shift_q31.cyclo ./Core/Src/DSP/arm_shift_q31.d ./Core/Src/DSP/arm_shift_q31.o ./Core/Src/DSP/arm_shift_q31.su ./Core/Src/DSP/arm_shift_q7.cyclo ./Core/Src/DSP/arm_shift_q7.d ./Core/Src/DSP/arm_shift_q7.o ./Core/Src/DSP/arm_shift_q7.su ./Core/Src/DSP/arm_sub_f32.cyclo ./Core/Src/DSP/arm_sub_f32.d ./Core/Src/DSP/arm_sub_f32.o ./Core/Src/DSP/arm_sub_f32.su ./Core/Src/DSP/arm_sub_q15.cyclo ./Core/Src/DSP/arm_sub_q15.d ./Core/Src/DSP/arm_sub_q15.o ./Core/Src/DSP/arm_sub_q15.su ./Core/Src/DSP/arm_sub_q31.cyclo ./Core/Src/DSP/arm_sub_q31.d ./Core/Src/DSP/arm_sub_q31.o ./Core/Src/DSP/arm_sub_q31.su ./Core/Src/DSP/arm_sub_q7.cyclo ./Core/Src/DSP/arm_sub_q7.d ./Core/Src/DSP/arm_sub_q7.o ./Core/Src/DSP/arm_sub_q7.su

.PHONY: clean-Core-2f-Src-2f-DSP

