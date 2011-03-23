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

COMPONENT_NAME=		nginx
COMPONENT_VERSION=	0.8.54
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:4d63c35b8974dba42cc62dd5046ae89df3528e34
COMPONENT_ARCHIVE_URL=	http://nginx.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS = --prefix=$(ECPREFIX)
CONFIGURE_OPTIONS += --user=webservd
CONFIGURE_OPTIONS += --group=webservd


$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	mkdir -p $(BUILD_DIR)
	rsync -aH --delete $(SOURCE_DIR)/ $(@D)/
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		./configure $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

CONFIGURE_OPTIONS += --with-http_ssl_module
#CONFIGURE_OPTIONS  +=		--disable-static
#CONFIGURE_OPTIONS  +=		--enable-shared
#CONFIGURE_OPTIONS  +=		CFLAGS="$(CFLAGS)"

# common targets
build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)

#install:	$(PROTOUSRSHAREMAN3DIR) $(INSTALL_32_and_64)
#	$(CP) -f $(COMPONENT_DIR)/man3/*.3 $(PROTOUSRSHAREMAN3DIR)

# build does this always
test: build
	@cd $(BUILD_DIR_32); $(MAKE) check
	@cd $(BUILD_DIR_64); $(MAKE) check

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
