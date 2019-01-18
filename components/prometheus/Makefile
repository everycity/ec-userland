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

COMPONENT_NAME=		prometheus
COMPONENT_FMRI=		monitoring/prometheus
COMPONENT_VERSION=      2.6.1
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  https://github.com/prometheus/prometheus
COMPONENT_SUMMARY=	Systems and service monitoring system (binaries only)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3ece7541e090e6c11c0c35a0856b99005094aded0152e1e3e71ea2390ac8069f
COMPONENT_ARCHIVE_URL=	https://github.com/prometheus/prometheus/archive/v$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+="GOPATH=$(BUILD_DIR)/$(COMPONENT_NAME)"
COMPONENT_BUILD_TARGETS=build

COMPONENT_POST_UNPACK_ACTION+= find $(SOURCE_DIR) -exec chmod u+w {} \;

$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D)
	$(MKDIR) $(@D)/src/github.com/prometheus/prometheus
	$(CLONEY) $(SOURCE_DIR) $(@D)/src/github.com/prometheus/prometheus
	(cd $(@D)/src/github.com/prometheus/prometheus ; \
		$(ENV) $(COMPONENT_BUILD_ENV) $(COMPONENT_BUILD_ARGS) \
		$(GMAKE) $(COMPONENT_BUILD_GMAKE_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(TOUCH) $@


$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(@D)/src/github.com/prometheus/prometheus/prometheus $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(SYMLINK) $(MACH64)/prometheus $(PROTO_DIR)$(ECPREFIX)/bin/prometheus
	$(CP) $(@D)/src/github.com/prometheus/prometheus/promtool $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(SYMLINK) $(MACH64)/promtool $(PROTO_DIR)$(ECPREFIX)/bin/promtool
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed

