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
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		p7zip
COMPONENT_VERSION=	9.20.1
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)_src_all.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = ( sed -i 's/^\(.*chmod.*\)/\#\1/g' $(@D)/install.sh )
COMPONENT_PRE_BUILD_ACTION+=	( $(CP) -R $(SOURCE_DIR)/* $(@D)/ && \
	 cd $(@D) && cp makefile.solaris_x86 makefile.machine )
COMPONENT_BUILD_TARGETS=	all
COMPONENT_INSTALL_ARGS+=	DEST_DIR="$(PROTO_DIR)" \
	DEST_HOME="$(ECPREFIX)"

build:		$(BUILD_32)

install:	$(INSTALL_32)

