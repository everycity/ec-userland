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
# Copyright 2011, 2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		bash
COMPONENT_FMRI=         shell/bash
COMPONENT_VERSION=	4.3
COMPONENT_LICENSE=      GPLv3, FDLv1.2
COMPONENT_PROJECT_URL=  http://www.gnu.org/software/bash/
COMPONENT_SUMMARY=      GNU Bourne-Again shell (bash)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)
COMPONENT_AUTOGEN_MANIFEST=	yes
COMPONENT_LICENSE_FILE=	COPYING

CONFIGURE_DEFAULT_SHAREDLIB=no

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV+=	LIBS="$(LIBS)"

GPATCH_FLAGS=	-p0

CONFIGURE_OPTIONS+=	--enable-alias
CONFIGURE_OPTIONS+=	--enable-arith-for-command
CONFIGURE_OPTIONS+=	--enable-array-variables
CONFIGURE_OPTIONS+=	--enable-bang-history	
CONFIGURE_OPTIONS+=	--enable-brace-expansion	
CONFIGURE_OPTIONS+=	--enable-casemod-attributes	
CONFIGURE_OPTIONS+=	--enable-casemod-expansions	
CONFIGURE_OPTIONS+=	--enable-command-timing	
CONFIGURE_OPTIONS+=	--enable-cond-command	
CONFIGURE_OPTIONS+=	--enable-cond-regexp	
CONFIGURE_OPTIONS+=	--enable-coprocesses	
CONFIGURE_OPTIONS+=	--enable-debugger	
CONFIGURE_OPTIONS+=	--enable-directory-stack	
CONFIGURE_OPTIONS+=	--enable-disabled-builtins	
CONFIGURE_OPTIONS+=	--enable-dparen-arithmetic	
CONFIGURE_OPTIONS+=	--enable-extended-glob	
CONFIGURE_OPTIONS+=	--enable-help-builtin	
CONFIGURE_OPTIONS+=	--enable-history	
CONFIGURE_OPTIONS+=	--enable-job-control	
CONFIGURE_OPTIONS+=	--enable-multibyte	
CONFIGURE_OPTIONS+=	--enable-net-redirections	
CONFIGURE_OPTIONS+=	--enable-process-substitution	
CONFIGURE_OPTIONS+=	--enable-progcomp	
CONFIGURE_OPTIONS+=	--enable-prompt-string-decoding	
CONFIGURE_OPTIONS+=	--enable-readline	
CONFIGURE_OPTIONS+=	--enable-restricted	
CONFIGURE_OPTIONS+=	--enable-select	
CONFIGURE_OPTIONS+=	--enable-separate-helpfiles	
CONFIGURE_OPTIONS+=	--enable-single-help-strings	
CONFIGURE_OPTIONS+=	--disable-strict-posix-default	
CONFIGURE_OPTIONS+=	--enable-usg-echo-default	
CONFIGURE_OPTIONS+=	--enable-xpg-echo-default	
CONFIGURE_OPTIONS+=	--enable-mem-scramble	
CONFIGURE_OPTIONS+=	--disable-profiling	
CONFIGURE_OPTIONS+=	--enable-largefile
CONFIGURE_OPTIONS+=	--enable-nls	
CONFIGURE_OPTIONS+=	--with-bash-malloc	

build:		$(BUILD_32)

install:	$(INSTALL_32)

