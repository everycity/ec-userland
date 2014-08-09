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
COMPONENT_VERSION=      0.2
COMPONENT_FMRI=		developer/build/sunmake
COMPONENT_SUMMARY=	Sun make and dmake
COMPONENT_PROJECT_URL=	http://dlc.sun.com/osol/devpro/downloads/20081119/
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:d1a203f20ac0f16acc44e62915bf66fe3c7579f83075f2e12bd295c69f06a22d
COMPONENT_ARCHIVE_URL=  http://smartos.igork.cloud.ec/$(COMPONENT_ARCHIVE)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/ips.mk

# untar the tar ball and apply the patches
build:		$(SOURCE_DIR)/.prep

install: build
	$(MKDIR) $(PROTO_DIR)
	$(CP) -r $(SOURCE_DIR)$(USRDIR) $(PROTO_DIR)$(USRDIR)

test:	$(NO_TESTS)

clean::
	$(RM) -r $(BUILD_DIR)

include $(WS_TOP)/make-rules/depend.mk
