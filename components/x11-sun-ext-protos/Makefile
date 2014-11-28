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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		x11-sun-ext-protos
COMPONENT_FMRI=         x11/header/x11-sun-protocols
COMPONENT_VERSION=      1.0
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "https://hg.openindiana.org/upstream/oracle/x-cons/x-s12-clone/file/4a76cf532c2c/open-src/proto/sun-ext-protos"
COMPONENT_SUMMARY=	Definitions of Solaris-specific X Server extensions

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR) .installed

download prep::
configure build:

.installed:
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/X11/extensions
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/X11
	for file in allplanes.h  allplanesstr.h  dgast.h  fbpm.h  fbpmstr.h  interactive.h  interactiveCommon.h  sme.h  transovl.h  transovlstr.h; \
	do $(CP) files/include/$$file $(PROTO_DIR)$(ECPREFIX)/include/X11/extensions/; done
	$(CP) files/docs/FBPM.txt $(PROTO_DIR)$(ECPREFIX)/share/X11/
	$(CP) files/docs/sun-sme.txt $(PROTO_DIR)$(ECPREFIX)/share/X11/
	$(TOUCH) $@

install:	.installed

