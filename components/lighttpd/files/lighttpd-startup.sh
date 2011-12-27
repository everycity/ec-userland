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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

. /lib/svc/share/smf_include.sh

# Do not change these defaults below, they will be overwritten
# during the next package upgrade. Instead, set these properties
# via SMF using "svccfg -s lighttpd1.4:default" and setprop

config_file="/ec/etc/lighttpd/1.4/lighttpd.conf"
lighttpd_32_binary="/ec/lib/lighttpd/1.4/bin/lighttpd"
lighttpd_64_binary="/ec/lib/lighttpd/1.4/bin/amd64/lighttpd"
additional_startup_options=""
enable_64bit="false"

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
  getprop lighttpd/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop config_file
varprop additional_startup_options
varprop enable_64bit

if [ "x$enable_64bit" = "xtrue" ] ; then
  lighttpd_binary=$lighttpd_64_binary
else
  lighttpd_binary=$lighttpd_32_binary
fi

case "$1" in
  start)
    echo "Starting lighttpd 1.4: \c"
    $lighttpd_binary $additional_startup_options -f $config_file 
    echo "lighttpd."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

