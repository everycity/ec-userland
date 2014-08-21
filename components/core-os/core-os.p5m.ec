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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
<transform file path=.* -> default pkg.depend.bypass-generate .*>

set name=pkg.fmri value=pkg:/$(COMPONENT_FMRI)@$(IPS_COMPONENT_VERSION),$(BUILD_VERSION)
set name=pkg.summary value="$(COMPONENT_SUMMARY)"
set name=info.upstream_url value="$(COMPONENT_PROJECT_URL)"

# users
group gid=80 groupname=webservd
user gcos-field="webservd" group=webservd uid=80 username=webservd login-shell=/bin/false home-dir=/var/apache
#group gid=97 groupname=pkg5srv
#user gcos-field="pkg(5) server UID" group=pkg5srv uid=97 username=pkg5srv

# Core Directories
dir  path=opt owner=root group=root mode=0755
dir  path=tmp owner=root group=root mode=1777

# Core Directories
dir  path=etc
dir  path=etc/security
dir  path=etc/security/auth_attr.d
dir  path=etc/security/exec_attr.d
dir  path=ec
dir  path=ec/bin
dir  path=ec/etc
dir  path=ec/lib
dir  path=ec/lib/$(MACH64)
link path=ec/lib/64 target=$(MACH64)
dir  path=ec/share
dir  path=ec/share/man
dir  path=ec/var
dir  path=dev
dir  path=lib
dir  path=lib/$(MACH64)
#link path=lib/64 target=$(MACH64)
dir  path=lib/svc
dir  path=lib/svc/manifest
dir  path=lib/svc/manifest/application
dir  path=lib/svc/method
dir  path=proc
dir  path=sbin
dir  path=usr
dir  path=usr/bin
dir  path=usr/lib
dir  path=usr/lib/$(MACH64)
#link path=usr/lib/64 target=$(MACH64)
dir  path=usr/share
dir  path=var
dir  path=var/run
dir  path=var/svc
dir  path=var/svc/manifest
dir  path=var/svc/manifest/application
dir  path=var/svc/method
