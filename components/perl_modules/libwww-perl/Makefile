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

COMPONENT_NAME=		libwww-perl
COMPONENT_FMRI=         library/perl-5/perl-libwww-512
COMPONENT_VERSION=      6.05
IPS_COMPONENT_VERSION=	6.5
COMPONENT_LICENSE=      PERL
COMPONENT_PROJECT_URL=  http://search.cpan.org/~gaas/libwww-perl-6.05/
COMPONENT_SUMMARY=	The World-Wide Web library for Perl
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7b25799ff7eec18e8e4e97dc0cad7b2a5b433b50b13feb59d9179173bee78f23
COMPONENT_ARCHIVE_URL=	http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(PERL.5.12) Makefile.PL
COMPONENT_INSTALL_TARGETS = install_vendor

build:		$(BUILD_32)

install:	$(INSTALL_32)

