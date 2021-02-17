# RISCV on a Zybo

## Description

This repo contains materials to run Linux on a RISCV core on a Zynq-based FPGA dev board as well as documentation on the process and materials generated on the way to a solution

## Running

The base sd-card files that can run Linux can be downloaded from the RISCV page, and they've been placed in the riscv-dwn-page-sd-card folder.

## Virtual Machine

The virtual machine which was used to build the project can be found [here](https://mega.nz/file/ARw0yCRK#IoHZa1Hm4pApDjTfKeqSL4m_esVwCtVuP9POiEDQrrM).

## Building

1. Run `./scripts/install-deps.sh`

2. Install Vivado 2015.4

3. Run `git submodule update --init --recursive`

4. Run `source \<xilinx install path\>/Xilinx/SDK/2015.4/settings64.sh`

5. Copy `./patches/sbt-launch.jar` over `./fpga-zynq/rocket-chip/sbt-launch.jar`

6. Run `cd ./fpga-zynq/zybo`

7. From this sub directory, run `make project`. This will FAIL, which is expected. However, it will create a project which we can patch in order to finish the build.

8. Run `cd ../..` to return to the root directory

9. Copy the file `./patches/build.properties` over `./fpga-zynq/common/project/build.properties`

10. Re-run `cd ./fpga-zynq/zybo`

11. Re-run `make project` from in this directory and the project should be built

12. Now in the same directory run `make arm-uboot`

13. From here, open vivado, generate the bitstream, export the hardware, and open SDK

14. In SDK, create a new application that's a Zynq FSBL

15. Go to create a boot loader (an option under "Xilinx Tools")

16. Add the following files __in order__:

     - the fsbl's elf file located in it's Debug folder

     - the exported bitstream

     - the generated uboot.elf which should be located in the current folder (./fpga-zynq/zybo) under soft_build

17. Still in that folder, run the following commands:

     - `make arm-linux`

     - `make arm-dtb`

     - `make fetch-ramdisk`

     - `make fetch-riscv-linux-deliver`

18. Get the files under the deliver_output subfolder of the current folder (./fpga-zynq/zybo) along with your generated BOOT.bin from step 16 and put them in the root directory of your sd card, and you're done.
