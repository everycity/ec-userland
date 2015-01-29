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

COMPONENT_NAME=		freetype
COMPONENT_FMRI=		library/freetype2
COMPONENT_VERSION=	2.5.5
COMPONENT_LICENSE=	Freetype
COMPONENT_PROJECT_URL=	"http://www.freetype.org/"
COMPONENT_SUMMARY=	FreeType 2 font engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:387bcc4b780b12484aa2ec9f7db1a55d8286eb5639f45fbc0fbba7a4e5a1afb9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_SAVANNAH)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	ftconfig.h

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	# Note: freetype2 generates a header file, include/freetype2/ftconfig.h
	# This header file is different depending on 32bit or 64bit build
	/usr/bin/echo "/* EC: combining 32 and 64bit versions */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/ftconfig.h
	/usr/bin/cat $(BUILD_DIR_64)/ftconfig.h >> $(COMPONENT_DIR)/ftconfig.h
	/usr/bin/echo "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/ftconfig.h
	/usr/bin/cat $(BUILD_DIR_32)/ftconfig.h >> $(COMPONENT_DIR)/ftconfig.h
	/usr/bin/echo "\n#endif /* EC */" >> $(COMPONENT_DIR)/ftconfig.h
	$(RM) $(PROTO_DIR)$(USRDIR)/include/freetype2/ftconfig.h
	$(INSTALL) $(COMPONENT_DIR)/ftconfig.h $(PROTO_DIR)$(USRDIR)/include/freetype2/ftconfig.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

