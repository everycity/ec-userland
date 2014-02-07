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

COMPONENT_NAME=		yaml
COMPONENT_FMRI=         library/libyaml
COMPONENT_VERSION=      0.1.5
COMPONENT_LICENSE=      yaml
COMPONENT_PROJECT_URL=  http://pyyaml.org/wiki/LibYAML
COMPONENT_SUMMARY=	A YAML 1.1 parser and emitter written in C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fa87ee8fb7b936ec04457bc044cd561155e1000a4d25029867752e543c2d3bef
COMPONENT_ARCHIVE_URL=	http://pyyaml.org/download/libyaml/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

