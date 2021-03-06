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
# Copyright 2020 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ImageMagick
COMPONENT_FMRI=		multimedia/imagemagick
COMPONENT_VERSION=	6.9.10-84
IPS_COMPONENT_VERSION=	6.9.10.84
COMPONENT_LICENSE=	ImageMagick
COMPONENT_PROJECT_URL=	http://www.imagemagick.org/
COMPONENT_SUMMARY=	Convert, Edit, And Compose Images
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e7a8656dfdad475791765655fb0701de6caa1428fc4657ea66a5f81cf66eaa80
COMPONENT_ARCHIVE_URL=	ftp://ftp.imagemagick.org/pub/ImageMagick/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) && libtoolize -f && autoreconf -fi)

# To get the Perl modules built it is necessary to copy the PerlMagick directory
# to the build directory
#
COMPONENT_PRE_CONFIGURE_ACTION= ($(CP) -R $(SOURCE_DIR)/PerlMagick $(@D))

# Don't use rpath, or relink!
COMPONENT_POST_CONFIGURE_ACTION = \
	(cd $(BUILD_DIR_$(BITS)) ; \
	$(GSED) -i \
	-e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' \
	-e 's|need_relink=yes|need_relink=not_on_solaris|' \
	libtool)

LIBS += -lsocket -lnsl
CONFIGURE_ENV += LIBS="$(LIBS)"

# Prevent older versions of libMagick{Core,Wand}-6.Q16.so from the build
# machine from being found ahead of new versions from the proto area.
LD_OPTIONS_SO=		-L. -L../../magick/.libs
COMPONENT_BUILD_ENV +=	LD_OPTIONS_SO="$(LD_OPTIONS_SO)"


CONFIGURE_OPTIONS+=	--enable-shared=yes
CONFIGURE_OPTIONS+=	--enable-static=no
CONFIGURE_OPTIONS+=	--without-gvc
CONFIGURE_OPTIONS+=	--disable-openmp
CONFIGURE_OPTIONS+=	--without-modules
CONFIGURE_OPTIONS.32+=	--with-perl
CONFIGURE_OPTIONS.64+=	--without-perl
CONFIGURE_OPTIONS+=	--with-rsvg=yes
CONFIGURE_OPTIONS+=	--with-gslib

#COMPONENT_BUILD_ARGS += LD="$(CC)"
#COMPONENT_BUILD_ARGS += LD_RUN_PATH="$(CONFIGURE_LIBDIR.$(BITS))"

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
# RSVG              --with-rsvg=yes               yes
# TIFF              --with-tiff=yes               yes
# WEBP              --with-webp=yes               yes
# Windows fonts     --with-windows-font-dir=      none
# WMF               --with-wmf=yes                no
# X11               --with-x=                     yes
# XML               --with-xml=yes                yes
# ZLIB              --with-zlib=yes               yes

COMPONENT_POST_INSTALL_ACTION+= ( \
	/usr/bin/echo "/* EC: combining 32 and 64bit versions */\n\n\#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/magick-baseconfig.h; \
	/usr/bin/cat $(BUILD_DIR_64)/magick/magick-baseconfig.h >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	/usr/bin/echo "\n\#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	/usr/bin/cat $(BUILD_DIR_32)/magick/magick-baseconfig.h >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	/usr/bin/echo "\n\#endif /* EC */" >> $(COMPONENT_DIR)/magick-baseconfig.h; \
	\
	/usr/bin/echo "/* EC: combining 32 and 64bit versions */\n\n\#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/version.h; \
	/usr/bin/cat $(BUILD_DIR_64)/magick/version.h >> $(COMPONENT_DIR)/version.h; \
	/usr/bin/echo "\n\#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/version.h; \
	/usr/bin/cat $(BUILD_DIR_32)/magick/version.h >> $(COMPONENT_DIR)/version.h; \
	/usr/bin/echo "\n\#endif /* EC */" >> $(COMPONENT_DIR)/version.h; )

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(RM) $(PROTO_DIR)$(ECPREFIX)/include/ImageMagick-6/magick/magick-baseconfig.h
	$(INSTALL) $(COMPONENT_DIR)/magick-baseconfig.h $(PROTO_DIR)$(ECPREFIX)/include/ImageMagick-6/magick/magick-baseconfig.h
	$(RM) $(PROTO_DIR)$(ECPREFIX)/include/ImageMagick-6/magick/version.h
	$(INSTALL) $(COMPONENT_DIR)/version.h $(PROTO_DIR)$(ECPREFIX)/include/ImageMagick-6/magick/version.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

