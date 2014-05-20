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
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
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

BUILD_VERSION=	$(OS_VERSION)-0.162

PKGDEPEND=	pkgdepend
PKGFMT=		pkgfmt -u
PKGMOGRIFY=	pkgmogrify
PKGSEND=	pkgsend
PKGLINT=	pkglint
PKGMANGLE=	$(WS_TOOLS)/userland-mangler
PKG_REPO=	file:$(WS_REPO)

# Package headers should all pretty much follow the same format
METADATA_TEMPLATE=	$(WS_TRANSFORMS)/manifest-metadata-template
COPYRIGHT_TEMPLATE=	$(WS_TRANSFORMS)/copyright-template

# order is important
GENERATE_TRANSFORMS+=	$(WS_TRANSFORMS)/generate-cleanup

COMPARISON_TRANSFORMS+=	$(WS_TRANSFORMS)/comparison-cleanup
COMPARISON_TRANSFORMS+=	$(PKGMOGRIFY_TRANSFORMS)

# order is important
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/variant-cleanup
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/defaults
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/actuators
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/devel
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/docs
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/locale
PUBLISH_TRANSFORMS+=	$(PKGMOGRIFY_TRANSFORMS)
PUBLISH_TRANSFORMS+=	$(WS_TRANSFORMS)/publish-cleanup

PKGDEPEND_TRANSFORMS+=	$(WS_TRANSFORMS)/drop-os-dependencies

PKG_MACROS+=		PLAT=$(PLAT)
PKG_MACROS+=		MACH=$(MACH)
PKG_MACROS+=		MACH32=$(MACH32)
PKG_MACROS+=		MACH64=$(MACH64)
PKG_MACROS+=		MACH64_GNU=$(MACH64_GNU)
PKG_MACROS+=		GNU_ARCH=$(GNU_ARCH)
PKG_MACROS+=		GNU_ARCH_64=$(GNU_ARCH_64)
PKG_MACROS+=		PUBLISHER=$(PUBLISHER)
PKG_MACROS+=		BUILD_VERSION=$(BUILD_VERSION)
PKG_MACROS+=		SOLARIS_VERSION=$(SOLARIS_VERSION)
PKG_MACROS+=		OS_VERSION=$(OS_VERSION)
PKG_MACROS+=		IPS_COMPONENT_VERSION=$(IPS_COMPONENT_VERSION)
PKG_MACROS+=		COMPONENT_NAME=$(COMPONENT_NAME)
PKG_MACROS+=		COMPONENT_FMRI=$(COMPONENT_FMRI)
PKG_MACROS+=		COMPONENT_VERSION=$(COMPONENT_VERSION)
PKG_MACROS+=		COMPONENT_MJR_VERSION=$(COMPONENT_MJR_VERSION)
PKG_MACROS+=		COMPONENT_MNR_VERSION=$(COMPONENT_MNR_VERSION)
PKG_MACROS+=		COMPONENT_PROJECT_URL=$(COMPONENT_PROJECT_URL)
PKG_MACROS+=		COMPONENT_ARCHIVE_URL=$(COMPONENT_ARCHIVE_URL)
PKG_MACROS+=		COMPONENT_HG_URL=$(COMPONENT_HG_URL)
PKG_MACROS+=		COMPONENT_HG_REV=$(COMPONENT_HG_REV)
PKG_MACROS+=		ECPREFIX=$(shell echo $(ECPREFIX) | sed 's;^/;;')
PKG_MACROS+=		SYSCONFDIR=$(shell echo $(CONFIGURE_SYSCONFDIR) | sed 's;^/;;')
PKG_MACROS+=		LOCALSTATEDIR=$(shell echo $(CONFIGURE_LOCALSTATEDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_PREFIX=$(shell echo $(APPLICATION_PREFIX) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_ETCDIR=$(shell echo $(APPLICATION_ETCDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_VARDIR=$(shell echo $(APPLICATION_VARDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_BINDIR.32=$(shell echo $(APPLICATION_BINDIR.32) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_BINDIR.64=$(shell echo $(APPLICATION_BINDIR.64) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_LIBDIR.32=$(shell echo $(APPLICATION_LIBDIR.32) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_LIBDIR.64=$(shell echo $(APPLICATION_LIBDIR.64) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_SHAREDIR=$(shell echo $(APPLICATION_SHAREDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_INCDIR=$(shell echo $(APPLICATION_INCDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_LOCALEDIR=$(shell echo $(APPLICATION_LOCALEDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_MANDIR=$(shell echo $(APPLICATION_MANDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_DOCDIR=$(shell echo $(APPLICATION_DOCDIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_INFODIR=$(shell echo $(APPLICATION_INFODIR) | sed 's;^/;;')
PKG_MACROS+=		APPLICATION_SHARELIBDIR=$(shell echo $(APPLICATION_SHARELIBDIR) | sed 's;^/;;')
PKG_MACROS+=		USRDIR=$(shell echo $(USRDIR) | sed 's;^/;;')
PKG_MACROS+=		APPDIR=$(shell echo $(USRDIR) | sed 's;^/;;')
PKG_MACROS+=		ETCDIR=$(shell echo $(ETCDIR) | sed 's;^/;;')
PKG_MACROS+=		VARDIR=$(shell echo $(VARDIR) | sed 's;^/;;')
PKG_MACROS+=		BINDIR.32=$(shell echo $(BINDIR.32) | sed 's;^/;;')
PKG_MACROS+=		BINDIR.64=$(shell echo $(BINDIR.64) | sed 's;^/;;')
PKG_MACROS+=		LIBDIR.32=$(shell echo $(LIBDIR.32) | sed 's;^/;;')
PKG_MACROS+=		LIBDIR.64=$(shell echo $(LIBDIR.64) | sed 's;^/;;')
PKG_MACROS+=		SHAREDIR=$(shell echo $(SHAREDIR) | sed 's;^/;;')
PKG_MACROS+=		INCDIR=$(shell echo $(INCDIR) | sed 's;^/;;')
PKG_MACROS+=		LOCALEDIR=$(shell echo $(LOCALEDIR) | sed 's;^/;;')
PKG_MACROS+=		MANDIR=$(shell echo $(MANDIR) | sed 's;^/;;')
PKG_MACROS+=		DOCDIR=$(shell echo $(DOCDIR) | sed 's;^/;;')
PKG_MACROS+=		INFODIR=$(shell echo $(INFODIR) | sed 's;^/;;')
PKG_MACROS+=		SHARELIBDIR=$(shell echo $(SHARELIBDIR) | sed 's;^/;;')
PKG_MACROS+=		MANIFESTDIR=$(shell echo $(MANIFESTDIR) | sed 's;^/;;')
PKG_MACROS+=		METHODDIR=$(shell echo $(METHODDIR) | sed 's;^/;;')

PKG_OPTIONS+=		$(PKG_MACROS:%=-D %) -D COMPONENT_SUMMARY="$(COMPONENT_SUMMARY)" \
				-D COMPONENT_LICENSE="$(COMPONENT_LICENSE)"  -I$(WS_TRANSFORMS)

PKG_PROTO_DIRS+=	$(PROTO_DIR) $(@D) $(COMPONENT_DIR)
ifdef COMPONENT_SRC
	PKG_PROTO_DIRS += source/$(COMPONENT_SRC)
endif

MANIFEST_BASE=		$(BUILD_DIR)/manifest-$(MACH)

CANONICAL_MANIFESTS?=	$(wildcard *.p5m)
GENERATED=		$(MANIFEST_BASE)-generated
COMBINED=		$(MANIFEST_BASE)-combined
MANIFESTS=		$(CANONICAL_MANIFESTS:%=$(MANIFEST_BASE)-%)


DEPENDED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend)
FIXED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend.fixed)
RESOLVED=$(CANONICAL_MANIFESTS:%.p5m=$(MANIFEST_BASE)-%.depend.fixed.res)
PUBLISHED=$(RESOLVED:%.depend.fixed.res=%.published)

COPYRIGHT_FILE?=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).copyright
IPS_COMPONENT_VERSION?=	$(COMPONENT_VERSION)

.DEFAULT:		publish

.SECONDARY:

# allow publishing to be overridden, such as when
# a package is for one architecture only.
PUBLISH_STAMP?=		$(BUILD_DIR)/.published-$(MACH)

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
$(MANIFEST_BASE)-%.mogrified:	%.p5m canonical-manifests
	$(PKGMOGRIFY) $(PKG_OPTIONS) $< \
		$(PUBLISH_TRANSFORMS) | \
		sed -e '/^$$/d' -e '/^#.*$$/d' | uniq >$@

# mangle the file contents
$(BUILD_DIR):
	$(MKDIR) $@

# generate dependencies
PKGDEPEND_GENERATE_OPTIONS= -m $(PKG_PROTO_DIRS:%=-d %)
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
PKGSEND_PUBLISH_OPTIONS= -s $(PKG_REPO) publish --fmri-in-manifest
PKGSEND_PUBLISH_OPTIONS+= $(PKG_PROTO_DIRS:%=-d %)
PKGSEND_PUBLISH_OPTIONS+= -T \*.py
$(MANIFEST_BASE)-%.published:	$(MANIFEST_BASE)-%.depend.fixed.res $(BUILD_DIR)/.linted-$(MACH)
	$(PKGSEND) $(PKGSEND_PUBLISH_OPTIONS) $<
	$(PKGFMT) <$< >$@

$(BUILD_DIR)/.published-$(MACH):	$(PUBLISHED)
	$(TOUCH) $@

print-package-names:	canonical-manifests
	@cat $(CANONICAL_MANIFESTS) $(WS_TRANSFORMS)/print-pkgs | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 | \
 		sed -e '/^$$/d' -e '/^#.*$$/d' | sort -u

print-package-paths:	canonical-manifests
	@cat $(CANONICAL_MANIFESTS) $(WS_TRANSFORMS)/print-paths | \
		$(PKGMOGRIFY) $(PKG_OPTIONS) /dev/fd/0 | \
 		sed -e '/^$$/d' -e '/^#.*$$/d' | sort -u

install-packages:	publish
	@if [ $(IS_GLOBAL_ZONE) = 0 -o x$(ROOT) != x ]; then \
	    cat $(CANONICAL_MANIFESTS) $(WS_TRANSFORMS)/print-paths | \
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


CLEAN_PATHS+=	required-pkgs.mk

