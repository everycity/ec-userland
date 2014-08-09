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

CONFIGURE_DEFAULT_CPPFLAGS = yes
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ncurses
COMPONENT_VERSION=	5.9
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/ncurses/
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# need remove -I/ec/include on EC zones because build failed with it
CPPFLAGS=
CPPFLAGS += -D_REENTRANT

CONFIGURE_OPTIONS    += --with-normal
CONFIGURE_OPTIONS    += --with-shared
CONFIGURE_OPTIONS    += --without-debug
CONFIGURE_OPTIONS    += --enable-pc-files
CONFIGURE_OPTIONS.32 += --with-pkg-config=$(USRDIR)/bin/pkgconfig
CONFIGURE_OPTIONS.64 += --with-pkg-config=$(USRDIR)/bin/$(MACH64)/pkgconfig
CONFIGURE_OPTIONS    += --with-default-terminfo-dir=$(USRDIR)/share/terminfo
CONFIGURE_OPTIONS    += --without-profile
CONFIGURE_OPTIONS    += --enable-echo
CONFIGURE_OPTIONS    += --enable-const
CONFIGURE_OPTIONS    += --without-ada
CONFIGURE_OPTIONS    += --without-tests
CONFIGURE_OPTIONS    += --with-progs
CONFIGURE_OPTIONS    += --enable-symlinks
CONFIGURE_OPTIONS    += --disable-lp64
CONFIGURE_OPTIONS    += --with-chtype='long'
CONFIGURE_OPTIONS    += --with-mmask-t='long'
CONFIGURE_OPTIONS    += --disable-termcap
CONFIGURE_OPTIONS    += --with-ticlib=tic
CONFIGURE_OPTIONS    += --with-termlib=tinfo

# Support two variants - regular, and wide character support
VARIANT_WIDE =		$(BUILD_DIR)/wide
VARIANT_NONWIDE =	$(BUILD_DIR)/non-wide

VARIANTS =	$(VARIANT_NONWIDE) $(VARIANT_WIDE)

BUILD_32 = $(VARIANTS:%=%/$(MACH32)/.built)
BUILD_64 = $(VARIANTS:%=%/$(MACH64)/.built)

INSTALL_32 = $(VARIANTS:%=%/$(MACH32)/.installed)
INSTALL_64 = $(VARIANTS:%=%/$(MACH64)/.installed)

$(VARIANT_WIDE)/$(MACH32)/.configured: BITS=32
$(VARIANT_NONWIDE)/$(MACH32)/.configured:  BITS=32

$(VARIANT_WIDE)/$(MACH64)/.configured: BITS=64
$(VARIANT_NONWIDE)/$(MACH64)/.configured:  BITS=64

CFG_WIDE = --enable-widec
CFG_WIDE += --includedir=$(USRDIR)/include/ncursesw
CFG_WIDE += --disable-overwrite

CFG_NONWIDE = --disable-widec
#CFG_NONWIDE += --includedir=$(USRDIR)/include/ncurses
CFG_NONWIDE += --enable-overwrite

$(VARIANT_WIDE)/%/.configured: CONFIGURE_OPTIONS += $(CFG_WIDE)
$(VARIANT_NONWIDE)/%/.configured: CONFIGURE_OPTIONS += $(CFG_NONWIDE)

COMPONENT_POST_INSTALL_ACTION+= (                                          \
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig &&        \
	cd $(PROTO_DIR)$(USRDIR)/lib/pkgconfig &&                        \
	for file in *.pc ; do                                              \
		cat $$file | $(GSED) -e 's/\$(USRDIR)\/lib$$/\$(USRDIR)\/lib\/$(MACH64)/'  \
		-e 's/-L\$${libdir} -l/-L\$${libdir} -R\$${libdir} -l/'    \
		> $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig/$$file ; \
	done )

build:          $(BUILD_32_and_64)

install:        $(INSTALL_32_and_64)

