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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ncurses
COMPONENT_VERSION=	5.9
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LINKER=	gcc

CONFIGURE_OPTIONS    +=        --without-normal
CONFIGURE_OPTIONS    +=        --with-shared
CONFIGURE_OPTIONS    +=        --without-debug
CONFIGURE_OPTIONS    +=        --enable-pc-files
CONFIGURE_OPTIONS.32 +=        --with-pkg-config=$(ECPREFIX)/bin/pkgconfig
CONFIGURE_OPTIONS.64 +=        --with-pkg-config=$(ECPREFIX)/bin/$(MACH64)/pkgconfig
CONFIGURE_OPTIONS    +=        --with-default-terminfo-dir=$(ECPREFIX)/share/terminfo

# Support two variants - regular, and wide character support
VARIANT_WIDE =		$(BUILD_DIR)/wide
VARIANT_NONWIDE =	$(BUILD_DIR)/non-wide

VARIANTS =	$(VARIANT_WIDE) $(VARIANT_NONWIDE)

BUILD_32 = $(VARIANTS:%=%/$(MACH32)/.built)
BUILD_64 = $(VARIANTS:%=%/$(MACH64)/.built)

INSTALL_32 = $(VARIANTS:%=%/$(MACH32)/.installed)
INSTALL_64 = $(VARIANTS:%=%/$(MACH64)/.installed)

$(VARIANT_WIDE)/$(MACH64)/.configured: BITS=64
$(VARIANT_NONWIDE)/$(MACH64)/.configured:  BITS=64

$(VARIANT_WIDE)/%/.configured: CONFIGURE_OPTIONS += --enable-widec
$(VARIANT_NONWIDE)/%/.configured: CONFIGURE_OPTIONS += --disable-widec

COMPONENT_POST_INSTALL_ACTION+= (                                          \
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig &&        \
	cd $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig &&                        \
	for file in *.pc ; do                                              \
		cat $$file | sed -e 's/\/ec\/lib$$/\/ec\/lib\/$(MACH64)/'  \
		-e 's/-L\$${libdir} -l/-L\$${libdir} -R\$${libdir} -l/'    \
		> $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig/$$file ; \
	done )

build:          $(BUILD_32_and_64)

install:        $(INSTALL_32_and_64)

