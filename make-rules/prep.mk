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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

UNPACK=		$(WS_TOOLS)/userland-unpack
FETCH=		$(WS_TOOLS)/userland-fetch

ARCHIVES+=	$(COMPONENT_ARCHIVE)
CLEAN_PATHS+=	source

# In order to override PATCH_DIR and PATCH_PATTERN in component makefiles, they
# need to be conditionally set here.  This means that the override needs to
# happen prior to including prep.mk.  Otherwise other variables set here which
# are based on those will be expanded too early for the override to take effect.
# You also can't override PATCHES after including prep.mk; if you want to
# append filenames to PATCHES, you'll have to set $(EXTRA_PATCHES) prior to
# inclusion.
PATCH_DIR?=	patches
PATCH_PATTERN?=	*.patch
PATCHES=	$(shell find $(PATCH_DIR) -type f -name '$(PATCH_PATTERN)' \
				2>/dev/null | sort) $(EXTRA_PATCHES)
STAMPS=		$(PATCHES:$(PATCH_DIR)/%=$(SOURCE_DIR)/.%ed)

$(SOURCE_DIR)/.%ed:	$(PATCH_DIR)/%
	$(GSED) -e "s;@APPDIR@;$(APPDIR);g" -e "s;@USRDIR@;$(USRDIR);g" \
		-e "s;@VARDIR@;$(VARDIR);g" -e "s;@ETCDIR@;$(ETCDIR);g" < $< | \
	$(GPATCH) -d $(@D) $(GPATCH_FLAGS)
	$(TOUCH) $@

# template for download rules. add new rules with $(call download-rule, suffix)
define download-rule
ifdef COMPONENT_ARCHIVE$(1)
ARCHIVES+= $$(COMPONENT_ARCHIVE$(1))
CLOBBER_PATHS+= $$(COMPONENT_ARCHIVE$(1))
$$(WS_ARCHIVES)/$$(COMPONENT_ARCHIVE$(1)):	Makefile
	($$(MKDIR) $$(COMPONENT_DIR)/source ; \
	cd $$(COMPONENT_DIR)/source ; \
	$$(FETCH) --file $$@ \
		$$(COMPONENT_ARCHIVE_URL$(1):%=--url %) \
		$$(COMPONENT_ARCHIVE_HASH$(1):%=--hash %) ; \
	$$(TOUCH) $$@)
endif
endef

# Generate the download rules from the above template
NUM_ARCHIVES=	1 2 3 4 5 6 7
$(eval $(call download-rule,))
$(foreach suffix,$(NUM_ARCHIVES),$(eval $(call download-rule,_$(suffix))))

$(SOURCE_DIR)/.unpacked:	download Makefile $(PATCHES)
	$(RM) -r $(SOURCE_DIR)
	($(MKDIR) $(COMPONENT_DIR)/source ; \
	cd $(COMPONENT_DIR)/source ; \
	$(UNPACK) $(UNPACK_ARGS) $(WS_ARCHIVES)/$(COMPONENT_ARCHIVE))
	$(COMPONENT_POST_UNPACK_ACTION)
	@$(ECHO) -n "SHA256 Digest: "
	@digest -a sha256 $(WS_ARCHIVES)/$(COMPONENT_ARCHIVE)
	$(COMPONENT_POST_UNPACK_ACTION)
	$(TOUCH) $@

$(SOURCE_DIR)/.patched:	$(SOURCE_DIR)/.unpacked $(STAMPS)
	$(COMPONENT_EXTRA_PATCH_ACTION)
	$(TOUCH) $@

$(SOURCE_DIR)/.prep:	$(SOURCE_DIR)/.patched
	$(COMPONENT_PREP_ACTION)
	$(TOUCH) $@

prep::	$(SOURCE_DIR)/.prep

download::	$(ARCHIVES:%=$(WS_ARCHIVES)/%)

clean::
	$(RM) -r $(CLEAN_PATHS)

clobber::	clean
	$(RM) -r $(CLOBBER_PATHS)
