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

COMPONENT_NAME=		openvpn
COMPONENT_FMRI=         network/security/openvpn
COMPONENT_VERSION=      2.3.6
COMPONENT_LICENSE=      "Multiple Open Source Licenses"
COMPONENT_PROJECT_URL=  "http://openvpn.net/index.php/open-source.html"
COMPONENT_SUMMARY=	OpenVPN is a full-featured open source SSL VPN solution
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:adae2ef34c9225347a844683b88caa87cde0979b7f2390fd1776db0eb51510ed
COMPONENT_ARCHIVE_URL=	http://swupdate.openvpn.org/community/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	-disable-debug --disable-dependency-tracking --enable-password-save

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

