# $Id$


# released or debug version, different on debug and log info
# must be 'release' or 'debug'
EDITION=debug
# EDITION=release

# PLUGINS:=NO

# ARCH=arm

# default: build all as plugins
ifeq ($(PLUGINS),NO)

else
	PLUGINS=YES
endif

ROOT_DIR:=$(shell pwd)
RULE_DIR:=$(ROOT_DIR)/

NAME=$(shell basename $(ROOT_DIR))

export ROOT_DIR
export RULE_DIR

export HISI_LINUX_ENV=ok
export EDITION
export PLUGINS

# BUILDTIME := $(shell date "+%Y_%m_%d-%H_%M")
# GCC_VERSION := $(shell $(CC) -dumpversion )
BUILD_TIME := $(shell date "+%Y %m %d %H:%M")

INSTALL_NAME=$(NAME)_install_$(GCC_VERSION)_$(ARCH)_$(EDITION)_$(BUILDTIME).zip
UPDATE_NAME=$(NAME)_update_$(GCC_VERSION)_$(ARCH)_$(EDITION)_$(BUILDTIME).zip
#.tar.gz  

#echo 
# export ARCH
export BUILDTIME
export INSTALL_NAME
export UPDATE_NAME
export OSTYPE=linux


ifeq ($(PLUGINS),YES)
endif

SUBDIRS += bsp
SUBDIRS += fsbl
SUBDIRS += app

# V=1 
all: 
	for i in $(SUBDIRS) ; do ( cd $$i && $(MAKE) DRV_CMN_DEBUG=y CONFIG_CMN_DEBUG=y BUILD_TIME="$(BUILD_TIME)" $@ ) ; done
	bootgen -image bootimage.bif -o i BOOT.BIN -w on 


# librsa is released in binary format
clean: 
	rm -rf $(NAME)_*
	rm -rf pkg
	rm -rf Linux.bin.* 
	rm -rf *.log
	- find . -name 'Linux.obj.*' -prune -exec rm -r -f {} \;
	- find . -name 'build*' -prune -exec rm -r -f {} \;
	- find . -name '*.cmd' -prune -exec rm -r -f {} \;
	- find . -name '*.o' -prune -exec rm -r -f {} \;
	- find . -name '*.d' -prune -exec rm -r -f {} \;
	- find . -name '*.elf' -prune -exec rm -r -f {} \;
	- find . -name '*.BIN' -prune -exec rm -r -f {} \;
	- find . -name '*.a' -not -path "./bsp/ps7_cortexa9_0/libsrc/xilrsa_v1_6/src/*" -prune -exec rm -r -f {} \;
	- find . -name '*.mod' -prune -exec rm -r -f {} \;
	- find . -name '*.mod.c' -prune -exec rm -r -f {} \;
	- find . -name '*.ko' -prune -exec rm -r -f {} \;
	- find . -name '.tmp_versions' -prune -exec rm -r -f {} \;
	- find . -name '*.order' -prune -exec rm -r -f {} \;
	- find . -name '*.symvers' -prune -exec rm -r -f {} \;
	- find . -name manifest.txt -prune -exec rm -r -f {} \;
	
#include $(ROOT_DIR)/Rules.mak
# all	
#	@$(SHELL) $(ROOT_DIR)/buildver.sh $(ROOT_DIR)
install:

#	@$(SHELL) $(ROOT_DIR)/install.sh $(ROOT_DIR)/Linux.bin.$(ARCH) $(ROOT_DIR)/releases  


update:
	@$(SHELL) $(ROOT_DIR)/buildver.sh $(ROOT_DIR)
	@$(SHELL) $(ROOT_DIR)/update.sh $(ROOT_DIR)/Linux.bin.$(ARCH) $(ROOT_DIR)/releases  


#	@$(SHELL) $(ROOT_DIR)/buildver.sh $(ROOT_DIR)
#cd ..;  --exclude='$(NAME)/build*'

DIRS=$(NAME)/docs $(NAME)/samples $(NAME)/scripts $(NAME)/source $(NAME)/tests
FILES=$(NAME)/Makefile $(NAME)/Makefile.post $(NAME)/Makefile.pre $(NAME)/Rules.mak

package:clean
	cd ../; tar -cvjf $(NAME).$(BUILDTIME).tar.bz2 $(DIRS) $(FILES) 
			
