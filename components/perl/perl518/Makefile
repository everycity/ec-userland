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

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		perl
COMPONENT_FMRI=		runtime/perl-518
COMPONENT_VERSION=	5.18.4
PERL_VERSION=		5.18
COMPONENT_LICENSE=	Artistic
COMPONENT_PROJECT_URL=	http://www.perl.org/
COMPONENT_SUMMARY=	The Perl Programming Language
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:01a4e11a9a34616396c4a77b3cef51f76a297e1a2c2c490ae6138bf0351eb29f
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PERL5)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

BITS = 64

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

CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure
CONFIGURE_ENV += MAKE=$(GMAKE)
CONFIGURE_ENV += PATH="$(dir $(CC)):$(PATH)"

CONFIGURE_OPTIONS = \
			-de \
			-Dmksymlinks \
			-Ulocincpth= \
			-Uloclibpth= \
                        -Dbin=$(USRDIR)/lib/perl/$(PERL_VERSION)/bin \
			-Dcc="$(CC)" \
			-Accflags="-fstack-protector $(CFLAGS)" \
			-Dcf_email="userland-discuss@opensolaris.org" \
			-Dcf_by="perl-bugs" \
			-Dlibperl=libperl.so.$(PERL_VERSION) \
			-Dmyhostname="localhost" \
			-Dperl_static_inline="static" \
			-Dprefix=$(USRDIR)/lib/perl/$(PERL_VERSION) \
                        -Dprivlib=$(USRDIR)/lib/perl/$(PERL_VERSION)/lib \
			-Dsitelib=$(USRDIR)/lib/perl/site_perl/$(PERL_VERSION) \
			-Dsiteprefix=$(USRDIR)/lib/perl/$(PERL_VERSION) \
			-Dvendorlib=$(USRDIR)/lib/perl/vendor_perl/$(PERL_VERSION) \
			-Dvendorprefix=$(USRDIR)/lib/perl/$(PERL_VERSION) \
			-Duseshrplib \
			-Duse64bitall \
			-Dusedtrace \
			-Uuselargefiles \
			-Dman1dir=$(USRDIR)/lib/perl/$(PERL_VERSION)/man/man1 \
			-Dman1ext=1 \
			-Dman3dir=$(USRDIR)/lib/perl/$(PERL_VERSION)/man/man3 \
			-Dman3ext=3 \
			-Aldflags="-L$(USRDIR)/lib/64 $(LDFLAGS)" \
			-Doptimize="$(CFLAGS)" \
			-Dlocincpth="$(CPPFLAGS)" \
			-Dloclibpth="$(USRDIR)/lib/$(MACH64)"


CONFIGURE_THREAD_OPTIONS =  -Dusethreads \
			    -Duseithreads

CONFIGURE_OPTIONS += $(CONFIGURE_THREAD_OPTIONS)

#COMPONENT_POST_UNPACK_ACTION = \
#	( cd $(SOURCE_DIR) \
#	&& gfind . -type f -name "*" | xargs chmod 0644 )

COMPONENT_POST_CONFIGURE_ACTION = \
	(cd $(@D); \
	    cp config.sh config.sh_orig ; \
	    gawk \
	    '/^myuname=/{print $$1" localhost "$$3" "$$5" "$$6" "$$7"\047"} ; \
	    		!/^myuname=/ {print}' config.sh_orig \
		| \
		sed -e "s/[^ ']*SUNWspro[^ ']*//g" > config.sh )

COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

#
# perl's install path for sparc is based off the value of the
# "arch" command.  So we must package that way also.
#
PKG_MACROS		+=	PERL_ARCH=$(shell arch)
PKG_MACROS		+=	PERL_VERSION=$(PERL_VERSION)


build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(TEST_64)
