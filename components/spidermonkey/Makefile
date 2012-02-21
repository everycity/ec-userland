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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		spidermonkey
COMPONENT_VERSION=	1.8.5
COMPONENT_SRC=		js-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	js185-1.0.0.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:52a01449c48d7a117b35f213d3e4263578d846d6
COMPONENT_ARCHIVE_URL=	http://ftp.mozilla.org/pub/mozilla.org/js/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION +=	( cd $(SOURCE_DIR)/js/src && autoconf && \
	$(GPATCH) -d $(SOURCE_DIR)/js/src $(GPATCH_FLAGS) < \
	$(COMPONENT_DIR)/pre-conf-patches/remove-soname.patch )

COMPONENT_PRE_CONFIGURE_ACTION +=	( $(CLONEY) $(SOURCE_DIR)/js/src $(@D) )

CONFIGURE_SCRIPT   =    $(@D)/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

