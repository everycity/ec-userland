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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=			erlang
COMPONENT_VERSION_MAJOR=	12
COMPONENT_VERSION_MINOR=	B
COMPONENT_VERSION_MICRO=	5
# IPS_COMPONENT_VERSION needs update whenever this is changed
COMPONENT_VERSION=	R$(COMPONENT_VERSION_MAJOR)$(COMPONENT_VERSION_MINOR)-$(COMPONENT_VERSION_MICRO)
COMPONENT_PROJECT_URL=	http://www.erlang.org/
COMPONENT_SRC_NAME=	otp_src
COMPONENT_SRC=		$(COMPONENT_SRC_NAME)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:6ec3f344dd626bd83494fcad66db98a03f930a039b2a1499313d1a5a57aadda7
COMPONENT_ARCHIVE_URL=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	utility/erlang

# manpages
COMPONENT_NAME_1=	otp_doc_man
COMPONENT_SRC_1=	$(COMPONENT_NAME_1)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_1=	$(COMPONENT_SRC_1).tar.gz
COMPONENT_ARCHIVE_HASH_1=	\
    sha256:f7acb458b72ffa8f9b1f45501bed85d3d9fb691c601f3f6997856c501e2f0659
COMPONENT_ARCHIVE_URL_1=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE_1)

# HTML documentation
COMPONENT_NAME_2=	otp_doc_html
COMPONENT_SRC_2=	$(COMPONENT_NAME_2)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_2=	$(COMPONENT_SRC_2).tar.gz
COMPONENT_ARCHIVE_HASH_2=	\
    sha256:db131a347217ab434ca4c483abb61dc01989e0db43e1fe6982c3067f60cf91d7
COMPONENT_ARCHIVE_URL_2=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE_2)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

override COMPONENT_BUILD_GMAKE_ARGS=

# IPS_COMPONENT_VERSION is by default set to $(COMPONENT_VERSION) but it is not
# enough for us. We need to include the $(COMPONENT_SUBVERSION) somehow.
# Because the IPS_COMPONENT_VERSION cannot contain letters we use mapping:
# R(major)(minor)-(micro) - (major).(minor as number).(micro)
IPS_COMPONENT_VERSION=  $(COMPONENT_VERSION_MAJOR).2.$(COMPONENT_VERSION_MICRO)

# Built in SFW with gcc and builds cleanly now only with gcc
COMPILER = gcc

CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS += CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_OPTIONS += --enable-smp-support
CONFIGURE_OPTIONS += --enable-threads
CONFIGURE_OPTIONS += --enable-hipe
CONFIGURE_OPTIONS += --with-ssl=$(ECPREFIX)
CONFIGURE_OPTIONS += --enable-dynamic-ssl-lib

LD =	$(CC) $(LD_BITS)

# Use cp(1) instead of cloney because erlang's 'install' target uses 'tar'
# to copy files and our tar doesn't handle long links by default.  Between
# the use of 'tar' and 'ld', a path adjustment wasn't an option due to the
# need for /usr/bin/ld and /usr/gnu/bin/tar.  Perhaps this can be looked
# at when we upgrade to a more current version.
COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CP) -rp $(SOURCE_DIR)/. $(@D))
CONFIGURE_SCRIPT =	$(@D)/configure

COMPONENT_INSTALL_ARGS += INSTALL_PREFIX=$(PROTO_DIR) LD="$(LD)" LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))" CPPFLAGS="$(CPPFLAGS)"
COMPONENT_BUILD_ARGS += LD="$(LD)" CPPFLAGS="$(CPPFLAGS)" 
COMPONENT_BUILD_ARGS += LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))"

# common targets
build:	$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	# Undelivered useless files:
	#    erlang/lib/crypto-*/priv/obj
	#    erlang/lib/ssl-*/priv/obj
	#    erlang/Install
	#    erlang/misc
	#    erlang/*/*.bat
	#    manpages: start.1 werl.1
	$(RM) -r documentation
	$(MKDIR) documentation && cd documentation && \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1) && \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2)
	# remove INSTALL_PREFIX from path
	$(PERL) -pi -e "s|$(PROTO_DIR)||g" $(PROTO_DIR)$(ECPREFIX)/lib/erlang/bin/erl \
		$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/erlang/bin/erl \
		$(PROTO_DIR)$(ECPREFIX)/lib/erlang/releases/RELEASES \
		$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/erlang/releases/RELEASES

clean::
	$(RM) -r documentation

