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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openssh
COMPONENT_FMRI=         security/openssh
COMPONENT_VERSION=	7.0p1
IPS_COMPONENT_VERSION=	7.0.0.1
COMPONENT_LICENSE=	OpenSSH
COMPONENT_PROJECT_URL=	http://www.openssh.com/
COMPONENT_SUMMARY=	OpenSSH Secure Shell
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fd5932493a19f4c81153d812ee4e042b49bbd3b759ab3d9344abecc2bc1485e5
COMPONENT_ARCHIVE_URL=	http://mirror.bytemark.co.uk/pub/OpenBSD/OpenSSH/portable/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = \
	( $(CP) $(COMPONENT_DIR)/patches/if_tun.h $(SOURCE_DIR)/openbsd-compat/ )


CFLAGS += -fno-stack-protector
CFLAGS += -DSET_USE_PAM
CFLAGS += -DDEPRECATE_SUNSSH_OPT
CFLAGS += -DLASTLOG_FIX
CFLAGS += -DAUE_openssh=6172
CFLAGS += -DDTRACE_SFTP
CFLAGS += -DDISABLE_BANNER
CFLAGS += -DPAM_ENHANCEMENT
CFLAGS += -DPAM_BUGFIX
CFLAGS += -DSSH_TUN_ILLUMOS=1

#LDFLAGS += -B direct -z nolazyload
LDFLAGS += -B direct

CONFIGURE_OPTIONS+=	--sysconfdir=$(CONFIGURE_SYSCONFDIR)/ssh
CONFIGURE_OPTIONS+=	--sbindir=$(USRDIR)/bin
CONFIGURE_OPTIONS+=	--libexecdir=$(USRDIR)/bin

CONFIGURE_OPTIONS+=	--with-ssl-dir=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-default-path=$(USRDIR)/bin:$(USRDIR)/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin
CONFIGURE_OPTIONS+=	--with-pid-dir=$(CONFIGURE_LOCALSTATEDIR)/run
CONFIGURE_OPTIONS+=	--with-privsep-path=$(CONFIGURE_LOCALSTATEDIR)/empty/sshd
CONFIGURE_OPTIONS+=	--with-md5-passwords
CONFIGURE_OPTIONS+=	--with-pam
CONFIGURE_OPTIONS+=	--with-ssl-engine
CONFIGURE_OPTIONS+=	--with-kerberos5=/usr
CONFIGURE_OPTIONS+=	--with-solaris-contracts
CONFIGURE_OPTIONS+=	--with-solaris-projects
CONFIGURE_OPTIONS+=	--with-audit=bsm
CONFIGURE_OPTIONS+=	--with-zlib=$(USRDIR)

build:		$(BUILD_32)

install:	$(INSTALL_32)
