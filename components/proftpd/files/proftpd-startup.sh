#!/usr/xpg4/bin/sh
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

PROFTPD=/ec/bin/proftpd

. /lib/svc/share/smf_include.sh

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

getprop proftpd/startup_options
if [ "${PROPVAL}" != "" ] ; then
        STARTUP_OPTIONS="${PROPVAL} "
fi

getprop proftpd/config_file
if [ "${PROPVAL}" != "" ] ; then
  STARTUP_OPTIONS="-c ${PROPVAL} ${STARTUP_OPTIONS}"
fi

case "$1" in
  start)
    echo "Starting ProFTPd: \c"
    ${PROFTPD} ${STARTUP_OPTIONS}
    echo "proftpd."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

