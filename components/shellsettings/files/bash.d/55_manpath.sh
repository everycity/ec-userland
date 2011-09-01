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

MANPATH=/ec/share/man:/ec/share

# Find common man locations
mandirs=`ls -d /ec/lib/*/active/man /ec/lib/*/*/man /ec/share/*/*/man /ec/share/*/man 2>/dev/null`

for i in $mandirs ; do
	MANPATH="$MANPATH:$i"
done

export MANPATH=${MANPATH}:/usr/share/man

