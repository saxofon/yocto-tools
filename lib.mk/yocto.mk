# Author  : Per Hallsmark <per@hallsmark.se>
# License : GPLv2

LAYERS += meta-openembedded
LAYER_meta-openembedded_URL := https://github.com/openembedded/meta-openembedded

$(TOP)/poky:
	@echo "Cloning $@"
	@git clone git://git.yoctoproject.org/poky
	@mkdir -p $(TOP)/layers

$(TOP)/layers/meta-%:
	@if [ ! -d $@ ]; then \
		echo "Cloning $@" ; \
		cd $(TOP)/layers && git clone $(LAYER_$(patsubst $(TOP)/layers/%,%,$@)_URL) ; \
	fi
	
clone: poky $(patsubst meta-%,$(TOP)/layers/meta-%,$(LAYERS))

$(TOP)/poky.pull:
	@echo "Pulling $(@:%.pull=%)"
	@cd $(TOP)/poky && git pull

$(TOP)/layers/meta-%.pull:
	@echo "Pulling $(@:%.pull=%)"
	@cd $(@:%.pull=%) && git pull

pull: $(TOP)/poky.pull $(patsubst meta-%,$(TOP)/layers/meta-%.pull,$(LAYERS))

help::
	@echo "yocto-install.mk help"
	@echo "  clone  : initial setup and download of yocto repos"
	@echo "  pull   : update of yocto repos"
	@echo ""

info::
	@echo "yocto-install.mk info"
	@echo ""
