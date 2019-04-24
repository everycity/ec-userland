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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ImageMagick
COMPONENT_FMRI=		multimedia/imagemagick
COMPONENT_VERSION=	7.0.8-41
IPS_COMPONENT_VERSION=	7.0.8.41
COMPONENT_LICENSE=	ImageMagick
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	http://www.imagemagick.org/
COMPONENT_SUMMARY=	Convert, Edit, And Compose Images
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:93f73a245c25194f757c075df9f2ec40010376200cc664c21646565b8690112c
COMPONENT_ARCHIVE_URL=	ftp://ftp.imagemagick.org/pub/ImageMagick/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared=yes
CONFIGURE_OPTIONS+=	--enable-static=no
CONFIGURE_OPTIONS+=	--without-gvc
CONFIGURE_OPTIONS+=	--without-modules
CONFIGURE_OPTIONS.64+=	--with-perl=$(USRDIR)/bin/perl
CONFIGURE_OPTIONS.32+=	--with-perl-options="INSTALLDIRS=vendor"
CONFIGURE_OPTIONS.32+=	--without-perl
CONFIGURE_OPTIONS+=	--with-rsvg=yes
CONFIGURE_OPTIONS+=	--with-gslib

# To get the Perl modules built it is necessary to copy the PerlMagick directory
# to the build directory
COMPONENT_PRE_CONFIGURE_ACTION= ($(CP) -R $(SOURCE_DIR)/PerlMagick $(@D); )

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

#COMPONENT_POST_INSTALL_ACTION+= ( \
	$(ECHO) -e "/* EC: combining 32 and 64bit versions */\n\n\#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/magick-baseconfig.h; \
	$(CAT) $(BUILD_DIR_64)/magick/magick-baseconfig.h >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	$(ECHO) -e "\n\#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	$(CAT) $(BUILD_DIR_32)/magick/magick-baseconfig.h >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	$(ECHO) -e "\n\#endif /* EC */" >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	\
	$(ECHO) -e "/* EC: combining 32 and 64bit versions */\n\n\#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/version.h; \
	$(CAT) $(BUILD_DIR_64)/magick/version.h >> $(COMPONENT_DIR)/version.h; \
	$(ECHO) -e "\n\#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/version.h; \
	$(CAT) $(BUILD_DIR_32)/magick/version.h >> $(COMPONENT_DIR)/version.h; \
	$(ECHO) -e "\n\#endif /* EC */" >> $(COMPONENT_DIR)/version.h; )

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(TOUCH) $@
#	$(RM) $(PROTO_DIR)$(USRDIR)/include/ImageMagick-7/magick/magick-baseconfig.h
#	$(INSTALL) $(COMPONENT_DIR)/magick-baseconfig.h $(PROTO_DIR)$(USRDIR)/include/ImageMagick-7/magick/magick-baseconfig.h
#	$(RM) $(PROTO_DIR)$(USRDIR)/include/ImageMagick-7/magick/version.h
#	$(INSTALL) $(COMPONENT_DIR)/version.h $(PROTO_DIR)$(USRDIR)/include/ImageMagick-7/magick/version.h
#	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

