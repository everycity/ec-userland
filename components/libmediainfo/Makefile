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

COMPONENT_NAME=		libmediainfo
COMPONENT_VERSION=	0.7.50
COMPONENT_SRC=		MediaInfoLib
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:a3cae3b1ae75d60a14fc7369f922602c48254d31
COMPONENT_ARCHIVE_URL=	 http://switch.dl.sourceforge.net/project/mediainfo/source/libmediainfo/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D)/Project/GNU/Library; $(CONFIG_SHELL) autogen; )
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR)/Source $(@D))
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Project/GNU/Library/configure
CONFIGURE_OPTIONS += --with-pic --disable-static --enable-shared
CONFIGURE_OPTIONS += --with-libcurl --with-libmms

COMPONENT_BUILD_ENV += CPPFLAGS=$(CPPFLAGS)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
