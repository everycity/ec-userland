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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		bzip2
COMPONENT_FMRI=		compress/bzip2
COMPONENT_VERSION=	1.0.6
COMPONENT_LICENSE=	BSD
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	"http://www.bzip.org/"
COMPONENT_SUMMARY=	bzip2 is a high-quality data compressor
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd
COMPONENT_ARCHIVE_URL=	http://bzip.org/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CFLAGS += $(CPP_LARGEFILES) $(CC_PIC)

COMPONENT_BUILD_ENV += CC="$(CC)"
COMPONENT_BUILD_ARGS += CC="$(CC)"
COMPONENT_BUILD_ARGS += CFLAGS="$(CFLAGS)"
COMPONENT_INSTALL_ARGS += PREFIX=$(PROTOUSRDIR)

COMPONENT_PRE_BUILD_ACTION =	( cd $(@D) ; cp ../../oldapi.c . )

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(INSTALL) $(BUILD_DIR_32)/libbz2.so.1 $(PROTOUSRLIBDIR)
	( cd $(PROTOUSRLIBDIR) && $(SYMLINK) libbz2.so.1 libbz2.so )
	$(MKDIR) $(PROTOUSRBINDIR64) $(PROTOUSRLIBDIR64)
	( for i in bzdiff bzgrep bzip2 bzip2recover bzmore ; \
		do $(INSTALL) $(BUILD_DIR_64)/$$i $(PROTOUSRBINDIR64) ; done )
	( cd $(PROTOUSRBINDIR64) && \
		$(LN) bzip2 bunzip2 && \
		$(LN) bzip2 bzcat && \
		$(SYMLINK) ./bzgrep bzegrep && \
		$(SYMLINK) ./bzgrep bzfgrep && \
		$(SYMLINK) ./bzdiff bzcmp && \
		$(SYMLINK) ./bzmore bzless )
	$(INSTALL) $(BUILD_DIR_64)/libbz2.so.1 $(PROTOUSRLIBDIR64)
	( cd $(PROTOUSRLIBDIR64) && $(SYMLINK) libbz2.so.1 libbz2.so )
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
