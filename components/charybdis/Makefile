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

CONFIGURE_OPTIONS +=    --enable-openssl=$(USRDIR)
CONFIGURE_OPTIONS +=	--bindir=$(USRDIR)/lib/charybdis
CONFIGURE_OPTIONS +=	--sbindir=$(USRDIR)/lib/charybdis
CONFIGURE_OPTIONS +=	--sysconfdir=$(CONFIGURE_SYSCONFDIR)/charybdis
CONFIGURE_OPTIONS +=	--with-confdir=$(CONFIGURE_SYSCONFDIR)/charybdis
CONFIGURE_OPTIONS +=	--with-helpdir=$(USRDIR)/share/doc/charybdis
CONFIGURE_OPTIONS +=	--with-moduledir=$(USRDIR)/lib/charybdis/modules
CONFIGURE_OPTIONS +=	--with-logdir=$(CONFIGURE_LOCALSTATEDIR)/log/charybdis
CONFIGURE_OPTIONS +=	--with-rundir=$(CONFIGURE_LOCALSTATEDIR)/run

COMPONENT_PRE_INSTALL_ACTION  +=       ( \
	$(MKDIR) $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/log/charybdis )
COMPONENT_POST_INSTALL_ACTION +=       ( \
	$(MV) $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/charybdis/example.conf \
	    $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/charybdis/ircd.conf )

build:          $(BUILD_32)

install:        $(INSTALL_32)

