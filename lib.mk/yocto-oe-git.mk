# Author  : Per Hallsmark <per@hallsmark.se>
# License : GPLv2

clone:
	git clone git://git.yoctoproject.org/poky
	mkdir -p layers
	cd layers && git clone https://github.com/openembedded/meta-openembedded
	cd layers && git clone git://git.yoctoproject.org/meta-ti

pull:
	cd poky && git pull
	cd layers/meta-openembedded && git pull
	cd layers/meta-ti && git pull

help::
	@echo "yocto-install.mk help"
	@echo "  clone  : initial setup and download of yocto repos"
	@echo "  pull   : update of yocto repos"
	@echo ""

info::
	@echo "yocto-install.mk info"
	@echo ""
