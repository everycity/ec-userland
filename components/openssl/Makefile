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
# Copyright 2017, EveryCity Ltd. All rights reserved.
#

# we need JOBS=1 for this component
DEF_JOBS := no
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openssl
COMPONENT_FMRI=		library/security/openssl
COMPONENT_VERSION=	1.0.2m
IPS_COMPONENT_VERSION=  1.0.2.13
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.openssl.org/"
COMPONENT_SUMMARY=	OpenSSL - a Toolkit for Secure Sockets Layer (SSL v2/v3) and Transport Layer (TLS v1) protocols and general purpose cryptographic library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f
COMPONENT_ARCHIVE_URL=	https://www.openssl.org/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	$(COMPONENT_NAME).license

CLEAN_PATHS +=	opensslconf.h

# test build stuff isn't thread safe
override COMPONENT_BUILD_GMAKE_ARGS=

# OpenSSL does not use autoconf but its own configure system.
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure

CFLAGS += -DSOLARIS_OPENSSL -DNO_WINDOWS_BRAINDEATH

GENERIC_CONFIGURE_OPTIONS = \
        $(CFLAGS) \
        --openssldir=$(CONFIGURE_SYSCONFDIR)/openssl \
        --prefix=$(USRDIR) \
        --install_prefix=$(PROTO_DIR) \
        threads \
        shared

CONFIGURE_OPTIONS_i386_32 = solaris-x86-gcc 386
CONFIGURE_OPTIONS_i386_64 = solaris64-x86_64-gcc
CONFIGURE_OPTIONS_sparc_32 = solaris-sparcv8-gcc
CONFIGURE_OPTIONS_sparc_64 = solaris64-sparcv9-gcc

CONFIGURE_OPTIONS =  $(GENERIC_CONFIGURE_OPTIONS)
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS_$(MACH)_$(BITS))

CONFIGURE_OPTIONS += no-rc3
CONFIGURE_OPTIONS += no-rc5
CONFIGURE_OPTIONS += no-md2
CONFIGURE_OPTIONS += no-mdc2
CONFIGURE_OPTIONS += no-idea
CONFIGURE_OPTIONS += no-hw_4758_cca
CONFIGURE_OPTIONS += no-hw_aep
CONFIGURE_OPTIONS += no-hw_atalla
CONFIGURE_OPTIONS += no-hw_chil
CONFIGURE_OPTIONS += no-hw_gmp
CONFIGURE_OPTIONS += no-hw_ncipher
CONFIGURE_OPTIONS += no-hw_nuron
CONFIGURE_OPTIONS += no-hw_padlock
CONFIGURE_OPTIONS += no-hw_sureware
CONFIGURE_OPTIONS += no-hw_ubsec
CONFIGURE_OPTIONS += no-hw_cswift
CONFIGURE_OPTIONS += no-seed
CONFIGURE_OPTIONS += no-whirlpool
CONFIGURE_OPTIONS += no-whrlpool
CONFIGURE_OPTIONS += no-ssl2 no-ssl2-method
CONFIGURE_OPTIONS += no-ssl3 no-ssl3-method

COMPONENT_BUILD_TARGETS+= LDFLAGS="$(LDFLAGS)"

COMPONENT_PRE_CONFIGURE_ACTION = \
	( $(CLONEY) $(SOURCE_DIR) $(BUILD_DIR)/$(MACH$(BITS)); )

COMPONENT_POST_CONFIGURE_ACTION = ( cd $(@D); $(MAKE) depend; )

COMPONENT_INSTALL_ARGS += PATH=$(PATH) MANDIR=$(USRDIR)/share/man

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64) $(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share
#	([ -d $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/openssl/man ] && \
#	    $(CP) -RP $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/openssl/man \
#	    $(PROTO_DIR)$(USRDIR)/share || true)
#	([ -d $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/openssl/man ] && \
#	    $(RM) -rf $(PROTO_DIR)$(CONFIGURE_SYSCONFDIR)/openssl/man || true)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/apps/openssl $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.so.1.0.0 $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libssl.so.1.0.0 $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	( cd $(PROTO_DIR)$(USRDIR)/lib/$(MACH64) && \
		$(SYMLINK) -f libcrypto.so.1.0.0 libcrypto.so && \
		$(SYMLINK) -f libssl.so.1.0.0 libssl.so )
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/lib4758cca.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libaep.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libatalla.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libcapi.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libchil.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libcswift.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libgmp.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/ccgost/libgost.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libnuron.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libpadlock.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libsureware.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(INSTALL) $(BUILD_DIR_64)/engines/libubsec.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/engines
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.pc $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libssl.pc $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/openssl.pc $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig
	(chmod +w $(PROTO_DIR)$(USRDIR)/bin/openssl $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/openssl \
		$(PROTO_DIR)$(USRDIR)/lib/*so.* $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*so.*)
#	(strip $(PROTO_DIR)$(USRDIR)/bin/openssl $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/openssl \
#		$(PROTO_DIR)$(USRDIR)/lib/*so.* $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*so.*)
	# Note: OpenSSL generates a header file, include/openssl/opensslconf.h
	# This header file is different depending on 32bit or 64bit build
	$(ECHO) -e "/* EC: combining 32 and 64bit versions */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/cat $(BUILD_DIR_64)/include/openssl/opensslconf.h >> $(COMPONENT_DIR)/opensslconf.h
	$(ECHO) -e "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/opensslconf.h
	/usr/bin/cat $(BUILD_DIR_32)/include/openssl/opensslconf.h >> $(COMPONENT_DIR)/opensslconf.h
	$(ECHO) -e "\n#endif /* EC */" >> $(COMPONENT_DIR)/opensslconf.h
	$(RM) $(PROTO_DIR)$(USRDIR)/include/openssl/opensslconf.h
	$(INSTALL) $(COMPONENT_DIR)/opensslconf.h $(PROTO_DIR)$(USRDIR)/include/openssl/opensslconf.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

test:  $(NO_TESTS)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

