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

# Set a reasonable ulimit
ulimit -n 65535

# Allow more than 256 file descriptors on Solaris 10 32bit
# See the following URL for a full description:
# http://developers.sun.com/solaris/articles/stdio_256.html
export LD_PRELOAD_32=/usr/lib/extendedFILE.so.1

NGINX_USR_ROOT=/ec
NGINX_ETC_ROOT=/ec/etc/nginx

STARTUP_OPTIONS=

PLATFORM_DIR=

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

getprop httpd/config_dir
if [ "${PROPVAL}" != "" ] ; then
    NGINX_ETC_ROOT=$PROPVAL
fi

getprop httpd/enable_64bit
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

	# 64 bit Apache
	PLATFORM_DIR=/amd64
	;;
    false|0) 
	# 32 bit Apache
	PLATFORM_DIR=
	;;
    *)
	# Invalid value for "bitness"
	echo "\"bitness\" property value is invalid. Starting the server in 32-bit mode"
	PLATFORM_DIR=
	;;
    esac
fi

NGINX_HOME=${NGINX_USR_ROOT}
NGINX_BIN=${NGINX_HOME}/bin${PLATFORM_DIR}

getprop httpd/startup_options
if [ "${PROPVAL}" != "" ] ; then
	echo startupoptions set
	echo val=${PROPVAL}
	STARTUP_OPTIONS="${PROPVAL} -k"
fi

# Export NGINX_ETC_ROOT as an environment variable for use in config files
export NGINX_ETC_ROOT="${NGINX_ETC_ROOT}"

case "$1" in
start)
	${NGINX_BIN}/nginx ${STARTUP_OPTIONS} -c ${NGINX_ETC_ROOT}/nginx.conf 2>&1
	;;
*)
	echo "Usage: $0 {start}"
	exit $SMF_EXIT_ERR_CONFIG
	;;
esac


if [ $? -ne 0 ]; then
    echo "Server failed to start. Check the error log (defaults to ${NGINX_USR_ROOT}/var/nginx/logs/error_log) for more information, if any."
    exit $SMF_EXIT_ERR_FATAL
fi

exit $SMF_EXIT_OK
