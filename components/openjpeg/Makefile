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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openjpeg
COMPONENT_VERSION=	1_4
COMPONENT_SRC=		$(COMPONENT_NAME)_v$(COMPONENT_VERSION)_sources_r697
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:9ef6a08ecf5944962b4e2cd7569ac01a8eaa66d0
COMPONENT_ARCHIVE_URL=	http://openjpeg.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=1.4.697

COMPONENT_PRE_CONFIGURE_ACTION+= cp -R $(SOURCE_DIR)/* $(@D)/

SRCS=	bio.c cio.c dwt.c event.c image.c j2k.c j2k_lib.c jp2.c jpt.c mct.c \
  mqc.c openjpeg.c pi.c raw.c t1.c t2.c tcd.c tgt.c

LOBJS=	bio.lo cio.lo dwt.lo event.lo image.lo j2k.lo j2k_lib.lo jp2.lo jpt.lo mct.lo \
  mqc.lo openjpeg.lo pi.lo raw.lo t1.lo t2.lo tcd.lo tgt.lo

LIBPATH.32=	$(ECPREFIX)/lib
LIBPATH.64=	$(ECPREFIX)/lib/$(MACH64)
LIBPATH=	$(LIBPATH.$(BITS))

build:	$(BUILD_32_and_64)

$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	(cd $(@D)/libopenjpeg && for src in $(SRCS); do \
	   libtool --mode=compile $(CC) $(CFLAGS) -c $$src; \
	 done)
	(cd $(@D)/libopenjpeg && libtool --mode=link \
	   $(CC) -o libopenjpeg.la $(LOBJS) \
	  -rpath $(LIBPATH) -version-info 0:0:0)
	$(TOUCH) $@

install:	$(INSTALL_32_and_64)

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	mkdir -p $(PROTO_DIR)/$(LIBPATH)
	mkdir -p $(PROTO_DIR)/$(ECPREFIX)/include
	(cd $(@D) ; libtool --mode=install cp \
	  libopenjpeg/libopenjpeg.la $(PROTO_DIR)/$(LIBPATH) ; \
	  cp libopenjpeg/openjpeg.h $(PROTO_DIR)/$(ECPREFIX)/include \
	)
	$(TOUCH) $@

