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

COMPONENT_NAME=		swig
COMPONENT_FMRI=		developer/swig
COMPONENT_VERSION=	3.0.2
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.swig.org/"
COMPONENT_SUMMARY=	SWIG is an interface compiler that connects programs written in C and C++ with scripting languages
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a2669657cabcedc371f63c0457407a183e0b6b2ef4e7e303c1ec9a3964cc7813
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-x
CONFIGURE_OPTIONS+=	--without-python3
CONFIGURE_OPTIONS.32+=	--with-python=$(ECPREFIX)/bin/python
CONFIGURE_OPTIONS.64+=	--with-python=$(ECPREFIX)/bin/$(MACH64)/python
CONFIGURE_OPTIONS.32+=	--with-java=$(ECPREFIX)/bin/java
CONFIGURE_OPTIONS.64+=	--with-java=$(ECPREFIX)/bin/$(MACH64)/java
CONFIGURE_OPTIONS.32+=	--with-javac=$(ECPREFIX)/bin/javac
CONFIGURE_OPTIONS.64+=	--with-javac=$(ECPREFIX)/bin/$(MACH64)/javac
CONFIGURE_OPTIONS+=	--with-javaincl=$(ECPREFIX)/jdk/active/include
CONFIGURE_OPTIONS.32+=	--with-ruby=$(ECPREFIX)/bin/ruby1.8
CONFIGURE_OPTIONS.64+=	--with-ruby=$(ECPREFIX)/bin/$(MACH64)/ruby1.8
CONFIGURE_OPTIONS.32+=	--with-php=$(ECPREFIX)/lib/php/5.3/bin/php-cli
CONFIGURE_OPTIONS.64+=	--with-php=$(ECPREFIX)/lib/php/5.3/bin/$(MACH64)/php-cli
CONFIGURE_OPTIONS.32+=	--with-tclconfig=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--with-tclconfig=$(ECPREFIX)/lib/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

