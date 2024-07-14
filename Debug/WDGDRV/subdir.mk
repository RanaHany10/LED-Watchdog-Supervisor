################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../WDGDRV/WDGDRV.c 

OBJS += \
./WDGDRV/WDGDRV.o 

C_DEPS += \
./WDGDRV/WDGDRV.d 


# Each subdirectory must supply rules for building sources it contributes
WDGDRV/%.o: ../WDGDRV/%.c WDGDRV/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"G:\root\my_life\sbme_2025\3rd_year\second_semester\Emedded_System\test\GPIO" -I"G:\root\my_life\sbme_2025\3rd_year\second_semester\Emedded_System\test\LEDM" -I"G:\root\my_life\sbme_2025\3rd_year\second_semester\Emedded_System\test\TIMER" -I"G:\root\my_life\sbme_2025\3rd_year\second_semester\Emedded_System\test\WDGDRV" -I"G:\root\my_life\sbme_2025\3rd_year\second_semester\Emedded_System\test\WDGM" -Wall -g2 -gstabs -O1 -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega328p -DF_CPU=1000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


