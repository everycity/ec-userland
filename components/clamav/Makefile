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
# Copyright 2022 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		clamav
COMPONENT_FMRI=		security/antivirus/clamav
COMPONENT_VERSION=	0.103.7
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.clamav.net/"
COMPONENT_SUMMARY=	ClamAV is an open source (GPL) antivirus engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1e34c31f600cb3b5bd1bf76690590cdeebe9409b330959b1c0f77d421bb17e50
COMPONENT_ARCHIVE_URL=	http://www.clamav.net/downloads/production/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic --with-xml=$(ECPREFIX) --with-zlib=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-libbz2-prefix=$(ECPREFIX) --with-libcurl=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-openssl=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

