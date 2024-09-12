# Raspberry Pi Bare bones example

This example is made for Raspberry Pi 2 Model B. This bare metal program
runs on AARCH32 mode.

Source code is a straight copy paste of
[OSDev Wiki's Raspberry Pi Bare Bones](https://wiki.osdev.org/Raspberry_Pi_Bare_Bones)

## Requirements

- `make`
- `arm-none-eabi-gcc` toolchain to compile.
- `qemu` to run `qemu-system-arm`.

## Building

- Run `make all`
- ELF and kernel7.img is located inside out/img/

## Testing on QEMU

Bash script `qemu-test.sh` is available to run `qemu-system-arm`.

## Testing on hardware

As of now, I only tested the image on QEMU since I don't have the device.
