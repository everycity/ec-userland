#!/bin/sh

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

PREFIXDIR="/usr"
SSHDBINARY="${PREFIXDIR}/bin/sshd"

case "$1" in
  start)
    # Preparing host ssh keys
    if [ ! -f /etc/ssh/ssh_host_rsa_key ] ; then
      ${PREFIXDIR}/bin/ssh-keygen -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key

      # Only generate the ecdsa key if no rsa key exists to avoid causing known_host warnings when people upgrade openssh
      [ ! -f /etc/ssh/ssh_host_ecdsa_key ] && ${PREFIXDIR}/bin/ssh-keygen -N '' -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
    fi

    [ -f /etc/ssh/ssh_host_dsa_key ] || ${PREFIXDIR}/bin/ssh-keygen -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key

    $SSHDBINARY
    ;;
  *)
    echo "Usage: $0 {start}"
    exit 1
    ;;
esac

exit 0

