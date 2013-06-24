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
COMPONENT_VERSION=      1.2.15
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= sha256:89d30cbd38dcfb9d9e0fccc8e4ba7d6452ffad45afb3f1e9614a3be0a3a33e77
COMPONENT_ARCHIVE_URL=  http://oligarchy.co.uk/xapian/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

CONFIGURE_OPTIONS +=    --with-pic
CONFIGURE_OPTIONS +=	--without-tcl --without-lua --without-csharp --without-java
CONFIGURE_OPTIONS +=	--with-ruby
CONFIGURE_OPTIONS +=	--with-perl
CONFIGURE_OPTIONS +=	--with-php
CONFIGURE_OPTIONS_32 +=	--with-python
#CONFIGURE_OPTIONS_64 +=
CONFIGURE_OPTIONS +=	$(CONFIGURE_OPTIONS_$(BITS))

CONFIGURE_ENV_32 +=	XAPIAN_CONFIG=$(ECPREFIX)/bin/xapian-config
CONFIGURE_ENV_32 +=	PHP_CONFIG=$(ECPREFIX)/lib/php/5.3/bin/php-config
CONFIGURE_ENV_32 +=	PYTHON=$(ECPREFIX)/bin/python
CONFIGURE_ENV_64 +=	XAPIAN_CONFIG=$(ECPREFIX)/bin/$(MACH64)/xapian-config
CONFIGURE_ENV_64 +=	PHP_CONFIG=$(ECPREFIX)/lib/php/5.3/bin/$(MACH64)/php-config
#CONFIGURE_ENV_64 +=	PYTHON=$(ECPREFIX)/lib/$(MACH64)/python2.6/site-packages
#CONFIGURE_ENV_64 +=	PYTHON_LIB=$(ECPREFIX)/lib/$(MACH64)/python
CONFIGURE_ENV +=	$(CONFIGURE_ENV_$(BITS))

build:          $(BUILD_32_and_64)
#build:		$(BUILD_32)

install:        $(INSTALL_32_and_64)
#install:	$(INSTALL_32)

