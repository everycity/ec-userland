<?xml version='1.0'?>
<!DOCTYPE service_bundle SYSTEM '/usr/share/lib/xml/dtd/service_bundle.dtd.1'>
<service_bundle type='manifest' name='export'>
  <service name='application/database/redis' type='service' version='0'>
    <create_default_instance enabled='false'/>
    <single_instance/>
    <dependency name='fs' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/system/filesystem/local'/>
    </dependency>
    <dependency name='net' grouping='require_all' restart_on='none' type='service'>
      <service_fmri value='svc:/network/loopback'/>
    </dependency>
    <dependent name='redis' restart_on='none' grouping='optional_all'>
      <service_fmri value='svc:/milestone/multi-user'/>
    </dependent>
    <exec_method name='start' type='method' exec='/ec/bin/redis-server /ec/etc/redis/redis.conf' timeout_seconds='60'>
      <method_context working_directory='/'>
        <method_credential user='root' group='root'/>
        <method_environment>
          <envvar name='PATH' value='/ec/bin:/ec/sbin:/usr/bin:/bin:/opt/csw/bin:/opt/local/bin'/>
        </method_environment>
      </method_context>
    </exec_method>
    <exec_method name='stop' type='method' exec='/ec/bin/redis-cli shutdown' timeout_seconds='60'/>
  </service>
</service_bundle>
