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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		grep
COMPONENT_FMRI=		text/gnu-grep
COMPONENT_VERSION=	3.3
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://gnu.org/software/grep/"
COMPONENT_SUMMARY=	GNU grep utilities
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#LDFLAGS+=	-liconv

CONFIGURE_OPTIONS+=	--program-prefix=g

PROGS=		egrep fgrep grep
GNUPROGS=	$(PROGS)
GNUMAN1=	$(PROGS:%=%.1)
SFWPROGS=	$(PROGS:%=g%)

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	cd $(PROTOUSRBINDIR) && \
		$(SYMLINK) gegrep egrep && \
		$(SYMLINK) gfgrep fgrep && \
		$(SYMLINK) ggrep grep
	cd $(PROTOUSRBINDIR64) && \
		$(SYMLINK) gegrep egrep && \
		$(SYMLINK) gfgrep fgrep && \
		$(SYMLINK) ggrep grep
	cd $(PROTOUSRSHAREMAN1DIR) && \
		$(SYMLINK) gegrep.1 egrep.1 && \
		$(SYMLINK) gfgrep.1 fgrep.1 && \
		$(SYMLINK) ggrep.1 grep.1 
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

