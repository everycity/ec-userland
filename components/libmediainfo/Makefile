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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libmediainfo
COMPONENT_VERSION=	0.7.50
COMPONENT_SRC=		MediaInfoLib
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:68faa49142a5a1951199d7c1d592163c23392931466749d7deb16243c1ecbdec
SF_PROJECT_NAME=	mediainfo
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

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

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/MediaInfo
	$(CP) $(SOURCE_DIR)/Source/MediaInfo/MediaInfo.h $(PROTO_DIR)$(ECPREFIX)/include/MediaInfo
	$(CP) $(SOURCE_DIR)/Source/MediaInfo/MediaInfoList.h $(PROTO_DIR)$(ECPREFIX)/include/MediaInfo
	$(CP) $(SOURCE_DIR)/Source/MediaInfo/MediaInfo_Const.h $(PROTO_DIR)$(ECPREFIX)/include/MediaInfo
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	echo "#!/bin/sh" > $(PROTO_DIR)$(ECPREFIX)/bin/libmediainfo-config
	cat $(BUILD_DIR_32)/libmediainfo-config | sed -e 's/\(-DUNICODE.*\)\(-DUNICODE\)/\1/' | \
		sed -e 's|[a-z/L\-]*home[.a-z/0-9\-]*||g' | \
		sed -e 's|\(-L/ec/lib.*\)\(-L/ec/lib\)|\1|' | sed -e 's/\s\s*/ /g' >> \
		$(PROTO_DIR)$(ECPREFIX)/bin/libmediainfo-config
	echo "#!/bin/sh" > $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/libmediainfo-config
	cat $(BUILD_DIR_64)/libmediainfo-config | sed -e 's/\(-DUNICODE.*\)\(-DUNICODE\)/\1/' | \
		sed -e 's|[a-z/L\-]*home[.a-z/0-9\-]*||g' | \
		sed -e 's|\(-L/ec/lib/amd64.*\)\(-L/ec/lib/amd64\)|\1|' | \
		sed -e 's/\s\s*/ /g' >> \
		$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/libmediainfo-config
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
