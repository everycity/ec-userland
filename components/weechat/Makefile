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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		weechat
COMPONENT_VERSION=	0.3.6
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:529f8ec1756ababfe25cf16241fa7250508b6cc8
COMPONENT_ARCHIVE_URL=	http://www.weechat.org/files/src/$(COMPONENT_ARCHIVE)


include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION=  (cd $(@D) ; autoconf)

CONFIGURE_ENV+=		CPPFLAGS="-I$(ECPREFIX)/include/ncurses"
CONFIGURE_ENV+=		LIBS="-lnsl"
CONFIGURE_ENV+=		PERL="/usr/perl5/5.8.4/bin/perl"

CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-debug=0

COMPONENT_POST_CONFIGURE_ACTION+= \
	$(PERL) -pi -e 's%/usr/perl5/5.8.4/lib/i86pc-solaris-64int/auto/DynaLoader/DynaLoader.a%%' \
	$(@D)/src/plugins/scripts/perl/Makefile;

build:		$(BUILD_32)

install:	$(INSTALL_32)
