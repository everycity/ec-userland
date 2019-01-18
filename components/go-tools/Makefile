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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		go-tools
COMPONENT_FMRI=		developer/go-tools
COMPONENT_VERSION=      2019.1
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  https://github.com/dominikh/go-tools
COMPONENT_SUMMARY=	Collection of tools and libraries for working with Go code
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1c05d62045dd6ef19da9b287daf4b192a5da99af984ea5e6a9559782e8bbc11c
COMPONENT_ARCHIVE_URL=	https://github.com/dominikh/go-tools/archive/$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+="GOPATH=$(BUILD_DIR)/$(COMPONENT_NAME)"

GO_TOOLS_CMD=  errcheck-ng gosimple keyify megacheck rdeps staticcheck
GO_TOOLS_CMD+= structlayout structlayout-optimize structlayout-pretty


$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D)
	$(MKDIR) $(@D)/src/honnef.co/go/tools
	$(CLONEY) $(SOURCE_DIR) $(@D)/src/honnef.co/go/tools
	(for i in $(GO_TOOLS_CMD); do \
		cd $(@D)/src/honnef.co/go/tools/cmd/$$i; \
		$(ENV) $(COMPONENT_BUILD_ENV) go get .; \
		$(ENV) $(COMPONENT_BUILD_ENV) go install; \
	done)
	$(TOUCH) $@

$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	(for i in $(GO_TOOLS_CMD); do \
		$(CP) $(@D)/bin/$$i $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64); \
		$(SYMLINK) $(MACH64)/$$i $(PROTO_DIR)$(ECPREFIX)/bin/$$i; \
	done)
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed
