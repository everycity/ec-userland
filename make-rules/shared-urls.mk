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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

# Default to looking for source archives on the internal mirror before we
# hammer on the external repositories.
export DOWNLOAD_SEARCH_PATH ?=	http://download.everycity.co.uk/ec-userland/archives

# URL roots
APACHE_ARCHIVE=		http://archive.apache.org/dist
CODE_GOOGLE_P=		http://code.google.com/p
EC_ARCHIVE=		http://dlc.everycity.com/ec-userland/source-archives
MIRRORSERVICE_ROOT=	http://www.mirrorservice.org/sites
SOURCEFORGE_PROJECTS=	http://sourceforge.net/projects
SF_ROOT=		http://downloads.sourceforge.net
XMLSOFT_FTP_ROOT=	ftp://xmlsoft.org
XORG_ROOT=		http://xorg.freedesktop.org/releases/individual

# Shared project URLs
PROJECT_APACHE=		http://$(COMPONENT_NAME).apache.org/
PROJECT_CODE_GOOGLE_P=	$(CODE_GOOGLE_P)/$(COMPONENT_NAME)
PROJECT_SOURCEFORGE1=	http://$(COMPONENT_NAME).sourceforge.net/
PROJECT_SOURCEFORGE2=	$(SOURCEFORGE_PROJECTS)/$(COMPONENT_NAME)/

# Mirrors
MIRROR_APACHE=		$(MIRRORSERVICE_ROOT)/ftp.apache.org

# Shared download URLs
DOWNLOAD_APACHE=	$(MIRROR_APACHE)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_EC=		$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GITHUB=	https://github.com/downloads/$(COMPONENT_NAME)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GITHUB1=	https://github.com/$(GITHUB_PROJECT)/$(COMPONENT_NAME)/archive/$(COMPONENT_VERSION).tar.gz
DOWNLOAD_GITHUB2=	https://github.com/$(COMPONENT_NAME)/$(COMPONENT_NAME)/releases/download/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GITHUB3=	https://github.com/$(COMPONENT_NAME)/$(COMPONENT_NAME)/releases/download/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GNU_FTP=	https://ftp.gnu.org/gnu/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_GNU_SAVANNAH=	http://download.savannah.gnu.org/releases/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_LIBRDF=	http://download.librdf.org/source/$(COMPONENT_ARCHIVE)
DOWNLOAD_PERL5=		http://www.cpan.org/src/5.0/$(COMPONENT_ARCHIVE)
DOWNLOAD_PHP_PECL=	http://pecl.php.net/get/$(COMPONENT_ARCHIVE)
DOWNLOAD_PHP_UK=	http://www.php.net/get/$(COMPONENT_ARCHIVE)/from/this/mirror
DOWNLOAD_RUBY=		https://cache.ruby-lang.org/pub/ruby/$(COMPONENT_MJR_VERSION)/$(COMPONENT_ARCHIVE)
DOWNLOAD_SF=		$(SF_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_SF_PROJECT=	$(SF_ROOT)/$(SF_PROJECT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_VIDEOLAN=	http://download.videolan.org/pub/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XIPH=		http://downloads.xiph.org/releases/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XMLSOFT=	$(XMLSOFT_FTP_ROOT)/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_APP=	$(XORG_ROOT)/app/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_LIB=	$(XORG_ROOT)/lib/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_PROTO=	$(XORG_ROOT)/proto/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_UTIL=	$(XORG_ROOT)/util/$(COMPONENT_ARCHIVE)
DOWNLOAD_XORG_XCB=	$(XORG_ROOT)/xcb/$(COMPONENT_ARCHIVE)
