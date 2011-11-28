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

COMPONENT_NAME=		wkhtmltopdf-qt
COMPONENT_VERSION=	2011.11.28
COMPONENT_SRC=		$(COMPONENT_NAME).$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:f527aec044fb0076a48fae9cabd7a10692320eb9
COMPONENT_ARCHIVE_URL=	http://svn.everycity.co.uk/public/solaris/misc/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_INSTALL_ENV+=	INSTALL_ROOT=$(PROTO_DIR)

CONFIGURE_OPTIONS=	-prefix $(ECPREFIX)/lib/$(COMPONENT_NAME)
CONFIGURE_OPTIONS.32=	-bindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/bin
CONFIGURE_OPTIONS.32+=	-libdir $(ECPREFIX)/lib/$(COMPONENT_NAME)/lib
CONFIGURE_OPTIONS.32+=	-plugindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/plugins
CONFIGURE_OPTIONS.32+=	-platform solaris-g++
CONFIGURE_OPTIONS+=	-confirm-license
CONFIGURE_OPTIONS+=	-opensource
CONFIGURE_OPTIONS+=     -largefile
CONFIGURE_OPTIONS+=     -rpath
CONFIGURE_OPTIONS+=     -release
CONFIGURE_OPTIONS+=     -fast
CONFIGURE_OPTIONS+=     -exceptions
CONFIGURE_OPTIONS+=     -no-accessibility
CONFIGURE_OPTIONS+=     -no-stl
CONFIGURE_OPTIONS+=     -no-sql-ibase
CONFIGURE_OPTIONS+=     -no-sql-mysql
CONFIGURE_OPTIONS+=     -no-sql-odbc
CONFIGURE_OPTIONS+=     -no-sql-psql
CONFIGURE_OPTIONS+=     -no-sql-sqlite
CONFIGURE_OPTIONS+=     -no-sql-sqlite2
CONFIGURE_OPTIONS+=     -no-qt3support
CONFIGURE_OPTIONS+=     -xmlpatterns
CONFIGURE_OPTIONS+=     -no-phonon
CONFIGURE_OPTIONS+=     -no-phonon-backend
CONFIGURE_OPTIONS+=     -webkit
CONFIGURE_OPTIONS+=     -no-scripttools
CONFIGURE_OPTIONS+=     -no-mmx
CONFIGURE_OPTIONS+=     -no-3dnow
CONFIGURE_OPTIONS+=     -no-sse
CONFIGURE_OPTIONS+=     -no-sse2 
CONFIGURE_OPTIONS+=     -no-sse3
CONFIGURE_OPTIONS+=     -no-ssse3
CONFIGURE_OPTIONS+=     -no-sse4.1
CONFIGURE_OPTIONS+=     -no-sse4.2
CONFIGURE_OPTIONS+=     -no-avx
CONFIGURE_OPTIONS+=     -no-neon
CONFIGURE_OPTIONS+=     -qt-zlib
CONFIGURE_OPTIONS+=     -qt-libtiff
CONFIGURE_OPTIONS+=     -qt-libpng
CONFIGURE_OPTIONS+=     -qt-libmng
CONFIGURE_OPTIONS+=     -qt-libjpeg
CONFIGURE_OPTIONS+=     -graphicssystem raster
CONFIGURE_OPTIONS+=     -nomake tools
CONFIGURE_OPTIONS+=     -nomake examples
CONFIGURE_OPTIONS+=     -nomake demos
CONFIGURE_OPTIONS+=     -nomake docs
CONFIGURE_OPTIONS+=     -nomake translations
CONFIGURE_OPTIONS+=     -no-opengl
CONFIGURE_OPTIONS+=     -no-dbus
CONFIGURE_OPTIONS+=     -no-multimedia
CONFIGURE_OPTIONS+=     -openssl
CONFIGURE_OPTIONS+=     -no-declarative
CONFIGURE_OPTIONS+=     -no-nis
CONFIGURE_OPTIONS+=     -no-cups
CONFIGURE_OPTIONS+=     -no-iconv
CONFIGURE_OPTIONS+=     -no-pch
CONFIGURE_OPTIONS+=     -no-gtkstyle
CONFIGURE_OPTIONS+=     -no-nas-sound
CONFIGURE_OPTIONS+=     -no-sm
CONFIGURE_OPTIONS+=     -no-xshape
CONFIGURE_OPTIONS+=     -no-xinerama
CONFIGURE_OPTIONS+=     -no-xcursor
CONFIGURE_OPTIONS+=     -no-xfixes
CONFIGURE_OPTIONS+=     -no-xrandr
CONFIGURE_OPTIONS+=     -no-mitshm
CONFIGURE_OPTIONS+=     -no-xinput
CONFIGURE_OPTIONS+=     -no-xkb
CONFIGURE_OPTIONS+=     -no-glib
CONFIGURE_OPTIONS+=     -no-openvg
CONFIGURE_OPTIONS+=     -no-xsync
CONFIGURE_OPTIONS+=     -no-audio-backend
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))


build:		$(BUILD_32)

install:	$(INSTALL_32)

