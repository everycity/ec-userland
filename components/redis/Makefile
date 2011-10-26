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

COMPONENT_NAME=		redis
COMPONENT_VERSION=	2.2.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:75b953e4a3067570555c5f3f5e8f481c40489904
COMPONENT_ARCHIVE_URL=	http://redis.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
#include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

include ../../make-rules/shared-targets.mk

CLEAN_PATHS +=	$(BUILD_DIR)

COMPONENT_BUILD_ENV.32 += 'CC=$(ECPREFIX)/bin/gcc -m32 -I$(ECPREFIX)/include'
COMPONENT_INSTALL_ENV.32 += 'CC=$(ECPREFIX)/bin/gcc -m32'
COMPONENT_BUILD_ENV.64 += 'CC=$(ECPREFIX)/bin/gcc -DBYTE_ORDER=LITTLE_ENDIAN -m64 -I$(ECPREFIX)/include/$(MACH64) -L$(ECPREFIX)/lib/$(MACH64)'
COMPONENT_INSTALL_ENV.64 += 'CC=$(ECPREFIX)/bin/gcc -m64'

COMPONENT_INSTALL_TARGETS += os=solaris PREFIX=$(PROTO_DIR)/$(ECPREFIX)
COMPONENT_PRE_INSTALL_ACTION= \
        (for i in bin include lib sbin share/man/man8; do \
        mkdir -p $(PROTO_DIR)/$(ECPREFIX)/$$i; done)

$(BUILD_DIR)/$(MACH32)/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64)/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32)/.built:          BITS=32
$(BUILD_DIR)/$(MACH64)/.built:          BITS=64
$(BUILD_DIR)/$(MACH32)/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64)/.installed:      BITS=64

CONFIGURE_ENV += $(CONFIGURE_ENV.$(BITS))
COMPONENT_INSTALL_ENV += $(COMPONENT_INSTALL_ENV.$(BITS))
COMPONENT_BUILD_ENV += $(COMPONENT_BUILD_ENV.$(BITS))

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
	(cd $(@D)/src ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D)/src ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
		$(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS) install)
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

