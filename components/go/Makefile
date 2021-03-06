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

COMPONENT_NAME=		go
COMPONENT_FMRI=		developer/go
COMPONENT_VERSION=	1.11.2
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://golang.org/"
COMPONENT_SUMMARY=	The Go Programming Language
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)$(COMPONENT_VERSION).src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:042fba357210816160341f1002440550e952eb12678f7c9e7e9d389437942550
COMPONENT_ARCHIVE_URL=	https://dl.google.com/go/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+= GOOS=solaris GOROOT_BOOTSTRAP=$(ECPREFIX)/lib/go
#COMPONENT_BUILD_ENV+= GOROOT=$(PROTO_DIR)$(ECPREFIX)/lib/go
COMPONENT_BUILD_ENV+= GOROOT_FINAL=$(ECPREFIX)/lib/go
COMPONENT_BUILD_ARGS+= --no-banner

$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D)/src ; $(ENV) $(COMPONENT_BUILD_ENV) \
		./make.bash $(COMPONENT_BUILD_ARGS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/bin
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib
	$(CP) -Rp $(@D) $(PROTO_DIR)$(ECPREFIX)/lib/go
	$(SYMLINK) ../lib/go/bin/go $(PROTO_DIR)$(ECPREFIX)/bin/go
	$(SYMLINK) ../lib/go/bin/gofmt $(PROTO_DIR)$(ECPREFIX)/bin/gofmt
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

# Go is supported on amd64 architecture only
build:		$(BUILD_64)

install:	$(INSTALL_64)
