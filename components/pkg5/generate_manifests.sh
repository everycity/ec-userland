#!/bin/sh

cp pkg-gate/src/pkg/license_files/* .

for i in \
library%2Fpython-2%2Fcherrypy.p5m \
library%2Fpython-2%2Fcoverage.p5m \
library%2Fpython-2%2Fm2crypto.p5m \
library%2Fpython-2%2Fmako.p5m \
library%2Fpython-2%2Fply.p5m \
library%2Fpython-2%2Fpybonjour.p5m \
library%2Fpython-2%2Fpycurl.p5m \
package%2Fpkg.p5m; \
do
	cat pkg-gate/src/pkg/manifests/$i | \
	gsed s/set\ name=info.classification/\#set\ name=info.classification/ | \
	ggrep -v \^legacy | \
	ggrep -v \^depend | \
	gsed s/path=usr/path=ec/ | \
	gsed s%path=$\(PYDIR\)%path=ec/lib/python2.6% | \
	gsed s%path=$\(PYDIRVP\)%path=ec/lib/python2.6/vendor-packages% | \
	gsed s%$\(PKGVERS_BUILTON\)-$\(PKGVERS_BRANCH\)%$\(BUILD_VERSION\)% | \
	gsed s%$\(PKGVERS\)%$\(IPS_COMPONENT_VERSION\),$\(BUILD_VERSION\)% | \
	gsed s%$\(ARCH\)%$\(MACH\)% \
	> $i
done

S=pkg-gate/src/setup.py

CPVER=`awk '/^CPVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${CPVER}%" library%2Fpython-2%2Fcherrypy.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${CPVER}%" library%2Fpython-2%2Fcherrypy.p5m

COVVER=`awk '/^COVVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${COVVER}%" library%2Fpython-2%2Fcoverage.p5m

COVPVER=`awk '/^COVPVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(PKG_VER\\)%${COVPVER}%" library%2Fpython-2%2Fcoverage.p5m

M2CVER=`awk '/^M2CVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${M2CVER}%" library%2Fpython-2%2Fm2crypto.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${M2CVER}%" library%2Fpython-2%2Fm2crypto.p5m

MAKOVER=`awk '/^MAKOVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${MAKOVER}%" library%2Fpython-2%2Fmako.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${MAKOVER}%" library%2Fpython-2%2Fmako.p5m

PLYVER=`awk '/^PLYVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${PLYVER}%" library%2Fpython-2%2Fply.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${PLYVER}%" library%2Fpython-2%2Fply.p5m

PBJVER=`awk '/^PBJVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${PBJVER}%" library%2Fpython-2%2Fpybonjour.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${PBJVER}%" library%2Fpython-2%2Fpybonjour.p5m

PCVER=`awk '/^PCVER/ { print $3 }' < $S|tr -d \'`
perl -pi -e "s%\\$\\(SOURCE_VER\\)%${PCVER}%" library%2Fpython-2%2Fpycurl.p5m
perl -pi -e "s%\\$\\(PKG_VER\\)%${PCVER}%" library%2Fpython-2%2Fpycurl.p5m
