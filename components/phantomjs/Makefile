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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		phantomjs
COMPONENT_FMRI=         web/automation/phantomjs
COMPONENT_VERSION=	1.9.8
#COMPONENT_VERSION=      2.0
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://phantomjs.org/"
COMPONENT_SUMMARY=	PhantomJS is a headless WebKit scriptable with a JavaScript API.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-source.zip
COMPONENT_ARCHIVE_HASH=	sha256:37e53b2907bf37d2b6a43f08d38bb4a15596bba337822179e647efd60c2261bf
#COMPONENT_ARCHIVE_HASH=	sha256:49159fb9d43e76fb39873f354255253bd70eebf62aa669f7f52f08cfe710f98a
COMPONENT_ARCHIVE_URL=	https://bitbucket.org/ariya/$(COMPONENT_NAME)/downloads/$(COMPONENT_ARCHIVE)
#COMPONENT_ARCHIVE_URL=	https://github.com/ariya/phantomjs/archive/2.0.zip

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)
ECBINDIR_32=	$(ECPREFIX)/bin
ECBINDIR_64=	$(ECPREFIX)/bin/$(MACH64)
ECBINDIR=	$(ECBINDIR_$(BITS))

QT_ARCH_32=	solaris-g++
QT_ARCH_64=	solaris-g++-64
QT_ARCH=	$(QT_ARCH_$(BITS))

QT_ARGS=-platform $(QT_ARCH) -javascript-jit -webkit -system-sqlite
#QT_ARGS+=-debug -webkit-debug
QT_ARGS+=-iconv -I$(ECPREFIX)/include -no-rpath
QT_ARGS+=-system-zlib -system-libtiff -system-libpng -no-libmng -system-libjpeg -no-dbus -svg
QT_ARGS_32=-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
QT_ARGS_64=-L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)
QT_ARGS+=$(QT_ARGS_$(BITS))

COMPONENT_BUILD_ENV+=	CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)"

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) ./build.sh --confirm --qt-config "$(QT_ARGS)" )
	$(TOUCH) $@

build:		$(BUILD_32)
#build:		$(BUILD_64)
#build:		$(BUILD_32_and_64)

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(ECBINDIR)
	$(CP) $(@D)/bin/phantomjs $(PROTO_DIR)$(ECBINDIR)
	$(TOUCH) $@

install:	$(INSTALL_32)
#install:	$(INSTALL_64)
#install:	$(INSTALL_32_and_64)

