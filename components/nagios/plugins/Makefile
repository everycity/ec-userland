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

COMPONENT_NAME=		nagios-plugins
COMPONENT_FMRI=         monitoring/nagios/plugins
COMPONENT_VERSION=      2.0.3
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://nagios-plugins.org/
COMPONENT_SUMMARY=	Official plugins for Nagios
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8f0021442dce0138f0285ca22960b870662e28ae8973d49d439463588aada04a
COMPONENT_ARCHIVE_URL=	http://nagios-plugins.org/download/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_SCRIPT_32=	$(BUILD_DIR_32)/configure
CONFIGURE_SCRIPT_64=	$(BUILD_DIR_64)/configure
CONFIGURE_SCRIPT=	$(CONFIGURE_SCRIPT_$(BITS))
CONFIGURE_PREFIX=	$(ECPREFIX)/nagios

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

