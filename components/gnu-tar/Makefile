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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tar
COMPONENT_VERSION=	1.26
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:ba89cba98c1a6aea3c80cda5ddcd5eceb5adbb9b
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

ifeq ($(SOLARIS_VERSION),2.10)
COMPONENT_POST_UNPACK_ACTION=	($(GPATCH) -d $(@D) $(GPATCH_FLAGS) < gnulib-s10u9.patch)
endif

CONFIGURE_OPTIONS +=	--with-gzip=$(ECPREFIX)/bin/gzip
CONFIGURE_OPTIONS +=	--with-bzip2=$(ECPREFIX)/bin/bzip2

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

