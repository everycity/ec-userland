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

COMPONENT_NAME=		proftpd
COMPONENT_FMRI=		network/ftp/proftpd
COMPONENT_VERSION=	1.3.5b
IPS_COMPONENT_VERSION=	1.3.5.2
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.proftpd.org/"
COMPONENT_SUMMARY=	Highly configurable FTP server software
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d044b4fc8
COMPONENT_ARCHIVE_URL=	ftp://ftp.proftpd.org/distrib/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=-z nolazyload

COMPONENT_PRE_CONFIGURE_ACTION = \
    $(CLONEY) $(SOURCE_DIR) $(@D)
CONFIGURE_SCRIPT = $(@D)/configure

# can't build it as a shared module: mod_auth, mod_auth_unix, mod_cap, mod_core, mod_ctrls, mod_dso, mod_log, mod_ls, mod_site, mod_xfer
# disabled: mod_sample, mod_wrap
DSOMODS1 = mod_auth_file:mod_auth_pam:mod_ban:mod_copy:mod_ctrls_admin:
DSOMODS2 = mod_deflate:mod_delay:mod_dynmasq:mod_exec:mod_facl:mod_facts:mod_ident:mod_ifsession:mod_ifversion:
DSOMODS3 = mod_lang:mod_ldap:mod_load:mod_memcache:mod_qos:mod_quotatab:mod_quotatab_file:mod_quotatab_ldap:
DSOMODS4 = mod_quotatab_radius:mod_quotatab_sql:mod_radius:mod_ratio:mod_readme:mod_rewrite:mod_sftp:mod_sftp_pam:
DSOMODS5 = mod_sftp_sql:mod_shaper:mod_site_misc:mod_sql:mod_sql_mysql:mod_sql_odbc:mod_sql_passwd:mod_sql_postgres:
DSOMODS6 = mod_sql_sqlite:mod_tls:mod_tls_memcache:mod_tls_shmcache:mod_unique_id:mod_wrap2:mod_wrap2_file:mod_wrap2_sql

CONFIGURE_OPTIONS +=	CFLAGS="$(CFLAGS) -I$(ECPREFIX)/include/odbc -I$(ECPREFIX)/lib/postgres/9.3/include"
CONFIGURE_OPTIONS +=	LDFLAGS="$(LDFLAGS) -L$(ECPREFIX)/lib/postgres/9.3/lib -R$(ECPREFIX)/lib/postgres/9.3/lib -R$(ECPREFIX)/lib/mysql/5.5/lib"
CONFIGURE_OPTIONS +=	CPPFLAGS="$(CPPFLAGS) -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_OPENSSL"
CONFIGURE_OPTIONS +=	install_user=$(LOGNAME)
CONFIGURE_OPTIONS +=	install_group=`groups | cut -f 1 -d ' '`
CONFIGURE_OPTIONS +=	--sysconfdir=$(ECPREFIX)/etc/proftpd
CONFIGURE_OPTIONS +=	--localstatedir=$(ECPREFIX)/var/run
CONFIGURE_OPTIONS +=	--libexecdir=$(ECPREFIX)/lib/proftpd
CONFIGURE_OPTIONS +=	--enable-sendfile
CONFIGURE_OPTIONS +=	--enable-facl
CONFIGURE_OPTIONS +=	--enable-dso
CONFIGURE_OPTIONS +=	--enable-autoshadow
CONFIGURE_OPTIONS +=	--enable-ctrls
CONFIGURE_OPTIONS +=	--with-modules=mod_readme
CONFIGURE_OPTIONS +=	--enable-ipv6
CONFIGURE_OPTIONS +=	--enable-nls
CONFIGURE_OPTIONS +=	--enable-openssl
CONFIGURE_OPTIONS +=	--enable-pcre
CONFIGURE_OPTIONS +=	--disable-static
CONFIGURE_OPTIONS +=	--enable-buffer-size=16384
CONFIGURE_OPTIONS +=	--with-shared=$(DSOMODS1)$(DSOMODS2)$(DSOMODS3)$(DSOMODS4)$(DSOMODS5)$(DSOMODS6)

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/svc/method
	$(MKDIR) $(PROTO_DIR)/var/svc/manifest/site
	$(CP) $(COMPONENT_DIR)/files/proftpd-startup.sh $(PROTO_DIR)$(ECPREFIX)/var/svc/method/proftpd
	$(CP) $(COMPONENT_DIR)/files/proftpd-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/proftpd.xml
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

