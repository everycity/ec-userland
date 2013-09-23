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

COMPONENT_NAME=		gpac
COMPONENT_FMRI=		multimedia/gpac
COMPONENT_VERSION=	0.5.0
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://gpac.wp.institut-telecom.fr/"
COMPONENT_SUMMARY=	OpenSource multimedia framework
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE_NAME=	$(COMPONENT_NAME)-code-4774-trunk
COMPONENT_ARCHIVE=	$(COMPONENT_ARCHIVE_NAME).zip
COMPONENT_ARCHIVE_HASH=	sha256:b7f089efd5782acce746e5699ef6850b7dd49fe28c5e52801bb20ac321bcb035
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/code-snapshots/svn/g/gp/$(COMPONENT_NAME)/code/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = ( \
	${MV} source/$(COMPONENT_ARCHIVE_NAME)/$(COMPONENT_NAME) source/ ; \
	${RM} -r source/$(COMPONENT_ARCHIVE_NAME) ; )

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

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

CONFIGURE_OPTIONS+=	--verbose
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

