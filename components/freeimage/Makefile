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

COMPONENT_NAME=		freeimage
COMPONENT_VERSION=	3.15.0
COMPONENT_SRC=		FreeImage
COMPONENT_ARCHIVE=	FreeImage3150.zip
COMPONENT_ARCHIVE_HASH=	sha1:ec2faa01d1b312aab68d77afe62861759c790100
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/3.15.0/FreeImage3150.zip

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_TARGETS+= 'CC=$(ECPREFIX)/bin/gcc $(CFLAGS)' 'CXX=$(CCC) $(CXXFLAGS)' OS=Solaris DESTDIR=$(PROTO_DIR)/$(ECPREFIX)
COMPONENT_INSTALL_TARGETS+= OS=Solaris DESTDIR=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_INSTALL_TARGETS32= INSTALLLIBDIR=$(PROTO_DIR)/$(ECPREFIX)/lib
COMPONENT_INSTALL_TARGETS64= INSTALLLIBDIR=$(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)

$(BUILD_DIR_32)/.built: BITS=32
$(BUILD_DIR_64)/.built: BITS=64
$(BUILD_DIR_32)/.install:       BITS=32

$(BUILD_DIR_64)/.install:       BITS=64

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

#$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
#	$(COMPONENT_PRE_INSTALL_ACTION)
#	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
#			$(COMPONENT_INSTALL_TARGETS) \
#			$(COMPONENT_INSTALL_TARGETS.$(BITS)))
#	$(COMPONENT_POST_INSTALL_ACTION)
#	$(TOUCH) $@

$(BUILD_DIR_32)/.installed:	$(BUILD_DIR_32)/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
			$(COMPONENT_INSTALL_TARGETS) $(COMPONENT_INSTALL_TARGETS32))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

$(BUILD_DIR_64)/.installed:   $(BUILD_DIR_64)/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
			$(COMPONENT_INSTALL_TARGETS) $(COMPONENT_INSTALL_TARGETS64))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	build $(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

