<?xml version='1.0'?>
<!DOCTYPE service_bundle SYSTEM '/usr/share/lib/xml/dtd/service_bundle.dtd.1'>
  <service_bundle type='manifest' name='memcached'>
  <service name='application/database/memcached' type='service' version='0'>
    <dependency name='net' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/milestone/network:default' />
    </dependency>

    <dependency name='ns' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/milestone/name-services:default' />
    </dependency>

    <exec_method type='method' name='start'
      exec='/ec/var/svc/method/memcached.sh start'
      timeout_seconds='-1'>
    </exec_method>

    <exec_method type='method' name='stop'
      exec=':kill'
      timeout_seconds='30'>
    </exec_method>

    <exec_method type='method' name='refresh'
      exec=':kill -HUP'
      timeout_seconds='30'>
    </exec_method>

    <instance name='default' enabled='false'>
      <property_group name='memcached' type='application'>
        <propval name='enable_64bit' type='boolean' value='false'/>
        <propval name='startup_options' type='astring' value='-u noaccess -l 127.0.0.1 -m 128M -d'/>
        <propval name='memcached_binary' type='astring' value='/ec/bin/memcached'/>
        <propval name='memcached_binary64' type='astring' value='/ec/bin/amd64/memcached'/>
      </property_group>
    </instance>
  </service>
  </service_bundle>

