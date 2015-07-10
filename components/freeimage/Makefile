#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		freeimage
COMPONENT_FMRI=		library/freeimage
COMPONENT_VERSION=	3.15.4
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://freeimage.sourceforge.net/"
COMPONENT_SUMMARY=	Open Source Image Library
COMPONENT_SRC=		FreeImage
COMPONENT_ARCHIVE=	FreeImage3154.zip
COMPONENT_ARCHIVE_HASH=	sha256:eb6361519d33131690a0e726b085a05825e5adf9fb72c752d8d39100e48dc829
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CFLAGS +=	-DSHARED_OBJECT $(CC_PIC)
CXXFLAGS +=	-DSHARED_OBJECT $(CC_PIC)
LDFLAGS +=	$(CC_BITS)
COMPONENT_BUILD_ENV	+=	CC="$(CC)" CFLAGS="$(CFLAGS)" \
				CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
				LDFLAGS="$(LDFLAGS)"
COMPONENT_BUILD_TARGETS	+=	OS=Solaris DESTDIR=$(PROTO_DIR)$(USRDIR)
COMPONENT_INSTALL_ARGS	=	OS=Solaris DESTDIR=$(PROTO_DIR)$(USRDIR)
COMPONENT_INSTALL_ARGS.32=	INSTALLLIBDIR=$(PROTO_DIR)$(USRDIR)/lib
COMPONENT_INSTALL_ARGS.64=	INSTALLLIBDIR=$(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
COMPONENT_INSTALL_ARGS	+=	$(COMPONENT_INSTALL_ARGS.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

