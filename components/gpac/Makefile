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

COMPONENT_NAME=		gpac
COMPONENT_VERSION=	0.5.0
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:42971ac39511a1b6d1db39af664ce887b38c8657328c88cd200d87a02de81c24
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/gpac/files/GPAC/GPAC%200.5.0/$(COMPONENT_ARCHIVE)/download

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--mandir=$(ECPREFIX)/share/man
CONFIGURE_OPTIONS.32+=	--libdir=lib
CONFIGURE_OPTIONS.64+=	--libdir=lib/$(MACH64)

CONFIGURE_OPTIONS.32+=	--extra-ldflags="-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib"
CONFIGURE_OPTIONS.64+=	--extra-ldflags="-L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)"
CONFIGURE_OPTIONS.64+=	--cc='gcc -m64'
CONFIGURE_OPTIONS.64+=	--cpp='g++ -m64'
CONFIGURE_OPTIONS.64+=	--cpu=amd64
CONFIGURE_OPTIONS+=	--extra-cflags="-I$(ECPREFIX)/include"
CONFIGURE_OPTIONS+=	--extra-libs="-lrt"
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-ssl
#CONFIGURE_OPTIONS+=	--enable-amr
CONFIGURE_OPTIONS+=	--disable-3d

CONFIGURE_OPTIONS+=	--X11-path=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-ft=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-jpeg=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-png=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-faad=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-mad=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-xvid=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-ffmpeg=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-ogg=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-vorbis=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-theora=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--use-openjpeg=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--disable-oss-audio

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

