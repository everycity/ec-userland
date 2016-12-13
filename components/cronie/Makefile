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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cronie
COMPONENT_FMRI=		service/cronie
COMPONENT_VERSION=	1.5.1
COMPONENT_LICENSE=	MIT, BSD, ISC, GPLv2
COMPONENT_PROJECT_URL=	"https://fedorahosted.org/cronie/"
COMPONENT_SUMMARY=	crond and anacron - daemons for executing programs at set times
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338
COMPONENT_ARCHIVE_URL=	https://fedorahosted.org/releases/c/r/cronie/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--sbindir=$(USRDIR)/bin
CONFIGURE_OPTIONS+=	--sysconfdir=$(CONFIGURE_SYSCONFDIR)
CONFIGURE_OPTIONS+=	--localstatedir=$(CONFIGURE_LOCALSTATEDIR)
CONFIGURE_OPTIONS+=	--enable-anacron
CONFIGURE_OPTIONS+=	--enable-pie

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf -i )

build:		$(BUILD_32)

install:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/spool/cron
	$(MKDIR) $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/cron.d
	$(INSTALL) -m644 $(SOURCE_DIR)/contrib/anacrontab $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/anacrontab
	$(INSTALL) -m644 $(SOURCE_DIR)/contrib/0hourly $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/cron.d/0hourly
	$(MKDIR) $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/cron.hourly
	$(INSTALL) -m755 $(SOURCE_DIR)/contrib/0anacron $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/cron.hourly/0anacron
	$(MKDIR) $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/spool/anacron
	touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/spool/anacron/cron.daily
	touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/spool/anacron/cron.weekly
	touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/spool/anacron/cron.monthly
