# RISC-Y Zybo

## Description

Putting a RISC-V core on a Digilent Zybo

## Build Notes

 - Vivado must be in $PATH
 
 - Requires Vivado 2016.2 to build the initial project
 
## Re-Building

To Rebuild everything, run `make XILINX_PATH=<xilinx install path>`

__Re-Building sd-card/devicetree.dtb, sd-card/uImage, and sd-card/uramdisk.image.gz__

1. Run `make build-arm-linux XILINX_PATH=<xilinx install path>`. For instance, I do `make build-arm-linux XILINX_PATH=~/Xilinx`, but your install may be different.

2. Copy files from ./fpga-zynq/zybo/deliver_output/ to sd-card

__Re-Building sd-card/BOOT.bin__

1. Run `make build-base-zynq-project XILINX_PATH=<xilinx install path>`. For instance, I do `make build-base-zynq-project XILINX_PATH=~/Xilinx`, but your install may be different.

2. This will build the initial project and generate a bitstream.

3. From here, you can open Vivado 2016.2, export the hardware and open up sdk

4. In SDK, create an FSBL project based on the hardware.

5. Click on Xilinx/Create Boot Image

6. Set the output file to ./fpga-zynq/zybo/deliver_output/output.bif

7. Add (in order) the FSBL elf, then the bitstream, and finally the fpga-zynq/zybo/soft_build/u-boot.elf file. Then click generate.

8. Copy the fpga-zynq/zybo/deliver_output/BOOT.bin file to the sd-card folder
