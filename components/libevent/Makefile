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

COMPONENT_NAME=		libevent
COMPONENT_FMRI=		library/libevent
COMPONENT_VERSION=	2.1.8
COMPONENT_LICENSE=	BSD3c
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	"http://libevent.org/"
COMPONENT_SUMMARY=	The libevent event notification library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-stable
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:965cc5a8bb46ce4199a47e9b2c9e1cae3b137e8356ffdad6d94d3b9069b71dc2
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB4)
GITHUB_RELEASE=		release-$(COMPONENT_VERSION)-stable

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CLEAN_PATHS +=		event-config.h

#CONFIGURE_OPTIONS +=	--with-pic
#CONFIGURE_OPTIONS +=	--enable-static=no

build:		$(BUILD_32_and_64)

#$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
#	# Note: libevent generates a header file, include/event2/event-config.h
#	# This header file is different depending on 32bit or 64bit build
#	$(ECHO) -e "/* EC: combining 32 and 64bit versions */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/event-config.h
#	$(CAT) $(BUILD_DIR_64)/include/event2/event-config.h >> $(COMPONENT_DIR)/event-config.h
#	$(ECHO) -e "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/event-config.h
#	$(CAT) $(BUILD_DIR_32)/include/event2/event-config.h >> $(COMPONENT_DIR)/event-config.h
#	$(ECHO) -e "\n#endif /* EC */" >> $(COMPONENT_DIR)/event-config.h
#	$(RM) $(PROTO_DIR)$(ECPREFIX)/include/event2/event-config.h
#	$(INSTALL) $(COMPONENT_DIR)/event-config.h $(PROTO_DIR)$(ECPREFIX)/include/event2/event-config.h
#	$(TOUCH) $@

#install:	$(BUILD_DIR)/.installed
install:	$(INSTALL_32_and_64)

