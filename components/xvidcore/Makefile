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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		xvidcore
COMPONENT_VERSION=	1.3.2
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:56e065d331545ade04c63c91153b9624b51d6e1b
COMPONENT_ARCHIVE_URL=	http://downloads.xvid.org/downloads/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV+=LD=/ec/bin/ld
COMPONENT_BUILD_ENV.32+=LD_ALTEXEC=/ec/bin/ld
COMPONENT_BUILD_ENV.64+=LD_ALTEXEC=/ec/bin/amd64/ld
COMPONENT_BUILD_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_INSTALL_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	cp -R $(SOURCE_DIR)/* $(@D)
	(cd $(@D)/build/generic ; \
		$(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		./configure $(CONFIGURE_OPTIONS))
	$(TOUCH) $@

# build the configured source
$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	(cd $(@D)/build/generic ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_GMAKE_ARGS) $(COMPONENT_BUILD_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(TOUCH) $@

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	(cd $(@D)/build/generic ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
                $(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS))
	$(TOUCH) $@


build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

