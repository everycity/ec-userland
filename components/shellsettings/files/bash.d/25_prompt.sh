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

if [ "$EUID" == 0 ]; then rgb_usr=$bldred; else rgb_usr=$bldgrn; fi

if [ $?prompt ]; then
	# Uncomment to remove the black background
	#bak=""
	bak=${bakblk}
	PS1="\[${bak}${rgb_usr}\]${USER}\[${bldwht}${bak}\] \W (\[${bldylw}\]${HOSTNAME}\[${bldwht}${bak}\]):${txtrst} "
fi

