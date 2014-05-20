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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#

PATH=$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin

# Calculate the workspace top with some make magic, and tidy it up with realpath
export WS_TOP :=	$(realpath $(dir $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))..)

# Set the location of the make-rules
WS_MAKE_RULES :=	$(WS_TOP)/make-rules

# Include essential macros
include	$(WS_MAKE_RULES)/paths.mk
include $(WS_MAKE_RULES)/targets.mk
include $(WS_MAKE_RULES)/compiler-options.mk
include $(WS_MAKE_RULES)/application-paths.mk
include $(WS_MAKE_RULES)/download-urls.mk

