# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2023 Yan Lu <yan.lu@sophgo.com>
#

include $(TOPDIR)/rules.mk

ARCH:=riscv64
BOARD:=nuclei
BOARDNAME:=Nuclei-based SoCs. 
FEATURES:=ext4
KERNELNAME:=Image dtbs
SUBTARGETS:=vega

KERNEL_PATCHVER:=5.8

include $(INCLUDE_DIR)/target.mk

define Target/Description
        Build firmware images for the Milk-V Vega Switch. 
endef

$(eval $(call BuildTarget))
