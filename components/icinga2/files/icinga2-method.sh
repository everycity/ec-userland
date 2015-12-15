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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

. /lib/svc/share/smf_include.sh

# Do not change these defaults below, they will be overwritten
# during the next package upgrade. Instead, set these properties
# via SMF using "svccfg -s icinga2:default" and setprop

binary="/ec/lib/icinga2/sbin/icinga2"
options="--no-stack-rlimit daemon -d -e /ec/var/log/icinga2/icinga2.err"

getprop() {
    PROPVAL=""
    svcprop -q -p $1 ${SMF_FMRI}
    if [ $? -eq 0 ] ; then
        PROPVAL=`svccfg -s ${SMF_FMRI} listprop $1 | \
		/usr/bin/nawk '{ for (i = 3; i <= NF; i++) printf $i" " }' | \
		/usr/bin/nawk '{ sub(/^\"/,""); sub(/\"[ \t]*$/,""); print }' | \
		/usr/bin/sed 's/[ ]*$//g'`
        if [ "${PROPVAL}" = "\"\"" ] ; then
            PROPVAL=""
        fi
        return
    fi
    return
}

varprop() {
  getprop icinga/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop binary
varprop options

case "$1" in
  start)
    echo "Starting Icinga2: \c"
    $binary $options
    echo "icinga2."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0
