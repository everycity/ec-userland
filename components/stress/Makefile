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

COMPONENT_NAME=		stress
COMPONENT_FMRI=         benchmark/stress
COMPONENT_VERSION=      1.0.4
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://pkgs.fedoraproject.org/repo/pkgs/stress/
COMPONENT_SUMMARY=	A tool to produce stress on the system
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0
COMPONENT_ARCHIVE_URL=	http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-1.0.4.tar.gz/a607afa695a511765b40993a64c6e2f4/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

