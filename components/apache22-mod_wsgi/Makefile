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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mod_wsgi
COMPONENT_VERSION=	3.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:f32d38e5d3ed5de1efd5abefb52678f833dc9166
COMPONENT_ARCHIVE_URL=	http://modwsgi.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk


$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	rsync -aH --delete $(SOURCE_DIR)/ $(@D)/
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
	    ./configure $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@


LDFLAGS.32 = -L$(ECPREFIX)/lib
LDFLAGS.64 = -L$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_ENV += LDFLAGS=$(LDFLAGS.$(BITS))

CONFIGURE_OPTIONS.32	+=	--with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/apxs
CONFIGURE_OPTIONS.64	+=	--with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/$(MACH64)/apxs

CONFIGURE_OPTIONS.32	+=	--with-python=$(ECPREFIX)/bin/python
CONFIGURE_OPTIONS.64	+=	--with-python=$(ECPREFIX)/bin/$(MACH64)/python

COMPONENT_POST_INSTALL_ACTION = ( strip \
                $(PROTO_DIR)/$(ECPREFIX)/lib/apache/2.2/modules/*so \
                $(PROTO_DIR)/$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)/*so \
                >/dev/null 2>&1; true )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
