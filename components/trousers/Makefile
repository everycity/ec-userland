#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2012-2013, Igor Kozhukhov <ikozhukhov@gmail.com>. All rights reserved.
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		trousers
COMPONENT_VERSION=	0.3.11.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_PROJECT_URL=	http://sourceforge.net/projects/trousers/files/trousers/
#COMPONENT_ARCHIVE_HASH=	\
#	sha256:9bdc3001e00e215c09ac50810940c5c32a0fe057952916e5e836c858bf0e870d
COMPONENT_ARCHIVE_URL=	$(COMPONENT_PROJECT_URL)0.3.11/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LIBS = -lnsl -lsocket -lgen
CFLAGS += -DSOLARIS -DBI_OPENSSL -D_REENTRANT

CONFIGURE_OPTIONS += --with-gui=openssl
#CONFIGURE_OPTIONS += --with-gui=none
CONFIGURE_OPTIONS += LD="$(CC)"
CONFIGURE_OPTIONS += LIBS="$(LIBS)"

COMPONENT_POST_CONFIGURE_ACTION = (cd source/$(COMPONENT_SRC); \
	for f in `ls src/include/tss/*.h` ; do \
		/usr/bin/dos2unix $$f $$f; \
	done; \
	for f in `ls src/include/trousers/*.h` ; do \
		/usr/bin/dos2unix $$f $$f; \
	done; \
	for f in `ls src/include/*.h` ; do \
		/usr/bin/dos2unix $$f $$f; \
	done; \
	/usr/bin/libtoolize -f; \
	$(ACLOCAL); \
	$(AUTOMAKE) src/tspi/Makefile; \
	$(AUTOCONF))

#
# We had to use cc as the linker (see CONFIGURE_OPTIONS above) so the 
# .init and .fini sections get set correctly.  Because we use cc, we 
# must pass the -m64 flag through cc to the linker when building 64 bit 
# libraries.  We can't just add it to LDFLAGS because then it gets used 
# when creating executables and static libs and generates lots of noise 
# in the build logs.  LDARCHFLAG is only recognized by the Makefile in 
# the src/tspi directory.
#
COMPONENT_BUILD_ENV.64 += LDARCHFLAG="-Wl,$(CC_BITS)"

COMPONENT_TEST_TARGETS = 

COMPONENT_BUILD_TARGETS = all

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(NO_TESTS)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
