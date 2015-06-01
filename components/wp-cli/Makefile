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

COMPONENT_NAME=		wp-cli
COMPONENT_FMRI=         tools/wp-cli
COMPONENT_VERSION=      20150331
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://wp-cli.org/"
COMPONENT_SUMMARY=	WP-CLI is a set of command-line tools for managing WordPress installations
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	wp-cli.phar
COMPONENT_ARCHIVE_HASH=	sha256:b4dd0b82df6ffd3ccbedcd9d2789dbc9f26fd21c86fc62b6f9f524d1775c9fd3
COMPONENT_ARCHIVE_URL=	https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

$(SOURCE_DIR)/.unpacked:	download Makefile $(PATCHES)
	$(RM) -r $(SOURCE_DIR) build
	($(MKDIR) $(COMPONENT_DIR)/source/wp-cli $(PROTO_DIR)$(ECPREFIX)/bin; \
	$(CP) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE) $(PROTO_DIR)$(ECPREFIX)/bin/wp)
	$(TOUCH) $@

$(SOURCE_DIR)/.built:	$(SOURCE_DIR)/.prep
	$(TOUCH) $@

build:		$(SOURCE_DIR)/.built

$(SOURCE_DIR)/.installed:	$(SOURCE_DIR)/.built
	$(TOUCH) $@

install:	$(SOURCE_DIR)/.installed

