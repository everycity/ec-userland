#!/usr/xpg4/bin/sh
#
# Copyright (c) EveryCity 2011
#

. /lib/svc/share/smf_include.sh

# Do not change these defaults below, they will be overwritten
# during the next package upgrade. Instead, set these properties
# via SMF using "svccfg -s mysql55:default" and setprop

config_file="/ec/etc/varnish/default.vcl"
user="webservd"
working_dir="/ec/var/varnish"
cache_size="file,/ec/var/varnish/varnish_cache.bin,512M"
tcp_listen_address="0.0.0.0"
tcp_listen_port="8000"
admin_tcp_listen_address="0.0.0.0"
admin_tcp_listen_port="2000"
varnishd_32_binary="/ec/bin/varnishd"
varnishd_64_binary="/ec/bin/amd64/varnishd"
cc_command_32="/ec/bin/gcc -fPIC -shared -o %o %s"
cc_command_64="/ec/bin/gcc -m64 -fPIC -shared -o %o %s"
additional_startup_options=""
enable_64bit="true"
properties_list="listen_depth=8192 waiter=poll thread_pool_max=2000 thread_pool_min=50 thread_pools=4 thread_pool_add_delay=2ms sess_timeout=10s max_restarts=12 session_linger=120ms connect_timeout=0s lru_interval=20s sess_workspace=262144 cli_timeout=10"

getprop() {
    PROPVAL=""
    svcprop -q -p $1 ${SMF_FMRI}
    if [ $? -eq 0 ] ; then
        PROPVAL=`svccfg -s ${SMF_FMRI} listprop $1 | \
		/usr/bin/nawk '{ for (i = 3; i <= NF; i++) print $i" " }' | \
		/usr/bin/tr -d '\012' | \
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
  getprop varnish/$1
  if [ "${PROPVAL}" != "" ] ; then
    export $1="${PROPVAL}"
  fi
}

varprop config_file
varprop user
varprop working_dir
varprop cache_size
varprop tcp_listen_address
varprop tcp_listen_port
varprop admin_tcp_listen_address
varprop admin_tcp_listen_port
varprop varnishd_32_binary
varprop varnishd_64_binary
varprop cc_command_32
varprop cc_command_64
varprop additional_startup_options
varprop enable_64bit
varprop properties_list

if [ "x$enable_64bit" = "xtrue" ] ; then
  varnishd_binary=$varnishd_64_binary
  cc_command=$cc_command_64
else
  varnishd_binary=$varnishd_32_binary
  cc_command=$cc_command_32
fi

for prop in $properties_list ; do
  additional_startup_options="$additional_startup_options -p $prop"
done

case "$1" in
  start)
    echo "Starting Varnish: \c"
    $varnishd_binary -f $config_file -u $user -n $working_dir -a ${tcp_listen_address}:${tcp_listen_port} -T ${admin_tcp_listen_address}:${admin_tcp_listen_port} -s $cache_size -p cc_command="${cc_command}" $additional_startup_options -F &
    echo "varnishd."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

