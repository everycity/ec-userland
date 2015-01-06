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

COMPONENT_NAME=		libevent
COMPONENT_FMRI=		library/libevent
COMPONENT_VERSION=	2.0.22
COMPONENT_LICENSE=	BSD3c
COMPONENT_PROJECT_URL=	"http://libevent.org/"
COMPONENT_SUMMARY=	The libevent event notification library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-stable
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3
SF_PROJECT_NAME=	levent
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=		event-config.h

CONFIGURE_OPTIONS +=	--with-pic
CONFIGURE_OPTIONS +=	--enable-static=no

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	# Note: libevent generates a header file, include/event2/event-config.h
	# This header file is different depending on 32bit or 64bit build
	/usr/bin/echo "/* EC: combining 32 and 64bit versions */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/event-config.h
	/usr/bin/cat $(BUILD_DIR_64)/include/event2/event-config.h >> $(COMPONENT_DIR)/event-config.h
	/usr/bin/echo "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/event-config.h
	/usr/bin/cat $(BUILD_DIR_32)/include/event2/event-config.h >> $(COMPONENT_DIR)/event-config.h
	/usr/bin/echo "\n#endif /* EC */" >> $(COMPONENT_DIR)/event-config.h
	$(RM) $(PROTO_DIR)$(ECPREFIX)/include/event2/event-config.h
	$(INSTALL) $(COMPONENT_DIR)/event-config.h $(PROTO_DIR)$(ECPREFIX)/include/event2/event-config.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

