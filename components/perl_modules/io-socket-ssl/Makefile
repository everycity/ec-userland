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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		IO-Socket-SSL
COMPONENT_FMRI=         library/perl-5/perl-io-tty-512
COMPONENT_VERSION=      1.962
COMPONENT_LICENSE=      PERL
COMPONENT_PROJECT_URL=  http://search.cpan.org/~sullr/IO-Socket-SSL-$(COMPONENT_VERSION)
COMPONENT_SUMMARY=	PERL IO::Socket-SSL module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a5776b471e8be1d0614c42a52d0e6838e41e5db86a2b795d507b7a422f4ccb3f
COMPONENT_ARCHIVE_URL=	http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(PERL.5.12) Makefile.PL
COMPONENT_INSTALL_TARGETS = install_vendor

build:		$(BUILD_32)

install:	$(INSTALL_32)

