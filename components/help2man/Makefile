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
# Copyright 2012 Igor Kozhukhov <ikozhukhov@gmail.com>. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		help2man
COMPONENT_VERSION=	1.38.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/help2man/
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
	sha256:952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1
COMPONENT_ARCHIVE_URL=	ftp://ftp.gnu.org/gnu/help2man/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

BITS = 64

COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CLONEY) $(SOURCE_DIR) $(@D))

CC += $(CC_BITS)
LDFLAGS += -nodefaultlibs -lc

CONFIGURE_BINDIR.64 = $(CONFIGURE_BINDIR.32)

CONFIGURE_ENV += CPP="$(CC) -E"
CONFIGURE_ENV += CXXCPP="$(CXX) -E"

CONFIGURE_OPTIONS +=	--enable-nls

build:			$(BUILD_64)

install:		$(INSTALL_64)

test: $(NO_TESTS)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include ../../make-rules/depend.mk
