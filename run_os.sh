#!/bin/zsh
OS_NAME="my_os"

BOOTIMAGE_PATH="./target/x86_64-"$OS_NAME"/debug/bootimage-"$OS_NAME".bin"
echo "<I> Rebuilding bootimage..."
cargo bootimage

# Check required binary
echo "<I> Checking required binary..."
if ! qemu-system-x86_64 --version &> /dev/null; then
    echo "<X> Cannot detect qemu-system-x86_64 in your system, please install \"qemu\" first"
fi

# Check os specific before running
if [[ $(uname) == "Linux" ]]; then
    if ! vncviewer -help &> /dev/null; then
        echo "<X> Cannot detect realvnc-vnc-viewer in your system, please install \"realvnc-vnc-viewer\" frist"
    else
        echo "<I> Detect running on Linux: Starting qemu-system-x86_64 and vncviewer..."
        qemu-system-x86_64 -drive format=raw,file=$BOOTIMAGE_PATH & ( vncviewer 127.0.0.1:5900 && killall qemu-system-x86_64 )
    fi
elif [[ $(uname) == "Darwin" ]]; then
    echo "<I> Detect running on Darwin: Starting Starting qemu-system-x86_64..."
    qemu-system-x86_64 -drive format=raw,file=$BOOTIMAGE_PATH
fi
