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

# Set up the hostname
HOSTNAME=`hostname | /usr/bin/awk -F. '{print $1 "." $2}'`

# Set the prompt

if [ "$EUID" == 0 ]; then rgb_usr=$rgb_red; else rgb_usr=$rgb_green; fi

if [ $?prompt ]; then
	PS1="\[${rgb_usr}\]${USER}\[${rgb_white}\] \W (\[${rgb_yellow}\]${HOSTNAME}\[${rgb_white}\]): \[${rgb_restore}\]"
fi

