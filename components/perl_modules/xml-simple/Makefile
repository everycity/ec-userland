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
# Copyright (c) 2012, Igor Kozhukhov <ikozhukhov@gmail.com>.  All rights reserved.
# Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		XML-Simple
COMPONENT_VERSION=	2.20
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:5cff13d0802792da1eb45895ce1be461903d98ec97c9c953bc8406af7294434a
COMPONENT_ARCHIVE_URL=	\
    http://www.cpan.org/authors/id/G/GR/GRANTM/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	http://search.cpan.org/~grantm/
COMPONENT_BUGDB=	perl-mod/xml-parser

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/ips.mk
include $(WS_TOP)/make-rules/makemaker.mk

# man pages go in the common area
COMPONENT_INSTALL_ENV += INSTALLVENDORMAN3DIR=$(USRSHAREMAN3DIR)

# look in XML::Parser's proto area
PERL_FLAGS.5.12 = -I$(WS_COMPONENTS)/perl_modules/xml-parser/build/prototype/$(MACH)/usr/lib/perl/vendor_perl/$(PERL_VERSION)/$(PERL_ARCH.5.12)
PERL_FLAGS.5.18 = -I$(WS_COMPONENTS)/perl_modules/xml-parser/build/prototype/$(MACH)/usr/lib/perl/vendor_perl/$(PERL_VERSION)/$(PERL_ARCH.5.18)
PERL_FLAGS = $(PERL_FLAGS.$(PERL))

COMPONENT_TEST_TARGETS = test

# special targets; need xml-parser built and installed first
$(WS_COMPONENTS)/perl_modules/xml-parser/build/$(PERL_VERSION)/.installed:
	(cd $(WS_COMPONENTS)/perl_modules/xml-parser ; $(GMAKE) JOBS=$(JOBS) install)

$(BUILD_32):	\
		$(WS_COMPONENTS)/perl_modules/xml-parser/build/$(PERL_VERSION)/.installed

$(BUILD_64):	\
		$(WS_COMPONENTS)/perl_modules/xml-parser/build/$(PERL_VERSION)/.installed

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

	#
	# Must have xml-parser installed for these tests to pass.
	#
test:		$(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include $(WS_TOP)/make-rules/depend.mk
