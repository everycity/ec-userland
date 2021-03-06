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

# Do not change these defaults below, they will be overwritten
# during the next package upgrade. Instead, set these properties
# via SMF using "svccfg -s mysql55:default" and setprop

config_file="/ec/etc/mysql/5.5/my.cnf"
user="mysql"
data_dir="/ec/var/mysql/5.5/data"
unix_socket_file="/tmp/mysql.sock"
tcp_listen_address="127.0.0.1"
tcp_listen_port="3306"
error_log="/ec/var/mysql/5.5/data/mysqld.log"
pid_file="/ec/var/mysql/5.5/data/mysqld.pid"
mysqld_32_binary="/ec/lib/mysql/5.5/bin/mysqld"
mysqld_64_binary="/ec/lib/mysql/5.5/bin/amd64/mysqld"
mysqld_installdb_binary="/ec/lib/mysql/5.5/bin/mysql_install_db"
additional_startup_options=""
enable_64bit="true"
skip_grant_tables="false"

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
  getprop mysqld/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop config_file
varprop user
varprop data_dir
varprop unix_socket_file
varprop tcp_listen_address
varprop tcp_listen_port
varprop error_log
varprop pid_file
varprop mysqld_32_binary
varprop mysqld_64_binary
varprop mysqld_installdb_binary
varprop additional_startup_options
varprop enable_64bit
varprop skip_grant_tables

if [ "x$enable_64bit" = "xtrue" ] ; then
  mysqld_binary=$mysqld_64_binary
else
  mysqld_binary=$mysqld_32_binary
fi

# Skip grant tables option
if [ "x$skip_grant_tables" = "xtrue" ] ; then
  additional_startup_options="$additional_startup_options --skip-grant-tables"
fi

# Create a data directory if it exists and is owned by the mysql user
if [ -d $data_dir ] ; then
  owner=`COLUMNS=255 /usr/bin/ls -dl $data_dir | /usr/bin/awk '{print $3}'`
  if [ "x${owner}" = "x${user}" ] ; then
    if [ ! -e ${data_dir}/mysql/user.MYI ] ; then
      # MySQL user table missing - lets populate the data directory
      $mysqld_installdb_binary --datadir=$data_dir --user=$user
      # Update Permissions
      /usr/bin/chown -R ${user}:${user} $data_dir
    fi
  fi
fi

case "$1" in
  start)
    echo "Starting MySQL 5.5: \c"
    $mysqld_binary --defaults-file=$config_file --user=$user --datadir=$data_dir --socket=$unix_socket_file --port=$tcp_listen_port --bind-address=$tcp_listen_address --log-error=$error_log --pid-file=$pid_file $additional_startup_options &
    echo "mysqld."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

