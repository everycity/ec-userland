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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=         xapian-bindings
COMPONENT_VERSION=      1.2.9
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= sha1:3cd457058ae89ff62588c56308fdba0c311afbc0
COMPONENT_ARCHIVE_URL=  http://oligarchy.co.uk/xapian/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

CONFIGURE_OPTIONS +=    --with-pic
CONFIGURE_OPTIONS +=	--without-tcl --without-lua --without-csharp --without-java
CONFIGURE_OPTIONS +=	--with-python
CONFIGURE_OPTIONS +=	--with-ruby
CONFIGURE_OPTIONS +=	--with-perl
CONFIGURE_OPTIONS +=	--with-php

CONFIGURE_ENV +=	PHP_CONFIG=$(ECPREFIX)/lib/php/5.3/bin/php-config
CONFIGURE_ENV.64 +=     XAPIAN_CONFIG=$(ECPREFIX)/bin/$(MACH64)/xapian-config

build:          $(BUILD_32)

install:        $(INSTALL_32)

