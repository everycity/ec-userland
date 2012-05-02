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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

. /lib/svc/share/smf_include.sh

PREFIX="/ec"
mongod_binary=$PREFIX/bin/mongod

getprop() {
    PROPVAL=""
    svcprop -q -p $1 ${SMF_FMRI}
    if [ $? -eq 0 ] ; then
	PROPVAL=`svcprop -p $1 ${SMF_FMRI}`
	if [ "${PROPVAL}" = "\"\"" ] ; then
	    PROPVAL=""
	fi
	return
    fi
    return
}

getprop mongodb/enable_64bit
if [ "${PROPVAL}" != "" ] ; then
    enable_64bit=$PROPVAL
fi

if [ "x$enable_64bit" = "xfalse" ] ; then
    mongod_binary=$PREFIX/bin/mongod
else
    mongod_binary=$PREFIX/bin/amd64/mongod
fi


case "$1" in
    start)
	mkdir -p $PREFIX/var/lib/mongo
	mkdir -p $PREFIX/var/log/mongo
	$mongod_binary --config $PREFIX/etc/mongod.conf
    ;;
    *)
	echo "Usage: $0 {start}"
	exit 1
    ;;
esac
