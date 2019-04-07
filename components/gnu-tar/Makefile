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

COMPONENT_NAME=		tar
COMPONENT_FMRI=		compress/gnu-tar
COMPONENT_VERSION=	1.32
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/tar/"
COMPONENT_SUMMARY=	The GNU Tar (tar) archiver
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--program-prefix=g
CONFIGURE_OPTIONS +=	--with-bzip2=$(USRDIR)/bin/bzip2
CONFIGURE_OPTIONS +=	--with-gzip=$(USRDIR)/bin/gzip
CONFIGURE_OPTIONS +=	--with-xz=$(USRDIR)/bin/xz

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	cd $(PROTOUSRBINDIR) && $(SYMLINK) gtar tar
	cd $(PROTOUSRBINDIR64) && $(SYMLINK) gtar tar
	cd $(PROTOUSRSHAREMAN1DIR) && $(SYMLINK) gtar.1 tar.1
	cd $(PROTOUSRSHAREMAN8DIR) && $(SYMLINK) grmt.8 rmt.8
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
