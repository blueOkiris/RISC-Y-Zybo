#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/dylan/Xilinx/SDK/2018.3/bin:/home/dylan/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/dylan/Xilinx/Vivado/2018.3/bin
else
  PATH=/home/dylan/Xilinx/SDK/2018.3/bin:/home/dylan/Xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/dylan/Xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/dylan/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/dylan/Xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/dylan/MEGA/Documents/School/2020-21/ECE/530/RISC-Y-Zybo/zybo/zybo_rocketchip_ZynqMediumFPGAConfig/zybo_rocketchip_ZynqMediumFPGAConfig.runs/impl_1'
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

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log rocketchip_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source rocketchip_wrapper.tcl -notrace


