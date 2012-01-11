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
ulimit -n

# Allow more than 256 file descriptors on Solaris 10 32bit
# See the following URL for a full description:
# http://developers.sun.com/solaris/articles/stdio_256.html
export LD_PRELOAD_32=/usr/lib/extendedFILE.so.1

APACHE_USR_ROOT=/ec/lib/apache/2.2
APACHE_ETC_ROOT=/ec/etc/apache/2.2
APACHE_VAR_ROOT=/ec/var/apache/2.2

STARTUP_OPTIONS=

SERVER_TYPE=prefork
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

getprop httpd/var_dir
if [ "${PROPVAL}" != "" ] ; then
    APACHE_VAR_ROOT=$PROPVAL
fi

getprop httpd/config_dir
if [ "${PROPVAL}" != "" ] ; then
    APACHE_ETC_ROOT=$PROPVAL
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

APACHE_HOME=${APACHE_USR_ROOT}
APACHE_BIN=${APACHE_HOME}/bin${PLATFORM_DIR}

getprop httpd/startup_options
if [ "${PROPVAL}" != "" ] ; then
	echo startupoptions set
	echo val=${PROPVAL}
	STARTUP_OPTIONS="${PROPVAL} -k"
fi

getprop httpd/server_type
if [ "${PROPVAL}" != "" ] ; then
	SERVER_TYPE=${PROPVAL}
fi

case ${SERVER_TYPE} in
prefork)
	# If HTTPD value is set in
	# /ec/etc/apache/<version>/envvars file
	# delete the line so that it defaults to prefork 
	# type
	ALREADY_SET=`grep "^HTTPD.*=.*$APACHE_BIN'/httpd" \
		${APACHE_ETC_ROOT}/envvars`
	if [ "${ALREADY_SET}" = "" ]; then
		grep "^HTTPD.*=" ${APACHE_ETC_ROOT}/envvars >/dev/null || \
			echo HTTPD= >>${APACHE_ETC_ROOT}/envvars
		perl -pi -e "s%^HTTPD.*=.*%HTTPD=${APACHE_BIN}/httpd%" \
			${APACHE_ETC_ROOT}/envvars
	fi
	;;
worker)
	# set HTTPD value to httpd.worker within 
	# /etc/apache/<version>/envvars file
	ALREADY_SET=`grep "^HTTPD.*=.*$APACHE_BIN'/httpd.worker" \
		${APACHE_ETC_ROOT}/envvars`
	if [ "${ALREADY_SET}" = "" ]; then
		grep "^HTTPD.*=" ${APACHE_ETC_ROOT}/envvars >/dev/null || \
			echo HTTPD= >>${APACHE_ETC_ROOT}/envvars
		perl -pi -e "s%^HTTPD.*=.*%HTTPD=${APACHE_BIN}/httpd.worker%" \
			${APACHE_ETC_ROOT}/envvars
	fi
	;;
*)
        if [ "x${APACHE_VERSION}" != "x" ]; then
            echo "Unknown server_type"
            exit $SMF_EXIT_ERR_CONFIG
        fi
	;;
esac
	
# Export APACHE_ETC_ROOT as an environment variable for use in config files
export APACHE_ETC_ROOT="${APACHE_ETC_ROOT}"
export APACHE_VAR_ROOT="${APACHE_VAR_ROOT}"

case "$1" in
start)
	cmd="start"
	;;
refresh)
	cmd="graceful"
	;;
stop)
	cmd="stop"
	;;
*)
	echo "Usage: $0 {start|stop|refresh}"
	exit $SMF_EXIT_ERR_CONFIG
	;;
esac

${APACHE_BIN}/apachectl ${STARTUP_OPTIONS} -f ${APACHE_ETC_ROOT}/httpd.conf -k ${cmd} 2>&1

if [ $? -ne 0 ]; then
    echo "Server failed to start. Check the error log (defaults to ${APACHE_VAR_ROOT}/logs/error_log) for more information, if any."
    exit $SMF_EXIT_ERR_FATAL
fi

exit $SMF_EXIT_OK
