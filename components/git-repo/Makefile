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

COMPONENT_NAME=		git-repo
COMPONENT_FMRI=         tools/git-repo
COMPONENT_VERSION=      1.21
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "https://code.google.com/p/git-repo/"
COMPONENT_SUMMARY=	Repo is a tool built on top of Git to help manage many Git repositories
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	repo
COMPONENT_ARCHIVE_HASH=	sha256:07aa40b0508a8b7edf92f2073b4adcb6ec95f825accda72ad42f1e1b6d8e4881
COMPONENT_ARCHIVE_URL=	https://storage.googleapis.com/git-repo-downloads/repo

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

$(SOURCE_DIR)/.unpacked:	download Makefile $(PATCHES)
	$(RM) -r $(SOURCE_DIR) build
	($(MKDIR) $(COMPONENT_DIR)/source/git-repo $(PROTO_DIR)$(ECPREFIX)/bin; \
	$(CP) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE) $(PROTO_DIR)$(ECPREFIX)/bin)
	$(TOUCH) $@

$(SOURCE_DIR)/.built:	$(SOURCE_DIR)/.prep
	$(TOUCH) $@

build:		$(SOURCE_DIR)/.built

$(SOURCE_DIR)/.installed:	$(SOURCE_DIR)/.built
	$(TOUCH) $@

install:	$(SOURCE_DIR)/.installed

