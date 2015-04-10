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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		nagios
COMPONENT_FMRI=         monitoring/nagios/core
COMPONENT_VERSION=      4.0.8
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.nagios.org/
COMPONENT_SUMMARY=	IT Infrastructure Monitoring
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8b268d250c97851775abe162f46f64724f95f367d752ae4630280cc5d368ca4b
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_SCRIPT_32=	$(BUILD_DIR_32)/configure
CONFIGURE_SCRIPT_64=	$(BUILD_DIR_64)/configure
CONFIGURE_SCRIPT=	$(CONFIGURE_SCRIPT_$(BITS))
CONFIGURE_PREFIX=	$(ECPREFIX)/nagios
CONFIGURE_OPTIONS+=	--with-httpd-conf=$(ECPREFIX)/etc/apache/2.2/sites-available

COMPONENT_BUILD_TARGETS=	all
COMPONENT_INSTALL_TARGETS=	install install-config install-webconf

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

