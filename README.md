# RISC-Y Zybo

## Description

Putting a RISC-V core on a Digilent Zybo

## Build Notes

 - Vivado must be in $PATH
 
 - Requires Vivado 2016.2 to build the initial project, though the project is then upgraded to 2018.3. Both versions are required to build
 
## Re-Building

__Re-Building sd-card/BOOT.bin__

1. Run `make init XILINX_PATH=<xilinx install path>`. For instance, I do `make init XILIX_PATH=~/Xilinx`, but your install may be different.

2. This will build the initial project. From here, you can open Vivado 2018.3, and generate the bitstream.

3. Export the hardware and open up SDK

4. In SDK, create an FSBL project based on the hardware.

5. Click on Xilinx/Create Boot Image

6. Set the output file to ./fpga-zynq/zybo/deliver_output/output.bif

7. Add (in order) the FSBL elf, then the bitstream, and finally the fpga-zynq/zybo/soft_build/u-boot.elf file. Then click generate.

8. Copy the fpga-zynq/zybo/deliver_output/BOOT.bin file to the sd-card folder
