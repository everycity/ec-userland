From 3c7978e563bb39fa62d9a252b4968bacc5e9dc7b Mon Sep 17 00:00:00 2001
From: Alex Wilson <alex.wilson@joyent.com>
Date: Fri, 7 Aug 2015 12:19:47 -0700
Subject: [PATCH 22/34] Add SMF manifest and method, and install them

---
 Makefile.in      |   6 ++
 smf/manifest.xml | 155 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 smf/method.sh    |  76 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 smf/manifest.xml
 create mode 100644 smf/method.sh

diff --git a/Makefile.in b/Makefile.in
index 47dbceff..1ab8bc90 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -27,6 +27,8 @@ SFTP_SERVER=$(libexecdir)/sftp-server
 SSH_KEYSIGN=$(libexecdir)/ssh-keysign
 SSH_PKCS11_HELPER=$(libexecdir)/ssh-pkcs11-helper
 ROOTDLIBDIR64=$(DESTDIR)/usr/lib/dtrace/64
+SMFMETHODDIR=$(DESTDIR)/var/svc/method
+SMFSITEMANIDIR=$(DESTDIR)/var/svc/manifest/site
 PRIVSEP_PATH=@PRIVSEP_PATH@
 SSH_PRIVSEP_USER=@SSH_PRIVSEP_USER@
 STRIP_OPT=@STRIP_OPT@
@@ -364,6 +366,10 @@ install-files:
 	$(INSTALL) -m 644 ssh-keysign.1m.out $(DESTDIR)$(mandir)/$(mansubdir)1m/ssh-keysign.1m
 	$(INSTALL) -m 644 ssh-pkcs11-helper.1m.out $(DESTDIR)$(mandir)/$(mansubdir)1m/ssh-pkcs11-helper.1m
 	mkdir -p $(ROOTDLIBDIR64) && cp $(srcdir)/sftp64.d $(ROOTDLIBDIR64)/sftp64.d
+	$(srcdir)/mkinstalldirs $(SMFMETHODDIR)
+	$(srcdir)/mkinstalldirs $(SMFSITEMANIDIR)
+	$(INSTALL) -m 555 $(srcdir)/smf/method.sh $(SMFMETHODDIR)/openssh
+	$(INSTALL) -m 444 $(srcdir)/smf/manifest.xml $(SMFSITEMANIDIR)/openssh.xml
 
 install-sysconf:
 	if [ ! -d $(DESTDIR)$(sysconfdir) ]; then \
diff --git a/smf/manifest.xml b/smf/manifest.xml
new file mode 100644
index 00000000..50452966
--- /dev/null
+++ b/smf/manifest.xml
@@ -0,0 +1,155 @@
+<?xml version="1.0"?>
+<!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
+<!--
+	CDDL HEADER START
+
+	The contents of this file are subject to the terms of the
+	Common Development and Distribution License (the "License").
+	You may not use this file except in compliance with the License.
+
+	You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+	or http://www.opensolaris.org/os/licensing.
+	See the License for the specific language governing permissions
+	and limitations under the License.
+
+	When distributing Covered Code, include this CDDL HEADER in each
+	file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+	If applicable, add the following below this CDDL HEADER, with the
+	fields enclosed by brackets "[]" replaced with your own identifying
+	information: Portions Copyright [yyyy] [name of copyright owner]
+
+	CDDL HEADER END
+
+	Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
+	Use is subject to license terms.
+
+	NOTE:  This service manifest is not editable; its contents will
+	be overwritten by package or patch operations, including
+	operating system upgrade.  Make customizations in a different
+	file.
+-->
+
+<service_bundle type='manifest' name='openssh'>
+
+<service
+	name='network/openssh'
+	type='service'
+	version='1'>
+
+	<create_default_instance enabled='false' />
+
+	<single_instance />
+
+	<dependency name='fs-local'
+		grouping='require_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri
+			value='svc:/system/filesystem/local' />
+	</dependency>
+
+	<dependency name='fs-autofs'
+		grouping='optional_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri value='svc:/system/filesystem/autofs' />
+	</dependency>
+
+	<dependency name='net-loopback'
+		grouping='require_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri value='svc:/network/loopback' />
+	</dependency>
+
+	<dependency name='net-physical'
+		grouping='require_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri value='svc:/network/physical' />
+	</dependency>
+
+	<dependency name='cryptosvc'
+		grouping='require_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri value='svc:/system/cryptosvc' />
+	</dependency>
+
+	<dependency name='utmp'
+		grouping='require_all'
+		restart_on='none'
+		type='service'>
+		<service_fmri value='svc:/system/utmp' />
+	</dependency>
+
+	<dependency name='network_ipfilter'
+		grouping='optional_all'
+		restart_on='error'
+		type='service'>
+		<service_fmri value='svc:/network/ipfilter:default' />
+	</dependency>
+
+	<dependency name='config_data'
+		grouping='require_all'
+		restart_on='restart'
+		type='path'>
+		<service_fmri
+		    value='file://localhost/ec/etc/ssh/sshd_config' />
+	</dependency>
+
+	<dependent
+		name='ssh_multi-user-server'
+		grouping='optional_all'
+		restart_on='none'>
+			<service_fmri
+			    value='svc:/milestone/multi-user-server' />
+	</dependent>
+
+	<exec_method
+		type='method'
+		name='start'
+		exec='/var/svc/method/openssh start'
+		timeout_seconds='60'/>
+
+	<exec_method
+		type='method'
+		name='stop'
+		exec=':kill'
+		timeout_seconds='60' />
+
+	<exec_method
+		type='method'
+		name='refresh'
+		exec='/var/svc/method/openssh restart'
+		timeout_seconds='60' />
+
+	<property_group name='startd'
+		type='framework'>
+		<!-- sub-process core dumps shouldn't restart session -->
+		<propval name='ignore_error'
+		    type='astring' value='core,signal' />
+	</property_group>
+
+	<property_group name='general' type='framework'>
+		<!-- to start stop sshd -->
+		<propval name='action_authorization' type='astring'
+		    value='solaris.smf.manage.ssh' />
+	</property_group>
+
+	<stability value='Unstable' />
+
+	<template>
+		<common_name>
+			<loctext xml:lang='C'>
+			SSH server
+			</loctext>
+		</common_name>
+		<documentation>
+			<manpage title='sshd' section='1M' manpath='/usr/share/man' />
+		</documentation>
+	</template>
+
+</service>
+
+</service_bundle>
diff --git a/smf/method.sh b/smf/method.sh
new file mode 100644
index 00000000..e91ed553
--- /dev/null
+++ b/smf/method.sh
@@ -0,0 +1,76 @@
+#!/sbin/sh
+#
+# Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
+# Use is subject to license terms.
+#
+
+. /lib/svc/share/smf_include.sh
+
+SSHDIR=/ec/etc/ssh
+SSHKEYDIR=$SSHDIR
+KEYGEN="/ec/bin/ssh-keygen -q"
+PIDFILE=/ec/var/run/sshd.pid
+
+# Checks to see if RSA, and DSA host keys are available
+# if any of these keys are not present, the respective keys are created.
+create_key()
+{
+	keypath=$1
+	keytype=$2
+
+	if [ ! -f $keypath ]; then
+		#
+		# HostKey keywords in sshd_config may be preceded or
+		# followed by a mix of any number of space or tabs,
+		# and optionally have an = between keyword and
+		# argument.  We use two grep invocations such that we
+		# can match HostKey case insensitively but still have
+		# the case of the path name be significant, keeping
+		# the pattern somewhat more readable.
+		#
+		# The character classes below contain one literal
+		# space and one literal tab.
+		#
+		grep -i "^[ 	]*HostKey[ 	]*=\{0,1\}[ 	]*$keypath" \
+		    $SSHDIR/sshd_config | grep "$keypath" > /dev/null 2>&1
+
+		if [ $? -eq 0 ]; then
+			echo Creating new $keytype public/private host key pair
+			$KEYGEN -f $keypath -t $keytype -N ''
+			if [ $? -ne 0 ]; then
+				echo "Could not create $keytype key: $keypath"
+				exit $SMF_EXIT_ERR_CONFIG
+			fi
+		fi
+	fi
+}
+
+
+case $1 in
+'start')
+	#
+	# If host keys don't exist when the service is started, create
+	# them; sysidconfig is not run in every situation (such as on
+	# the install media).
+	#
+	create_key $SSHKEYDIR/ssh_host_rsa_key rsa
+	create_key $SSHKEYDIR/ssh_host_dsa_key dsa
+	create_key $SSHKEYDIR/ssh_host_ecdsa_key ecdsa
+	create_key $SSHKEYDIR/ssh_host_ed25519_key ed25519
+
+	/usr/lib/ssh/sshd
+	;;
+
+'restart')
+	if [ -f "$PIDFILE" ]; then
+		/usr/bin/kill -HUP `/usr/bin/cat $PIDFILE`
+	fi
+	;;
+
+*)
+	echo "Usage: $0 { start | restart }"
+	exit 1
+	;;
+esac
+
+exit $?
-- 
2.11.0

