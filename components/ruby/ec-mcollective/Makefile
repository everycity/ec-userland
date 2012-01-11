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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		mcollective
COMPONENT_VERSION=	1.3.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:a7292484f699b6e2095131e17064c54a23b71016
COMPONENT_ARCHIVE_URL=	http://puppetlabs.com/downloads/mcollective/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/ips.mk

CLEAN_PATHS +=  $(BUILD_DIR)

build: prep

install: build
	[ -d $(PROTO_DIR)/$(ECPREFIX)/bin ] || mkdir -p $(PROTO_DIR)/$(ECPREFIX)/bin
	[ -d $(PROTO_DIR)/$(ECPREFIX)/share/mcollective/plugins ] || mkdir -p $(PROTO_DIR)/$(ECPREFIX)/share/mcollective/plugins
	[ -d $(PROTO_DIR)/$(ECPREFIX)/lib/ruby/vendor_ruby/1.8 ] || mkdir -p $(PROTO_DIR)/$(ECPREFIX)/lib/ruby/vendor_ruby/1.8
	[ -d $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/plugin.d ] || mkdir -p $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/plugin.d
	[ -d $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/ssl/clients ] || mkdir -p $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/ssl/clients
	$(INSTALL) -m 0755 $(COMPONENT_SRC)/mcollectived.rb $(PROTO_DIR)/$(ECPREFIX)/bin/mcollectived
	$(INSTALL) -m 0640 $(COMPONENT_SRC)/etc/server.cfg.dist $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/server.cfg
	$(INSTALL) -m 0644 $(COMPONENT_SRC)/etc/client.cfg.dist $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/client.cfg
	$(INSTALL) -m 0444 $(COMPONENT_SRC)/etc/facts.yaml.dist $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/facts.yaml
	$(INSTALL) -m 0444 $(COMPONENT_SRC)/etc/rpc-help.erb $(PROTO_DIR)/$(ECPREFIX)/etc/mcollective/rpc-help.erb
	cp -R $(COMPONENT_SRC)/lib/* $(PROTO_DIR)/$(ECPREFIX)/lib/ruby/vendor_ruby/1.8
	cp -R $(COMPONENT_SRC)/plugins/* $(PROTO_DIR)/$(ECPREFIX)/share/mcollective/plugins
	cp $(COMPONENT_SRC)/mc-* $(PROTO_DIR)/$(ECPREFIX)/bin
	cp $(COMPONENT_SRC)/mco $(PROTO_DIR)/$(ECPREFIX)/bin
