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

COMPONENT_NAME=		apr
COMPONENT_FMRI=		library/apr
COMPONENT_VERSION=	1.6.5
COMPONENT_LICENSE=	APLv2
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	http://apr.apache.org/
COMPONENT_SUMMARY=	Apache Portable Runtime (APR)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0ebad47d194371b0a105
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS += $(CC_BITS)

CONFIGURE_OPTIONS.32	+=	--with-installbuilddir=$(USRDIR)/share/apr-1.0/build
CONFIGURE_OPTIONS.64	+=	--with-installbuilddir=$(USRDIR)/share/apr-1.0/build/$(MACH64)
CONFIGURE_OPTIONS	+=	--includedir=$(USRDIR)/include/apr-1.0
#CONFIGURE_OPTIONS.32	+=	--includedir=$(USRDIR)/include/apr-1.0
#CONFIGURE_OPTIONS.64	+=	--includedir=$(USRDIR)/include/apr-1.0/$(MACH64)

CONFIGURE_OPTIONS	+=	--enable-threads
CONFIGURE_OPTIONS	+=	--enable-other-child
CONFIGURE_OPTIONS	+=	--enable-nonportable-atomics
CONFIGURE_OPTIONS	+=	--enable-shared

COMPONENT_PRE_CONFIGURE_ACTION= ( $(CLONEY) $(SOURCE_DIR) $(@D) );

# Some patches need configure script recreation.
COMPONENT_PRE_CONFIGURE_ACTION += (cd $(@D); ./buildconf);

CONFIGURE_SCRIPT=       $(@D)/configure

#COMPONENT_POST_INSTALL_ACTION = ( strip \
#		$(PROTO_DIR)$(USRDIR)/lib/*so* \
#                $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*so* \
#                >/dev/null 2>&1; true )

# 32 and 64 bits apr.h headers need to be merged to the final one.
APRH=include/apr.h
$(BUILD_DIR_64)/.installed: COMPONENT_POST_INSTALL_ACTION += \
	/usr/bin/diff -D __$(MACH64) $(BUILD_DIR_32)/$(APRH) \
	  $(BUILD_DIR_64)/$(APRH) > $(PROTO_DIR)$(USRDIR)/include/apr-1.0/apr.h; true

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(GSED) -i -e 's;LDFLAGS=.*;LDFLAGS="";' $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/apr-1-config \
	&& $(GSED) -i -e 's;LDFLAGS=.*;LDFLAGS="";' $(PROTO_DIR)$(USRDIR)/bin/apr-1-config \
	&& $(GSED) -i -e 's;CC=.*;CC="gcc";' $(PROTO_DIR)$(USRDIR)/bin/apr-1-config \
	&& $(GSED) -i -e 's;CC=.*;CC="gcc";' $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/apr-1-config \
	&& $(GSED) -i -e 's;CPP=.*;CPP="gcc -E";' $(PROTO_DIR)$(USRDIR)/bin/apr-1-config \
	&& $(GSED) -i -e 's;CPP=.*;CPP="gcc -E";' $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/apr-1-config
