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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		bash
COMPONENT_VERSION=	4.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:487840ab7134eb7901fbb2e49b0ee3d22de15cb8
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV +=	CFLAGS="$(CFLAGS)"
CONFIGURE_ENV +=	LDFLAGS="$(LDFLAGS)"
CONFIGURE_ENV +=	LIBS="$(LIBS)"

CONFIGURE_OPTIONS  +=		--localstatedir=$(ECPREFIX)/var
CONFIGURE_OPTIONS  += 		--enable-alias
CONFIGURE_OPTIONS  += 		--enable-arith-for-command
CONFIGURE_OPTIONS  += 		--enable-array-variables
CONFIGURE_OPTIONS  += 		--enable-bang-history	
CONFIGURE_OPTIONS  += 		--enable-brace-expansion	
CONFIGURE_OPTIONS  += 		--enable-casemod-attributes	
CONFIGURE_OPTIONS  += 		--enable-casemod-expansions	
CONFIGURE_OPTIONS  += 		--enable-command-timing	
CONFIGURE_OPTIONS  += 		--enable-cond-command	
CONFIGURE_OPTIONS  += 		--enable-cond-regexp	
CONFIGURE_OPTIONS  += 		--enable-coprocesses	
CONFIGURE_OPTIONS  += 		--enable-debugger	
CONFIGURE_OPTIONS  += 		--enable-directory-stack	
CONFIGURE_OPTIONS  += 		--enable-disabled-builtins	
CONFIGURE_OPTIONS  += 		--enable-dparen-arithmetic	
CONFIGURE_OPTIONS  += 		--enable-extended-glob	
CONFIGURE_OPTIONS  += 		--enable-help-builtin	
CONFIGURE_OPTIONS  += 		--enable-history	
CONFIGURE_OPTIONS  += 		--enable-job-control	
CONFIGURE_OPTIONS  += 		--enable-multibyte	
CONFIGURE_OPTIONS  += 		--enable-net-redirections	
CONFIGURE_OPTIONS  += 		--enable-process-substitution	
CONFIGURE_OPTIONS  += 		--enable-progcomp	
CONFIGURE_OPTIONS  += 		--enable-prompt-string-decoding	
CONFIGURE_OPTIONS  += 		--enable-readline	
CONFIGURE_OPTIONS  += 		--enable-restricted	
CONFIGURE_OPTIONS  += 		--enable-select	
CONFIGURE_OPTIONS  += 		--enable-separate-helpfiles	
CONFIGURE_OPTIONS  += 		--enable-single-help-strings	
CONFIGURE_OPTIONS  += 		--disable-strict-posix-default	
CONFIGURE_OPTIONS  += 		--enable-usg-echo-default	
CONFIGURE_OPTIONS  += 		--enable-xpg-echo-default	
CONFIGURE_OPTIONS  += 		--enable-mem-scramble	
CONFIGURE_OPTIONS  += 		--disable-profiling	
CONFIGURE_OPTIONS  += 		--enable-largefile
CONFIGURE_OPTIONS  += 		--enable-nls	
CONFIGURE_OPTIONS  += 		--with-bash-malloc	
CONFIGURE_OPTIONS  +=		--infodir=$(CONFIGURE_INFODIR)

build:		$(BUILD_32)

install:	$(INSTALL_32)

