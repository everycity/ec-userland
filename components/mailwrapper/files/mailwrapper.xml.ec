<?xml version="1.0"?>
<!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
<service_bundle type="manifest" name="mailwrapper:default">
  <service name="network/mail/mailwrapper" type="service" version="0">
    <create_default_instance enabled="true"/>
    <single_instance/>
    <dependency name="fs-local" grouping="require_all" restart_on="none" type="service">
      <service_fmri value="svc:/system/filesystem/local:default"/>
    </dependency>
    <method_context>
      <method_credential group="root" user="root"/>
    </method_context>
    <exec_method name="start" type="method" exec="/var/svc/method/mailwrapper start" timeout_seconds="10"/>
    <exec_method name="stop" type="method" exec="/var/svc/method/mailwrapper stop" timeout_seconds="10"/>
    <exec_method name="refresh" type="method" exec="/var/svc/method/mailwrapper refresh" timeout_seconds="10"/>
    <exec_method name="restart" type="method" exec="/var/svc/method/mailwrapper restart" timeout_seconds="10"/>
    <property_group name="application" type="application"/>
    <property_group name="startd" type="framework">
      <propval name="duration" type="astring" value="transient"/>
      <propval name="ignore_error" type="astring" value="core,signal"/>
    </property_group>
    <stability value="Unstable"/>
    <template>
      <common_name>
        <loctext xml:lang="C">Wrapper to support arbitrary Mail Transport Agents</loctext>
      </common_name>
      <documentation>
        <manpage title="mailwrapper" section="8" manpath="/ec/share/man"/>
      </documentation>
    </template>
  </service>
</service_bundle>
