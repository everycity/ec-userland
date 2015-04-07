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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ocaml
COMPONENT_FMRI=         runtime/ocaml
COMPONENT_VERSION_MJR=	4.02
COMPONENT_VERSION_MNR=	1
COMPONENT_VERSION=      $(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
IPS_COMPONENT_VERSION=	4.2.1
COMPONENT_LICENSE=      QPL, LGPLv2
COMPONENT_PROJECT_URL=  "https://ocaml.org/"
COMPONENT_SUMMARY=	OCaml is an industrial strength programming language supporting functional, imperative and object-oriented styles
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3cbc7af5a3886c8c5af8dab5568d6256a191d89ecbd4aea18eaf5b47034c6138
COMPONENT_ARCHIVE_URL=	http://caml.inria.fr/pub/distrib/$(COMPONENT_NAME)-$(COMPONENT_VERSION_MJR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Build is not thread safe
override JOBS=1

COMPONENT_LICENSE_FILE=	LICENSE

COMPONENT_PRE_CONFIGURE_ACTION=	($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_ENV+=		CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS=	-verbose
CONFIGURE_OPTIONS+=	-prefix $(ECPREFIX)
CONFIGURE_OPTIONS_32+=	-bindir $(ECPREFIX)/bin
CONFIGURE_OPTIONS_64+=	-bindir $(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS_32+=	-libdir $(ECPREFIX)/lib
CONFIGURE_OPTIONS_64+=	-libdir $(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS_$(BITS))
CONFIGURE_OPTIONS+=	-mandir $(ECPREFIX)/share/man
CONFIGURE_OPTIONS+=	-cc "$(CC) $(CC_BITS)"
CONFIGURE_OPTIONS+=	-as "$(ECPREFIX)/bin/gas --$(BITS)"
CONFIGURE_OPTIONS+=	-aspp "$(CC) $(CC_BITS) -c"
CONFIGURE_OPTIONS+=	-partialld "/usr/bin/ld -$(BITS) -r"

COMPONENT_BUILD_TARGETS=	world opt opt.opt

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

