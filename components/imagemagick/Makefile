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

COMPONENT_NAME=		ImageMagick
COMPONENT_VERSION=	6.7.4-0
IPS_COMPONENT_VERSION=	6.7.4.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:5407f75dcc7a3cfad5779ba47cf2798fe5fb3c7b
COMPONENT_ARCHIVE_URL=	ftp://ftp.imagemagick.org/pub/ImageMagick/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared=yes
CONFIGURE_OPTIONS+=	--enable-static=no
CONFIGURE_OPTIONS+=	--without-gvc
CONFIGURE_OPTIONS+=	--without-modules
CONFIGURE_OPTIONS.32+=	--with-perl=$(ECPREFIX)/bin/perl
CONFIGURE_OPTIONS.32+=	--with-perl-options="INSTALLDIRS=vendor"
CONFIGURE_OPTIONS.64+=	--without-perl

# The archive contains pre-generated magick-config.h header, which is later on
# being used and the build fails.  However, we want to use the header generated
# by configure from BUILD_DIR_32 / BUILD_DIR_64 directory, so the pre-generated
# header file needs to be deleted.
#
COMPONENT_PREP_ACTION= (cd $(@D) ; $(RM) magick/magick-config.h)

# To get the Perl modules built it is necessary to copy the PerlMagick directory
# to the build directory
#
COMPONENT_PRE_CONFIGURE_ACTION= ($(CP) -R $(SOURCE_DIR)/PerlMagick $(@D); cd $(SOURCE_DIR); $(AUTORECONF) -f)

COMPONENT_BUILD_ARGS += LD="$(CC)"
COMPONENT_BUILD_ARGS += LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))"

# Your build time output from ImageMagick should look like this:
#
# Shared libraries  --enable-shared=yes           yes
# Static libraries  --enable-static=no            no
# Module support    --with-modules=no             no
# GNU ld            --with-gnu-ld=no              no
# Quantum depth     --with-quantum-depth=16       16
# High Dynamic Range Imagery
#                   --enable-hdri=no              no
# 
# Delegate Configuration:
# BZLIB             --with-bzlib=yes              yes
# Autotrace         --with-autotrace=no           no
# Dejavu fonts      --with-dejavu-font-dir=default        none
# DJVU              --with-djvu=yes               no
# DPS               --with-dps=yes                no
# FFTW              --with-fftw=yes               yes
# FlashPIX          --with-fpx=yes                no
# FontConfig        --with-fontconfig=yes         yes
# FreeType          --with-freetype=yes           yes
# GhostPCL          None                          pcl6 (unknown)
# GhostXPS          None                          gxps (unknown)
# Ghostscript       None                          gs (9.04)
# Ghostscript fonts --with-gs-font-dir=default    /ec/share/ghostscript/fonts/
# Ghostscript lib   --with-gslib=no               no
# Graphviz          --with-gvc=yes                no
# JBIG              --with-jbig=yes               no
# JPEG v1           --with-jpeg=yes               yes
# JPEG-2000         --with-jp2=yes                no
# LCMS v1           --with-lcms=yes               no
# LCMS v2           --with-lcms2=yes              no
# LQR               --with-lqr=yes                no
# LZMA              --with-lzma=yes               yes
# Magick++          --with-magick-plus-plus=yes   yes
# OpenEXR           --with-openexr=yes            no
# PERL              --with-perl=no                no
# PNG               --with-png=yes                yes
# RSVG              --with-rsvg=yes               no
# TIFF              --with-tiff=yes               yes
# WEBP              --with-webp=yes               no
# Windows fonts     --with-windows-font-dir=      none
# WMF               --with-wmf=yes                no
# X11               --with-x=                     yes
# XML               --with-xml=yes                yes
# ZLIB              --with-zlib=yes               yes


build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

