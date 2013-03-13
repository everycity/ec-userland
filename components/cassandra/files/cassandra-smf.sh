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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

. /lib/svc/share/smf_include.sh

# Set a reasonable ulimit
ulimit -n 65535

# Allow more than 256 file descriptors on Solaris 10 32bit
# See the following URL for a full description:
# http://developers.sun.com/solaris/articles/stdio_256.html
export LD_PRELOAD_32=/usr/lib/extendedFILE.so.1

# Defaults, overidable via SMF
cassandra_conf=/ec/etc/cassandra
java_home=
jvm_extra_options=
enable_64bit=true

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
  getprop cassandra/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop cassandra_conf
varprop java_home
varprop jvm_extra_options

getprop cassandra/enable_64bit
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
	jvm_extra_options="-d64 $jvm_extra_options"
	;;
    false|0) 
	# 32 bit
	;;
    *)
	# Invalid value for "bitness"
	echo "\"bitness\" property value is invalid. Starting the server in 32-bit mode"
	;;
    esac
fi

echo CASSANDRA_CONF="$cassandra_conf"
export CASSANDRA_CONF="$cassandra_conf"

echo JAVA_HOME="$java_home"
export JAVA_HOME="$java_home"

echo JVM_EXTRA_OPTS="$jvm_extra_options"
export JVM_EXTRA_OPTS="$jvm_extra_options"


case "$1" in
start)
	/ec/bin/cassandra 2>&1
	if [ $? -ne 0 ]; then
		echo "Server failed to start. Check the cassandra error log for more information, if any."
		exit $SMF_EXIT_ERR_FATAL
	fi
	;;
*)
	echo "Usage: $0 start"
	exit $SMF_EXIT_ERR_CONFIG
	;;
esac

exit $SMF_EXIT_OK
