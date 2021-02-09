.PHONY : all
all : install-deps init

# Install dependencies for building (requires Ubuntu/Debian)
# Note: Requires specific java version
.PHONY : install-deps
install-deps :
	sudo apt install -y scala openjdk-8-jdk

.PHONY : init
init : build-base-zynq-project build-arm-linux
	
# Build the base vivado project as per fpga-zynq
# You have to update our submodules,
# Then the submodule's submodules
# And then again, the submodule's submodule's submodules
.PHONY : build-base-zynq-project
build-base-zynq-project :
	$(shell source $(XILINX_PATH)/SDK/2016.2/settings64.sh)
	export TERM=xterm-color
	git submodule update --init
	cd fpga-zynq; git reset --hard origin/master
	cd fpga-zynq; git submodule update --init
	cd fpga-zynq/rocket-chip; git reset --hard origin/master
	cd fpga-zynq/rocket-chip; git submodule update --init
	cd fpga-zynq/rocket-chip; git apply ../../patches/rocket-java-version.patch
	cd fpga-zynq; git apply ../patches/common-java-version.patch
	cd fpga-zynq/zybo; make project
	$(shell source $(XILINX_PATH)/SDK/2018.3/settings64.sh)
	
# Build the stuff to run linux on the ARM chip
.PHONY : build-arm-linux
build-arm-linux :
	cd fpga-zynq/zybo; make arm-uboot
	cd fpga-zynq/zybo; make arm-linux
	cd fpga-zynq/zybo; make arm-dtb
	cd fpga-zynq/zybo; make fetch-ramdisk

.PHONY : clean
clean :
	cd fpga-zynq/rocket-chip; git submodule deinit -f --all
	cd fpga-zynq; git submodule deinit -f --all
	git submodule deinit -f --all
