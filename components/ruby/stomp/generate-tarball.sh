#!/bin/sh

GIT=/ec/bin/git

if [ ! -s $4/$2-$3.tar.gz ]; then
    [ -d $2 ] && rm -rf $2
    $GIT clone $1 $2
    cd $2
    $GIT checkout $3
    cd ..
    tar cf - $2 | gzip -9 >$2-$3.tar.gz
    mv $2-$3.tar.gz $4/
fi
