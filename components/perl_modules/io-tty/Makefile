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

COMPONENT_NAME=		IO-Tty
COMPONENT_FMRI=         library/perl-5/perl-io-tty-518
COMPONENT_VERSION=      1.10
COMPONENT_LICENSE=      PERL
COMPONENT_PROJECT_URL=  http://search.cpan.org/~toddr/IO-Tty-1.10/
COMPONENT_SUMMARY=	PERL IO::Tty module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:31a6e21ad187ec5ea93c2b898d6b3519647c5fce9f394b6d3c05a1f7c3f6f8b1
COMPONENT_ARCHIVE_URL=	http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(PERL) Makefile.PL
COMPONENT_INSTALL_TARGETS = install_vendor

build:		$(BUILD_64)

install:	$(INSTALL_64)

