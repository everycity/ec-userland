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

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		nagios-plugins
COMPONENT_FMRI=         monitoring/nagios/plugins
COMPONENT_VERSION=      1.4.16
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://nagios-plugins.org/
COMPONENT_SUMMARY=	Official plugins for Nagios
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b0caf07e0084e9b7f10fdd71cbd3ebabcd85ad78df64da360b51233b0e73b2bd
SF_PROJECT_NAME=	nagiosplug
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

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

