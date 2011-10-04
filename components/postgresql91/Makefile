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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		postgresql
COMPONENT_VERSION=	9.1.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:4df7b6f6b23acdac5ea198e3623796a2b62fc7a4
COMPONENT_ARCHIVE_URL=	http://wwwmaster.postgresql.org/redir/398/f/source/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS +=	--enable-dtrace
CONFIGURE_OPTIONS +=	--with-perl
CONFIGURE_OPTIONS +=	--with-python
CONFIGURE_OPTIONS +=	--with-ldap
CONFIGURE_OPTIONS +=	--with-openssl
CONFIGURE_OPTIONS +=	--with-libxml
CONFIGURE_OPTIONS +=	--with-libxslt

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

