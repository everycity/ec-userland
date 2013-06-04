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

COMPONENT_NAME=		mod_fastcgi
COMPONENT_VERSION=	2.4.6
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a5a887eecc8fe13e4cb1cab4d140188a3d2b5e6f337f8a1cce88ca441ddbe689
COMPONENT_ARCHIVE_URL=	http://test.fastcgi.com/dist/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

APXS.32 = $(ECPREFIX)/lib/apache/2.2/bin/apxs
APXS.64 = $(ECPREFIX)/lib/apache/2.2/bin/$(MACH64)/apxs
APXS=$(APXS.$(BITS))

APACHECTL.32 = $(ECPREFIX)/lib/apache/2.2/bin/apachectl
APACHECTL.64 = $(ECPREFIX)/lib/apache/2.2/bin/$(MACH64)/apachectl
APACHECTL=$(APACHECTL.$(BITS))

COMPONENT_COMMON_ARGS = APXS=$(APXS) APACHECTL=$(APACHECTL)
COMPONENT_COMMON_ARGS += top_dir=/ec/share/apache/2.2

COMPONENT_BUILD_ARGS += $(COMPONENT_COMMON_ARGS)
COMPONENT_INSTALL_ARGS += $(COMPONENT_COMMON_ARGS)

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(CP) Makefile.AP2 Makefile; 
COMPONENT_PRE_BUILD_ACTION.64 = $(PERL) -pi -e \
    's/(include.*build)\/special\.mk/\1\/amd64\/special.mk/' \
    Makefile
COMPONENT_PRE_BUILD_ACTION += $(COMPONENT_PRE_BUILD_ACTION.$(BITS))


build:		$(BUILD_32_and_64)

install: build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/.libs/mod_fastcgi.so \
	    $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules
	$(CP) $(BUILD_DIR_64)/.libs/mod_fastcgi.so \
	    $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
