#!/bin/sh
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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

ZTYPE="$2"

if [ $BITS = 32 ]; then
    ISAINFO=
else
    ISAINFO=/$MACH
fi

if [ $MPM = prefork ] ; then
    MPM=
fi

for i in patches.templates/*.${ZTYPE} ; do
    cd $1
    cat $COMPONENT_DIR/$i | \
    sed s,::ISAINFO::,$ISAINFO,g | \
    sed s,::MPM::,/$MPM,g | \
    sed s,::BITS::,$BITS,g | \
    gpatch -p1
done
