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
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
#

include ../../../../make-rules/shared-macros.mk

LIBNAME =	libusbugen.so.1
SRCS =		libusbugen.c
OBJS =		$(SRCS:%.c=%.o)

MAPFILES =	libusbugen.mapfile

CFLAGS +=	$(CC_PIC)
CFLAGS +=	-I.
CFLAGS +=	-D_REENTRANT -D_TS_ERRNO
LDFLAGS +=	$(MAPFILES:%=-M %)
LIBS +=		-ldl -lc

all:	$(LIBNAME)

$(LIBNAME):	$(OBJS)
	$(LD) $(LDFLAGS) -G -h $@ -o $@ $(OBJS) $(LIBS)

install:	$(LIBNAME)

clean:
	$(RM) $(TEST) $(LIBNAME) *.o
