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

COMPONENT_NAME=		rabbitmq
COMPONENT_FMRI=		service/rabbitmq
COMPONENT_VERSION=	3.4.1
COMPONENT_LICENSE=	MPL
COMPONENT_PROJECT_URL=	"http://www.rabbitmq.com/"
COMPONENT_SUMMARY=	Messaging for applications
COMPONENT_SRC=		$(COMPONENT_NAME)-server-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9048576a7c40d2fb37efef4981fe6ef41cf078402739c56e71600e19caa8d56b
COMPONENT_ARCHIVE_URL=	http://www.rabbitmq.com/releases/rabbitmq-server/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_INSTALL_ENV+= \
	TARGET_DIR=$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq \
	SBIN_DIR=$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin \
	MAN_DIR=$(PROTO_DIR)$(ECPREFIX)/share/man \
	DOC_INSTALL_DIR=$(PROTO_DIR)$(ECPREFIX)/share/doc

COMPONENT_POST_INSTALL_ACTION= \
	( perl -pi -e 's/^SYS_PREFIX=.*/SYS_PREFIX=\/ec/g' \
		$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin/rabbitmq-defaults ) && \
	( perl -pi -e 's/.*next line potentially.*//g' \
		$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin/rabbitmq-defaults ) && \
	( perl -pi -e "s/\/etc\/rabbitmq/\/ec\/etc\/rabbitmq/g" \
		$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin/rabbitmq-env )

build:		$(BUILD_32)

install:	$(INSTALL_32)

