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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		Image-ExifTool
COMPONENT_FMRI=         library/perl-5/perl-image-exiftool-518
COMPONENT_VERSION=      10.38
COMPONENT_LICENSE=      PERL
COMPONENT_PROJECT_URL=  "http://www.sno.phy.queensu.ca/~phil/exiftool/"
COMPONENT_SUMMARY=	PERL ExifTool module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b94a406f63cff2c0cccc75037076d0f54775c5adfc620ceae7e7523d85c9fc7b
COMPONENT_ARCHIVE_URL=	http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.38.tar.gz

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(PERL) Makefile.PL
COMPONENT_INSTALL_TARGETS = install_vendor

build:		$(BUILD_64)

install:	$(INSTALL_64)
