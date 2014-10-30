#!/bin/sh

# Copyright (C) EveryCity 2011
# Written by Alasdair Lumsden <al@everycity.co.uk> - 2011-04-03

. /lib/svc/share/smf_include.sh

STARTUPOPTS="-u noaccess -l 127.0.0.1 -m 128M -d"

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

getprop memcached/enable_64bit
if [ "${PROPVAL}" = "true" ] ; then
  MEMCACHEDBINARY="/ec/bin/amd64/memcached"
  getprop memcached/memcached_binary64
  if [ "${PROPVAL}" != "" ] ; then
    MEMCACHEDBINARY="${PROPVAL}"
  fi
else
  MEMCACHEDBINARY="/ec/bin/memcached"
  getprop memcached/memcached_binary
  if [ "${PROPVAL}" != "" ] ; then
    MEMCACHEDBINARY="${PROPVAL}"
  fi
fi

getprop memcached/startup_options
if [ "${PROPVAL}" != "" ] ; then
  STARTUPOPTS="${PROPVAL}"
fi

case "$1" in
  start)
    echo "Starting memcached: \c"
    $MEMCACHEDBINARY $STARTUPOPTS
    echo "memcached."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

