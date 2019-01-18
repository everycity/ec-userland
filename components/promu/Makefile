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

COMPONENT_NAME=		promu
COMPONENT_FMRI=		developer/promu
COMPONENT_VERSION=      0.2.0
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  https://github.com/prometheus/promu
COMPONENT_SUMMARY=	Utility tool for building and releasing Prometheus projects
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ce025991439062381d473387c9181071e657c359626b4c3828606133febadb80
COMPONENT_ARCHIVE_URL=	https://github.com/prometheus/promu/archive/v$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+="GOPATH=$(BUILD_DIR)/$(COMPONENT_NAME)"
COMPONENT_BUILD_TARGETS=build

$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D)
	$(MKDIR) $(@D)/src/github.com/prometheus/promu
	$(CLONEY) $(SOURCE_DIR) $(@D)/src/github.com/prometheus/promu
	(cd $(@D)/src/github.com/prometheus/promu ; \
		$(ENV) $(COMPONENT_BUILD_ENV) $(COMPONENT_BUILD_ARGS) \
		$(GMAKE) $(COMPONENT_BUILD_GMAKE_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(TOUCH) $@


$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(@D)/bin/promu $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(SYMLINK) $(MACH64)/promu $(PROTO_DIR)$(ECPREFIX)/bin/promu
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed
