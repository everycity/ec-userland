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

# These functions are to prevent accidents in the global zone
if [[ "xglobal" == "x`zonename`" ]] ; then

function safetyfirst() {
  echo "This server is `hostname` with `zoneadm list | grep -v ^global | wc -l` VMs running."
  echo
  echo -n "Please type AGREE to run \"$@\": "
  read arg
  if [[ "xAGREE" = "x$arg" ]] ; then
    echo Running $@
    $@
  else
    echo Aborting
  fi
}

function shutdown() {
  safetyfirst /usr/sbin/shutdown $@
}

function reboot() {
  safetyfirst /usr/sbin/reboot $@
}

function uadmin() {
  safetyfirst /usr/sbin/uadmin $@
}

function init() {
  safetyfirst /usr/sbin/init $@
}

function poweroff() {
  safetyfirst /usr/sbin/poweroff $@
}

fi

