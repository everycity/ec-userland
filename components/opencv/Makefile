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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		opencv
COMPONENT_FMRI=         library/opencv
COMPONENT_VERSION=      2.4.9
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://opencv.org/"
COMPONENT_SUMMARY=	OpenCV is an open source computer vision and machine learning software library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).zip
COMPONENT_ARCHIVE_HASH=	sha256:803010848154988e9cbda8b3fa857fcbb27382c2946ed729e1a7e40600bb4c71
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip/download

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

LDFLAGS += -lz

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS="$(CFLAGS)"

CMAKE_OPTIONS+=	-D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$(USRDIR)

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += export LDFLAGS="$(LDFLAGS)";
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR);

build:		$(BUILD_32_and_64)

COMPONENT_PRE_INSTALL_ACTION_32+=	( cd $(@D) ; \
	/ec/bin/sed -i -e 's!libdir=!libdir=$${prefix}/lib!' unix-install/opencv.pc ; )
COMPONENT_PRE_INSTALL_ACTION_64+=	( cd $(@D) ; \
	for file in \
		apps/haartraining/cmake_install.cmake \
		apps/traincascade/cmake_install.cmake ; do \
		/ec/bin/sed -i -e 's!$${CMAKE_INSTALL_PREFIX}/bin!$${CMAKE_INSTALL_PREFIX}/bin/$(MACH64)!' \
			-e 's!RPATH "/ec64/lib!RPATH "/ec64/lib/$(MACH64)!' \
			$$file ; \
		done ; \
	for lib in \
		modules/calib3d/cmake_install.cmake \
		modules/contrib/cmake_install.cmake \
		modules/core/cmake_install.cmake \
		modules/features2d/cmake_install.cmake \
		modules/flann/cmake_install.cmake \
		modules/gpu/cmake_install.cmake \
		modules/highgui/cmake_install.cmake \
		modules/imgproc/cmake_install.cmake \
		modules/legacy/cmake_install.cmake \
		modules/ml/cmake_install.cmake \
		modules/nonfree/cmake_install.cmake \
		modules/objdetect/cmake_install.cmake \
		modules/ocl/cmake_install.cmake \
		modules/photo/cmake_install.cmake \
		modules/stitching/cmake_install.cmake \
		modules/superres/cmake_install.cmake \
		modules/video/cmake_install.cmake \
		modules/videostab/cmake_install.cmake ; do \
		/ec/bin/sed -i -e 's!$${CMAKE_INSTALL_PREFIX}/lib!$${CMAKE_INSTALL_PREFIX}/lib/$(MACH64)!' \
			-e 's!RPATH "/ec64/lib!RPATH "/ec64/lib/$(MACH64)!' \
			$$lib ; \
		done ; \
	/ec/bin/sed -i -e 's!$${CMAKE_INSTALL_PREFIX}/lib!$${CMAKE_INSTALL_PREFIX}/lib/$(MACH64)!' \
		cmake_install.cmake ; \
	/ec/bin/sed -i -e 's!libdir=!libdir=$${prefix}/lib/$(MACH64)!' unix-install/opencv.pc ; \
	)
COMPONENT_PRE_INSTALL_ACTION=	$(COMPONENT_PRE_INSTALL_ACTION_$(BITS))

install:	$(INSTALL_32_and_64)

