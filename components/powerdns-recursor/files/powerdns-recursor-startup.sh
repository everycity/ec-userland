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

. /lib/svc/share/smf_include.sh

# Set a reasonable ulimit
ulimit -n 65535

# Allow more than 256 file descriptors on Solaris 10 32bit
# See the following URL for a full description:
# http://developers.sun.com/solaris/articles/stdio_256.html
export LD_PRELOAD_32=/usr/lib/extendedFILE.so.1

PATHPREFIX=/ec

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

getprop powerdns/enable_64bit
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
        PLATFORM_DIR=/amd64
        ;;
    false|0)
        # 32 bit
        PLATFORM_DIR=
        ;;
    *)
        # Invalid value for "bitness"
        echo "\"bitness\" property value is invalid. Starting the server in 32-bit mode"
        PLATFORM_DIR=
        ;;
    esac
fi

POWERDNS_BIN=${PATHPREFIX}/bin${PLATFORM_DIR}

getprop powerdns/startup_options
if [ "${PROPVAL}" != "" ] ; then
        echo startupoptions set
        echo val=${PROPVAL}
        STARTUP_OPTIONS="${PROPVAL} "
fi

getprop powerdns/config_dir
if [ "${PROPVAL}" != "" ] ; then
  STARTUP_OPTIONS="--config-dir=${PROPVAL} ${STARTUP_OPTIONS}"
fi

case "$1" in
  start)
    echo "Starting PowerDNS: \c"
    ${POWERDNS_BIN}/pdns_recursor ${STARTUP_OPTIONS}
    echo "powerdns-recursor."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

