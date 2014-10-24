<?xml version="1.0"?>
<!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
<!--
    Copyright 2004 Sun Microsystems, Inc.  All rights reserved.
    Use is subject to license terms.

    ident	"@(#)cron.xml	1.5	04/12/09 SMI"

    NOTE:  This service manifest is not editable; its contents will
    be overwritten by package or patch operations, including
    operating system upgrade.  Make customizations in a different
    file.
-->

<service_bundle type='manifest' name='system/cronie'>

<service
	name='system/cronie'
	type='service'
	version='1'>

	<single_instance />

	<dependency
		name='usr'
		type='service'
		grouping='require_all'
		restart_on='none'>
		<service_fmri value='svc:/system/filesystem/local' />
	</dependency>

	<dependency
		name='ns'
		type='service'
		grouping='require_all'
		restart_on='none'>
		<service_fmri value='svc:/milestone/name-services' />
	</dependency>

	<dependent
		name='cronie_multi-user'
		grouping='optional_all'
		restart_on='none'>
		<service_fmri value='svc:/milestone/multi-user' />
	</dependent>

	<exec_method
		type='method'
		name='start'
		exec='/ec/var/svc/method/svc-cronie'
		timeout_seconds='60'>
		<method_context>
			<method_credential user='root' group='root' />
		</method_context>
	</exec_method>

	<exec_method
		type='method'
		name='stop'
		exec=':kill'
		timeout_seconds='60'>
	</exec_method>

	<property_group name='startd' type='framework'>
		<!-- sub-process core dumps shouldn't restart session -->
		<propval name='ignore_error' type='astring'
		    value='core,signal' />
	</property_group>

	<property_group name='general' type='framework'>
		<!-- to start stop cron -->
		<propval name='action_authorization' type='astring'
			value='solaris.smf.manage.cron' />
	</property_group>

	<instance name='default' enabled='false' />

	<stability value='Unstable' />

	<template>
		<common_name>
			<loctext xml:lang='C'>
			clock daemon (cronie)
			</loctext>
		</common_name>
		<documentation>
			<manpage title='crond' section='1' manpath='/ec/share/man' />
			<manpage title='crontab' section='1' manpath='/ec/share/man' />
		</documentation>
	</template>
</service>

</service_bundle>
