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

COMPONENT_NAME=		go
COMPONENT_FMRI=		developer/go
COMPONENT_VERSION=	1.4
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://golang.org/"
COMPONENT_SUMMARY=	The Go Programming Language
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)$(COMPONENT_VERSION).src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3ae9f67e45a5ca7004b28808da8b1367d328a371d641ddbe636c0fb0ae0ffdae
COMPONENT_ARCHIVE_URL=	https://storage.googleapis.com/golang/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+= GOOS=solaris
COMPONENT_BUILD_ENV+= GOROOT_FINAL=$(ECPREFIX)/lib/go
COMPONENT_BUILD_ARGS+= --no-banner

$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D)/src ; $(ENV) $(COMPONENT_BUILD_ENV) \
		./all.bash $(COMPONENT_BUILD_ARGS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	$(MKDIR) -p $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) -p $(PROTO_DIR)/$(ECPREFIX)/lib/go/pkg
	$(MKDIR) -p $(PROTO_DIR)/$(ECPREFIX)/share/go
	$(MKDIR) -p $(PROTO_DIR)/$(ECPREFIX)/share/doc/go/html
	$(CP) $(@D)/bin/go $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(@D)/bin/gofmt $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(SYMLINK) $(MACH64)/go $(PROTO_DIR)/$(ECPREFIX)/bin/go
	$(SYMLINK) $(MACH64)/gofmt $(PROTO_DIR)/$(ECPREFIX)/bin/gofmt
	$(CP) -Rp $(@D)/pkg $(PROTO_DIR)/$(ECPREFIX)/lib/go
	$(SYMLINK) ../../share/go/src $(PROTO_DIR)/$(ECPREFIX)/lib/go/src
	$(CP) -Rp $(SOURCE_DIR)/src $(PROTO_DIR)/$(ECPREFIX)/share/go
	$(CP) -Rp $(SOURCE_DIR)/test $(PROTO_DIR)/$(ECPREFIX)/share/go
	$(CP) -Rp $(SOURCE_DIR)/doc $(PROTO_DIR)/$(ECPREFIX)/share/doc/go/html
	$(SYMLINK) ../../share/doc/go/html $(PROTO_DIR)/$(ECPREFIX)/lib/go/doc
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

# Go is supported on amd64 architecture only
build:		$(BUILD_64)

install:	$(INSTALL_64)
