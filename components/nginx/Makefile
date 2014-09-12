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

COMPONENT_NAME=		nginx
COMPONENT_FMRI=		web/server/nginx
COMPONENT_VERSION=	1.6.1
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://nginx.net/
COMPONENT_SUMMARY=	Nginx Webserver
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f5cfe682a1aeef4602c2ca705402d5049b748f946563f41d8256c18674836067
COMPONENT_ARCHIVE_URL=	http://nginx.org/download/$(COMPONENT_ARCHIVE)

MOD_WSGI_HG_TAG=		6975f0ec7eeb
COMPONENT_ARCHIVE_1=		$(MOD_WSGI_HG_TAG).tar.bz2
COMPONENT_ARCHIVE_HASH_1=	sha256:84c5c041ddf84a648cee8d8f980d882a9239a2f6bfa2e73489cfbe28759a7b4c
COMPONENT_ARCHIVE_URL_1=	https://bitbucket.org/lifeeth/mod_wsgi/get/$(MOD_WSGI_HG_TAG).tar.bz2

NPS_VERSION=			1.8.31.4
COMPONENT_ARCHIVE_2=		release-${NPS_VERSION}-beta.zip
COMPONENT_ARCHIVE_HASH_2=	sha256:ab8172d1f5d4965d412fe047b9725e4ecb78b6de780c053f4c29b136a202e1de
COMPONENT_ARCHIVE_URL_2=	https://github.com/pagespeed/ngx_pagespeed/archive/$(COMPONENT_ARCHIVE_2)
COMPONENT_ARCHIVE_3=		psol-ec-${NPS_VERSION}.tar.gz
COMPONENT_ARCHIVE_HASH_3=	sha256:4fe16bc91165fd09c408d8a6f9e4af4e2944ce3400862b8a09bdb7eaf25649bd
#COMPONENT_ARCHIVE_URL_3=	https://dl.google.com/dl/page-speed/psol/$(COMPONENT_ARCHIVE_3)
COMPONENT_ARCHIVE_URL_3=	http://smartos.igork.cloud.ec/$(COMPONENT_ARCHIVE_3)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = \
	( cd $(@D); \
	$(RM) -r mod_wsgi; \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1); \
	$(MV) lifeeth-mod_wsgi-$(MOD_WSGI_HG_TAG) mod_wsgi; \
	$(RM) -r ngx-pagespeed; \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2); \
	$(MV) ngx_pagespeed-release-${NPS_VERSION}-beta ngx-pagespeed; \
	cd ngx-pagespeed; \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_3); )

CONFIGURE_ENV += BITS="$(BITS)"

CONFIGURE_OPTIONS  = --prefix=$(USRDIR)
CONFIGURE_OPTIONS.32 = --sbin-path=$(USRDIR)/bin/nginx
CONFIGURE_OPTIONS.64 = --sbin-path=$(USRDIR)/bin/$(MACH64)/nginx
CONFIGURE_OPTIONS += --with-ld-opt=$(LD_BITS)
CONFIGURE_OPTIONS += --conf-path=$(SYSCONFDIR)/nginx/nginx.conf
CONFIGURE_OPTIONS += --http-log-path=$(LOCALSTATEDIR)/nginx/logs/access_log
CONFIGURE_OPTIONS += --error-log-path=$(LOCALSTATEDIR)/nginx/logs/error_log
CONFIGURE_OPTIONS += --pid-path=$(LOCALSTATEDIR)/run/nginx
CONFIGURE_OPTIONS += --lock-path=$(LOCALSTATEDIR)/run/nginx
CONFIGURE_OPTIONS += --user=webservd
CONFIGURE_OPTIONS += --group=webservd
CONFIGURE_OPTIONS += --with-http_addition_module
CONFIGURE_OPTIONS += --with-http_dav_module
CONFIGURE_OPTIONS += --with-http_flv_module
CONFIGURE_OPTIONS += --with-http_geoip_module
CONFIGURE_OPTIONS += --with-http_gzip_static_module
CONFIGURE_OPTIONS += --with-http_mp4_module
CONFIGURE_OPTIONS += --with-http_random_index_module
CONFIGURE_OPTIONS += --with-http_realip_module
CONFIGURE_OPTIONS += --with-http_secure_link_module
CONFIGURE_OPTIONS += --with-http_ssl_module
CONFIGURE_OPTIONS += --with-http_sub_module
CONFIGURE_OPTIONS += --with-http_stub_status_module
CONFIGURE_OPTIONS += --with-ipv6
CONFIGURE_OPTIONS += --with-mail
CONFIGURE_OPTIONS += --with-mail_ssl_module
CONFIGURE_OPTIONS += --add-module=mod_wsgi
CONFIGURE_OPTIONS += --add-module=ngx-pagespeed
CONFIGURE_OPTIONS += --with-ld-opt="$(CC_BITS) -lgcc_s -lumem"

CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
COMPONENT_POST_INSTALL_ACTION+= \
	( $(MKDIR) $(PROTO_DIR)/$(LOCALSTATEDIR)/nginx/logs )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

