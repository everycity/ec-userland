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

COMPONENT_NAME=		HTTP-Message
COMPONENT_FMRI=         library/perl-5/perl-http-message-512
COMPONENT_VERSION=      6.06
IPS_COMPONENT_VERSION=	6.6
COMPONENT_LICENSE=      PERL
COMPONENT_PROJECT_URL=  http://search.cpan.org/~gaas/HTTP-Message-6.06/
COMPONENT_SUMMARY=	PERL HTTP::Message module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:087e97009c5239dca4631cf433d836771b3fc5ba5685eef1965f9d3415cbad63
COMPONENT_ARCHIVE_URL=	http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(PERL.5.12) Makefile.PL
COMPONENT_INSTALL_TARGETS = install_vendor

build:		$(BUILD_32)

install:	$(INSTALL_32)

