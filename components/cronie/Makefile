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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cronie
COMPONENT_VERSION=	1.4.8
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:1d2ce3a6ca2a6f96ff31921e4060be3199dc10f3
COMPONENT_ARCHIVE_URL=	https://fedorahosted.org/releases/c/r/cronie/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS+=	--sysconfdir=/etc
CONFIGURE_OPTIONS+=	--localstatedir=/var
CONFIGURE_OPTIONS+=	--enable-anacron
CONFIGURE_OPTIONS+=	--enable-pie

build:		$(BUILD_32)

install:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)/var/spool/cron
	$(MKDIR) $(PROTO_DIR)/etc/cron.d
	$(INSTALL) -m644 $(SOURCE_DIR)/contrib/anacrontab $(PROTO_DIR)/etc/anacrontab
	$(INSTALL) -m644 $(SOURCE_DIR)/contrib/0hourly $(PROTO_DIR)/etc/cron.d/0hourly
	$(MKDIR) $(PROTO_DIR)/etc/cron.hourly
	$(INSTALL) -m755 $(SOURCE_DIR)/contrib/0anacron $(PROTO_DIR)/etc/cron.hourly/0anacron
	$(MKDIR) $(PROTO_DIR)/var/spool/anacron
	touch $(PROTO_DIR)/var/spool/anacron/cron.daily
	touch $(PROTO_DIR)/var/spool/anacron/cron.weekly
	touch $(PROTO_DIR)/var/spool/anacron/cron.monthly
