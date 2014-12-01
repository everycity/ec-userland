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

#  If we have modern GNU terminal definitions, use them
if [ -d /ec/share/terminfo ]; then
	export TERMINFO=/ec/share/terminfo
#	export TERM=xterm-color
else
	export TERM=xterm
fi