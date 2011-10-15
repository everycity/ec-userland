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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mediainfo
COMPONENT_VERSION=	0.7.50
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:62e6e9e7c4937f9cb863d2a370d2946e1a8c9bc4
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = ( ${MV} MediaInfo $(COMPONENT_NAME) )

COMPONENT_PREP_ACTION = (cd $(@D)/Project/GNU/CLI; $(CONFIG_SHELL) autogen; )
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR)/Source $(@D))
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Project/GNU/CLI/configure

CONFIGURE_OPTIONS +=	--with-pic

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/doc/$(COMPONENT_NAME)
	$(CP) $(SOURCE_DIR)/History_CLI.txt $(PROTO_DIR)$(ECPREFIX)/share/doc/$(COMPONENT_NAME)
	$(CP) $(SOURCE_DIR)/License.html $(PROTO_DIR)$(ECPREFIX)/share/doc/$(COMPONENT_NAME)

