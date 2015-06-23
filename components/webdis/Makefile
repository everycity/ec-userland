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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		webdis
COMPONENT_FMRI=         web/application/webdis
COMPONENT_VERSION=      0.1.1.20150526
COMPONENT_LICENSE=      2 Clause BSD
COMPONENT_PROJECT_URL=  "http://webd.is/"
COMPONENT_SUMMARY=	A Redis HTTP interface with JSON output
COMPONENT_SRC=		$(COMPONENT_NAME)-master
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6471c1d9ac61bcd36fcd15d0dea53d0c1a7bbd449a4ae1b7f639985bb8e4fb13
COMPONENT_ARCHIVE_URL=	https://github.com/nicolasff/webdis/archive/master.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV+=	CC_BITS="$(CC_BITS)" PREFIX="$(ECPREFIX)"
COMPONENT_INSTALL_ENV+=	PREFIX="$(ECPREFIX)"
COMPONENT_INSTALL_ARGS=	DESTDIR="$(PROTO_DIR)"

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/webdis $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) -d $(PROTO_DIR)$(ECPREFIX)/var/log/
	$(TOUCH) $(PROTO_DIR)$(ECPREFIX)/var/log/webdis.log
	$(GSED) -i'' -e 's/0\.0\.0\.0/127\.0\.0\.1/' -e 's!/var/log/webdis.log!/ec/var/log/webdis.log!' $(PROTO_DIR)$(ECPREFIX)/etc/webdis.prod.json
	$(INSTALL) -D files/webdis-startup.sh $(PROTO_DIR)$(ECPREFIX)/var/svc/method/webdis.sh
	$(INSTALL) -D files/webdis-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/webdis.xml
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

