#!/usr/bin/bash

set -ex

GIT=`which git`

[[ -n $4 ]] && USERLAND_ARCHIVES=${4}/ || USERLAND_ARCHIVES=

if [ ! -s ${USERLAND_ARCHIVES}$2-$3.tar.bz2 ]; then
    [ -d $2 ] && rm -rf $2
    $GIT clone $1 $2
    cd $2
    $GIT checkout $3
    cd ..
    tar cf - $2 | bzip2 -9 >${USERLAND_ARCHIVES}$2-$3.tar.bz2
    rm -rf $2
fi

