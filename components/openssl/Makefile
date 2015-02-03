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
# Copyright 2015, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openssl
COMPONENT_FMRI=		library/security/openssl
COMPONENT_VERSION=	1.0.2
IPS_COMPONENT_VERSION=  1.0.2
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.openssl.org/"
COMPONENT_SUMMARY=	OpenSSL - a Toolkit for Secure Sockets Layer (SSL v2/v3) and Transport Layer (TLS v1) protocols and general purpose cryptographic library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8c48baf3babe0d505d16cfc0cf272589c66d3624264098213db0fb00034728e9
COMPONENT_ARCHIVE_URL=	http://www.openssl.org/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	opensslconf.h

# test build stuff isn't thread safe
override COMPONENT_BUILD_GMAKE_ARGS=

# OpenSSL does not use autoconf but its own configure system.
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure

CFLAGS += -DNO_WINDOWS_BRAINDEATH

GENERIC_CONFIGURE_OPTIONS = \
        $(CFLAGS) \
        --openssldir=$(ECPREFIX)/etc/openssl \
        --prefix=$(ECPREFIX) \
        --install_prefix=$(PROTO_DIR) \
        no-rc3 \
        no-rc5 \
        no-mdc2 \
        no-idea \
        no-hw_4758_cca \
        no-hw_aep \
        no-hw_atalla \
        no-hw_chil \
        no-hw_gmp \
        no-hw_ncipher \
        no-hw_nuron \
        no-hw_padlock \
        no-hw_sureware \
        no-hw_ubsec \
        no-hw_cswift \
        threads \
        shared

CONFIGURE_OPTIONS_i386_32 = solaris-x86-gcc 386
CONFIGURE_OPTIONS_i386_64 = solaris64-x86_64-gcc
CONFIGURE_OPTIONS_sparc_32 = solaris-sparcv8-gcc
CONFIGURE_OPTIONS_sparc_64 = solaris64-sparcv9-gcc
CONFIGURE_OPTIONS = $(GENERIC_CONFIGURE_OPTIONS) \
	$(CONFIGURE_OPTIONS_$(MACH)_$(BITS))

COMPONENT_BUILD_TARGETS+= LDFLAGS="$(LDFLAGS)"

COMPONENT_PRE_CONFIGURE_ACTION = \
	( $(CLONEY) $(SOURCE_DIR) $(BUILD_DIR)/$(MACH$(BITS)); )

COMPONENT_POST_CONFIGURE_ACTION = ( cd $(@D); $(MAKE) depend; )

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64) $(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share
	([ -d $(PROTO_DIR)$(ECPREFIX)/etc/openssl/man ] && \
	    $(CP) -RP $(PROTO_DIR)$(ECPREFIX)/etc/openssl/man \
	    $(PROTO_DIR)$(ECPREFIX)/share || true)
	([ -d $(PROTO_DIR)$(ECPREFIX)/etc/openssl/man ] && \
	    $(RM) -rf $(PROTO_DIR)$(ECPREFIX)/etc/openssl/man || true)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/apps/openssl $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.so.1.0.0 $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libssl.so.1.0.0 $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	( cd $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64) && \
		$(SYMLINK) libcrypto.so.1.0.0 libcrypto.so && \
		$(SYMLINK) libssl.so.1.0.0 libssl.so )
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/lib4758cca.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libaep.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libatalla.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libcapi.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libchil.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libcswift.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libgmp.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/ccgost/libgost.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libnuron.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libpadlock.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libsureware.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libubsec.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/engines
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.pc $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libssl.pc $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/openssl.pc $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	(chmod +w $(PROTO_DIR)$(ECPREFIX)/bin/openssl $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/openssl \
		$(PROTO_DIR)$(ECPREFIX)/lib/*so.* $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/*so.*)
	(strip $(PROTO_DIR)$(ECPREFIX)/bin/openssl $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/openssl \
		$(PROTO_DIR)$(ECPREFIX)/lib/*so.* $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/*so.*)
	# Note: OpenSSL generates a header file, include/openssl/opensslconf.h
	# This header file is different depending on 32bit or 64bit build
	/usr/bin/echo "/* EC: combining 32 and 64bit versions */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/cat $(BUILD_DIR_64)/include/openssl/opensslconf.h >> $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/echo "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/cat $(BUILD_DIR_32)/include/openssl/opensslconf.h >> $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/echo "\n#endif /* EC */" >> $(COMPONENT_DIR)/opensslconf.h
	$(RM) $(PROTO_DIR)$(ECPREFIX)/include/openssl/opensslconf.h
	$(INSTALL) $(COMPONENT_DIR)/opensslconf.h $(PROTO_DIR)$(ECPREFIX)/include/openssl/opensslconf.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

test:  $(NO_TESTS)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
