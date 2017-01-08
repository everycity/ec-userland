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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		yaml
COMPONENT_FMRI=         library/libyaml
COMPONENT_VERSION=      0.1.7
COMPONENT_LICENSE=      yaml
COMPONENT_PROJECT_URL=  http://pyyaml.org/wiki/LibYAML
COMPONENT_SUMMARY=	A YAML 1.1 parser and emitter written in C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729
COMPONENT_ARCHIVE_URL=	http://pyyaml.org/download/libyaml/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE_FILE=	LICENSE

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

