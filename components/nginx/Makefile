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

COMPONENT_NAME=		nginx
COMPONENT_VERSION=	1.0.15
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1daf3950623c90b084e7eceb104071596060aca5c721bf890549fc2990b1ebe6
COMPONENT_ARCHIVE_URL=	http://nginx.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LINKER=	gcc

CONFIGURE_OPTIONS  = --prefix=$(ECPREFIX)
CONFIGURE_OPTIONS.32 = --sbin-path=$(ECPREFIX)/bin/nginx
CONFIGURE_OPTIONS.64 = --sbin-path=$(ECPREFIX)/bin/$(MACH64)/nginx
CONFIGURE_OPTIONS.64 += --with-ld-opt=$(LD_BITS)
CONFIGURE_OPTIONS += --conf-path=$(ECPREFIX)/etc/nginx/nginx.conf
CONFIGURE_OPTIONS += --http-log-path=$(ECPREFIX)/var/nginx/logs/access_log
CONFIGURE_OPTIONS += --error-log-path=$(ECPREFIX)/var/nginx/logs/error_log
CONFIGURE_OPTIONS += --pid-path=$(ECPREFIX)/var/run/nginx
CONFIGURE_OPTIONS += --lock-path=$(ECPREFIX)/var/run/nginx
CONFIGURE_OPTIONS += --user=webservd
CONFIGURE_OPTIONS += --group=webservd
CONFIGURE_OPTIONS += --with-http_ssl_module
CONFIGURE_OPTIONS += --with-http_secure_link_module
CONFIGURE_OPTIONS += --with-http_stub_status_module
CONFIGURE_OPTIONS += --with-ipv6
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
COMPONENT_POST_INSTALL_ACTION+= \
	( $(MKDIR) $(PROTO_DIR)/var/nginx/logs )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

