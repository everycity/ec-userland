#!/bin/bash

# Note - this publishes via http to the destination repo
# If your zone has an internal IP, ensure you have an /etc/hosts
# entry pointing the destrepo hostname at the internal IP

# Also ensure that this zone's IP is in the following file on the
# destrepo server: /ec/etc/apache/2.2/sites-enabled/smartos.pkg.ec

# Changeables
publisher="smartos.pkg.ec"
sourcerepo="file:///ws/ec-userland/i386/repo"
destrepo="http://smartos.pkg.ec"

# lets do it
cd `dirname $0`/includes && . ./common.inc

