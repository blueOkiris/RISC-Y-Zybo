.PHONY : all
all : init

.PHONY : init
init : install-deps build-base-zynq-project 

# Install dependencies for building (requires Ubuntu/Debian)
# Note: Requires specific java version
.PHONY : install-deps
install-deps :
	sudo apt install -y scala openjdk-8-jdk
	
# Build the base vivado project as per fpga-zynq
# You have to update our submodules,
# Then the submodule's submodules
# And then again, the submodule's submodule's submodules
.PHONY : build-base-zynq-project
build-base-zynq-project :
	export TERM=xterm-color
	git submodules update --init
	cd fpga-zynq; git submodules update --init
	cd fpga-zynq/rocket-chip; git submodule update --init
	cd fpga-zynq/zybo; make project
	cd fpga-zynq/rocket-chip; git apply ../../patches/rocket-java-version.patch
	cd fpga-zynq; git apply ../patches/common-java-version.patch
	
.PHONY : clean
clean :
	cd fpga-zynq/rocket-chip; git reset --HARD master
	cd fpga-zynq; git reset --HARD master
