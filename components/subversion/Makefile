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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2015 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		subversion
COMPONENT_VERSION=	1.8.13
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PYMODS = client core delta fs ra repos wc

PLMODS= Fs Core Wc Client Repos Ra Delta

JAVA_ROOT = $(JAVA_HOME)

CPPFLAGS += -D__EXTENSIONS__
CXXFLAGS += $(CC_PIC)
CXXFLAGS += -D_REENTRANT -DNDEBUG -DSOLARIS
CFLAGS += $(CPP_LARGEFILES)

LDFLAGS += $(CC_BITS)

COMPONENT_PREP_ACTION = \
	( cd $(@D) \
	&& $(ENV) $(CONFIGURE_ENV) ./autogen.sh )

COMPONENT_PRE_CONFIGURE_ACTION = \
	$(CLONEY) $(SOURCE_DIR) $(@D)

COMPONENT_BUILD_TARGETS = all swig-py javahl
COMPONENT_INSTALL_TARGETS = install install-lib \
			    install-swig-py \
			    install-javahl install-javahl-lib \
			    install-mods-shared \
			    install-bin install-docs

COMPONENT_INSTALL_TARGETS += install-swig-pl
#COMPONENT_INSTALL_TARGETS += $(COMPONENT_INSTALL_TARGETS.$(BITS))

PERL = $(PERL.$(BITS))

PYTHONPATHSVN.32 = $(USRDIR)/lib/python2.7/vendor-packages/svn
PYTHONPATHSVN.64 = $(USRDIR)/lib/python2.7/vendor-packages/svn/64
PYTHONPATHLIBSVN.32 = $(USRDIR)/lib/python2.7/vendor-packages/libsvn
PYTHONPATHLIBSVN.64 = $(USRDIR)/lib/python2.7/vendor-packages/libsvn/64

CONFIGURE_ENV += PYTHON="$(PYTHON.$(BITS))"
CONFIGURE_ENV += PYMODS="$(PYMODS)"
CONFIGURE_ENV += PYTHONPATH="$(PYTHON_VENDOR_PACKAGES)"
CONFIGURE_ENV += JAVA_ROOT="$(JAVA_ROOT)"
CONFIGURE_ENV += PLMODS="$(PLMODS)"
CONFIGURE_ENV += PERL="$(PERL)"

CONFIGURE_OPTIONS += --mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS += --localstatedir=$(CONFIGURE_LOCALSTATEDIR)
CONFIGURE_OPTIONS += --enable-shared 
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --disable-experimental-libtool
CONFIGURE_OPTIONS.32 += --with-apxs="$(USRDIR)/bin/apxs"
CONFIGURE_OPTIONS.64 += --with-apxs="$(USRDIR)/bin/$(MACH64)/apxs"
CONFIGURE_OPTIONS.32 += --with-apache-libexecdir=$(USRDIR)/lib/apache/2.2/modules
CONFIGURE_OPTIONS.64 += --with-apache-libexecdir=$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
#CONFIGURE_OPTIONS += --with-ssl
CONFIGURE_OPTIONS += --with-zlib=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS += --with-jdk=$(JAVA_ROOT)
CONFIGURE_OPTIONS += --enable-nls
CONFIGURE_OPTIONS += --disable-mod-activation
CONFIGURE_OPTIONS += --enable-javahl
CONFIGURE_OPTIONS += --with-swig=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS += --with-berkeley-db=:::db
CONFIGURE_OPTIONS.32 += --with-apr="$(USRDIR)/bin/apr-1-config"
CONFIGURE_OPTIONS.64 += --with-apr="$(USRDIR)/bin/$(MACH64)/apr-1-config"
CONFIGURE_OPTIONS.32 += --with-apr-util="$(USRDIR)/bin/apu-1-config"
CONFIGURE_OPTIONS.64 += --with-apr-util="$(USRDIR)/bin/$(MACH64)/apu-1-config"
CONFIGURE_OPTIONS += --without-gnome-keyring

#CONFIGURE_OPTIONS.32+=	--with-swig=$(USRDIR)/bin/swig
#CONFIGURE_OPTIONS.64+=	--with-swig=$(USRDIR)/bin/$(MACH64)/swig

COMPONENT_BUILD_ARGS += \
	swig_pydir="$(PYTHONPATHLIBSVN.$(BITS))" swig_pydir_extra="$(PYTHONPATHSVN.$(BITS))"

COMPONENT_INSTALL_ARGS += \
	swig_pydir="$(PYTHONPATHLIBSVN.$(BITS))" swig_pydir_extra="$(PYTHONPATHSVN.$(BITS))"

#COMPONENT_INSTALL_TARGETS.32+=	install-swig-py install-swig-rb
#COMPONENT_INSTALL_TARGETS.64+=	install-swig-py
#COMPONENT_INSTALL_TARGETS+=	$(COMPONENT_INSTALL_TARGETS.$(BITS))

#COMPONENT_PRE_CONFIGURE_ACTION+=	($(CP) -R $(SOURCE_DIR)/* $(@D)/)
#CONFIGURE_SCRIPT=	$(@D)/configure

COMPONENT_PRE_BUILD_ACTION += \
	( cd $(COMPONENT_BUILD_ROOT) && \
	    $(GMAKE) -j1 autogen-swig )

COMPONENT_POST_BUILD_ACTION += \
	( cd $(COMPONENT_BUILD_ROOT) && \
	    $(GMAKE) -j1 swig-pl )

#COMPONENT_POST_BUILD_ACTION += $(COMPONENT_POST_BUILD_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
