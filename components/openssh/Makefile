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

#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openssh
COMPONENT_VERSION=	6.0p1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	
COMPONENT_ARCHIVE_URL=	http://mirror.bytemark.co.uk/pub/OpenBSD/OpenSSH/portable/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=  6.0.1

CONFIGURE_OPTIONS+=	--sysconfdir=$(ECPREFIX)/etc/ssh
CONFIGURE_OPTIONS+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS+=	--with-ssl-dir=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-default-path=$(ECPREFIX)/bin:$(ECPREFIX)/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin
CONFIGURE_OPTIONS+=	--with-pid-dir=$(ECPREFIX)/var/run
CONFIGURE_OPTIONS+=	--with-privsep-path=$(ECPREFIX)/var/empty/sshd
CONFIGURE_OPTIONS+=	--with-md5-passwords
CONFIGURE_OPTIONS+=	--with-pam
CONFIGURE_OPTIONS+=	--with-solaris-contracts
CONFIGURE_OPTIONS+=	--with-zlib=$(ECPREFIX)

build:		$(BUILD_32)

install:	$(INSTALL_32)


