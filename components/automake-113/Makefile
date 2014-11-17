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

COMPONENT_NAME=         automake
COMPONENT_FMRI=		developer/build/automake-113
COMPONENT_VERSION=      1.13.4
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/automake/"
COMPONENT_SUMMARY=	Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards.
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH= sha256:89ce4933f59b8f0c20115c39cfe450a595cca74ede27b6881e88ec27720d1d66
COMPONENT_ARCHIVE_URL=  $(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:          $(BUILD_32)

$(BUILD_DIR)/.installed:        $(INSTALL_32)
	$(MV) $(PROTO_DIR)$(ECPREFIX)/share/man/man1/aclocal-1.13.1 $(PROTO_DIR)$(ECPREFIX)/share/man/man1/aclocal-1.13
	$(MV) $(PROTO_DIR)$(ECPREFIX)/share/man/man1/automake-1.13.1 $(PROTO_DIR)$(ECPREFIX)/share/man/man1/automake-1.13
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

