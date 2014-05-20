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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#

# Default to looking for source archives on the internal mirror first
export DOWNLOAD_SEARCH_PATH ?=	http://dlc.everycity.com/ec-userland/source-archives

DOWNLOAD_GNU_FTP_ROOT=		http://ftp.gnu.org/gnu
DOWNLOAD_GNU_SAVANNAH_ROOT=	http://download.savannah.gnu.org/releases
DOWNLOAD_PHP_PECL_ROOT=		http://pecl.php.net/get
DOWNLOAD_SOURCEFORGE_ROOT=	http://downloads.sourceforge.net/project
DOWNLOAD_XMLSOFT_ROOT=		ftp://xmlsoft.org
DOWNLOAD_XORG_LIB_ROOT=		http://xorg.freedesktop.org/releases/individual/lib
DOWNLOAD_XORG_PROTO_ROOT=	http://xorg.freedesktop.org/releases/individual/proto
DOWNLOAD_XORG_XCB_ROOT=		http://xorg.freedesktop.org/releases/individual/xcb

# Shared download URLs
DOWNLOAD_GNU_FTP=	$(DOWNLOAD_GNU_FTP_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GNU_SAVANNAH=	$(DOWNLOAD_GNU_SAVANNAH_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_PHP_PECL=	$(DOWNLOAD_PHP_PECL_ROOT)/$(COMPONENT_ARCHIVE)
DOWNLOAD_SOURCEFORGE=	$(DOWNLOAD_SOURCEFORGE_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XMLSOFT=	$(DOWNLOAD_XMLSOFT_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_LIB=	$(DOWNLOAD_XORG_LIB_ROOT)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_PROTO=	$(DOWNLOAD_XORG_PROTO_ROOT)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_XCB=	$(DOWNLOAD_XORG_XCB_ROOT)/$(COMPONENT_ARCHIVE)

