#!/bin/zsh
OS_NAME="my_os"
# Check required binary
echo "<I> Checking required binary..."
if ! qemu-system-x86_64 --version &> /dev/null; then
    echo "<X> Cannot detect qemu-system-x86_64 in your system, please install \"qemu\" first"
fi
if ! vncviewer -help &> /dev/null; then
    echo "<X> Cannot detect realvnc-vnc-viewer in your system, please install \"realvnc-vnc-viewer\" frist"
fi

echo "<I> Checking bootimage existance..."
BOOTIMAGE_PATH="./target/x86_64-"$OS_NAME"/debug/bootimage-"$OS_NAME".bin"
if ! [ -f $BOOTIMAGE_PATH ]; then
    echo "<I> Cannot find boot image. Building boot image..."
    cargo bootimage
fi

qemu-system-x86_64 -drive format=raw,file=$BOOTIMAGE_PATH & ( vncviewer 127.0.0.1:5900 && killall qemu-system-x86_64 )