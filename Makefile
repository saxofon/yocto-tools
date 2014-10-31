# top Makefile for Yocto based projects
# Author  : Per Hallsmark <per@hallsmark.se>
# License : GPLv2

TOP := $(PWD)

all:

help::
	@echo "TOP Makefile help"
	@echo "  help : these help-texts..."
	@echo "  info : useful debug information"
	@echo ""

info::
	@echo "TOP Makefile info"
	@echo ""

-include $(TOP)/lib.mk/*.mk

distclean:
	$(RM) -r layers/* poky
