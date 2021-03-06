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

# Some delightful colours
if [ -f /ec/bin/ls ] ; then
	alias ls='/ec/bin/ls --color=auto'
fi

# Some helpful aliases for Linux converts
if [ ! -f /ec/bin/top ] ; then
	alias top='prstat -Z'
fi

if [ -f /ec/bin/ls ] ; then
	alias ll='/ec/bin/ls --color=auto -l'
fi

alias pp='/usr/bin/ps -ef'
