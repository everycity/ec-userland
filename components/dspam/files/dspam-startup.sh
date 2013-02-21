#!/bin/sh
#
# Copyright (c) EveryCity 2011-2013
#

. /lib/svc/share/smf_include.sh

BINARY="/ec/bin/dspam"

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

getprop dspam/enable_64bit
if [ "${PROPVAL}" != "" ] ; then
    case ${PROPVAL} in
    true|1)
        # Check if the system architecture supports 64-bit applications
        PLATFORM=`isainfo -b`
        if [ "${PLATFORM}" != "64" ]; then
            echo "This system is not capable of supporting 64-bit applications."
            echo "Set \"enable_64bit\" property value to \"false\" to start the 32-bit server."
            exit $SMF_EXIT_ERR_CONFIG
        fi

        # 64 bit
        BINARY=/ec/bin/amd64/dspam
        ;;
    false|0) 
        # 32 bit
        PLATFORM_DIR=/ec/bin/dspam
        ;;
    *)
        # Invalid value for "bitness"
        echo "\"bitness\" property value is invalid.  Starting the server in 32-bit mode"
        PLATFORM_DIR=/ec/bin/dspam
        ;;
    esac
fi

case "$1" in
  start)
    echo "Starting DSpam: \c"
    $BINARY --daemon
    echo "dspam."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

