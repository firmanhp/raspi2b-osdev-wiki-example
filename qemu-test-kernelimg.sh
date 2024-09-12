#!/bin/bash

qemu-system-arm \
  -nographic \
  -M raspi2b \
  -device loader,file=out/img/kernel7.img,addr=0x8000,cpu-num=0
