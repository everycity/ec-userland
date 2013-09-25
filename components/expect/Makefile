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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		expect
COMPONENT_FMRI=         shell/expect
COMPONENT_VERSION=      5.45
COMPONENT_LICENSE=      expect
COMPONENT_PROJECT_URL=  http://expect.sourceforge.net/#unix
COMPONENT_SUMMARY=	Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc
COMPONENT_SRC=		$(COMPONENT_NAME)$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040
COMPONENT_ARCHIVE_URL=	http://surfnet.dl.sourceforge.net/project/expect/Expect/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-tcl=$(ECPREFIX)/lib

build:		$(BUILD_32)

install:	$(INSTALL_32)

