
# Build env
ARMGNU ?= arm-none-eabi
OUT ?= out
OUT_OBJ := $(OUT)/obj
OUT_IMG := $(OUT)/img

all: kernel.img
clean:
	rm -rf $(OUT)

kernel.elf: boot.o kernel.o
	mkdir -p $(OUT_IMG)
	$(ARMGNU)-gcc -T linker.ld \
			-o $(OUT_IMG)/kernel.elf \
			-ffreestanding -O2 -nostdlib \
			$(OUT_OBJ)/kernel.o $(OUT_OBJ)/boot.o \
			-lgcc

kernel.img: kernel.elf
	$(ARMGNU)-objcopy $(OUT_IMG)/kernel.elf -O binary $(OUT_IMG)/kernel7.img

boot.o: boot.S
	mkdir -p $(OUT_OBJ)
	$(ARMGNU)-gcc \
		-mcpu=cortex-a7 \
		-fpic -ffreestanding \
		-c boot.S \
		-o $(OUT_OBJ)/boot.o

kernel.o: kernel.c
	mkdir -p $(OUT_OBJ)
	$(ARMGNU)-gcc \
		-mcpu=arm1176jzf-s \
		-fpic -ffreestanding -std=gnu99 \
		-O2 -Wall -Wextra \
		-c kernel.c \
		-o $(OUT_OBJ)/kernel.o \
