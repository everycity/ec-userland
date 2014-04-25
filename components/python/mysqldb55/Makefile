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

COMPONENT_NAME=		MySQL-python
COMPONENT_FMRI=		library/python/mysqldb
COMPONENT_VERSION=	1.2.5
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"https://github.com/farcepest/MySQLdb1"
COMPONENT_SUMMARY=	MySQLdb is an interface to the popular MySQL database server for Python
COMPONENT_SRC=		MySQLdb1-MySQLdb-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:905dd8be887ff596641ace5411fed17cfd08dd33699ea627d3fb44f8a922c2f0
COMPONENT_ARCHIVE_URL=	https://github.com/farcepest/MySQLdb1/archive/MySQLdb-$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/setup.py.mk
include ../../make-rules/ips.mk

# Ensure the 64bit mysql-config gets picked up on 64bit builds
PATH.32=$(ECPREFIX)/lib/mysql/5.5/bin:$(ECPREFIX)/bin:/usr/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/lib/mysql/5.5/bin/$(MACH64):$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

