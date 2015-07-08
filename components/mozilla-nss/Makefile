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
# Copyright 2014, Alexander Pyhalov 
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		nss
COMPONENT_FMRI=		library/nss
COMPONENT_VERSION=	3.17.4
COMPONENT_SUMMARY=	Network Security Services
COMPONENT_PROJECT_URL=	https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1d98ad1881a4237ec98cbe472fc851480f0b0e954dfe224d047811fb96ff9d79
COMPONENT_ARCHIVE_URL=	ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_4_RTM/src/$(COMPONENT_ARCHIVE)

# Enable compiler optimizations and disable debugging code
COMPONENT_BUILD_ENV += BUILD_OPT=1

# Generate symbolic info for debuggers
COMPONENT_BUILD_ENV += XCFLAGS="-g $(EC_INCLUDE)"

COMPONENT_BUILD_ENV += PATH=$(GCC_ROOT)/bin:$(PATH)
COMPONENT_BUILD_ENV += PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
COMPONENT_BUILD_ENV += PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
COMPONENT_BUILD_ENV += NSS_USE_SYSTEM_SQLITE=1
COMPONENT_BUILD_ENV += NS_USE_GCC=1

MPS.32=$(USRDIR)/lib
MPS.64=$(USRDIR)/lib/$(MACH64)
COMPONENT_BUILD_ENV += NSPR_INCLUDE_DIR=$(USRDIR)/include/nspr
COMPONENT_BUILD_ENV += NSPR_LIB_DIR=$(MPS.$(BITS))
COMPONENT_BUILD_ENV += NSS_INCLUDE_DIR=$(USRDIR)/include/nss
COMPONENT_BUILD_ENV += NSS_LIB_DIR=$(MPS.$(BITS))

COMPONENT_BUILD_ENV.64 += USE_64=1
COMPONENT_BUILD_ENV += $(COMPONENT_BUILD_ENV.$(BITS))

COMPONENT_TEST_ENV += $(COMPONENT_BUILD_ENV)
COMPONENT_TEST_ENV += HOST=127.0.0.1
COMPONENT_TEST_DIR = $(BUILD_DIR_$(BITS))/nss/tests

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D); $(ENV) $(COMPONENT_BUILD_ENV) $(GMAKE) -C nss/coreconf)
	(cd $(@D); $(ENV) $(COMPONENT_BUILD_ENV) $(GMAKE) -C nss/lib)
	(cd $(@D); $(ENV) $(COMPONENT_BUILD_ENV) $(GMAKE) -C nss/cmd)
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

build: $(BUILD_32_and_64)

install: build
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/bin
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/lib
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
#	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/include/dbm
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/include/nss
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/lib/pkgconfig
	$(MKDIR) -p $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig
#	cp $(BUILD_DIR_32)/dist/public/dbm/*.h $(PROTO_DIR)$(USRDIR)/include/dbm
	cp $(BUILD_DIR_32)/dist/public/nss/*.h $(PROTO_DIR)$(USRDIR)/include/nss
	cp $(BUILD_DIR_32)/dist/SunOS5.11_*_OPT.OBJ/lib/*.so $(PROTO_DIR)$(USRDIR)/lib
	cp $(BUILD_DIR_32)/dist/SunOS5.11_*_OPT.OBJ/lib/*.chk $(PROTO_DIR)$(USRDIR)/lib
	cp $(BUILD_DIR_64)/dist/SunOS5.11_*_OPT.OBJ/lib/*.so $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	cp $(BUILD_DIR_64)/dist/SunOS5.11_*_OPT.OBJ/lib/*.chk $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	for i in addbuiltin certutil cmsutil crlutil modutil pk12util signtool signver ssltap; do \
		cp $(BUILD_DIR_32)/dist/SunOS5.11_*_OPT.OBJ/bin/$$i $(PROTO_DIR)$(USRDIR)/bin; \
		cp $(BUILD_DIR_64)/dist/SunOS5.11_*_OPT.OBJ/bin/$$i $(PROTO_DIR)$(USRDIR)/bin/$(MACH64); \
		done
	cat $(COMPONENT_DIR)/nss.pc | sed s/^Version:/Version:\ $(COMPONENT_VERSION)/ | \
		sed s%/usr%$(USRDIR)% \
		> $(PROTO_DIR)$(USRDIR)/lib/pkgconfig/nss.pc 
	cat $(COMPONENT_DIR)/nss.pc | sed s/^Version:/Version:\ $(COMPONENT_VERSION)/ | \
		sed s%/usr%$(USRDIR)% | sed s%/lib$$%/lib/$(MACH64)% \
		> $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/pkgconfig/nss.pc 
#	for i in $(PROTO_DIR)$(USRDIR)/lib/*.so; do \
#        	$(ELFEDIT) -e 'dyn:value -s RPATH "$(USRDIR)/lib"' $$i ;\
#    		done ;
#	for i in $(PROTO_DIR)$(USRDIR)/lib/*.so; do \
#        	$(ELFEDIT) -e 'dyn:value -s RUNPATH "$(USRDIR)/lib"' $$i ;\
#		done
#	for i in $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*.so; do \
#        	$(ELFEDIT) -e 'dyn:value -s  RPATH "$(USRDIR)/lib/$(MACH64)"' $$i ;\
#    		done ;
#	for i in $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*.so; do \
#        	$(ELFEDIT) -e 'dyn:value -s  RUNPATH "$(USRDIR)/lib/$(MACH64)"' $$i ;\
#		done
	$(TOUCH) $(BUILD_DIR_32)/.installed $(BUILD_DIR_64)/.installed

test:	$(TEST_32_and_64)

$(TEST_32):  $(BUILD_32)
	cd $(COMPONENT_TEST_DIR) && \
	$(ENV) $(COMPONENT_TEST_ENV) $(CONFIG_SHELL) all.sh &&\
	$(TOUCH) $(BUILD_DIR_$(BITS))/.tested

$(TEST_64):  $(BUILD_64) 
	cd $(COMPONENT_TEST_DIR) && \
	$(ENV) $(COMPONENT_TEST_ENV) $(CONFIG_SHELL) all.sh &&\
	$(TOUCH) $(BUILD_DIR_$(BITS))/.tested

