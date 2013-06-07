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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cassandra
COMPONENT_VERSION=	1.2.2
COMPONENT_FMRI=		database/cassandra
COMPONENT_SUMMARY=	Distributed storage system for structured data
COMPONENT_PROJECT_URL=	$(PROJECT_APACHE)
COMPONENT_LICENSE=	APLv2.0
COMPONENT_SRC=		apache-cassandra-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-cassandra-$(COMPONENT_VERSION)-bin.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:435c921864ec90ddb5be88af2f9023173a6f57c7bcb428f9ed0409a57484546f
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

$(BUILD_DIR)/%/.built: $(SOURCE_DIR)/.prep
	$(MKDIR) -p $(@D)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed: $(BUILD_DIR)/%/.built

	[ -d $(PROTO_DIR)$(ECPREFIX)/bin ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	[ -d $(PROTO_DIR)$(ECPREFIX)/etc/cassandra ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/cassandra
	[ -d $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib
	[ -d $(PROTO_DIR)$(ECPREFIX)/share/doc/cassandra/licenses ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/doc/cassandra/licenses
	[ -d $(PROTO_DIR)$(ECPREFIX)/var/lib/cassandra ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/lib/cassandra
	[ -d $(PROTO_DIR)$(ECPREFIX)/var/log/cassandra ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/log/cassandra
	[ -d $(PROTO_DIR)$(ECPREFIX)/var/svc/method ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/svc/method
	[ -d $(PROTO_DIR)/var/svc/manifest/site ] || $(MKDIR) $(PROTO_DIR)/var/svc/manifest/site
	[ -d $(PROTO_DIR)$(ECPREFIX)/lib/python2.6/vendor-packages ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/python2.6/vendor-packages

	# bin
	$(CP) $(SOURCE_DIR)/tools/bin/* $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(SOURCE_DIR)/bin/* $(PROTO_DIR)$(ECPREFIX)/bin
	$(RM) $(PROTO_DIR)$(ECPREFIX)/bin/*.bat
	$(RM) $(PROTO_DIR)$(ECPREFIX)/bin/{cassandra.in.sh,debug-cql,stop-server}

	# etc/cassandra
	$(CP) $(SOURCE_DIR)/conf/* $(PROTO_DIR)$(ECPREFIX)/etc/cassandra
	$(RM) $(PROTO_DIR)$(ECPREFIX)/etc/cassandra/README.txt
	$(RM) $(PROTO_DIR)$(ECPREFIX)/etc/cassandra/cqlshrc.sample

	# lib/python2.6
	$(CP) -r $(SOURCE_DIR)/pylib/cqlshlib $(PROTO_DIR)$(ECPREFIX)/lib/python2.6/vendor-packages/cqlshlib

	# share/cassandra
	$(CP) $(SOURCE_DIR)/lib/{*.jar,*.zip} $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib
	$(MV) \
	  $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib/apache-cassandra-$(COMPONENT_VERSION).jar \
	  $(PROTO_DIR)$(ECPREFIX)/share/cassandra
	$(MV) \
	  $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib/apache-cassandra-thrift-$(COMPONENT_VERSION).jar \
	  $(PROTO_DIR)$(ECPREFIX)/share/cassandra
	$(RM) $(PROTO_DIR)$(ECPREFIX)/share/cassandra/lib/apache-cassandra-clientutil-$(COMPONENT_VERSION).jar
	$(CP) $(SOURCE_DIR)/bin/cassandra.in.sh $(PROTO_DIR)$(ECPREFIX)/share/cassandra
	$(CP) $(SOURCE_DIR)/tools/lib/stress.jar $(PROTO_DIR)$(ECPREFIX)/share/cassandra

	# share/doc/cassandra
	$(CP) $(SOURCE_DIR)/*.txt $(PROTO_DIR)$(ECPREFIX)/share/doc/cassandra
	$(CP) $(SOURCE_DIR)/conf/cqlshrc.sample $(PROTO_DIR)$(ECPREFIX)/share/doc/cassandra
	$(CP) $(SOURCE_DIR)/lib/licenses/* $(PROTO_DIR)$(ECPREFIX)/share/doc/cassandra/licenses

	$(TOUCH) $@

build: $(BUILD_32)

install: $(INSTALL_32)
