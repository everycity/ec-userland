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
# Copyright 2011-2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		binutils
COMPONENT_FMRI=         developer/gnu-binutils
COMPONENT_VERSION=	2.23.2
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://www.gnu.org/software/binutils/
COMPONENT_SUMMARY=      GNU binutils
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	\
    sha256:fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CFLAGS += -std=gnu99
CFLAGS += -Wno-maybe-uninitialized
CFLAGS += $(CPP_LARGEFILES) $(CPP_POSIX)
CXXFLAGS += $(CPP_LARGEFILES) $(CPP_POSIX)
CPPFLAGS += $(CPP_LARGEFILES) $(CPP_POSIX)

CONFIGURE_OPTIONS +=	--enable-targets=$(GNU_ARCH_64)
CONFIGURE_OPTIONS +=	--with-sysroot=/
CONFIGURE_OPTIONS +=	--mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS +=	--infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS +=	--enable-64-bit-bfd
CONFIGURE_OPTIONS +=    --enable-gold=no
CONFIGURE_OPTIONS +=    --enable-plugins=no
CONFIGURE_OPTIONS +=    --enable-nls
CONFIGURE_OPTIONS +=    --disable-libtool-lock
CONFIGURE_OPTIONS +=    --enable-largefile=yes

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) && $(RM) etc/standards.info && \
	sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in && \
	sed -i -e 's/@colophon/@@colophon/' \
		-e 's/doc@cygnus.com/doc@@cygnus.com/' bfd/doc/bfd.texinfo \
		-e 's/doc@cygnus.com/doc@@cygnus.com/' ld/ld.texinfo )

# common targets
build:		$(BUILD_32)

install:	$(INSTALL_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

test: $(TEST_32)

include ../../make-rules/depend.mk
