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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libiconv
COMPONENT_FMRI=		library/gnu-libiconv
COMPONENT_VERSION=	1.15
COMPONENT_LICENSE=	GPLv3,LGPLv2
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/libiconv/
COMPONENT_SUMMARY=	Library used to convert between different character encodings
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_OPTIONS+=	--docdir=$(USRSHAREDOCDIR)/libiconv

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test: build
	@cd $(BUILD_DIR_32); $(MAKE) check
	@cd $(BUILD_DIR_64); $(MAKE) check

