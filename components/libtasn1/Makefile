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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libtasn1
COMPONENT_FMRI=		library/libtasn1
COMPONENT_VERSION=	4.10
COMPONENT_LICENSE=	LGPLv2,GPLv3
COMPONENT_LICENSE_FILE=	$(COMPONENT_NAME).license
COMPONENT_PROJECT_URL=	"https://www.gnu.org/software/libtasn1/"
COMPONENT_SUMMARY=	Libtasn1 is the ASN.1 library used by GnuTLS, GNU Shishi and some other packages
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:681a4d9a0d259f2125713f2e5766c5809f151b3a1392fd91390f780b4b8f5a02
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

build:			$(BUILD_32_and_64)

install:		$(INSTALL_32_and_64)

