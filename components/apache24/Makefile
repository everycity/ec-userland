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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		httpd
COMPONENT_FMRI=		web/server/apache-24/httpd
COMPONENT_VERSION=	2.4.20
COMPONENT_LICENSE=	Apachev2.0
COMPONENT_PROJECT_URL=	"http://httpd.apache.org/"
COMPONENT_SUMMARY=	Apache HTTP Server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:0e76a375ed3dbac636f50ac39de966ece443751fe4d62392f9a360a19d94d0da
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	rsync -aH --delete $(SOURCE_DIR)/ $(@D)/
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		./configure $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

CPPFLAGS.32=	-I$(USRDIR)/include/apr-1.0
CPPFLAGS.64=	-I$(USRDIR)/include/apr-1.0/$(MACH64)
CPPFLAGS=	$(CPPFLAGS.$(BITS))

CONFIGURE_ENV += CPPFLAGS="$(CPPFLAGS)"

AP_PREFIX=$(USRDIR)/lib/apache/2.4
AP_SHAREDIR=$(USRDIR)/share/apache/2.4
AP_SYSCONFDIR=$(CONFIGURE_SYSCONFDIR)/apache/2.4
AP_DATADIR=$(CONFIGURE_LOCALSTATEDIR)/apache/2.4

# We patch sources differently depending on the flavour being built
COMPONENT_PRE_CONFIGURE_ACTION += $(ENV) BITS=$(BITS) MACH=$(MACH$(BITS)) \
	COMPONENT_DIR=$(COMPONENT_DIR) MPM=$(MPM) \
	$(COMPONENT_DIR)/patch-source.sh $(@D) $(ZTYPE)

# -L/ec/lib gets added to EXTRA_LDFLAGS for some reason, removing it as otherwise 64-bit build fails
COMPONENT_POST_CONFIGURE_ACTION += (cd $(@D); $(GSED) -i s/\^EXTRA_LDFLAGS.*// build/config_vars.mk)

CONFIGURE_OPTIONS      = CC="$(CC)"
CONFIGURE_OPTIONS     += CXX="$(CCC)"

CONFIGURE_OPTIONS     += --enable-layout=EveryCity

CONFIGURE_OPTIONS.32   = --with-pcre=$(USRDIR)/bin/pcre-config
CONFIGURE_OPTIONS.64   = --with-pcre=$(USRDIR)/bin/$(MACH64)/pcre-config
CONFIGURE_OPTIONS.32  += --with-apr=$(USRDIR)/bin/apr-1-config
CONFIGURE_OPTIONS.64  += --with-apr=$(USRDIR)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32  += --with-apr-util=$(USRDIR)/bin/apu-1-config
CONFIGURE_OPTIONS.64  += --with-apr-util=$(USRDIR)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS.32  += --with-z=$(USRDIR)/lib
CONFIGURE_OPTIONS.64  += --with-z=$(USRDIR)/lib/$(MACH64)
CONFIGURE_OPTIONS.32  += --with-libxml2=$(USRDIR)/lib
CONFIGURE_OPTIONS.64  += --with-libxml2=$(USRDIR)/lib/$(MACH64)

CONFIGURE_OPTIONS  +=	--enable-mods-shared=all
CONFIGURE_OPTIONS  +=	--enable-so
CONFIGURE_OPTIONS  +=	--enable-suexec
CONFIGURE_OPTIONS  +=	--with-suexec-caller=webservd
CONFIGURE_OPTIONS  +=	--enable-proxy
CONFIGURE_OPTIONS  +=	--enable-proxy-connect
CONFIGURE_OPTIONS  +=	--enable-proxy-fcgi
CONFIGURE_OPTIONS  +=	--enable-proxy-ftp
CONFIGURE_OPTIONS  +=	--enable-proxy-http
CONFIGURE_OPTIONS  +=	--enable-proxy-ajp
CONFIGURE_OPTIONS  +=	--enable-proxy-wstunnel
CONFIGURE_OPTIONS  +=	--enable-proxy-balancer
CONFIGURE_OPTIONS  +=	--enable-cache
CONFIGURE_OPTIONS  +=	--enable-file-cache
CONFIGURE_OPTIONS  +=	--enable-disk-cache
CONFIGURE_OPTIONS  +=	--enable-mem-cache
CONFIGURE_OPTIONS  +=	--enable-deflate
CONFIGURE_OPTIONS  +=	--enable-cgid
CONFIGURE_OPTIONS  +=	--enable-cgi
CONFIGURE_OPTIONS  +=	--enable-authnz-ldap
CONFIGURE_OPTIONS  +=	--enable-ldap
CONFIGURE_OPTIONS  +=	--enable-ssl
CONFIGURE_OPTIONS  +=	--enable-exception-hook
CONFIGURE_OPTIONS  +=	--enable-unixd
CONFIGURE_OPTIONS  +=	--enable-privileges
CONFIGURE_OPTIONS  +=	--enable-dav
CONFIGURE_OPTIONS  +=	--enable-rewrite
CONFIGURE_OPTIONS  +=	--with-mpm=$(MPM)

CONFIGURE_OPTIONS  +=	$(CONFIGURE_OPTIONS.$(BITS))


$(BUILD_DIR)/$(MACH32).worker/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).worker/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).worker/.configured:     MPM=worker
$(BUILD_DIR)/$(MACH64).worker/.configured:     MPM=worker
$(BUILD_DIR)/$(MACH32).worker/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).worker/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).worker/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).worker/.installed:      BITS=64

$(BUILD_DIR)/$(MACH32).prefork/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).prefork/.configured:     MPM=prefork
$(BUILD_DIR)/$(MACH64).prefork/.configured:     MPM=prefork
$(BUILD_DIR)/$(MACH32).prefork/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).prefork/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.installed:      BITS=64


build:		$(BUILD_DIR)/$(MACH32).prefork/.built \
		$(BUILD_DIR)/$(MACH64).prefork/.built \
		$(BUILD_DIR)/$(MACH32).worker/.built \
		$(BUILD_DIR)/$(MACH64).worker/.built

$(BUILD_DIR)/.installed:	\
		$(BUILD_DIR)/$(MACH32).prefork/.installed \
		$(BUILD_DIR)/$(MACH64).prefork/.installed \
		$(BUILD_DIR)/$(MACH32).worker/.built \
		$(BUILD_DIR)/$(MACH64).worker/.built
	(cd $(BUILD_DIR)/$(MACH32).worker; \
		$(GMAKE) install-include DESTDIR=$(PROTO_DIR))
	(cd $(BUILD_DIR)/$(MACH32).worker; \
		$(GMAKE) install-build DESTDIR=$(PROTO_DIR))
	(cd $(BUILD_DIR)/$(MACH64).worker; \
		$(GMAKE) install-include DESTDIR=$(PROTO_DIR))
	(cd $(BUILD_DIR)/$(MACH64).worker; \
		$(GMAKE) install-build DESTDIR=$(PROTO_DIR))
	$(INSTALL) -d $(PROTO_DIR)/$(AP_PREFIX)/bin
	$(INSTALL) -d $(PROTO_DIR)/$(AP_PREFIX)/bin/$(MACH64)
	$(INSTALL) -m 555 $(BUILD_DIR)/$(MACH32).worker/support/apxs \
		$(PROTO_DIR)/$(AP_PREFIX)/bin/apxs.worker
	$(INSTALL) -m 555 $(BUILD_DIR)/$(MACH64).worker/support/apxs \
		$(PROTO_DIR)/$(AP_PREFIX)/bin/$(MACH64)/apxs.worker
	$(INSTALL) -m 555 $(BUILD_DIR)/$(MACH32).worker/httpd \
		$(PROTO_DIR)/$(AP_PREFIX)/bin/httpd.worker
	$(INSTALL) -m 555 $(BUILD_DIR)/$(MACH64).worker/httpd \
		$(PROTO_DIR)/$(AP_PREFIX)/bin/$(MACH64)/httpd.worker
	$(PERL) -pi -e 's/\/build\/([a-zA-Z0-9_-]*\.mk)/\/build\/$(MACH64)\/\1/g' \
		$(PROTO_DIR)/$(AP_SHAREDIR)/build/$(MACH64)/*.mk
	(strip \
	    $(PROTO_DIR)/$(AP_PREFIX)/bin/* \
	    $(PROTO_DIR)/$(AP_PREFIX)/bin/$(MACH64)/* \
	    $(PROTO_DIR)/$(AP_PREFIX)/bin/modules/* \
	    $(PROTO_DIR)/$(AP_PREFIX)/bin/modules/$(MACH64)/* \
	    >/dev/null 2>&1; true )
	$(MKDIR) -p $(PROTO_DIR)/$(AP_SYSCONFDIR)/
	rsync -a --delete $(COMPONENT_DIR)/conf/ $(PROTO_DIR)/$(AP_SYSCONFDIR)/
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
