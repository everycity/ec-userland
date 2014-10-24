#!/sbin/sh
#
# Copyright 2004 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
# ident	"@(#)svc-cron	1.2	04/11/05 SMI"
#
# Start method script for the cron service.
#

. /lib/svc/share/smf_include.sh

if [ -p /ec/etc/cron.d/FIFO ]; then
	if /usr/bin/pgrep -x -u 0 -z `/sbin/zonename` cron >/dev/null 2>&1; then
		echo "$0: cron is already running"
		exit $SMF_EXIT_ERR_NOSMF
	fi
fi

if [ -x /ec/bin/crond ]; then
	/usr/bin/rm -f /ec/etc/cron.d/FIFO
	/ec/bin/crond &
else
	exit 1
fi
exit $SMF_EXIT_OK
