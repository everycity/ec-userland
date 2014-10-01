<?xml version="1.0"?>
<!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
<!--
//
// This file and its contents are supplied under the terms of the
// Common Development and Distribution License ("CDDL)". You may
// only use this file in accordance with the terms of the CDDL.
//
// A full copy of the text of the CDDL should have accompanied this
// source. A copy of the CDDL is also available via the Internet at
// http://www.illumos.org/license/CDDL.
//
//
// Copyright 2011 EveryCity Ltd. All rights reserved.
//
-->
<service_bundle type='manifest' name='apache22'>

<service
	name='network/http/apache22'
	type='service'
	version='1'>

	<!--
	  Because we may have multiple instances of network/http
	  provided by different implementations, we keep dependencies
	  and methods within the instance.
	-->

	<instance name='default' enabled='false'>
		<!--
		  Wait for network interfaces to be initialized.
		-->
		<dependency name='network'
		    grouping='require_all'
		    restart_on='error'
		    type='service'>
		    <service_fmri value='svc:/milestone/network:default'/>
		</dependency>

		<!--
		  Wait for all local filesystems to be mounted.
		-->
		<dependency name='filesystem-local'
		    grouping='require_all'
		    restart_on='none'
		    type='service'>
		    <service_fmri
			value='svc:/system/filesystem/local:default'/>
		</dependency>

		<!--
		  Wait for automounting to be available, as we may be
		  serving data from home directories or other remote
		  filesystems.
		-->
		<dependency name='autofs'
		    grouping='optional_all'
		    restart_on='error'
		    type='service'>
		    <service_fmri
			value='svc:/system/filesystem/autofs:default'/>
		</dependency>

		<!--
		  Wait for NFS to become available, as we may be
		  serving data from NFS mountpoints.
		-->
		<dependency name='nfs'
		    grouping='optional_all'
		    restart_on='error'
		    type='service'>
		    <service_fmri
			value='svc:/network/nfs/client:default'/>
		</dependency>

		<exec_method
			type='method'
			name='start'
			exec='/var/svc/method/http-apache22 start'
			timeout_seconds='60' />

		<exec_method
			type='method'
			name='stop'
			exec='/var/svc/method/http-apache22 stop'
			timeout_seconds='60' />

		<exec_method
			type='method'
			name='refresh'
			exec='/var/svc/method/http-apache22 refresh'
			timeout_seconds='60' />

		<property_group name='httpd' type='application'>
			<stability value='Evolving' />
			<propval name='config_dir' type='astring' value='/ec/etc/apache/2.2' />
			<propval name='var_dir' type='astring' value='/ec/var/apache/2.2' />
			<propval name='startup_options' type='astring' value='' />
			<propval name='server_type' type='astring' value='prefork' />
			<propval name='enable_64bit' type='boolean' value='false' />
			<propval name='value_authorization' type='astring' value='solaris.smf.value.http/apache22' />
		</property_group>

		<property_group name='general' type='framework'>
			<propval name='action_authorization' type='astring' value='solaris.smf.manage.http/apache22' />
			<propval name='value_authorization' type='astring' value='solaris.smf.value.http/apache22' />
		</property_group>

		<property_group name='startd' type='framework'>
			<!-- sub-process core dumps shouldn't restart
				session -->
			<propval name='ignore_error' type='astring'
				value='core,signal' />
		</property_group>

		<template>
			<common_name>
				<loctext xml:lang='C'>
					Apache 2.2 HTTP server
				</loctext>
			</common_name>

			<documentation>
				<manpage title='httpd' section='8'
					manpath='/ec/lib/apache/2.2/man' />
				<doc_link name='apache.org'
					uri='http://httpd.apache.org' />
			</documentation>
		</template>

	</instance>

	<stability value='Evolving' />

</service>

</service_bundle>
