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

COMPONENT_NAME=		openssh
COMPONENT_FMRI=         security/openssh
COMPONENT_VERSION=	7.4p1
IPS_COMPONENT_VERSION=	7.4.1
COMPONENT_LICENSE=	OpenSSH
COMPONENT_PROJECT_URL=	http://www.openssh.com/
COMPONENT_SUMMARY=	OpenSSH Secure Shell
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1b1fc4a14e2024293181924ed24872e6f2e06293f3e8926a376b8aec481f19d1
COMPONENT_ARCHIVE_URL=	http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-z nolazyload

CONFIGURE_OPTIONS+=	--sysconfdir=$(ECPREFIX)/etc/ssh
CONFIGURE_OPTIONS+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/bin

CONFIGURE_OPTIONS+=	--with-ssl-dir=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-default-path=$(ECPREFIX)/bin:$(ECPREFIX)/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin
CONFIGURE_OPTIONS+=	--with-pid-dir=$(ECPREFIX)/var/run
CONFIGURE_OPTIONS+=	--with-privsep-path=$(ECPREFIX)/var/empty/sshd
CONFIGURE_OPTIONS+=	--with-md5-passwords
CONFIGURE_OPTIONS+=	--with-pam
CONFIGURE_OPTIONS+=	--with-ssl-engine
CONFIGURE_OPTIONS+=	--with-kerberos5=/usr
CONFIGURE_OPTIONS+=	--with-solaris-contracts
CONFIGURE_OPTIONS+=	--with-solaris-projects
CONFIGURE_OPTIONS+=	--with-audit=bsm
CONFIGURE_OPTIONS+=	--with-zlib=$(ECPREFIX)

build:		$(BUILD_32)

install:	$(INSTALL_32)


