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

DEF_JOBS := no
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		perl
COMPONENT_VERSION=	5.12.5
PERL_VERSION=		5.12
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:1db3d7cf39ac0379233211dd41afad300c11b33e3219e1d76908d01172f84a5c
COMPONENT_ARCHIVE_URL=	http://www.cpan.org/src/5.0/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

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

CONFIGURE_OPTIONS= \
			    -Dprefix=$(USRLIBDIR)/perl/$(PERL_VERSION) \
			    -Dprivlib=$(USRLIBDIR)/perl/$(PERL_VERSION)/lib \
			    -Dsitelib=$(USRLIBDIR)/perl/site_perl/$(PERL_VERSION) \
			    -Dvendorprefix=$(USRLIBDIR)/perl/$(PERL_VERSION) \
			    -Dvendorlib=$(USRLIBDIR)/perl/vendor_perl/$(PERL_VERSION) \
			    -Dlibperl=libperl.so.$(PERL_VERSION) \
			    -Duseshrplib \
			    -Duse64bitint \
			    -Dcc="$(CC) -B/usr/bin/" \
			    -Accflags="-fno-stack-protector" \
			    -Doptimize="$(CFLAGS)" \
			    -Dcf_email="support@everycity.com" \
			    -Dcf_by="perl-bugs" \
			    -Dmyhostname="localhost" \
			    -Dmksymlinks \
			    -O \
			    -de

#			    -Dusedtrace \

CONFIGURE_THREAD_OPTIONS =  -Dusethreads \
			    -Duseithreads

CONFIGURE_OPTIONS += $(CONFIGURE_THREAD_OPTIONS)

COMPONENT_POST_UNPACK_ACTION = \
	( cd $(SOURCE_DIR) \
	&& gfind . -type f -name "*" | xargs chmod 0644 )

COMPONENT_POST_CONFIGURE_ACTION = \
	(cd $(@D); \
	    cp config.sh config.sh_orig ; \
	    gawk \
	    '/^myuname=/{print $$1" localhost "$$3" "$$5" "$$6" "$$7"\047"} ; \
	    		!/^myuname=/ {print}' config.sh_orig \
		| \
		sed -e 's/[^ ]*SUNWspro[^ ]*//g' > config.sh ) ; \
	( rm $(@D)/perly.act $(@D)/perly.tab $(@D)/perly.h; \
		cd $(@D) && $(GMAKE) regen_perly )
#		&& CONFIG_SHELL="/bin/bash" SHELL="/bin/bash" $(GMAKE) perldtrace.h )

COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

#LDFLAGS +=	-lssp

#COMPONENT_BUILD_TARGETS+= LDFLAGS="$(LDFLAGS)"

#
# perl's install path for sparc is based off the value of the
# "arch" command.  So we must package that way also.
#
PKG_MACROS		+=	PERL_ARCH=$(shell arch)
PKG_MACROS		+=	PERL_VERSION=$(PERL_VERSION)

LD_OPTIONS= 
COMPONENT_BUILD_ENV	+=	PATH="$(dir $(CC)):$(PATH)"
COMPONENT_BUILD_ENV	+=	LD_OPTIONS=$(LD_OPTIONS)
COMPONENT_INSTALL_ENV	+=	LD_OPTIONS=$(LD_OPTIONS)

build:		$(BUILD_32)

install:	$(INSTALL_32)

test:		$(TEST_32)
	#
	#
	# All tests should pass.
	#
	#

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include $(WS_TOP)/make-rules/depend.mk
