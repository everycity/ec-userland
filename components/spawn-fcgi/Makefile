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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		spawn-fcgi
COMPONENT_FMRI=         web/server/spawn-fcgi
COMPONENT_VERSION=      1.6.3
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  http://redmine.lighttpd.net/projects/spawn-fcgi
COMPONENT_SUMMARY=	spawn-fcgi is used to spawn FastCGI applications
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7507a822995731629149040ee5686279b7582ae46f0296efd64b542ef052a90e
COMPONENT_ARCHIVE_URL=	http://www.lighttpd.net/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

