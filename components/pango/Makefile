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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pango
COMPONENT_FMRI=		library/pango
COMPONENT_VERSION=	1.36.3
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.pango.org/"
COMPONENT_SUMMARY=	Layout and rendering of internationalized text
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:ad48e32917f94aa9d507486d44366e59355fcfd46ef86d119ddcba566ada5d22
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/pango
	$(PROTO_DIR)$(ECPREFIX)/bin/pango-querymodules > $(PROTO_DIR)$(ECPREFIX)/etc/pango/pango.modules
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/$(MACH64)/pango
	$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/pango-querymodules > $(PROTO_DIR)$(ECPREFIX)/etc/$(MACH64)/pango/pango.modules
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
