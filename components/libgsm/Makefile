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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libgsm
COMPONENT_FMRI=		library/libgsm
COMPONENT_VERSION=	1.0.13
COMPONENT_LICENSE=	BSD3CLAUSE
COMPONENT_PROJECT_URL=	"http://libgsm.sourcearchive.com/"
COMPONENT_SUMMARY=	GSM Speech Encoding Library
COMPONENT_SRC=		gsm-1.0-pl13
COMPONENT_ARCHIVE=	libgsm_1.0.13.orig.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:52c518244d428c2e56c543b98c9135f4a76ff780c32455580b793f60a0a092ad
COMPONENT_ARCHIVE_URL=	http://libgsm.sourcearchive.com/downloads/1.0.13-3/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	COPYRIGHT

BINDIR_32=	$(PROTO_DIR)$(USRDIR)/bin
BINDIR_64=	$(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
LIBDIR_32=	$(PROTO_DIR)$(USRDIR)/lib
LIBDIR_64=	$(PROTO_DIR)$(USRDIR)/lib/$(MACH64)

COMPONENT_BUILD_ENV+= CC="$(CC) $(CC_BITS)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
COMPONENT_INSTALL_ENV+= CC="$(CC) $(CC_BITS)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
COMPONENT_PRE_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)$(USRDIR)/{bin,lib} \
	$(PROTO_DIR)$(USRDIR)/{bin,lib}/$(MACH64) \
	$(PROTO_DIR)$(USRDIR)/include/gsm \
	$(PROTO_DIR)$(USRDIR)/share/man/man3
COMPONENT_INSTALL_ARGS= INSTALL_ROOT=$(PROTO_DIR)$(USRDIR) GSM_INSTALL_LIB=$(LIBDIR_$(BITS)) TOAST_INSTALL_BIN=$(BINDIR_$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

