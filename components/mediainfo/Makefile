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

COMPONENT_NAME=		mediainfo
COMPONENT_VERSION=	0.7.50
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:c3038999ccd63fd8ace1340981c8d2717f6a31b4a24bf218d7baae76a2d57e38
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# This is so that the 64bit libmediainfo-config gets picked up
#PATH.32	=	$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH.64	=	$(USRDIR)/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH	=	$(PATH.$(BITS))

COMPONENT_POST_UNPACK_ACTION = ( ${MV} source/MediaInfo source/$(COMPONENT_NAME) )

COMPONENT_PREP_ACTION = (cd $(@D)/Project/GNU/CLI; $(CONFIG_SHELL) autogen; )
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR)/Source $(@D))
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Project/GNU/CLI/configure

CONFIGURE_OPTIONS +=	--with-pic

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share/doc/$(COMPONENT_NAME)
	$(CP) $(SOURCE_DIR)/History_CLI.txt $(PROTO_DIR)$(USRDIR)/share/doc/$(COMPONENT_NAME)
	$(CP) $(SOURCE_DIR)/License.html $(PROTO_DIR)$(USRDIR)/share/doc/$(COMPONENT_NAME)

