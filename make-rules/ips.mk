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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

#
# Rules and Macros for generating an IPS package manifest and publishing an
# IPS package to a pkg depot.
#
# To use these rules, include ../make-rules/ips.mk in your Makefile
# and define an "install" target appropriate to building your component.
# Ex:
#
#	install:	$(BUILD_DIR)/build/$(MACH32)/.installed \
#	 		$(BUILD_DIR)/build/$(MACH64)/.installed
#
# This set of rules makes the "publish" target the default target for make(1)
#

# The package branch version scheme is:
#
#       release_major.release_minor.update.component_revision
#

#
# Release major number: 2014, 2015, etc.
#
RELEASE_MAJOR ?= 2014

#
# Release minor number: 0, 1, 2, etc.
#
RELEASE_MINOR ?= 0

#
# Release update number: 0, 1, 2, etc.
#
UPDATENUM ?= 0

#
# Component revision. Should be specified in the component's Makefile
#

COMPONENT_REVISION ?= 0

BRANCHID ?= $(RELEASE_MAJOR).$(RELEASE_MINOR).$(UPDATENUM).$(COMPONENT_REVISION)

BUILD_VERSION =                $(OS_VERSION)-$(BRANCHID)

PKGDEPEND =	pkgdepend
PKGFMT =	pkgfmt
PKGMOGRIFY =	pkgmogrify
PKGSEND =	pkgsend
PKGLINT =	pkglint
PKGMANGLE =	$(WS_TOOLS)/userland-mangler

# Package headers should all pretty much follow the same format
METADATA_TEMPLATE =		$(WS_TOP)/transforms/manifest-metadata-template
COPYRIGHT_TEMPLATE =		$(WS_TOP)/transforms/copyright-template

# order is important
GENERATE_TRANSFORMS +=		$(WS_TOP)/transforms/generate-cleanup

COMPARISON_TRANSFORMS +=	$(WS_TOP)/transforms/comparison-cleanup
COMPARISON_TRANSFORMS +=	$(PKGMOGRIFY_TRANSFORMS)

# order is important
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/variant-cleanup
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/defaults
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/actuators
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/devel
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/docs
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/locale
PUBLISH_TRANSFORMS +=	$(PKGMOGRIFY_TRANSFORMS)
PUBLISH_TRANSFORMS +=	$(WS_TOP)/transforms/publish-cleanup

PKGDEPEND_TRANSFORMS +=	$(WS_TOP)/transforms/drop-os-dependencies


ifeq   ($(strip $(COMPONENT_AUTOGEN_MANIFEST)),yes)
AUTOGEN_MANIFEST_TEMPLATE    =          $(METADATA_TEMPLATE)
AUTOGEN_MANIFEST_TRANSFORMS +=		$(WS_TOP)/transforms/generate-cleanup
else
AUTOGEN_MANIFEST_TEMPLATE    =          /dev/null
AUTOGEN_MANIFEST_TRANSFORMS +=		$(WS_TOP)/transforms/drop-all
endif

PKG_MACROS +=		MACH=$(MACH)
PKG_MACROS +=		MACH32=$(MACH32)
PKG_MACROS +=		MACH64=$(MACH64)
PKG_MACROS +=		MACH64_GNU=$(MACH64_GNU)
PKG_MACROS+=		GNU_ARCH=$(GNU_ARCH)
PKG_MACROS+=		GNU_ARCH_32=$(GNU_ARCH_32)
PKG_MACROS+=		GNU_ARCH_64=$(GNU_ARCH_64)
PKG_MACROS +=		PUBLISHER=$(PUBLISHER)
PKG_MACROS +=		BUILD_VERSION=$(BUILD_VERSION)
PKG_MACROS +=		SOLARIS_VERSION=$(SOLARIS_VERSION)
PKG_MACROS +=		OS_VERSION=$(OS_VERSION)
PKG_MACROS +=		HUMAN_VERSION=$(HUMAN_VERSION)
PKG_MACROS +=		IPS_COMPONENT_VERSION=$(IPS_COMPONENT_VERSION)
PKG_MACROS +=		COMPONENT_NAME=$(COMPONENT_NAME)
PKG_MACROS +=		COMPONENT_FMRI=$(COMPONENT_FMRI)
PKG_MACROS +=		COMPONENT_VERSION=$(COMPONENT_VERSION)
PKG_MACROS +=		COMPONENT_PROJECT_URL=$(COMPONENT_PROJECT_URL)
PKG_MACROS +=		COMPONENT_ARCHIVE_URL=$(COMPONENT_ARCHIVE_URL)
PKG_MACROS +=		COMPONENT_LICENSE="$(COMPONENT_LICENSE)"
PKG_MACROS +=		COMPONENT_LICENSE_FILE=$(COMPONENT_LICENSE_FILE)
PKG_MACROS +=		ECPREFIX=$(shell echo $(ECPREFIX) | sed 's/^\///g')
PKG_MACROS +=		SYSCONFDIR=$(shell echo $(CONFIGURE_SYSCONFDIR) | sed 's/^\///g')
PKG_MACROS +=		LOCALSTATEDIR=$(shell echo $(CONFIGURE_LOCALSTATEDIR) | sed 's/^\///g')
PKG_MACROS +=		PLAT=$(PLAT)
PKG_MACROS +=		COMPONENT_HG_URL=$(COMPONENT_HG_URL)
PKG_MACROS +=		COMPONENT_HG_REV=$(COMPONENT_HG_REV)
PKG_MACROS +=		USRDIR=$(shell echo $(USRDIR) | sed 's/^\///g')

PKG_OPTIONS +=		$(PKG_MACROS:%=-D %) -D COMPONENT_SUMMARY="$(COMPONENT_SUMMARY)" \
				-D COMPONENT_LICENSE="$(COMPONENT_LICENSE)"  -I$(WS_TOP)/transforms

PKG_PROTO_DIRS += $(PROTO_DIR) $(@D) $(COMPONENT_DIR)
ifdef COMPONENT_SRC
	PKG_PROTO_DIRS += source/$(COMPONENT_SRC)
endif

MANIFEST_BASE =		$(BUILD_DIR)/manifest-$(MACH)

CANONICAL_MANIFESTS ?=	$(wildcard *.p5m)
GENERATED =		$(MANIFEST_BASE)-generated
COMBINED =		$(MANIFEST_BASE)-combined
MANIFESTS =		$(CANONICAL_MANIFESTS:%=$(MANIFEST_BASE)-%)


DEPENDED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend)
FIXED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend.fixed)
RESOLVED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend.fixed.res)
PUBLISHED=$(RESOLVED:%.depend.fixed.res=%.published)

COMPONENT_LICENSE_FILE ?= COPYING
COPYRIGHT_FILE ?=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).copyright
IPS_COMPONENT_VERSION ?=	$(COMPONENT_VERSION)

.DEFAULT:		publish

.SECONDARY:

# allow publishing to be overridden, such as when
# a package is for one architecture only.
PUBLISH_STAMP ?= $(BUILD_DIR)/.published-$(MACH)

publish:		build install $(PUBLISH_STAMP)

sample-manifest:	$(GENERATED).p5m

$(GENERATED).p5m:	install
	$(PKGSEND) generate $(PKG_HARDLINKS:%=--target %) $(PROTO_DIR) | \
	$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 $(GENERATE_TRANSFORMS) | \
		sed -e '/^$$/d' -e '/^#.*$$/d' | $(PKGFMT) | \
		cat $(METADATA_TEMPLATE) - >$@

# copy the canonical manifest(s) to the build tree
$(MANIFEST_BASE)-%.generate:	%.p5m canonical-manifests
	cat $(METADATA_TEMPLATE) $< >$@

# mogrify the manifest
$(MANIFEST_BASE)-%.generated:	%.p5m canonical-manifests
	(cat $(AUTOGEN_MANIFEST_TEMPLATE); \
		$(PKGSEND) generate $(PKG_HARDLINKS:%=--target %) $(PROTO_DIR)) | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 $(AUTOGEN_MANIFEST_TRANSFORMS) | \
		sed -e '/^$$/d' -e '/^#.*$$/d' >$@;
	cat $< >>$@

$(MANIFEST_BASE)-%.mogrified:	$(MANIFEST_BASE)-%.generated
	$(PKGMOGRIFY) $(PKG_OPTIONS) $< \
		$(PUBLISH_TRANSFORMS) | \
		sed -e '/^$$/d' -e '/^#.*$$/d' | uniq >$@

# mangle the file contents
$(BUILD_DIR):
	$(MKDIR) $@

# generate dependencies
PKGDEPEND_GENERATE_OPTIONS = -m $(PKG_PROTO_DIRS:%=-d %)
$(MANIFEST_BASE)-%.depend:	$(MANIFEST_BASE)-%.mogrified
	$(PKGDEPEND) generate $(PKGDEPEND_GENERATE_OPTIONS) $< >$@

# Drop os dependencies from the dependency file
$(MANIFEST_BASE)-%.depend.fixed:	$(MANIFEST_BASE)-%.depend
	$(PKGMOGRIFY) $(PKG_OPTIONS) $< $(PKGDEPEND_TRANSFORMS) | \
	sed -e '/^$$/d' -e '/^#.*$$/d' | uniq >$@

# resolve the dependencies all at once
$(BUILD_DIR)/.resolved-$(MACH):	$(FIXED)
	$(PKGDEPEND) resolve -m $(FIXED)
	$(TOUCH) $@

# lint the manifests all at once
$(BUILD_DIR)/.linted-$(MACH):	$(BUILD_DIR)/.resolved-$(MACH)
	@echo "VALIDATING MANIFEST CONTENT: $(RESOLVED)"
	$(ENV) PYTHONPATH=$(WS_TOOLS)/python PROTO_PATH="$(PKG_PROTO_DIRS)"\
		$(PKGLINT) $(CANONICAL_REPO:%=-c $(WS_LINT_CACHE)) \
			-f $(WS_TOOLS)/pkglintrc $(RESOLVED)
	$(TOUCH) $@

# published
PKGSEND_PUBLISH_OPTIONS = -s $(PKG_REPO) publish --fmri-in-manifest
PKGSEND_PUBLISH_OPTIONS += $(PKG_PROTO_DIRS:%=-d %)
PKGSEND_PUBLISH_OPTIONS += -T \*.py
$(MANIFEST_BASE)-%.published:	$(MANIFEST_BASE)-%.depend.fixed.res $(BUILD_DIR)/.linted-$(MACH)
	$(PKGSEND) $(PKGSEND_PUBLISH_OPTIONS) $<
	$(PKGFMT) <$< >$@

$(BUILD_DIR)/.published-$(MACH):	$(PUBLISHED)
	$(TOUCH) $@

print-package-names:	canonical-manifests
	@cat $(CANONICAL_MANIFESTS) $(WS_TOP)/transforms/print-pkgs | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 | \
 		sed -e '/^$$/d' -e '/^#.*$$/d' | sort -u

print-package-paths:	canonical-manifests
	@cat $(CANONICAL_MANIFESTS) $(WS_TOP)/transforms/print-paths | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 | \
 		sed -e '/^$$/d' -e '/^#.*$$/d' | sort -u

install-packages:	publish
	@if [ $(IS_GLOBAL_ZONE) = 0 -o x$(ROOT) != x ]; then \
	    cat $(CANONICAL_MANIFESTS) $(WS_TOP)/transforms/print-paths | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 | \
 		sed -e '/^$$/d' -e '/^#.*$$/d' -e 's;/;;' | sort -u | \
		(cd $(PROTO_DIR) ; pfexec /bin/cpio -dump $(ROOT)) ; \
	else ; \
	    echo "unsafe to install package(s) automatically" ; \
        fi

$(RESOLVED):	install

canonical-manifests:	$(CANONICAL_MANIFESTS) Makefile $(PATCHES)
ifeq	($(strip $(CANONICAL_MANIFESTS)),)
	# If there were no canonical manifests in the workspace, nothing will
	# be published and we should fail.  A sample manifest can be generated
	# with
	#   $ gmake sample-manifest
	# Once created, it will need to be reviewed, edited, and added to the
	# workspace.
	$(error Missing canonical manifest(s))
endif

# This converts required paths to containing package names for be able to
# properly setup the build environment for a component.
required-pkgs.mk:	Makefile
	@echo "generating $@ from Makefile REQUIRED_* data"
	@pkg search -H -l '<$(DEPENDS:%=% OR) /bin/true>' \
		| sed -e 's/pkg:\/\(.*\)@.*/REQUIRED_PKGS += \1/g' >$@

pre-prep:	required-pkgs.mk


CLEAN_PATHS +=	required-pkgs.mk
