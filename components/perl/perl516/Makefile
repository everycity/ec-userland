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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		perl
COMPONENT_VERSION=	5.16.3
PERL_VERSION=		5.16
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:69cf08dca0565cec2c5c6c2f24b87f986220462556376275e5431cc2204dedb6
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PERL5)

include ../../../make-rules/prep.mk
include ../../../make-rules/justmake.mk
include ../../../make-rules/ips.mk

# Perl builds seem flakey since justmake.mk parallel enable.
COMPONENT_BUILD_GMAKE_ARGS=

#
# The extra Configure parameters (cf_email, cf_by, myhostname) and
# the gawk and sed that follow are attempting to sanatize the
# resulting config.sh of values from our build environment that

# are discoverable in perl's config via "perl -V".
# I'm assuming our compilers live on a path that contains "SUNWspro".
# If that changes the sed filter needs to change.
#

# Disabling these two flags, one of them breaks cpan:
#			    -Doptimize="$(CFLAGS.gcc)" \
#			    -Duseshrplib \

COMPONENT_PRE_BUILD_ACTION= \
	(cd $(@D); $(ENV) -i \
		MAKE=$(GMAKE) \
		PATH=$(dir $(CC.studio.32)):$(PATH) \
		$(CONFIG_SHELL) ./Configure \
			    -Dprefix=$(ECPREFIX)/lib/perl/$(PERL_VERSION) \
			    -Dprivlib=$(ECPREFIX)/lib/perl/$(PERL_VERSION)/lib \
			    -Dsitelib=$(ECPREFIX)/lib/perl/site_perl/$(PERL_VERSION) \
			    -Dvendorprefix=$(ECPREFIX)/lib/perl/$(PERL_VERSION) \
			    -Dvendorlib=$(ECPREFIX)/lib/perl/vendor_perl/$(PERL_VERSION) \
			    -Dcc="gcc" \
			    -Duse64bitint \
			    -Dusedtrace \
			    -Dlibperl=libperl.so \
			    -Dcf_email="support@everycity.com" \
			    -Dcf_by="perl-bugs" \
			    -Dmyhostname="localhost" \
			    -O \
			    -de ) ; \
	(cd $(@D); \
	    cp config.sh config.sh_orig ; \
	    gawk \
	    '/^myuname=/{print $$1" localhost "$$3" "$$5" "$$6" "$$7"\047"} ; \
	    		!/^myuname=/ {print}' config.sh_orig \
		| \
		sed -e 's/[^ ]*SUNWspro[^ ]*//g' > config.sh )

COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

LDFLAGS +=	-lssp

COMPONENT_BUILD_TARGETS+= LDFLAGS="$(LDFLAGS)"

#
# perl's install path for sparc is based off the value of the
# "arch" command.  So we must package that way also.
#
PKG_MACROS		+=	PERL_ARCH=$(shell arch)
PKG_MACROS		+=	PERL_VERSION=$(PERL_VERSION)


build:		$(BUILD_32)

install:	$(INSTALL_32)

