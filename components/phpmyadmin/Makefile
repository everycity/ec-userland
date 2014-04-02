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
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		phpmyadmin
COMPONENT_VERSION=	4.1.6
COMPONENT_SRC=		phpMyAdmin-$(COMPONENT_VERSION)-all-languages
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:22eab7f69cde89872b299778c3d0f28078139f555331744f5591d8d6b3972e54
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CONFIGURE_SYSCONFDIR = $(CONFIGURE_PREFIX)/etc

PHPMYADMIN_DIR=      $(PROTO_DIR)$(ECPREFIX)/share/phpmyadmin
PHPMYADMIN_DOC_DIR=      $(PROTO_DIR)$(ECPREFIX)/share/doc/phpmyadmin
PHPMYADMIN_ETC_DIR=      $(PROTO_DIR)$(ECPREFIX)/etc/phpmyadmin

CLEAN_PATHS +=  $(BUILD_DIR)

$(BUILD_DIR)/%/.built:	prep
	( $(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(PHPMYADMIN_DIR) \
		$(PHPMYADMIN_DOC_DIR) $(PHPMYADMIN_ETC_DIR) )
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(CP) -R $(SOURCE_DIR)/* $(PHPMYADMIN_DIR)/
	( cd $(PHPMYADMIN_DIR) && \
	  for i in README* ChangeLog LICENSE examples ; do \
	  mv $$i $(PHPMYADMIN_DOC_DIR)/ ; done && \
	mv config.sample.inc.php $(PHPMYADMIN_ETC_DIR)/config.inc.php && \
	ln -s $(ECPREFIX)/etc/phpmyadmin/config.inc.php config.inc.php )
	$(GSED) -i "s/a8b7c6d/`openssl rand -base64 32 | tr -dc _A-Z-a-z-0-9`/g" \
		$(PHPMYADMIN_ETC_DIR)/config.inc.php
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)


