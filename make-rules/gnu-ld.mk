#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

COMPONENT_BUILD_ENV.32+=        LD_ALTEXEC=$(USRDIR)/bin/gld
COMPONENT_BUILD_ENV.64+=        LD_ALTEXEC=$(USRDIR)/bin/$(MACH64)/gld
COMPONENT_BUILD_ENV+=           $(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_INSTALL_ENV+=         $(COMPONENT_BUILD_ENV.$(BITS))
CONFIGURE_ENV+= 		LD=$(USRDIR)/bin/gld
CONFIGURE_OPTIONS+=		--with-gnu-ld
