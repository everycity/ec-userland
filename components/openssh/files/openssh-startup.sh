#!/bin/sh
#
# Copyright (c) EveryCity 2011
#

. /lib/svc/share/smf_include.sh

SSHDBINARY="/ec/bin/sshd"

case "$1" in
  start)
    [ -f /ec/etc/ssh/ssh_host_rsa_key ] || /ec/bin/ssh-keygen -N '' -t rsa -f /ec/etc/ssh/ssh_host_rsa_key
    [ -f /ec/etc/ssh/ssh_host_dsa_key ] || /ec/bin/ssh-keygen -N '' -t dsa -f /ec/etc/ssh/ssh_host_dsa_key 
    echo "Starting OpenSSH: \c"
    $SSHDBINARY
    echo "sshd."
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

