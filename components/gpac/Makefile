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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gpac
COMPONENT_FMRI=		multimedia/gpac
COMPONENT_VERSION=	2014.11.28
GIT_COMMIT_ID=		fc32cebbe682a47804c8bf9eba6d0d4837aae88f
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://gpac.wp.institut-telecom.fr/"
COMPONENT_SUMMARY=	OpenSource multimedia framework
COMPONENT_SRC=		$(COMPONENT_NAME)-$(GIT_COMMIT_ID)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bd09d67c1b48da7f683579feec905f1e6ae9f01e57f4ec36c0ac66d23d15c594
COMPONENT_ARCHIVE_URL=	https://codeload.github.com/gpac/gpac/tar.gz/$(GIT_COMMIT_ID)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS=	--prefix=$(USRDIR)
CONFIGURE_OPTIONS+=	--mandir=$(USRDIR)/share/man
CONFIGURE_OPTIONS.32+=	--libdir=lib
CONFIGURE_OPTIONS.64+=	--libdir=lib/$(MACH64)

CONFIGURE_OPTIONS+=	--extra-ldflags="$(LDFLAGS)"
CONFIGURE_OPTIONS+=	--cc='gcc $(CC_BITS)'
CONFIGURE_OPTIONS+=	--cpp='g++ $(CC_BITS)'
CONFIGURE_OPTIONS.64+=	--cpu=amd64
CONFIGURE_OPTIONS+=	--extra-cflags="$(CFLAGS)"
CONFIGURE_OPTIONS+=	--extra-libs="-lrt"
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

CONFIGURE_OPTIONS+=	--verbose
CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-ssl
CONFIGURE_OPTIONS+=	--disable-3d

CONFIGURE_OPTIONS+=	--X11-path=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-ft=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-jpeg=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-png=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-faad=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-mad=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-xvid=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-ffmpeg=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-ogg=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-vorbis=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-theora=$(USRDIR)
CONFIGURE_OPTIONS+=	--use-openjpeg=$(USRDIR)
CONFIGURE_OPTIONS+=	--disable-oss-audio

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

