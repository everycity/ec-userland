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

COMPONENT_NAME=		mod_fastcgi
COMPONENT_FMRI=		web/server/apache-22/module/apache-fastcgi
COMPONENT_VERSION=	2.4.7
COMPONENT_LICENSE=	FastCGI
COMPONENT_PROJECT_URL=	"http://www.fastcgi.com/drupal/"
COMPONENT_SUMMARY=	Apache FastCGI module
COMPONENT_SRC=		$(COMPONENT_NAME)-SNAP-0811090952
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0759ede04552f51f4a2b5f37348030ebf96d82f79dd6e8d14eb384f5866b6130
COMPONENT_ARCHIVE_URL=	http://www.fastcgi.com/dist/mod_fastcgi-SNAP-0811090952.tar.gz

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

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-enabled
	$(CP) fastcgi.load $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	cd $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-enabled && $(SYMLINK) ../mods-available/fastcgi.load . 
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/.libs/mod_fastcgi.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules
	$(CP) $(BUILD_DIR_64)/.libs/mod_fastcgi.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

