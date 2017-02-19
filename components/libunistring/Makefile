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

COMPONENT_NAME=		libunistring
COMPONENT_FMRI=		library/libunistring
COMPONENT_VERSION=	0.9.7
COMPONENT_LICENSE=	LGPLv3,GPLv3
COMPONENT_LICENSE_FILE=	$(COMPONENT_NAME).license
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/libunistring/"
COMPONENT_SUMMARY=	Unicode string library for C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9ce081cbee1951b55597b30e7030bda9d7b2f034ef901a135ff3a020be5a41e5
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_OPTIONS+=	ac_cv_func_uselocale=no

build:			$(BUILD_32_and_64)

install:		$(INSTALL_32_and_64)

