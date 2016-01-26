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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		nginx
COMPONENT_FMRI=		web/server/nginx
COMPONENT_VERSION=	1.9.10
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://nginx.net/
COMPONENT_SUMMARY=	Nginx Webserver
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fb14d76844cab0a5a0880768be28965e74f9956790f618c454ef6098e26631d9
COMPONENT_ARCHIVE_URL=	http://nginx.org/download/$(COMPONENT_ARCHIVE)

MOD_WSGI_HG_TAG=		6975f0ec7eeb
COMPONENT_ARCHIVE_1=		$(MOD_WSGI_HG_TAG).tar.bz2
COMPONENT_ARCHIVE_HASH_1=	sha256:84c5c041ddf84a648cee8d8f980d882a9239a2f6bfa2e73489cfbe28759a7b4c
COMPONENT_ARCHIVE_URL_1=	https://bitbucket.org/lifeeth/mod_wsgi/get/$(MOD_WSGI_HG_TAG).tar.bz2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = cd $(@D); \
	$(RM) -r mod_wsgi; \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1); \
	$(MV) lifeeth-mod_wsgi-$(MOD_WSGI_HG_TAG) mod_wsgi

CONFIGURE_OPTIONS  = --prefix=$(ECPREFIX)
CONFIGURE_OPTIONS.32 = --sbin-path=$(ECPREFIX)/bin/nginx
CONFIGURE_OPTIONS.64 = --sbin-path=$(ECPREFIX)/bin/$(MACH64)/nginx
CONFIGURE_OPTIONS += --with-ld-opt="$(LD_BITS) -llua"
CONFIGURE_OPTIONS += --conf-path=$(ECPREFIX)/etc/nginx/nginx.conf
CONFIGURE_OPTIONS += --http-log-path=$(ECPREFIX)/var/nginx/logs/access_log
CONFIGURE_OPTIONS += --error-log-path=$(ECPREFIX)/var/nginx/logs/error_log
CONFIGURE_OPTIONS += --pid-path=$(ECPREFIX)/var/run/nginx
CONFIGURE_OPTIONS += --lock-path=$(ECPREFIX)/var/run/nginx
CONFIGURE_OPTIONS += --user=webservd
CONFIGURE_OPTIONS += --group=webservd
CONFIGURE_OPTIONS += --with-http_addition_module
CONFIGURE_OPTIONS += --with-http_dav_module
CONFIGURE_OPTIONS += --with-http_flv_module
CONFIGURE_OPTIONS += --with-http_geoip_module
CONFIGURE_OPTIONS += --with-http_gzip_static_module
CONFIGURE_OPTIONS += --with-http_mp4_module
CONFIGURE_OPTIONS.32 += --with-http_perl_module
CONFIGURE_OPTIONS += --with-http_random_index_module
CONFIGURE_OPTIONS += --with-http_realip_module
CONFIGURE_OPTIONS += --with-http_secure_link_module
CONFIGURE_OPTIONS += --with-http_v2_module
CONFIGURE_OPTIONS += --with-http_ssl_module
CONFIGURE_OPTIONS += --with-http_sub_module
CONFIGURE_OPTIONS += --with-http_stub_status_module
CONFIGURE_OPTIONS += --with-ipv6
CONFIGURE_OPTIONS += --with-mail
CONFIGURE_OPTIONS += --with-mail_ssl_module
CONFIGURE_OPTIONS += --add-module=mod_wsgi
CONFIGURE_OPTIONS += --with-threads
CONFIGURE_OPTIONS += --with-stream
CONFIGURE_OPTIONS += --with-stream_ssl_module
CONFIGURE_OPTIONS.32 += --add-module=$(WS_TOP)/components/modsecurity/build/$(MACH32)/nginx/modsecurity
CONFIGURE_OPTIONS.64 += --add-module=$(WS_TOP)/components/modsecurity/build/$(MACH64)/nginx/modsecurity

CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
COMPONENT_POST_INSTALL_ACTION+= \
	( $(MKDIR) $(PROTO_DIR)/var/nginx/logs )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

