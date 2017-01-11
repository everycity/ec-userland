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

COMPONENT_NAME=		rabbitmq
COMPONENT_FMRI=		service/rabbitmq
COMPONENT_VERSION=	3.6.6
COMPONENT_LICENSE=	MPL
COMPONENT_PROJECT_URL=	"http://www.rabbitmq.com/"
COMPONENT_SUMMARY=	Messaging for applications
COMPONENT_SRC=		$(COMPONENT_NAME)-server-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e
COMPONENT_ARCHIVE_URL=	https://www.rabbitmq.com/releases/rabbitmq-server/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_INSTALL_ENV +=        DESTDIR=$(PROTO_DIR)
COMPONENT_INSTALL_ENV +=        MANDIR=$(ECPREFIX)/share/man
COMPONENT_INSTALL_ENV +=        RMQ_ROOTDIR=$(ECPREFIX)
COMPONENT_INSTALL_ENV +=        RMQ_BINDIR=$(ECPREFIX)/lib/rabbitmq/bin
COMPONENT_INSTALL_ENV +=        RMQ_LIBDIR=$(ECPREFIX)/lib
COMPONENT_INSTALL_ENV +=        RMQ_ERLAPP_DIR=$(ECPREFIX)/lib/rabbitmq

COMPONENT_INSTALL_TARGETS=	all install install-man

COMPONENT_POST_INSTALL_ACTION= \
	( perl -pi -e 's/^SYS_PREFIX=.*/SYS_PREFIX=\/ec/g' \
		$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin/rabbitmq-defaults ) && \
	( perl -pi -e 's/.*next line potentially.*//g' \
		$(PROTO_DIR)$(ECPREFIX)/lib/rabbitmq/sbin/rabbitmq-defaults )

build:		$(BUILD_32)

install:	$(INSTALL_32)
