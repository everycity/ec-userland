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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		erlang
COMPONENT_FMRI=		runtime/erlang
COMPONENT_VERSION=	19.2
COMPONENT_LICENSE=	EPLv1.1
COMPONENT_PROJECT_URL=	http://www.erlang.org/
COMPONENT_SUMMARY=	Erlang/OTP
COMPONENT_SRC_NAME=	otp_src
COMPONENT_SRC=		$(COMPONENT_SRC_NAME)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a016b3ef5dac1e532972617b2715ef187ecb616f7cd7ddcfe0f1d502f5d24870
COMPONENT_ARCHIVE_URL=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE)

# manpages
COMPONENT_NAME_1=	otp_doc_man
COMPONENT_SRC_1=	$(COMPONENT_NAME_1)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_1=	$(COMPONENT_SRC_1).tar.gz
COMPONENT_ARCHIVE_HASH_1=	sha256:8a76ff3bb40a6d6a1552fa5a4204c8a3c7d99d2ea6f12684f02d038b23ad25cb
COMPONENT_ARCHIVE_URL_1=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE_1)

# HTML documentation
COMPONENT_NAME_2=	otp_doc_html
COMPONENT_SRC_2=	$(COMPONENT_NAME_2)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE_2=	$(COMPONENT_SRC_2).tar.gz
COMPONENT_ARCHIVE_HASH_2=	sha256:c373c8c1a9fe7433825088684932f3ded76f53d5b8a4d3d2a364263f1f783043
COMPONENT_ARCHIVE_URL_2=	$(COMPONENT_PROJECT_URL)download/$(COMPONENT_ARCHIVE_2)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CLEAN_PATH +=	documentation

PATH=   $(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

LD =	$(CC) $(LD_BITS)

CONFIGURE_ENV +=	DED_LD="$(LD)"
CONFIGURE_ENV +=	DED_LDFLAGS="-shared -L/ec/lib -R/ec/lib -lumem"
CONFIGURE_ENV +=	DED_LD_FLAG_RUNTIME_LIBRARY_PATH="-R"

CONFIGURE_OPTIONS +=	CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS +=	CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_OPTIONS +=	--enable-smp-support
CONFIGURE_OPTIONS +=	--enable-dtrace
CONFIGURE_OPTIONS +=	--enable-threads
CONFIGURE_OPTIONS +=	--enable-hipe
CONFIGURE_OPTIONS +=	--with-ssl=$(ECPREFIX)
CONFIGURE_OPTIONS +=	--enable-dynamic-ssl-lib
CONFIGURE_OPTIONS +=	--with-dynamic-trace=dtrace

# Use cp(1) instead of cloney because erlang's 'install' target uses 'tar'
# to copy files and our tar doesn't handle long links by default.  Between
# the use of 'tar' and 'ld', a path adjustment wasn't an option due to the
# need for /usr/bin/ld and /usr/gnu/bin/tar.  Perhaps this can be looked
# at when we upgrade to a more current version.
COMPONENT_PRE_CONFIGURE_ACTION = ($(CP) -rp $(SOURCE_DIR)/. $(@D))
CONFIGURE_SCRIPT =	$(@D)/configure

COMPONENT_INSTALL_ARGS += INSTALL_PREFIX=$(PROTO_DIR) LD="$(LD)" LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))" CPPFLAGS="$(CPPFLAGS)"
COMPONENT_BUILD_ARGS += V=1 LD="$(LD)" CPPFLAGS="$(CPPFLAGS)" 
COMPONENT_BUILD_ARGS += LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))"

# common targets
build:	$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
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
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

clean::
	$(RM) -r documentation

