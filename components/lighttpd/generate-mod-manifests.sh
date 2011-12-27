#!/bin/bash
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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

SAMPLEMANIFEST=sample-manifests/lighttpd-1.4.30
MODULES=`cat $SAMPLEMANIFEST | grep mod_ | grep -v MACH64 | grep '\.so$' | sed -e 's/.*mod_//g' -e 's/\.so$//g'`

for i in $MODULES ; do

cat <<EOF > lighttpd-mod-${i}.p5m
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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

set name=pkg.fmri value=pkg:/web/server/lighttpd-\$(LIGHTTPD_MAJOR)/module/lighttpd-${i}@\$(IPS_COMPONENT_VERSION),\$(BUILD_VERSION)
set name=pkg.summary value="${i} lighttpd module"
set name=info.upstream_url value="http://www.lighttpd.net/"
set name=info.source_url value=\$(COMPONENT_ARCHIVE_URL)
set name=org.opensolaris.consolidation value=\$(CONSOLIDATION)

license lighttpd.license license="Revised BSD"

dir path=\$(ECPREFIX)
dir path=\$(ECPREFIX)/lib
dir path=\$(ECPREFIX)/lib/lighttpd
dir path=\$(ECPREFIX)/lib/lighttpd/\$(LIGHTTPD_MAJOR)
dir path=\$(ECPREFIX)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib
dir path=\$(ECPREFIX)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib/\$(MACH64)
file path=\$(ECPREFIX)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib/\$(MACH64)/mod_${i}.so
file path=\$(ECPREFIX)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib/mod_${i}.so

EOF


done
