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

# Ignore unnecessary commands in the history
export HISTIGNORE="&:ls:[bf]g:exit:history:rm:reboot*:halt*:init*:uadmin*:shutdown*:zpool destroy*:zpool offline*:zpool replace*:zpool detach*:zfs destroy*:zfs rollback*"

# Set a reasonable history size
export HISTSIZE=5000
export HISTFILESIZE=5000

# Set history to append rather than overwrite
shopt -s histappend

