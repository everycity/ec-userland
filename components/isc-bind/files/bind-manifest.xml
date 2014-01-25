<?xml version='1.0'?>
<!DOCTYPE service_bundle SYSTEM '/usr/share/lib/xml/dtd/service_bundle.dtd.1'>
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
// Copyright 2014 EveryCity Ltd. All rights reserved.
//
-->
<service_bundle type='manifest' name='isc-bind'>
  <service name='network/isc-bind/server' type='service' version='1'>
    <create_default_instance enabled='false' />

    <single_instance />

    <dependency name='bind_filesystem-local' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/system/filesystem/local:default'/>
    </dependency>

    <dependency name="loopback" grouping="require_any" restart_on="error" type="service">
      <service_fmri value="svc:/network/loopback"/>
    </dependency>

    <dependency name='bind_network' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/milestone/network' />
    </dependency>

    <dependency name='config_data' grouping='require_all' restart_on='restart' type='path'>
      <service_fmri value='file://localhost/ec/etc/bind/named.conf' />
    </dependency>

    <exec_method name='start' type='method' exec='/ec/bin/named -c /ec/etc/bind/named.conf' timeout_seconds='60'>
      <method_context>
        <method_credential user='root' group='root'/>
      </method_context>
    </exec_method>

    <exec_method name='stop' type='method' exec=':kill' timeout_seconds='60'/>

    <exec_method name='refresh' type='method' exec=':kill -HUP' timeout_seconds='60' />

    <property_group name='startd' type='framework'>
      <propval name='ignore_error' type='astring' value='core,signal'/>
    </property_group>

    <stability value='Evolving'/>
  </service>
</service_bundle>
