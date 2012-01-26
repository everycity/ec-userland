#!/bin/sh

MACH=`uname -p`
[ "x$1" = "x" ] && repo_prefix=s10.pkg.ec || repo_prefix=$1

[ -d $MACH/repo ] && mv $MACH/repo $MACH/repo.`date +%Y-%m-%d-%H:%M:%S`
[ -d $MACH ] || mkdir $MACH

pkgrepo create $MACH/repo
pkgrepo set -s $MACH/repo publisher/prefix=$repo_prefix
