#!/sbin/sh
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2008 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#ident	"@(#)http-apache22	1.8	08/06/11 SMI"	
#

. /lib/svc/share/smf_include.sh

APACHE_VERSION=
APACHE_USR_ROOT=/ec/lib/apache
APACHE_ETC_ROOT=/ec/etc/apache
APACHE_VAR_ROOT=/ec/var/apache

#if startup options contain multiple arguments separated by a blank,
#then they should be specified as below
#e.g., %> svccfg -s apache22 setprop 'httpd/startup_options=("-f" "/etc/apache/2.2/new.conf")' 
#
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

APACHE_VERSION=`echo ${SMF_FMRI} | sed 's/[^0-9]//g;s/./\.&/g;s/^\.//'` 
if [ "x${APACHE_VERSION}" != "x" ]; then
    echo "Apache version is ${APACHE_VERSION}"
    APACHE_USR_ROOT=${APACHE_USR_ROOT}/${APACHE_VERSION}
    APACHE_ETC_ROOT=${APACHE_ETC_ROOT}/${APACHE_VERSION}
    APACHE_VAR_ROOT=${APACHE_VAR_ROOT}/${APACHE_VERSION}
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

${APACHE_BIN}/apachectl ${STARTUP_OPTIONS} ${cmd} 2>&1

if [ $? -ne 0 ]; then
    echo "Server failed to start. Check the error log (defaults to ${APACHE_VAR_ROOT}/logs/error_log) for more information, if any."
    exit $SMF_EXIT_ERR_FATAL
fi

exit $SMF_EXIT_OK
