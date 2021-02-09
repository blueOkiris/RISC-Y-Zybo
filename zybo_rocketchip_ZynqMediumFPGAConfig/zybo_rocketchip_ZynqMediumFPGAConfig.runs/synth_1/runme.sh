#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/dylan/Xilinx/SDK/2016.2/bin:/home/dylan/Xilinx/Vivado/2016.2/ids_lite/ISE/bin/lin64:/home/dylan/Xilinx/Vivado/2016.2/bin
else
  PATH=/home/dylan/Xilinx/SDK/2016.2/bin:/home/dylan/Xilinx/Vivado/2016.2/ids_lite/ISE/bin/lin64:/home/dylan/Xilinx/Vivado/2016.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/dylan/Xilinx/Vivado/2016.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/dylan/Xilinx/Vivado/2016.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/dylan/MEGA/Documents/School/2020-21/ECE/530/RISC-Y-Zybo/fpga-zynq/zybo/zybo_rocketchip_ZynqMediumFPGAConfig/zybo_rocketchip_ZynqMediumFPGAConfig.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log rocketchip_wrapper.vds -m64 -mode batch -messageDb vivado.pb -notrace -source rocketchip_wrapper.tcl
