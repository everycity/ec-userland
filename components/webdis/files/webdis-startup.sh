#!/bin/sh

# Copyright 2015 EveryCity Ltd. All Rights Reserved.

. /lib/svc/share/smf_include.sh

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

getprop webdis/enable_64bit
if [ "${PROPVAL}" = "true" ] ; then
  MEMCACHEDBINARY="/ec/bin/amd64/webdis"
  getprop webdis/webdis_binary64
  if [ "${PROPVAL}" != "" ] ; then
    MEMCACHEDBINARY="${PROPVAL}"
  fi
else
  MEMCACHEDBINARY="/ec/bin/webdis"
  getprop webdis/webdis_binary
  if [ "${PROPVAL}" != "" ] ; then
    MEMCACHEDBINARY="${PROPVAL}"
  fi
fi

case "$1" in
  start)
    echo "Starting webdis: \c"
    $MEMCACHEDBINARY
    echo "webdis."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0
