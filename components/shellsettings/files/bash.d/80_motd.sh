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

echo -e -n "$txtred"
echo "======================================================================="
echo -e -n "$bldred"
echo "             ___                       __                       "
echo "            /\_ \                     /\ \                      "
echo "         ___\//\ \     ___   __  __   \_\ \         __    ___   "
echo "        /'___\\ \ \   / __ \`\/\ \/\ \  /'_\` \      /'__\`\ /'___\\ "
echo "       /\ \__/ \_\ \_/\ \_\ \ \ \_\ \/\ \_\ \  __/\  __//\ \__/ "
echo "       \ \____\/\____\ \____/\ \____/\ \___,_\/\_\ \____\ \____\\"
echo "        \/____/\/____/\/___/  \/___/  \/__,_ /\/_/\/____/\/____/"
echo ""
echo -e -n "$txtred"
echo -e -n "Welcome to$bldylw `hostname`$txtred,$bldgrn `who am i | awk '{print $1}'`${txtred}."
echo
echo -e "You are connecting from: ${bldgrn}`who am i | awk '{print $NF}'`${txtred}."
echo
if [ -f /ec/share/everycity/solaris-quickstart.txt ] ; then
echo "To see our Solaris quickstart guide, simply type 'ec-quickstart'"
else
echo "To see our Solaris quickstart guide, simply install it with: "
echo "  sudo pkg install documentation/everycity/quickstart-guide"
echo "Then simply type 'ec-quickstart'"
fi
echo
echo "======================================================================="
echo
echo -e -n "$txtrst"

fi

