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
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=         charybdis
COMPONENT_VERSION=      3.4.2
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tbz2
COMPONENT_ARCHIVE_HASH= sha256:8a38e67072d90147c40202918c82237765e339cbc849456da54994ce6e31b754
COMPONENT_ARCHIVE_URL=  http://www.stack.nl/~jilles/irc/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = ( cd $(@D); autoconf )

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS +=    --enable-openssl=$(ECPREFIX)
CONFIGURE_OPTIONS +=	--bindir=$(ECPREFIX)/lib/charybdis
CONFIGURE_OPTIONS +=	--sbindir=$(ECPREFIX)/lib/charybdis
CONFIGURE_OPTIONS +=	--sysconfdir=$(ECPREFIX)/etc/charybdis
CONFIGURE_OPTIONS +=	--with-confdir=$(ECPREFIX)/etc/charybdis
CONFIGURE_OPTIONS +=	--with-helpdir=$(ECPREFIX)/share/doc/charybdis
CONFIGURE_OPTIONS +=	--with-moduledir=$(ECPREFIX)/lib/charybdis/modules
CONFIGURE_OPTIONS +=	--with-logdir=$(ECPREFIX)/var/log/charybdis
CONFIGURE_OPTIONS +=	--with-rundir=$(ECPREFIX)/var/run

COMPONENT_PRE_INSTALL_ACTION  +=       ( \
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/log/charybdis )
COMPONENT_POST_INSTALL_ACTION +=       ( \
	$(MV) $(PROTO_DIR)$(ECPREFIX)/etc/charybdis/example.conf \
	    $(PROTO_DIR)$(ECPREFIX)/etc/charybdis/ircd.conf )

build:          $(BUILD_32)

install:        $(INSTALL_32)

