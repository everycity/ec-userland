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

if [ "$EUID" != 0 ]; then

echo -e -n "$rgb_red"
echo "======================================================================="
echo -e -n "$rgb_magenta"
echo "             ___                       __                       "
echo "            /\_ \                     /\ \                      "
echo "         ___\//\ \     ___   __  __   \_\ \         __    ___   "
echo "        /'___\\ \ \   / __ \`\/\ \/\ \  /'_\` \      /'__\`\ /'___\\ "
echo "       /\ \__/ \_\ \_/\ \_\ \ \ \_\ \/\ \_\ \  __/\  __//\ \__/ "
echo "       \ \____\/\____\ \____/\ \____/\ \___,_\/\_\ \____\ \____\\"
echo "        \/____/\/____/\/___/  \/___/  \/__,_ /\/_/\/____/\/____/"
echo ""
echo -e -n "$rgb_red"
echo -e -n "Welcome to$rgb_yellow `hostname`$rgb_red,$rgb_green `who am i | awk '{print $1}'`${rgb_red}."
echo
echo -e "You are connecting from: ${rgb_green}`who am i | awk '{print $NF}'`${rgb_red}."
echo
echo "======================================================================="
echo
echo -e -n "$rgb_restore"

fi

