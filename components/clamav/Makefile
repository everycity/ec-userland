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

COMPONENT_NAME=		clamav
COMPONENT_FMRI=		security/antivirus/clamav
COMPONENT_VERSION=	0.99.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.clamav.net/"
COMPONENT_SUMMARY=	ClamAV is an open source (GPL) antivirus engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e144689122d3f91293808c82cbb06b7d3ac9eca7ae29564c5d148ffe7b25d58a
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic --with-xml=$(ECPREFIX) --with-zlib=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-libbz2-prefix=$(ECPREFIX) --with-libcurl=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-openssl=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

