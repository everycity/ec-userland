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

COMPONENT_NAME=		ssmtp
COMPONENT_FMRI=		mail/ssmtp
COMPONENT_SUMMARY=	extremely simple MTA to get mail off the system to a mail hub
COMPONENT_VERSION=	2.64
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).orig.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36
COMPONENT_ARCHIVE_URL=	 http://cdn.debian.net/debian/pool/main/s/ssmtp/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	 http://cdn.debian.net/debian/pool/main/s/ssmtp/
COMPONENT_LICENSE=		GPLv2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION=  (cd $(@D) ; autoconf)

COMPONENT_PRE_CONFIGURE_ACTION = $(CLONEY) $(SOURCE_DIR) $(@D)

CONFIGURE_OPTIONS+= --enable-logfile
CONFIGURE_OPTIONS+= --enable-ssl
CONFIGURE_OPTIONS+= --enable-inet6
#CONFIGURE_OPTIONS+= --enable-md5auth

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built

	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/ssmtp
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man/man5
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man/man8

	$(CP) $(@D)/ssmtp $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(@D)/ssmtp.conf $(PROTO_DIR)$(ECPREFIX)/etc/ssmtp
	$(CP) $(@D)/revaliases $(PROTO_DIR)$(ECPREFIX)/etc/ssmtp

	$(CP) $(@D)/ssmtp.conf.5 $(PROTO_DIR)$(ECPREFIX)/share/man/man5
	$(CP) $(@D)/ssmtp.8 $(PROTO_DIR)$(ECPREFIX)/share/man/man8

	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)
