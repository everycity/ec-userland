#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 Audioboo Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libgsm
COMPONENT_VERSION=	1.0.13
COMPONENT_SRC=		gsm-1.0-pl13
COMPONENT_ARCHIVE=	libgsm_1.0.13.orig.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:668b0a180039a50d379b3d5a22e78da4b1d90afc
COMPONENT_ARCHIVE_URL=	http://libgsm.sourcearchive.com/downloads/1.0.13-3/$(COMPONENT_ARCHIVE)

COMPONENT_PRE_INSTALL_ACTION= \
        (for i in bin include lib sbin man/man1; do \
        mkdir -p $(PROTO_DIR)/$(ECPREFIX)/$$i; done)

include ../../make-rules/prep.mk
#include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_INSTALL_ENV += INSTALL_ROOT=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_BUILD_ENV.32 += 'CC=/ec/bin/gcc -m32 -I/ec/include'
COMPONENT_INSTALL_ENV.32 += 'CC=/ec/bin/gcc -m32'
COMPONENT_BUILD_ENV.64 += 'CC=/ec/bin/gcc -m64 -I/ec/include/amd64 -L/ec/lib/amd64'
COMPONENT_INSTALL_ENV.64 += 'CC=/ec/bin/gcc -m64'

#COMPONENT_POST_INSTALL_ACTION= cp -a $(BUILD_DIR)/$(MACH)/bin/* $(PROTO_DIR)$(ECPREFIX)/bin/; cp -a $(BUILD_DIR)/$(MACH)/lib/* $(PROTO_DIR)$(ECPREFIX)/lib/; cp -a $(BUILD_DIR)/$(MACH)/include/* $(PROTO_DIR)$(ECPREFIX)/include/

$(BUILD_DIR)/$(MACH32)/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64)/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32)/.built:          BITS=32
$(BUILD_DIR)/$(MACH64)/.built:          BITS=64
$(BUILD_DIR)/$(MACH32)/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64)/.installed:      BITS=64

CONFIGURE_ENV += $(CONFIGURE_ENV.$(BITS))
COMPONENT_INSTALL_ENV += $(COMPONENT_INSTALL_ENV.$(BITS))
COMPONENT_BUILD_ENV += $(COMPONENT_BUILD_ENV.$(BITS))

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cp -r $(SOURCE_DIR)/* $(@D) ; cd $(@D)/src) \
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

# build the configured source
$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
		$(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS) install)
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

