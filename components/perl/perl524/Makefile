#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2013, Oracle and/or its affiliates. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

#
# Note this perl is 64-bit only.
#

# I want to override PERL_VERSION and PERL_ARCH because when building
# a new version of perl it probably isn't installed so shared-macros.mk
# can't call it.

COMPONENT_NAME=		perl
COMPONENT_FMRI=		runtime/perl-524
COMPONENT_VERSION=	5.24.1
COMPONENT_SUMMARY=	Perl 5.24
PERL_VERSION=		5.24
COMPONENT_PROJECT_URL=	http://www.perl.org/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PERL5)
COMPONENT_LICENSE=	Artistic
COMPONENT_LICENSE_FILE=	Artistic

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

LD_B_DIRECT=		""

PERLDIR=	$(USRDIR)/lib/perl
PERLVERDIR=	$(PERLDIR)/$(PERL_VERSION)

COMPONENT_BUILD_ARGS =

CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure
CONFIGURE_ENV += MAKE=$(GMAKE)

CONFIGURE_OPTIONS = \
			-de \
			-Dmksymlinks \
			-Ulocincpth= \
			-Uloclibpth= \
                        -Dbin=$(PERLVERDIR)/bin \
			-Dcc="$(CC) $(CC_BITS)" \
			-Dcf_email="support@everycity.com" \
			-Dcf_by="perl-bugs" \
			-Dlibperl=libperl.so \
			-Dmyhostname="localhost" \
			-Dprefix=$(PERLVERDIR) \
                        -Dprivlib=$(PERLVERDIR)/lib \
			-Dsitelib=$(PERLDIR)/site_perl/$(PERL_VERSION) \
			-Dsiteprefix=$(PERLVERDIR) \
			-Dvendorlib=$(PERLDIR)/vendor_perl/$(PERL_VERSION) \
			-Dvendorprefix=$(PERLVERDIR) \
			-Duse64bitall \
			-Duseshrplib \
			-Dusedtrace \
			-Dusethreads \
			-Dlibpth="$(USRDIR)/lib/64 /lib/64 /usr/lib/64"

COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

#
# perl's install path for sparc is based off the value of the
# "arch" command.  So we must package that way also.
#
PKG_MACROS		+=	P_ARCH=$(shell arch)

#
# Getting 1 different result between sparc and x86.
#
COMPONENT_TEST_MASTER = $(COMPONENT_TEST_RESULTS_DIR)/results-$(MACH).master

#
# Throw out everything prior to test results.
# 2 x delete timings
#
COMPONENT_TEST_TRANSFORMS += \
	'-e "1,/runtests choose/d"' \
	'-e "/^u=/d" ' \
	'-e "/^Elapsed/d"'

build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(TEST_64)
