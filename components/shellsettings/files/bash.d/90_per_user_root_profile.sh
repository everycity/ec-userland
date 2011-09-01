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

# This allows you to have a custom root profile, stored in your
# own home directory so other users aren't affected by your 
# shell preferences.

OUSER=`/usr/bin/who am i | awk '{print $1}'`
OUSER_HDIR=`/usr/bin/grep "^${OUSER}:" /etc/passwd | /usr/bin/awk -F':' '{print $6}'`

if [ -f ${OUSER_HDIR}/.root_bashrc ] ; then
        source ${OUSER_HDIR}/.root_bashrc
fi

