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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		varnish
COMPONENT_FMRI=		web/cache/varnish
COMPONENT_VERSION=	4.1.4
COMPONENT_LICENSE=	Varnish
COMPONENT_PROJECT_URL=	"https://www.varnish-cache.org/"
COMPONENT_SUMMARY=	Varnish Web Application Accelerator
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:44fdeb66fb27af9c18fde6123ef7b0038d6d263c7999a02a780ce4ea1a3965fc
COMPONENT_ARCHIVE_URL=	http://repo.varnish-cache.org/source/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE_FILE=	LICENSE

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-std=c99

CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
#CONFIGURE_OPTIONS+=	--disable-silent-rules

CONFIGURE_ENV+=		ac_cv_func_epoll_ctl=no
CONFIGURE_ENV+=		VCC_CC="$(CC) $(CC_BITS) $(CC_PIC) -shared -o %o %s" LIBS="-ltinfo"

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/etc/varnish
	$(INSTALL) $(SOURCE_DIR)/etc/example.vcl $(PROTO_DIR)$(ECPREFIX)/etc/varnish/example.vcl
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

