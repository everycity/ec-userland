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

COMPONENT_NAME=		pgpool
COMPONENT_FMRI=		database/pgpool
COMPONENT_VERSION=	3.6.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://pgpool.net/mediawiki/index.php/Main_Page"
COMPONENT_SUMMARY=	pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client.
COMPONENT_SRC=		$(COMPONENT_NAME)-II-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6218e5bdc89c435fb2e49103803db0b3e516b370eec427d42ec78bc53a664848
COMPONENT_ARCHIVE_URL=	http://www.pgpool.net/mediawiki/images/$(COMPONENT_ARCHIVE)

#curl --header 'Host: www.pgpool.net' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0) Gecko/20100101 Firefox/50.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Referer: http://pgpool.net/mediawiki/index.php/Downloads' --header 'DNT: 1' --header 'Connection: keep-alive' --header 'Upgrade-Insecure-Requests: 1' 'http://www.pgpool.net/mediawiki/images/pgpool-II-3.6.0.tar.gz' -o 'pgpool-II-3.6.0.tar.gz' -L

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

#CONFIGURE_OPTIONS+=	
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
CONFIGURE_SCRIPT	= $(@D)/configure
CONFIGURE_OPTIONS+=	--with-memcached=$(ECPREFIX)/include/memcached

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

