#!/bin/bash

qemu-system-arm \
  -nographic \
  -M raspi2b \
  -kernel out/img/kernel.elf
