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
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ant
COMPONENT_FMRI=		developer/build/ant
COMPONENT_VERSION=	1.8.4
COMPONENT_LICENSE=	ANT
COMPONENT_PROJECT_URL=	$(PROJECT_APACHE)
COMPONENT_SUMMARY=	Apache Ant Java-based build tool
COMPONENT_SRC_NAME=	apache-ant
COMPONENT_SRC=		$(COMPONENT_SRC_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-src.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:5de65f7ba3f67e436ffffcdc0a73f591d1006e9fb41af8632c1f1f84d4a3e0b1
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/$(COMPONENT_NAME)/source/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	utility/ant

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# Build script doesn't understand -j jobs
COMPONENT_BUILD_GMAKE_ARGS=

GMAKE=./build.sh

ANT_ENV+=JAVA_HOME=$(JAVA_HOME)

ANT_DIST_DIRS+=-Ddist.dir=$(PROTO_DIR)
ANT_DIST_DIRS+=-Ddist.bin=$(PROTO_DIR)$(ECPREFIX)/bin
ANT_DIST_DIRS+=-Ddist.etc=$(PROTO_DIR)$(ECPREFIX)/share/lib/ant
ANT_DIST_DIRS+=-Ddist.docs=$(PROTO_DIR)$(ECPREFIX)/share/doc/ant
ANT_DIST_DIRS+=-Ddist.manual=$(PROTO_DIR)$(ECPREFIX)/share/doc/ant/manual
ANT_DIST_DIRS+=-Ddist.javadocs=$(PROTO_DIR)$(ECPREFIX)/share/doc/ant/manual/api
ANT_DIST_DIRS+=-Ddist.lib=$(PROTO_DIR)$(ECPREFIX)/share/lib/ant

OPTIONAL_LIBS+=$(ECPREFIX)/share/lib/java/junit-4.10.jar
COMPONENT_PRE_BUILD_ACTION = $(CP) $(OPTIONAL_LIBS) $(@D)/lib/optional

COMPONENT_POST_INSTALL_ACTION=	( perl -pi -e "s,^\#!.*,\#!$(PYTHON)," \
	$(PROTO_DIR)$(ECPREFIX)/bin/runant.py )

COMPONENT_BUILD_TARGETS =	build
COMPONENT_BUILD_ENV +=		$(ANT_ENV)

COMPONENT_INSTALL_ARGS =	$(ANT_DIST_DIRS)
COMPONENT_INSTALL_TARGETS =	dist
COMPONENT_INSTALL_ENV +=	$(ANT_ENV)

COMPONENT_TEST_TARGETS =	test
COMPONENT_TEST_ENV +=		$(ANT_ENV)

build:	$(BUILD_32)

install: $(INSTALL_32)

test:  $(TEST_32)


