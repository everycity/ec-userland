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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openoffice
COMPONENT_FMRI=	 yeahright/hahaha
COMPONENT_VERSION=      3.4.1
COMPONENT_REVISION=	1435053
COMPONENT_LICENSE=      
COMPONENT_PROJECT_URL=  
COMPONENT_SUMMARY=	
COMPONENT_SRC=		aoo-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-incubating-r$(COMPONENT_REVISION)-src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5d6cb607675c60cab52a3f78a15d288e0aae7e62d4076a216b148bfd47215085
COMPONENT_ARCHIVE_URL=	http://archive.apache.org/dist/incubator/ooo/$(COMPONENT_VERSION)/source/$(COMPONENT_ARCHIVE)

# To regenerate list of external deps, you can do something along the lines of:
#
# # cat aoo-3.4.1/main/external_deps.lst  | grep -v if | sed 's/^[ ]*//g' | egrep '^MD5|^name' | \
#      sed 's/.*= //g' | xargs -n2 | sed 's/ /:/g' > /tmp/a
# # j=1 ; for i in `cat /tmp/a` ; do md5=`echo $i | awk -F: '{print $1}'` ; name=`echo $i | \ 
#      awk -F: '{print $2}'` ; echo COMPONENT_ARCHIVE_$j=$md5-$name ; echo COMPONENT_ARCHIVE_HASH_$j=md5:$md5 ; \
#      echo "COMPONENT_ARCHIVE_URL_$j=http://dlc.everycity.com/ec-userland/source-archives/\$(COMPONENT_ARCHIVE_$j)" ;
#      echo ; let j=j+1 ; done
#
# Note: A few entries in external_deps.list need reordering to make the above work

COMPONENT_ARCHIVE_1=0168229624cfac409e766913506961a8-ucpp-1.3.2.tar.gz
COMPONENT_ARCHIVE_HASH_1=md5:0168229624cfac409e766913506961a8
COMPONENT_ARCHIVE_URL_1=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_1)

COMPONENT_ARCHIVE_2=067201ea8b126597670b5eff72e1f66c-mythes-1.2.0.tar.gz
COMPONENT_ARCHIVE_HASH_2=md5:067201ea8b126597670b5eff72e1f66c
COMPONENT_ARCHIVE_URL_2=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_2)

COMPONENT_ARCHIVE_3=128cfc86ed5953e57fe0f5ae98b62c2e-libtextcat-2.2.tar.gz
COMPONENT_ARCHIVE_HASH_3=md5:128cfc86ed5953e57fe0f5ae98b62c2e
COMPONENT_ARCHIVE_URL_3=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_3)

COMPONENT_ARCHIVE_4=17410483b5b5f267aa18b7e00b65e6e0-hsqldb_1_8_0.zip
COMPONENT_ARCHIVE_HASH_4=md5:17410483b5b5f267aa18b7e00b65e6e0
COMPONENT_ARCHIVE_URL_4=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_4)

COMPONENT_ARCHIVE_5=1756c4fa6c616ae15973c104cd8cb256-Adobe-Core35_AFMs-314.tar.gz
COMPONENT_ARCHIVE_HASH_5=md5:1756c4fa6c616ae15973c104cd8cb256
COMPONENT_ARCHIVE_URL_5=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_5)

COMPONENT_ARCHIVE_6=48d8169acc35f97e05d8dcdfd45be7f2-lucene-2.3.2.tar.gz
COMPONENT_ARCHIVE_HASH_6=md5:48d8169acc35f97e05d8dcdfd45be7f2
COMPONENT_ARCHIVE_URL_6=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_6)

COMPONENT_ARCHIVE_7=1f24ab1d39f4a51faf22244c94a6203f-xmlsec1-1.2.14.tar.gz
COMPONENT_ARCHIVE_HASH_7=md5:1f24ab1d39f4a51faf22244c94a6203f
COMPONENT_ARCHIVE_URL_7=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_7)

COMPONENT_ARCHIVE_8=284e768eeda0e2898b0d5bf7e26a016e-raptor-1.4.18.tar.gz
COMPONENT_ARCHIVE_HASH_8=md5:284e768eeda0e2898b0d5bf7e26a016e
COMPONENT_ARCHIVE_URL_8=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_8)

COMPONENT_ARCHIVE_9=ca66e26082cab8bb817185a116db809b-redland-1.0.8.tar.gz
COMPONENT_ARCHIVE_HASH_9=md5:ca66e26082cab8bb817185a116db809b
COMPONENT_ARCHIVE_URL_9=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_9)

COMPONENT_ARCHIVE_10=fca8706f2c4619e2fa3f8f42f8fc1e9d-rasqal-0.9.16.tar.gz
COMPONENT_ARCHIVE_HASH_10=md5:fca8706f2c4619e2fa3f8f42f8fc1e9d
COMPONENT_ARCHIVE_URL_10=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_10)

COMPONENT_ARCHIVE_11=2c9b0f83ed5890af02c0df1c1776f39b-commons-httpclient-3.1-src.tar.gz
COMPONENT_ARCHIVE_HASH_11=md5:2c9b0f83ed5890af02c0df1c1776f39b
COMPONENT_ARCHIVE_URL_11=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_11)

COMPONENT_ARCHIVE_12=af3c3acf618de6108d65fcdc92b492e1-commons-codec-1.3-src.tar.gz
COMPONENT_ARCHIVE_HASH_12=md5:af3c3acf618de6108d65fcdc92b492e1
COMPONENT_ARCHIVE_URL_12=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_12)

COMPONENT_ARCHIVE_13=2f6ecca935948f7db92d925d88d0d078-icu4c-4_0_1-src.tgz
COMPONENT_ARCHIVE_HASH_13=md5:2f6ecca935948f7db92d925d88d0d078
COMPONENT_ARCHIVE_URL_13=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_13)

COMPONENT_ARCHIVE_14=3b179ed18f65c43141528aa6d2440db4-serf-1.0.0.tar.bz2
COMPONENT_ARCHIVE_HASH_14=md5:3b179ed18f65c43141528aa6d2440db4
COMPONENT_ARCHIVE_URL_14=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_14)

COMPONENT_ARCHIVE_15=3c219630e4302863a9a83d0efde889db-commons-logging-1.1.1-src.tar.gz
COMPONENT_ARCHIVE_HASH_15=md5:3c219630e4302863a9a83d0efde889db
COMPONENT_ARCHIVE_URL_15=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_15)

COMPONENT_ARCHIVE_16=2ae988b339daec234019a7066f96733e-commons-lang-2.3-src.tar.gz
COMPONENT_ARCHIVE_HASH_16=md5:2ae988b339daec234019a7066f96733e
COMPONENT_ARCHIVE_URL_16=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_16)

COMPONENT_ARCHIVE_17=63ddc5116488985e820075e65fbe6aa4-openssl-0.9.8o.tar.gz
COMPONENT_ARCHIVE_HASH_17=md5:63ddc5116488985e820075e65fbe6aa4
COMPONENT_ARCHIVE_URL_17=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_17)

COMPONENT_ARCHIVE_18=97262fe54dddaf583eaaee3497a426e1-apr-1.4.5.tar.gz
COMPONENT_ARCHIVE_HASH_18=md5:97262fe54dddaf583eaaee3497a426e1
COMPONENT_ARCHIVE_URL_18=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_18)

COMPONENT_ARCHIVE_19=666a5d56098a9debf998510e304c8095-apr-util-1.4.1.tar.gz
COMPONENT_ARCHIVE_HASH_19=md5:666a5d56098a9debf998510e304c8095
COMPONENT_ARCHIVE_URL_19=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_19)

COMPONENT_ARCHIVE_20=c441926f3a552ed3e5b274b62e86af16-STLport-4.0.tar.gz
COMPONENT_ARCHIVE_HASH_20=md5:c441926f3a552ed3e5b274b62e86af16
COMPONENT_ARCHIVE_URL_20=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_20)

COMPONENT_ARCHIVE_21=18f577b374d60b3c760a3a3350407632-STLport-4.5.tar.gz
COMPONENT_ARCHIVE_HASH_21=md5:18f577b374d60b3c760a3a3350407632
COMPONENT_ARCHIVE_URL_21=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_21)

COMPONENT_ARCHIVE_22=7376930b0d3f3d77a685d94c4a3acda8-STLport-4.5-0119.tar.gz
COMPONENT_ARCHIVE_HASH_22=md5:7376930b0d3f3d77a685d94c4a3acda8
COMPONENT_ARCHIVE_URL_22=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_22)

COMPONENT_ARCHIVE_23=7740a8ec23878a2f50120e1faa2730f2-libxml2-2.7.6.tar.gz
COMPONENT_ARCHIVE_HASH_23=md5:7740a8ec23878a2f50120e1faa2730f2
COMPONENT_ARCHIVE_URL_23=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_23)

COMPONENT_ARCHIVE_24=e61d0364a30146aaa3001296f853b2b9-libxslt-1.1.26.tar.gz
COMPONENT_ARCHIVE_HASH_24=md5:e61d0364a30146aaa3001296f853b2b9
COMPONENT_ARCHIVE_URL_24=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_24)

COMPONENT_ARCHIVE_25=7e4e73c21f031d5a4c93c128baf7fd75-apache-tomcat-5.5.35-src.tar.gz
COMPONENT_ARCHIVE_HASH_25=md5:7e4e73c21f031d5a4c93c128baf7fd75
COMPONENT_ARCHIVE_URL_25=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_25)

COMPONENT_ARCHIVE_26=980143f96b3f6ce45d2e4947da21a5e9-stax-src-1.2.0.zip
COMPONENT_ARCHIVE_HASH_26=md5:980143f96b3f6ce45d2e4947da21a5e9
COMPONENT_ARCHIVE_URL_26=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_26)

COMPONENT_ARCHIVE_27=a2c10c04f396a9ce72894beb18b4e1f9-jpeg-8c.tar.gz
COMPONENT_ARCHIVE_HASH_27=md5:a2c10c04f396a9ce72894beb18b4e1f9
COMPONENT_ARCHIVE_URL_27=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_27)

COMPONENT_ARCHIVE_28=a7983f859eafb2677d7ff386a023bc40-xsltml_2.1.2.zip
COMPONENT_ARCHIVE_HASH_28=md5:a7983f859eafb2677d7ff386a023bc40
COMPONENT_ARCHIVE_URL_28=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_28)

COMPONENT_ARCHIVE_29=bc702168a2af16869201dbe91e46ae48-LICENSE_Python-2.6.1
COMPONENT_ARCHIVE_HASH_29=md5:bc702168a2af16869201dbe91e46ae48
COMPONENT_ARCHIVE_URL_29=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_29)

COMPONENT_ARCHIVE_30=e81c2f0953aa60f8062c05a4673f2be0-Python-2.6.1.tar.bz2
COMPONENT_ARCHIVE_HASH_30=md5:e81c2f0953aa60f8062c05a4673f2be0
COMPONENT_ARCHIVE_URL_30=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_30)

COMPONENT_ARCHIVE_31=c735eab2d659a96e5a594c9e8541ad63-zlib-1.2.5.tar.gz
COMPONENT_ARCHIVE_HASH_31=md5:c735eab2d659a96e5a594c9e8541ad63
COMPONENT_ARCHIVE_URL_31=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_31)

COMPONENT_ARCHIVE_32=cf8a6967f7de535ae257fa411c98eb88-mdds_0.3.0.tar.bz2
COMPONENT_ARCHIVE_HASH_32=md5:cf8a6967f7de535ae257fa411c98eb88
COMPONENT_ARCHIVE_URL_32=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_32)

COMPONENT_ARCHIVE_33=ea91f2fb4212a21d708aced277e6e85a-vigra1.4.0.tar.gz
COMPONENT_ARCHIVE_HASH_33=md5:ea91f2fb4212a21d708aced277e6e85a
COMPONENT_ARCHIVE_URL_33=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_33)

COMPONENT_ARCHIVE_34=ecb2e37e45c9933e2a963cabe03670ab-curl-7.19.7.tar.gz
COMPONENT_ARCHIVE_HASH_34=md5:ecb2e37e45c9933e2a963cabe03670ab
COMPONENT_ARCHIVE_URL_34=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_34)

COMPONENT_ARCHIVE_35=ee8b492592568805593f81f8cdf2a04c-expat-2.0.1.tar.gz
COMPONENT_ARCHIVE_HASH_35=md5:ee8b492592568805593f81f8cdf2a04c
COMPONENT_ARCHIVE_URL_35=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_35)

COMPONENT_ARCHIVE_36=f872f4ac066433d8ff92f5e316b36ff9-dejavu-fonts-ttf-2.33.zip
COMPONENT_ARCHIVE_HASH_36=md5:f872f4ac066433d8ff92f5e316b36ff9
COMPONENT_ARCHIVE_URL_36=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_36)

COMPONENT_ARCHIVE_37=fcc6df1160753d0b8c835d17fdeeb0a7-boost_1_39_0.tar.gz
COMPONENT_ARCHIVE_HASH_37=md5:fcc6df1160753d0b8c835d17fdeeb0a7
COMPONENT_ARCHIVE_URL_37=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_37)

COMPONENT_ARCHIVE_38=fdb27bfe2dbe2e7b57ae194d9bf36bab-SampleICC-1.3.2.tar.gz
COMPONENT_ARCHIVE_HASH_38=md5:fdb27bfe2dbe2e7b57ae194d9bf36bab
COMPONENT_ARCHIVE_URL_38=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_38)

COMPONENT_ARCHIVE_39=2b5f1ca58d6ef30f18f1415b65bed81c-CoinMP-1.6.0.tgz
COMPONENT_ARCHIVE_HASH_39=md5:2b5f1ca58d6ef30f18f1415b65bed81c
COMPONENT_ARCHIVE_URL_39=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_39)

COMPONENT_ARCHIVE_40=35efabc239af896dfb79be7ebdd6e6b9-gentiumbasic-fonts-1.10.zip
COMPONENT_ARCHIVE_HASH_40=md5:35efabc239af896dfb79be7ebdd6e6b9
COMPONENT_ARCHIVE_URL_40=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_40)

COMPONENT_ARCHIVE_41=48a9f787f43a09c0a9b7b00cd1fddbbf-hyphen-2.7.1.tar.gz
COMPONENT_ARCHIVE_HASH_41=md5:48a9f787f43a09c0a9b7b00cd1fddbbf
COMPONENT_ARCHIVE_URL_41=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_41)

COMPONENT_ARCHIVE_42=61f59e4110781cbe66b46449eadac231-croscorefonts-1.21.0.tar.gz
COMPONENT_ARCHIVE_HASH_42=md5:61f59e4110781cbe66b46449eadac231
COMPONENT_ARCHIVE_URL_42=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_42)

COMPONENT_ARCHIVE_43=3121aaf3e13e5d88dfff13fb4a5f1ab8-hunspell-1.3.2.tar.gz
COMPONENT_ARCHIVE_HASH_43=md5:3121aaf3e13e5d88dfff13fb4a5f1ab8
COMPONENT_ARCHIVE_URL_43=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_43)

COMPONENT_ARCHIVE_44=99d94103662a8d0b571e247a77432ac5-rhino1_7R3.zip
COMPONENT_ARCHIVE_HASH_44=md5:99d94103662a8d0b571e247a77432ac5
COMPONENT_ARCHIVE_URL_44=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_44)

COMPONENT_ARCHIVE_45=a169ab152209200a7bad29a275cb0333-seamonkey-1.1.14.source.tar.gz
COMPONENT_ARCHIVE_HASH_45=md5:a169ab152209200a7bad29a275cb0333
COMPONENT_ARCHIVE_URL_45=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_45)

COMPONENT_ARCHIVE_46=b92261a5679276c400555004937af965-nss-3.12.6-with-nspr-4.8.4.tar.gz
COMPONENT_ARCHIVE_HASH_46=md5:b92261a5679276c400555004937af965
COMPONENT_ARCHIVE_URL_46=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_46)

COMPONENT_ARCHIVE_47=24be19595acad0a2cae931af77a0148a-LICENSE_source-9.0.0.7-bj.html
COMPONENT_ARCHIVE_HASH_47=md5:24be19595acad0a2cae931af77a0148a
COMPONENT_ARCHIVE_URL_47=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_47)

COMPONENT_ARCHIVE_48=48470d662650c3c074e1c3fabbc67bbd-README_source-9.0.0.7-bj.txt
COMPONENT_ARCHIVE_HASH_48=md5:48470d662650c3c074e1c3fabbc67bbd
COMPONENT_ARCHIVE_URL_48=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_48)

COMPONENT_ARCHIVE_49=ada24d37d8d638b3d8a9985e80bc2978-source-9.0.0.7-bj.zip
COMPONENT_ARCHIVE_HASH_49=md5:ada24d37d8d638b3d8a9985e80bc2978
COMPONENT_ARCHIVE_URL_49=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_49)

COMPONENT_ARCHIVE_50=377a60170e5185eb63d3ed2fae98e621-README_silgraphite-2.3.1.txt
COMPONENT_ARCHIVE_HASH_50=md5:377a60170e5185eb63d3ed2fae98e621
COMPONENT_ARCHIVE_URL_50=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_50)

COMPONENT_ARCHIVE_51=d35724900f6a4105550293686688bbb3-silgraphite-2.3.1.tar.gz
COMPONENT_ARCHIVE_HASH_51=md5:d35724900f6a4105550293686688bbb3
COMPONENT_ARCHIVE_URL_51=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_51)

COMPONENT_ARCHIVE_52=ea570af93c284aa9e5621cd563f54f4d-bsh-2.0b1-src.tar.gz
COMPONENT_ARCHIVE_HASH_52=md5:ea570af93c284aa9e5621cd563f54f4d
COMPONENT_ARCHIVE_URL_52=http://dlc.everycity.com/ec-userland/source-archives/$(COMPONENT_ARCHIVE_52)

NUM_ARCHIVES=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

SUNSTUDIO_DIR="/opt/solarisstudio12.3/"
PATH=$(COMPONENT_DIR)/build/bin:/opt/aoo-dmake/bin:$(SUNSTUDIO_DIR)/bin:/ec/bin:/usr/bin

CC=$(SUNSTUDIO_DIR)/bin/cc
CXX=$(SUNSTUDIO_DIR)/bin/CC
GNUMAKE=$(ECPREFIX)/bin/make
TAR=$(ECPREFIX)/bin/tar

COMPONENT_BUILD_ENV=	CONFIG_SHELL="$(CONFIG_SHELL)"
COMPONENT_BUILD_ENV+=	PATH="$(PATH)"
COMPONENT_BUILD_ENV+=	CC="$(CC)"
COMPONENT_BUILD_ENV+=	CXX="$(CXX)"
COMPONENT_BUILD_ENV+=	CFLAGS="-I$(ECPREFIX)/include"
COMPONENT_BUILD_ENV+=	CPPFLAGS="-I$(ECPREFIX)/include"
COMPONENT_BUILD_ENV+=	CXXFLAGS="-I$(ECPREFIX)/include"
COMPONENT_BUILD_ENV+=	LDFLAGS="-L/ec/lib -R/ec/lib"
COMPONENT_BUILD_ENV+=	GNUMAKE=$(ECPREFIX)/bin/make
COMPONENT_BUILD_ENV+=	TAR=$(ECPREFIX)/bin/tar
COMPONENT_BUILD_ENV+=	USE_XINERAMA=NO
COMPONENT_BUILD_ENV+=	X_LIBS='-L/ec/lib -R/ec/lib'

# Set up PKG_CONFIG to use correct version
COMPONENT_BUILD_ENV.32+=      PKG_CONFIG="$(ECPREFIX)/bin/pkg-config"
COMPONENT_BUILD_ENV.64+=      PKG_CONFIG="$(ECPREFIX)/bin/$(MACH64)/pkg-config"

COMPONENT_BUILD_ENV += $(COMPONENT_BUILD_ENV.$(BITS))

COMPONENT_PREP_ACTION= ( cd $(@D)/main && autoconf && \
	mkdir -p $(@D)/ext_sources/ && \
	for i in $(ARCHIVES) ; do rm -f $(@D)/ext_sources/$$i && \
	 ln -s $(USERLAND_ARCHIVES)/$$i $(@D)/ext_sources/$$i ; done && \
	pkg list library/icu > /dev/null 2>&1 ; if [ $? -eq 0 ] ; \
	then echo Error: library/icu must not be installed to build OpenOffice ; fi )

# Configure OpenOffice
$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D) && \
	 $(CLONEY) $(SOURCE_DIR) $(@D) && \
	 $(MKDIR) $(COMPONENT_DIR)/bin && \
	 ln -s /usr/bin/strip $(COMPONENT_DIR)/bin/strip && \
	 cp $(COMPONENT_DIR)/files/unowinreg.dll $(@D)/main/external/unowinreg/)
	(cd $(@D)/main && $(ENV) $(COMPONENT_BUILD_ENV) $(CONFIG_SHELL) \
		./configure $(CONFIGURE_OPTIONS))
	$(TOUCH) $@

# Build OpenOffice
$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	(cd $(@D)/main/instsetoo_native && export $(COMPONENT_BUILD_ENV) && source ../SolarisX86Env.Set.sh && \
		../solenv/bin/build.pl --all -P4 -- -P4 -s )
	$(TOUCH) $@


CONFIGURE_OPTIONS+= --with-gnu-patch=/ec/bin/gpatch
CONFIGURE_OPTIONS+= --with-gnu-cp=/ec/bin/cp
CONFIGURE_OPTIONS+= --with-system-jpeg
CONFIGURE_OPTIONS+= --with-system-libxml
CONFIGURE_OPTIONS+= --with-jdk-home=/ec/jdk/active
CONFIGURE_OPTIONS+= --with-ant-home=/ec/share
CONFIGURE_OPTIONS+= --disable-Xaw
CONFIGURE_OPTIONS+= --disable-randr
CONFIGURE_OPTIONS+= --disable-report-builder
CONFIGURE_OPTIONS+= --disable-systray
CONFIGURE_OPTIONS+= --enable-category-b
CONFIGURE_OPTIONS+= --enable-minimizer
CONFIGURE_OPTIONS+= --enable-presenter-console
CONFIGURE_OPTIONS+= --enable-pdfimport
CONFIGURE_OPTIONS+= --enable-wiki-publisher
CONFIGURE_OPTIONS+= --with-lang=en
CONFIGURE_OPTIONS+= --with-dict=ALL
CONFIGURE_OPTIONS+= --with-build-version=EveryCity
CONFIGURE_OPTIONS+= --with-package-format=installed
CONFIGURE_OPTIONS+= --disable-binfilter
CONFIGURE_OPTIONS+= --with-dmake=/opt/aoo-dmake/bin/dmake
CONFIGURE_OPTIONS+= --disable-cups
CONFIGURE_OPTIONS+= --with-gperf=/ec/bin/gperf
CONFIGURE_OPTIONS+= --disable-mozilla
CONFIGURE_OPTIONS+= --disable-gtk
CONFIGURE_OPTIONS+= --without-junit


build:		$(BUILD_32)

install:	$(INSTALL_32)

