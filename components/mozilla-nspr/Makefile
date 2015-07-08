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
# Copyright 2011, Andrzej Szeszo
# Copyright 2013, Jon Tibble
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		nspr
COMPONENT_FMRI=		library/nspr
COMPONENT_VERSION=	4.10.8
COMPONENT_SUMMARY=	Netscape Portable Runtime
COMPONENT_PROJECT_URL=	https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15
COMPONENT_ARCHIVE_URL=	http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(COMPONENT_VERSION)/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT = $(SOURCE_DIR)/nspr/configure

CONFIGURE_ENV += CC="$(CC)"

CONFIGURE_BINDIR.32 = $(USRDIR)/bin
CONFIGURE_BINDIR.64 = $(USRDIR)/bin/$(MACH64)

CONFIGURE_LIBDIR.32 = $(USRDIR)/lib
CONFIGURE_LIBDIR.64 = $(USRDIR)/lib/$(MACH64)

CONFIGURE_OPTIONS.64 += --enable-64bit

CONFIGURE_OPTIONS = --prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS += --bindir=$(CONFIGURE_BINDIR.$(BITS))
CONFIGURE_OPTIONS += --libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS += --includedir=$(USRDIR)/include/nspr
#CONFIGURE_OPTIONS += --disable-debug
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)
#	for i in $(PROTO_DIR)$(USRDIR)/lib/*.so; do \
#		$(ELFEDIT) -e 'dyn:value -s  RPATH "$(USRDIR)/lib"' $$i ;\
#		done ;
#	for i in $(PROTO_DIR)$(USRDIR)/lib/*.so; do \
#		$(ELFEDIT) -e 'dyn:value -s  RUNPATH "$(USRDIR)/lib"' $$i ;\
#		done
#	for i in $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*.so; do \
#		$(ELFEDIT) -e 'dyn:value -s  RPATH "$(USRDIR)/lib/$(MACH64)"' $$i ;\
#		done ;
#	for i in $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*.so; do \
#		$(ELFEDIT) -e 'dyn:value -s  RUNPATH "$(USRDIR)/lib/$(MACH64)"' $$i ;\
#		done
	$(RM) $(PROTO_DIR)$(USRDIR)/bin/compile-et.pl $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/compile-et.pl
	$(RM) $(PROTO_DIR)$(USRDIR)/bin/prerr.properties $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/prerr.properties
	$(RM) $(PROTO_DIR)$(USRDIR)/lib/*.a $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*.a
	
	$(TOUCH) $(BUILD_DIR_32)/.installed $(BUILD_DIR_64)/.installed
