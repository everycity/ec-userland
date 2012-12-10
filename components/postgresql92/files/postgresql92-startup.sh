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
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

. /lib/svc/share/smf_include.sh

# Do not change these defaults below, they will be overwritten
# during the next package upgrade. Instead, set these properties
# via SMF using "svccfg -s postgresql92:default" and setprop


bin_dir="/ec/lib/postgres/9.2/bin"
data_dir="/ec/var/postgres/9.2/data"
config_file="/ec/etc/postgres/9.2/postgresql.conf"
postgres_32_binary="${bin_dir}/pg_ctl"
postgres_64_binary="${bin_dir}/amd64/pg_ctl"
additional_startup_options=""
enable_64bit="true"

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
  getprop postgres/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop data_dir
varprop config_file
varprop additional_startup_options
varprop enable_64bit

if [ "x$enable_64bit" = "xtrue" ] ; then
  postgres_binary=$postgres_64_binary
  bin_dir=$bin_dir/amd64
else
  postgres_binary=$postgres_32_binary
fi

check_data_dir() {
	if [ ! -d $data_dir ]; then
		echo "Error: postgres/data_dir directory $data_dir does not exist"
		exit $SMF_EXIT_ERR_CONFIG
	fi

	if [ ! -w $data_dir ]; then
		echo "Error: postgres/data_dir directory $data_dir is not writable by postgres"
		exit $SMF_EXIT_ERR_CONFIG
	fi

	if [ ! -f $data_dir/.initialized ]; then
		echo "Notice: postgres/data directory $data_dir is not initialized"
		echo "        Calling '$bin_dir/initdb -D $data_dir' to initialize"
		$bin_dir/initdb -D $data_dir
		if [ $? -ne 0 ]; then
			echo "Error: initdb failed"
			echo "Hint : If database is already initialized, touch the $data_dir/.initialized file."
			exit $SMF_EXIT_ERR
		fi
		touch $data_dir/.initialized
	fi

	if [ ! -d $data_dir/base -o ! -d $data_dir/global -o ! -f $data_dir/PG_VERSION ]; then
		if [ `ls -a $data_dir | wc -w` -le 2 ]; then
			echo "Error: postgres/data directory $data_dir is empty, but it should be initialized"
			echo "Hint : check your mountpoints"
		else
			echo "Error: postgres/data directory $data_dir is not empty, nor is it a valid PostgreSQL data directory"
		fi
		exit $SMF_EXIT_ERR_CONFIG
	fi
}



case "$1" in
'start')
	check_data_dir
        $postgres_binary -D $data_dir -l $data_dir/server.log start
        ;;

'stop')
        $postgres_binary -D $data_dir stop
        ;;

'refresh')
        $postgres_binary -D $data_dir reload
        ;;

*)
        echo "Usage: $0 {start|stop|refresh}"
        exit 1
        ;;
esac

exit 0

