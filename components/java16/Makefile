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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		jdk
COMPONENT_VERSION=	26
COMPONENT_SRC=		jdk1.6.0_$(COMPONENT_VERSION)

COMPONENT_ARCHIVE_1.i386=	jdk-6u$(COMPONENT_VERSION)-dlj-solaris-i586.sh
COMPONENT_ARCHIVE_HASH_1.i386=	sha256:c7eb01d698dcf25c8928c25b98766a26277cba95147622a38196a65a24a5fdc0
#COMPONENT_ARCHIVE_URL_1.i386=	http://download.java.net/dlj/binaries/$(COMPONENT_ARCHIVE_1.i386)
COMPONENT_ARCHIVE_URL_1.i386=	$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE_1.i386)
COMPONENT_ARCHIVE_2.i386=	jdk-6u$(COMPONENT_VERSION)-dlj-solaris-amd64.sh
COMPONENT_ARCHIVE_HASH_2.i386=	sha256:b5869051537efdc3c1473ca83fa06b867328e06e0a3d74b24618f7c6093ef508
#COMPONENT_ARCHIVE_URL_2.i386=	http://download.java.net/dlj/binaries/$(COMPONENT_ARCHIVE_2.i386)
COMPONENT_ARCHIVE_URL_2.i386=	$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE_2.i386)

COMPONENT_ARCHIVE_1.sparc=	jdk-6u$(COMPONENT_VERSION)-dlj-solaris-sparc.sh
#COMPONENT_ARCHIVE_HASH_1.sparc=	sha1:
COMPONENT_ARCHIVE_URL_1.sparc=	http://download.java.net/dlj/binaries/$(COMPONENT_ARCHIVE_1.sparc)
COMPONENT_ARCHIVE_2.sparc=	jdk-6u$(COMPONENT_VERSION)-dlj-solaris-sparcv9.sh
#COMPONENT_ARCHIVE_HASH_2.sparc=	sha1:
COMPONENT_ARCHIVE_URL_2.sparc=	http://download.java.net/dlj/binaries/$(COMPONENT_ARCHIVE_2.sparc)

COMPONENT_ARCHIVE_1=		$(COMPONENT_ARCHIVE_1.$(MACH))
COMPONENT_ARCHIVE_HASH_1=	$(COMPONENT_ARCHIVE_HASH_1.$(MACH))
COMPONENT_ARCHIVE_URL_1=	$(COMPONENT_ARCHIVE_URL_1.$(MACH))

COMPONENT_ARCHIVE_2=		$(COMPONENT_ARCHIVE_2.$(MACH))
COMPONENT_ARCHIVE_HASH_2=	$(COMPONENT_ARCHIVE_HASH_2.$(MACH))
COMPONENT_ARCHIVE_URL_2=	$(COMPONENT_ARCHIVE_URL_2.$(MACH))

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk
include ../../make-rules/no-pkgdepend.mk

CLEAN_PATHS += $(BUILD_DIR)

#PKGMANGLE = true
#PKGLINT = true
#PKGDEPEND = true

#UNPACK200   = $(SOURCE_DIR)/bin/unpack200

#PACK_FILES  = jre/lib/rt.pack jre/lib/jsse.pack jre/lib/charsets.pack
#PACK_FILES += lib/tools.pack jre/lib/ext/localedata.pack jre/lib/plugin.pack
#PACK_FILES += jre/lib/javaws.pack jre/lib/deploy.pack

$(SOURCE_DIR)/.unpacked: download Makefile $(PATCHES)
	($(RM) -r $(SOURCE_DIR) ; $(MKDIR) $(COMPONENT_DIR)/source ; \
	cd $(COMPONENT_DIR)/source ; \
	$(CHMOD) +x $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2) ; \
	$(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1)  --accept-license --unpack ; \
	rm -f $(SOURCE_DIR)/jre/LICENSE $(SOURCE_DIR)/jre/README \
		$(SOURCE_DIR)/LICENSE $(SOURCE_DIR)/README.html ; \
	$(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2) --accept-license --unpack ; \
	$(TOUCH) $@)
#	for i in $(PACK_FILES); do \
#		$(UNPACK200) $(SOURCE_DIR)/$$i $(SOURCE_DIR)/`echo $$i|sed s/\.pack/\.jar/` && \
#		rm $(SOURCE_DIR)/$$i; \
#	done

build: prep

install: build
	[ -d $(PROTO_DIR)$(ECPREFIX)/jdk ] || mkdir -p $(PROTO_DIR)$(ECPREFIX)/jdk
	[ -h $(PROTO_DIR)$(ECPREFIX)/jdk/jdk1.6.0 ] || ln -s $(SOURCE_DIR) $(PROTO_DIR)$(ECPREFIX)/jdk/jdk1.6.0
