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

# this component builds only 'filebeat' of 'beats' distribution

COMPONENT_NAME=		node_exporter
COMPONENT_FMRI=		monitoring/prometheus/node_exporter
COMPONENT_VERSION=      0.17.0.20190112
GIT_COMMIT_ID=		e7664852867694265b093f79a8d8a4dcf27d0e82
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  https://github.com/prometheus/node_exporter
COMPONENT_SUMMARY=	Prometheus node/system metrics exporter
#COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(GIT_COMMIT_ID)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1c5db35ea3f478ba042952fe36e71002e57abb377333b16cb222f4be7c2acec8
#COMPONENT_ARCHIVE_URL=	https://github.com/prometheus/node_exporter/archive/v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_URL=	https://github.com/prometheus/node_exporter/archive/$(GIT_COMMIT_ID).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+="GOPATH=$(BUILD_DIR)/$(COMPONENT_NAME)"

COMPONENT_POST_UNPACK_ACTION+= find $(SOURCE_DIR) -exec chmod u+w {} \;

$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)/src/github.com/prometheus/node_exporter
	$(CLONEY) $(SOURCE_DIR) $(@D)/src/github.com/prometheus/node_exporter
	(cd $(@D)/src/github.com/prometheus/node_exporter ; \
		$(ENV) $(COMPONENT_BUILD_ENV) $(COMPONENT_BUILD_ARGS) \
		$(GMAKE) $(COMPONENT_BUILD_GMAKE_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(TOUCH) $@

$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(@D)/src/github.com/prometheus/node_exporter/node_exporter $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed
