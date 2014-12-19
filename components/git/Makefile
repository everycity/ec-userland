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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		git
COMPONENT_FMRI=		developer/versioning/git
COMPONENT_VERSION=	2.2.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://git-scm.com/
COMPONENT_SUMMARY=	git - Fast version control system
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:367a77d0b10a5070b02a0fb0e942f26f25af61793128e0ddfd5c5c474de93589
DOWNLOAD_GIT_ROOT=	https://www.kernel.org/pub/software/scm/git
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GIT_ROOT)/$(COMPONENT_ARCHIVE)

# manpages
COMPONENT_NAME_1=	$(COMPONENT_NAME)-manpages
COMPONENT_SRC_1=	$(COMPONENT_NAME_1)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_1=	$(COMPONENT_SRC_1).tar.gz
COMPONENT_ARCHIVE_HASH_1=	sha256:69dcb3decdb33dd35491935e80f71c40c576b536df4223eb98d5f7ccd9643293
COMPONENT_ARCHIVE_URL_1=	$(DOWNLOAD_GIT_ROOT)/$(COMPONENT_ARCHIVE_1)

# HTML documentation
COMPONENT_NAME_2=	$(COMPONENT_NAME)-htmldocs
COMPONENT_SRC_2=	$(COMPONENT_NAME_2)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_2=	$(COMPONENT_SRC_2).tar.gz
COMPONENT_ARCHIVE_HASH_2=	sha256:d35ecfd94a6911c2c334a9922dc1f481a9fad964daaddab8b97ead901efbe4db
COMPONENT_ARCHIVE_URL_2=	$(DOWNLOAD_GIT_ROOT)/$(COMPONENT_ARCHIVE_2)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Build is not thread safe
COMPONENT_BUILD_GMAKE_ARGS=

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-gitconfig=$(ECPREFIX)/etc/gitconfig
CONFIGURE_OPTIONS+=	--with-gitattributes=$(ECPREFIX)/etc/gitattributes
CONFIGURE_OPTIONS+=	--with-python=$(ECPREFIX)/bin/python2.6
CONFIGURE_OPTIONS+=	--with-perl=$(ECPREFIX)/bin/perl
CONFIGURE_OPTIONS+=	--with-iconv=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-editor=vim

LDFLAGS+=	-lintl

COMPONENT_BUILD_ENV+=		PERL_PATH=$(ECPREFIX)/bin/perl
COMPONENT_BUILD_TARGETS+=	all 

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man && \
		cd $(PROTO_DIR)$(ECPREFIX)/share/man && \
		$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/doc/git && \
		cd $(PROTO_DIR)$(ECPREFIX)/share/doc/git && \
		$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

