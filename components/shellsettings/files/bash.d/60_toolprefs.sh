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

# Set the pager to use less, which offers more than more!
if [ -f /ec/bin/less ] ; then
	export PAGER=/ec/bin/less
elif [ -f /usr/bin/less ] ; then 
	export PAGER=/usr/bin/less
fi

# Set the default editor to vim, which is nicer than vi
if [ -f /ec/bin/vim ] ; then
	export EDITOR=/ec/bin/vim
elif [ -f /ec/bin/nano ] ; then
	export EDITOR=/ec/bin/nano
fi

