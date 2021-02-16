#!/bin/bash

echo "Initializing git submodules..."
git submodule update --init --recursive
echo "Done."

if [ -z "$XILINX_PATH" ]; then
    echo "Please set XILINX_PATH before running.";
else
    echo "Sourcing Vivado SDK 2015.4..."
    source $XILINX_PATH/SDK/2015.4/settings64.sh
    echo "Done."
    
    echo "Building project..."
    cd fpga-zynq/zybo
    echo "Make sure to set -java-home <java 8 path> in /etc/sbt/sbtopts!"
    export TERM=xterm-color
    TERM=xterm-color
    make project
    if [$? -eq 0 ]; then
        echo "Success!"
    else
        echo "Failure!"
        echo "Make sure to set -java-home <java 8 path> in /etc/sbt/sbtopts!"
    
    export TERM=xterm-256color
    cd ../..
    echo "Done."
fi
