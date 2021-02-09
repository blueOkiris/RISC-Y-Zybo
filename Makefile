.PHONY : all
all : install-deps init

# Install dependencies for building (requires Ubuntu/Debian)
# Note: Requires specific java version
.PHONY : install-deps
install-deps :
	sudo apt install -y openjdk-8-jdk
	sudo apt install -y autoconf automake autotools-dev curl libmpc-dev \
		libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential \
		bison flex texinfo gperf libtool patchutils bc zlib1g-dev \
		device-tree-compiler pkg-config libexpat-dev

.PHONY : init
init : sub-mod-init build-base-zynq-project build-arm-linux riscv-linux

# Update all the submodules (takes a long time)
.PHONY : sub-mod-init
sub-mod-init :
	git submodule update --init --recursive
	
# Build the base vivado project as per fpga-zynq
# You have to update our submodules,
# Then the submodule's submodules
# And then again, the submodule's submodule's submodules
.PHONY : build-base-zynq-project
build-base-zynq-project :
	$(shell source $(XILINX_PATH)/SDK/2016.2/settings64.sh)
	export TERM=xterm-color
	cd fpga-zynq/rocket-chip; git apply ../../patches/rocket-java-version.patch
	cd fpga-zynq; git apply ../patches/common-java-version.patch
	cd fpga-zynq/zybo; make project
	cd fpga-zynq/zybo; make bitstream
	cd fpga-zynq/zybo; make arm-uboot
	
# Build the stuff to run linux on the ARM chip
.PHONY : build-arm-linux
build-arm-linux :
	cd fpga-zynq/zybo; make arm-linux
	cd fpga-zynq/zybo; make arm-dtb
	cd fpga-zynq/zybo; make fetch-ramdisk

.PHONY : clean
clean :
	cd fpga-zynq/rocket-chip; git submodule deinit -f --all
	cd fpga-zynq; git submodule deinit -f --all
	git submodule deinit -f --all
