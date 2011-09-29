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
# Copyright 2011, Andrzej Szeszo
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		stomp
COMPONENT_VERSION=	1.1.8
GIT_ID=			v$(COMPONENT_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(GIT_ID).tar.gz
COMPONENT_ARCHIVE_URL=	git://gitorious.org/~gmallard/stomp/gmallards-stomp-mainline.git

include ../../../make-rules/prep.mk
include ../../../make-rules/ips.mk

PKGMANGLE = true
PKGLINT = true
PKGDEPEND = true

CLEAN_PATHS +=  $(BUILD_DIR)

download::
	$(COMPONENT_DIR)/generate-tarball.sh $(COMPONENT_ARCHIVE_URL) $(COMPONENT_SRC) $(GIT_ID)

build: prep

install: build
	[ -d $(PROTO_DIR)$(ECPREFIX)/lib/ruby/vendor_ruby ] || mkdir -p $(PROTO_DIR)$(ECPREFIX)/lib/ruby/vendor_ruby
	[ -h $(PROTO_DIR)$(ECPREFIX)/lib/ruby/vendor_ruby/1.8 ] || ln -s $(SOURCE_DIR)/lib $(PROTO_DIR)$(ECPREFIX)/lib/ruby/vendor_ruby/1.8
