#
# This file and its contents are supplied under the terms of 
# The MIT License (MIT).
#
# A full copy of the text of the MIT should have accompanied this
# source.  A copy of the MIT is also available via the Internet at
# http://www.opensource.org/licenses/MIT.
#

#
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=         sunmake
COMPONENT_VERSION=      0.1
COMPONENT_FMRI=		developer/build/sunmake
COMPONENT_SUMMARY=	Sun make and dmake
COMPONENT_PROJECT_URL=	http://dlc.sun.com/osol/devpro/downloads/20081119/
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:3ca1dd7873730086519edee98438cacd429d4724dd04202a9f5c9e92085ddac0
COMPONENT_ARCHIVE_URL=  http://www.dilos.org/srcarch/$(COMPONENT_ARCHIVE)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/ips.mk

# untar the tar ball and apply the patches
build:		$(SOURCE_DIR)/.prep

install: build
	$(MKDIR) $(PROTO_DIR)
	$(CP) -r $(SOURCE_DIR)/* $(PROTO_DIR)

test:	$(NO_TESTS)

clean::
	$(RM) -r $(BUILD_DIR)

include $(WS_TOP)/make-rules/depend.mk
