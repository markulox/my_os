#!/bin/zsh
OS_NAME="my_os"
qemu-system-x86_64 -drive format=raw,file=./target/x86_64-$OS_NAME/debug/bootimage-$OS_NAME.bin & ( vncviewer 127.0.0.1:5900 && killall qemu-system-x86_64 )