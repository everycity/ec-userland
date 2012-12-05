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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=         zfs-auto-snapshot
COMPONENT_VERSION=      5441075
IPS_COMPONENT_VERSION=  0.12
COMPONENT_SRC=          zfs-auto-snapshot-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      aszeszo-$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4991d6cd505941f8b150dd5970fd570eed3189d27bccd14e73710203bd470758
COMPONENT_ARCHIVE_URL=  https://nodeload.github.com/aszeszo/$(COMPONENT_NAME)/tar.gz/$(COMPONENT_VERSION)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

build: prep

install: prep
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/svc/method
	$(MKDIR) $(PROTO_DIR)/var/svc/manifest/site
	cat $(SOURCE_DIR)/src/lib/svc/method/zfs-auto-snapshot | \
	    $(GSED) -e 's%/lib/svc/method%$(ECPREFIX)/var/svc/method%g' \
	        -e 's/NOW=.*/NOW=$$\(env TZ=UTC date +%s\)/' > \
	    $(PROTO_DIR)$(ECPREFIX)/var/svc/method/zfs-auto-snapshot
	$(CHMOD) +x $(PROTO_DIR)$(ECPREFIX)/var/svc/method/zfs-auto-snapshot
	
	cat $(SOURCE_DIR)/src/var/svc/manifest/system/filesystem/auto-snapshot.xml | \
	    $(GSED) 's%/lib/svc/method%$(ECPREFIX)/var/svc/method%g' > \
	    $(PROTO_DIR)/var/svc/manifest/site/zfs-auto-snapshot.xml
