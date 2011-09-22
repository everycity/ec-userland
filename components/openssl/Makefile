#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openssl
COMPONENT_VERSION=	1.0.0e
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:235eb68e5a31b0f7a23bc05f52d7a39c596e2e69
COMPONENT_ARCHIVE_URL=	http://openssl.org/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=  1.0.0.5

# ----------------------------

#PKCS11_LIB = /usr/lib/libpkcs11.so.1
#PKCS11_LIB64 = /usr/lib/64/libpkcs11.so.1

#ENGINESDIR_32 = $(ECPREFIX)/lib/openssl/engines
#ENGINESDIR_64 = $(ECPREFIX)/lib/openssl/engines/64

#CFLAGS = -DSOLARIS_OPENSSL -DNO_WINDOWS_BRAINDEATH
CFLAGS = -DNO_WINDOWS_BRAINDEATH
CFLAGS64 = $(CFLAGS)

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

CONFIGURE_OPTIONS64_i386 = solaris64-x86_64-gcc
CONFIGURE_OPTIONS64_sparc = solaris64-sparcv9-gcc
CONFIGURE_OPTIONS64 = $(GENERIC_CONFIGURE_OPTIONS) \
                $(CONFIGURE_OPTIONS64_$(MACH))
#                --enginesdir=$(ENGINESDIR_64)
#                --pk11-libname=$(PKCS11_LIB64) \

CONFIGURE_OPTIONS_i386 = solaris-x86-gcc 386
CONFIGURE_OPTIONS_sparc = solaris-sparcv8-gcc
CONFIGURE_OPTIONS = $(GENERIC_CONFIGURE_OPTIONS) \
                $(CONFIGURE_OPTIONS_$(MACH))
#                --enginesdir=$(ENGINESDIR_32)
#                --pk11-libname=$(PKCS11_LIB) \

# ----------------------------





#LIBNAME=	bz2
#LINTOUT=	lint.out
#LINTFLAGS=	-nsvx -I. $(BITS32)
#LINTFLAGS64=	-nsvx -I. $(BITS64)

# we need to enable large file support and build PIC for our shared libraries
#CFLAGS += $(CPP_LARGEFILE) $(CC_PIC)

#COMPONENT_BUILD_ENV += CC="$(CC)"
#COMPONENT_BUILD_TARGETS += CC="$(CC)"
#COMPONENT_BUILD_TARGETS += CFLAGS="$(CFLAGS)"
#COMPONENT_INSTALL_TARGETS += PREFIX=$(PROTOUSRDIR)

COMPONENT_PRE_BUILD_ACTION= \
	(cd $(@D) ; \
	    if [ $(BITS) = 32 ]; then ./Configure $(CONFIGURE_OPTIONS); \
            else ./Configure $(CONFIGURE_OPTIONS64); fi )

#COMPONENT_POST_BUILD_ACTION= \
#	(cd $(@D) ; \
#	    $(LINT) -o $(LIBNAME) ../../llib-lbz2 > $(LINTOUT) 2>&1)


# common targets
build:		$(BUILD_32) $(BUILD_64)

include ../../make-rules/shared-targets.mk

install:	build $(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share
	([ -d $(PROTO_DIR)/$(ECPREFIX)/etc/openssl/man ] && \
	    $(CP) -RP $(PROTO_DIR)/$(ECPREFIX)/etc/openssl/man \
	    $(PROTO_DIR)/$(ECPREFIX)/share || true)
	([ -d $(PROTO_DIR)/$(ECPREFIX)/etc/openssl/man ] && \
	    $(RM) -rf $(PROTO_DIR)/$(ECPREFIX)/etc/openssl/man || true)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/apps/openssl $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.so.1.0.0 $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/libssl.so.1.0.0 $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libcrypto.pc $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/libssl.pc $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(INSTALL) $(BUILD_DIR_64)/openssl.pc $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	(chmod +w $(PROTO_DIR)/$(ECPREFIX)/bin/openssl $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/openssl \
		$(PROTO_DIR)/$(ECPREFIX)/lib/*so.* $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/*so.*)
	(strip $(PROTO_DIR)/$(ECPREFIX)/bin/openssl $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/openssl \
		$(PROTO_DIR)/$(ECPREFIX)/lib/*so.* $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/*so.*)

# $(PROTOMAN3FILES) $(PROTOMAN1FILES)
#	$(INSTALL) $(BUILD_DIR_32)/libbz2.so.1 $(PROTOUSRLIBDIR)
#	cd $(PROTOUSRLIBDIR); rm -f libbz2.so; ln -s libbz2.so.1 libbz2.so
#	$(INSTALL) llib-lbz2 $(PROTOUSRLIBDIR)
#	$(INSTALL) $(BUILD_DIR_32)/llib-lbz2.ln $(PROTOUSRLIBDIR)
#	$(MKDIR) $(PROTOUSRLIBDIR64)
#	$(INSTALL) $(BUILD_DIR_64)/libbz2.so.1 $(PROTOUSRLIBDIR64)
#	cd $(PROTOUSRLIBDIR64); rm -f libbz2.so; ln -s libbz2.so.1 libbz2.so
#	$(INSTALL) $(BUILD_DIR_64)/llib-lbz2.ln $(PROTOUSRLIBDIR64)

# build does this always
test:  build
	@cd $(BUILD_DIR_32); $(MAKE) check
	@cd $(BUILD_DIR_64); $(MAKE) check


BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
