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

COMPONENT_NAME=		libxml2
COMPONENT_FMRI=		library/libxml2
COMPONENT_VERSION=	2.9.4
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xmlsoft.org/"
COMPONENT_SUMMARY=	The XML library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XMLSOFT)

# W3C XML Conformance Test Suites
COMPONENT_ARCHIVE_1= xmlts20080827.tar.gz
COMPONENT_ARCHIVE_HASH_1= \
    sha256:96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7
COMPONENT_ARCHIVE_URL_1= http://www.w3.org/XML/Test/$(COMPONENT_ARCHIVE_1)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS +=	$(CPP_LARGEFILES)
LDFLAGS +=	$(LD_Z_DEFS) $(LD_Z_TEXT) -lpthread

CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --with-threads
CONFIGURE_OPTIONS += --with-icu
CONFIGURE_OPTIONS += --with-python=$(PYTHON.$(BITS))
CONFIGURE_OPTIONS += --with-python-install-dir=$(PYTHON_VENDOR_PACKAGES)
# Cannot link to lzma since it's not in /lib.
CONFIGURE_OPTIONS += --without-lzma

COMPONENT_PREP_ACTION += (cd $(@D) ; cp $(COMPONENT_DIR)/mapfile libxml2.syms ; autoreconf -if)

# We have patched our 64 bit python so it will search for modules only in
# '64/' directories. Now we need to provide one. Otherwise python will
# end up using libxml2mod.so installed on system.
$(BUILD_DIR)/$(MACH64)/.tested: COMPONENT_PRE_TEST_ACTION = ( \
    $(MKDIR) $(@D)/python/.libs/64 $(@D)/python2.7/.libs/64; \
    $(SYMLINK) ../libxml2mod.so $(@D)/python/.libs/64/libxml2mod.so; \
    $(SYMLINK) ../libxml2mod.so $(@D)/python2.7/.libs/64/libxml2mod.so);

COMPONENT_PRE_TEST_ACTION += \
    (cd $(@D) ; gtar xf $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1));

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(PYTHON.2.7.32) -m compileall $(PROTO_DIR)/usr/lib/python2.7/vendor-packages

test:		$(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
