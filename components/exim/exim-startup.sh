#!/bin/sh

# Copyright (C) EveryCity 2011
# Written by Alasdair Lumsden <al@everycity.co.uk> - 2011-04-03

. /lib/svc/share/smf_include.sh

EXIMBINARY="/ec/bin/exim"
STARTUPOPTS="-bd -q15m"

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

getprop exim/exim_binary
if [ "${PROPVAL}" != "" ] ; then
  EXIMBINARY="${PROPVAL}"
fi

getprop exim/startup_options
if [ "${PROPVAL}" != "" ] ; then
  STARTUPOPTS="${PROPVAL}"
fi

getprop exim/configuration_file
if [ "${PROPVAL}" != "" ] ; then
  STARTUPOPTS="-C ${PROPVAL} ${STARTUPOPTS}"
fi

case "$1" in
  start)
    echo "Starting Exim: \c"
    $EXIMBINARY $STARTUPOPTS
    echo "exim."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

