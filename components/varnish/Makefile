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

COMPONENT_NAME=		varnish
COMPONENT_FMRI=		web/cache/varnish
COMPONENT_VERSION=	4.1.0
COMPONENT_LICENSE=	Varnish
COMPONENT_PROJECT_URL=	"https://www.varnish-cache.org/"
COMPONENT_SUMMARY=	Varnish Web Application Accelerator
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4a6ea08e30b62fbf25f884a65f0d8af42e9cc9d25bf70f45ae4417c4f1c99017
COMPONENT_ARCHIVE_URL=	http://repo.varnish-cache.org/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS+=	--without-rst2html --disable-silent-rules

CONFIGURE_ENV+=		VCC_CC="$(CC) $(CC_BITS) $(CC_PIC) -shared -o %o %s"

#COMPONENT_PRE_CONFIGURE_ACTION=	$(CLONEY) $(SOURCE_DIR) $(@D)
#COMPONENT_PRE_CONFIGURE_ACTION+=	( cd $(SOURCE_DIR) ; \
	libtoolize --force --copy ; aclocal -I m4; autoheader; \
	automake --add-missing --copy --foreign; autoconf; \
	$(GPATCH) -p1 < ../../patches/configure.patch;  )

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/etc/varnish
	$(INSTALL) $(SOURCE_DIR)/etc/example.vcl $(PROTO_DIR)$(ECPREFIX)/etc/varnish/example.vcl
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

