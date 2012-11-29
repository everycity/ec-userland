#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

GMAKE = gmake

COMPONENT_NAME=		mDNSResponder
COMPONENT_VERSION=	258.14
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:2a34794ff9a5184ce1e57ccea4001b5af6635f7b
COMPONENT_ARCHIVE_URL=	http://www.opensource.apple.com/tarballs/mDNSResponder/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_TARGETS += os=solaris LDFLAGS="$(LDFLAGS)"
COMPONENT_INSTALL_TARGETS += os=solaris INSTBASE=$(PROTO_DIR)/$(ECPREFIX)
COMPONENT_PRE_INSTALL_ACTION= \
	(for i in bin include lib sbin share/man/man8; do \
	mkdir -p $(PROTO_DIR)/$(ECPREFIX)/$$i; done)
COMPONENT_POST_INSTALL_ACTION= strip $(PROTO_DIR)/$(ECPREFIX)/bin/* \
	$(PROTO_DIR)/$(ECPREFIX)/lib/*so*

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D)/mDNSPosix; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D)/mDNSPosix ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
			$(COMPONENT_INSTALL_TARGETS))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32)

install:	build $(INSTALL_32)
