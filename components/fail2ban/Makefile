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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		fail2ban
COMPONENT_FMRI=         security/fail2ban
COMPONENT_VERSION=      0.9.5
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "http://www.fail2ban.org/wiki/index.php/Main_Page"
COMPONENT_SUMMARY=	Fail2ban scans log files and bans IPs that show the malicious signs
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:888ca1d8c5245b6f23391dd8e3b0e0a4279b682e966326a6572a330496ca8ee8
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB_2)

include ../../make-rules/prep.mk
include ../../make-rules/setup.py.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

