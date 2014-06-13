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
# Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
#

# Perl 5.12 and older are 32-bit only.
# Perl 5.18 and newer are 64-bit only.

COMMON_PERL_ENV +=	MAKE=$(GMAKE)
COMMON_PERL_ENV +=	PATH=$(dir $(CC)):$(PATH)
COMMON_PERL_ENV +=	LANG="C" LC_ALL="C"
COMMON_PERL_ENV +=	CC="$(CC)"
COMMON_PERL_ENV +=	CFLAGS="$(PERL_OPTIMIZE.$(PERL_VERSION))"

# Yes.  Perl is just scripts, for now, but we need architecture
# directories so that it populates all architecture prototype
# directories.

$(BUILD_DIR)/$(MACH32)-5.12/.configured:	PERL_VERSION=5.12
$(BUILD_DIR)/$(MACH32)-5.12/.configured:	BITS=32
$(BUILD_DIR)/$(MACH64)-5.18/.configured:	PERL_VERSION=5.18
$(BUILD_DIR)/$(MACH64)-5.18/.configured:	BITS=64

$(BUILD_DIR)/$(MACH32)-5.12/.built:		PERL_VERSION=5.12
$(BUILD_DIR)/$(MACH32)-5.12/.built:		BITS=32
BUILD_32 =	$(BUILD_DIR)/$(MACH32)-5.12/.built
$(BUILD_DIR)/$(MACH64)-5.18/.built:		PERL_VERSION=5.18
$(BUILD_DIR)/$(MACH64)-5.18/.built:		BITS=64
BUILD_64 =	$(BUILD_DIR)/$(MACH64)-5.18/.built

$(BUILD_DIR)/$(MACH32)-5.12/.installed:		PERL_VERSION=5.12
$(BUILD_DIR)/$(MACH32)-5.12/.installed:		BITS=32
INSTALL_32 =	$(BUILD_DIR)/$(MACH32)-5.12/.installed
$(BUILD_DIR)/$(MACH64)-5.18/.installed:		PERL_VERSION=5.18
$(BUILD_DIR)/$(MACH64)-5.18/.installed:		BITS=64
INSTALL_64 =	$(BUILD_DIR)/$(MACH64)-5.18/.installed

TEST_32 =	$(BUILD_DIR)/$(MACH32)-5.12/.tested
TEST_64 =	$(BUILD_DIR)/$(MACH64)-5.18/.tested

COMPONENT_CONFIGURE_ENV +=	$(COMMON_PERL_ENV)
COMPONENT_CONFIGURE_ENV +=	PERL="$(PERL)"
COMPONENT_MAKE_FILE = 		Makefile.PL
$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	($(RM) -r $(@D) ; $(MKDIR) $(@D))
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(COMPONENT_CONFIGURE_ENV) $(PERL) $(PERL_FLAGS) \
				$(COMPONENT_MAKE_FILE) $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@


COMPONENT_BUILD_ENV +=	$(COMMON_PERL_ENV)
$(BUILD_DIR)/%/.built:	$(BUILD_DIR)/%/.configured
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_ARGS) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
ifeq   ($(strip $(PARFAIT_BUILD)),yes)
	-$(PARFAIT) $(@D)
endif
	$(TOUCH) $@


COMPONENT_INSTALL_ARGS +=	DESTDIR="$(PROTO_DIR)"
COMPONENT_INSTALL_TARGETS =	install_vendor
COMPONENT_INSTALL_ENV +=	$(COMMON_PERL_ENV)
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
			$(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@


COMPONENT_TEST_TARGETS =	check
COMPONENT_TEST_ENV +=	$(COMMON_PERL_ENV)
$(BUILD_DIR)/%/.tested:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_TEST_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_TEST_ENV) $(GMAKE) \
			$(COMPONENT_TEST_ARGS) $(COMPONENT_TEST_TARGETS))
	$(COMPONENT_POST_TEST_ACTION)
	$(TOUCH) $@

ifeq   ($(strip $(PARFAIT_BUILD)),yes)
parfait: build
else
parfait:
	$(MAKE) PARFAIT_BUILD=yes parfait
endif

clean:: 
	$(RM) -r $(BUILD_DIR) $(PROTO_DIR)
