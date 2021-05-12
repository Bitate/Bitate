#!/bin/bash

rm boot.flp

nasm -f bin -o boot.exe boot.asm

dd status=noxfer conv=notrunc if=boot.exe of=boot.flp

bochs -f bochsrc
