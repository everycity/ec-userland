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
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#

COMPONENT_BUILD_ENV+=		LD_ALTEXEC=$(BINDIR)/gld
COMPONENT_INSTALL_ENV+=		$(COMPONENT_BUILD_ENV)
CONFIGURE_ENV+= 		LD=$(BINDIR)/gld
CONFIGURE_OPTIONS+=		--with-gnu-ld
