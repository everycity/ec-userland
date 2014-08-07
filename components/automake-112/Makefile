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
COMPONENT_FMRI=		developer/build/automake-112
COMPONENT_VERSION=      1.12.2
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/automake/"
COMPONENT_SUMMARY=	Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards.
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH= sha256:5fb56e918189b377a22368e19baaf70252bd85a9969ed5f8a8373f49e8faf07f
COMPONENT_ARCHIVE_URL=  $(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--program-suffix=-$(COMPONENT_VERSION)

build:          $(BUILD_32)

install:        $(INSTALL_32)

