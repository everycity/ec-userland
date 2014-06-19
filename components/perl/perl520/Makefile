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

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		perl
COMPONENT_FMRI=		runtime/perl-520
COMPONENT_VERSION=	5.20.0
PERL_VERSION=		5.20
COMPONENT_LICENSE=	Artistic
COMPONENT_PROJECT_URL=	http://www.perl.org/
COMPONENT_SUMMARY=	The Perl Programming Language
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a36ca45f8bbcd02
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PERL5)
COMPONENT_AUTOGEN_MANIFEST=	yes
COMPONENT_LICENSE_FILE=	Artistic

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

CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure
CONFIGURE_ENV += MAKE=$(GMAKE)
CONFIGURE_ENV += PATH="$(dir $(CC)):$(PATH)"

PERL_PREFIX=$(USRDIR)/lib/perl/$(PERL_VERSION)

CONFIGURE_OPTIONS = \
			-des \
			-Dmksymlinks \
			-Ulocincpth= \
			-Uloclibpth= \
			-Dcc="$(CC)" \
                        -Doptimize="-O3" \
                        -Dld=/usr/bin/ld \
			-Dcf_email="support@everycity.co.uk" \
			-Dcf_by="support" \
			-Dmyhostname="localhost" \
			-Dperl_static_inline="static" \
			-Dprefix=$(PERL_PREFIX) \
			-Dvendorprefix=$(PERL_PREFIX) \
			-Dsiteprefix=$(PERL_PREFIX) \
                        -Dbin=$(PERL_PREFIX)/bin/$(MACH$(BITS)) \
                        -Dsitebin=$(PERL_PREFIX)/bin/$(MACH$(BITS)) \
                        -Dvendorbin=$(PERL_PREFIX)/bin/$(MACH$(BITS)) \
                        -Dscriptdir=$(PERL_PREFIX)/bin \
                        -Dsitescript=$(PERL_PREFIX)/bin \
                        -Dvendorscript=$(PERL_PREFIX)/bin \
                        -Dprivlib=$(PERL_PREFIX)/lib \
			-Dsitelib=$(USRDIR)/lib/perl/site_perl/$(PERL_VERSION) \
			-Dvendorlib=$(USRDIR)/lib/perl/vendor_perl/$(PERL_VERSION) \
			-Duseshrplib \
			-Duse64bitint \
			-Duselargefiles \
			-Dusemultiplicity \
			-Dusethreads \
			-Dman1dir=$(PERL_PREFIX)/man/man1 \
			-Dman1ext=1 \
			-Dman3dir=$(PERL_PREFIX)/man/man3 \
			-Dman3ext=3

CONFIGURE_OPTIONS.32 = -Accflags="-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TS_ERRNO"
CONFIGURE_OPTIONS.64 = -Accflags="-D_LARGEFILE64_SOURCE -m64 -D_TS_ERRNO" \
                        -Dlddlflags="-G -64" \
                        -Dldflags=""

CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

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
		sed -e "s/[^ ']*SUNWspro[^ ']*//g" -e "s/-fstack-protector//g;" > config.sh )

COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

# create ISA stub files for binaries in i86 and amd64 subdirs

COMPONENT_POST_INSTALL_ACTION = \
	cd $(PROTO_DIR)$(PERL_PREFIX)/bin; \
		for i in $$(cd $(MACH$(BITS)); ls); do \
			[[ -f $$i ]] || CC=$(CC) $(MAKEISA_SH) $(MACH$(BITS)) $$i; \
		done; \
		$(GSED) -i "s%$(PERL_PREFIX)/bin/$(MACH$(BITS))%$(PERL_PREFIX)/bin%g" \
		    $$(find . -type f | xargs file | grep script | cut -f1 -d:); \
		$(MKDIR) $(PROTO_DIR)$(USRBINDIR)/$(MACH32) $(PROTO_DIR)$(USRBINDIR)/$(MACH64); \
		for i in $$(find . -maxdepth 1 -type f|cut -c 3-); do \
			[[ -L $(PROTO_DIR)$(USRBINDIR)/$$i ]] || \
				ln -s ../lib/perl/$(PERL_VERSION)/bin/$$i $(PROTO_DIR)$(USRBINDIR)/$$i; \
		done; \
		for i in $$(find $(MACH32) $(MACH64) -type f); do \
			[[ -L $(PROTO_DIR)$(USRBINDIR)/$$i ]] || \
				ln -s ../../lib/perl/$(PERL_VERSION)/bin/$$i $(PROTO_DIR)$(USRBINDIR)/$$i; \
		done

PKG_MACROS		+=	PERL_VERSION=$(PERL_VERSION)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

include ../../../make-rules/depend.mk

