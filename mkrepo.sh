#!/bin/sh

MACH=`uname -p`

[ -d $MACH/repo ] && mv $MACH/repo $MACH/repo.`date +%Y-%m-%d-%H:%M:%S`
[ -d $MACH ] || mkdir $MACH

pkgrepo create $MACH/repo
pkgrepo set -s $MACH/repo publisher/prefix=s10.pkg.ec
