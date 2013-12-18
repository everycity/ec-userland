#!/bin/bash

set -ex

if [[ -z $4 ]]; then
    echo Not enough parameters. Exiting.
    exit 1
fi

HG=/ec/bin/hg

REPOURL=$1
DIRNAME=$2
CHANGESET=$3
DESTDIR=$4

if [ ! -s $DESTDIR/$DIRNAME.tar.bz2 ]; then
    [ -d $DIRNAME ] && rm -rf $DIRNAME
    $HG clone $REPOURL $DIRNAME
    cd $DIRNAME
    $HG update $CHANGESET
#    rm -rf .hg
    cd ..
    tar cf - $DIRNAME | bzip2 -9 >$DIRNAME.tar.bz2
    mv $DIRNAME.tar.bz2 $DESTDIR
    rm -rf $DIRNAME
fi
