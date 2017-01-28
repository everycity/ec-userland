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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

SAMPLEMANIFEST=build/manifest-i386-generated.p5m
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
# Copyright $(date +%Y) EveryCity Ltd. All rights reserved.
#

set name=pkg.fmri value=pkg:/web/server/lighttpd-\$(LIGHTTPD_MAJOR)/module/lighttpd-${i}@\$(IPS_COMPONENT_VERSION),\$(BUILD_VERSION)
set name=pkg.summary value="${i} lighttpd module"
set name=info.upstream-url value="\$(COMPONENT_PROJECT_URL)"
set name=info.source-url value=\$(COMPONENT_ARCHIVE_URL)

license \$(COMPONENT_LICENSE_FILE) license='\$(COMPONENT_LICENSE)'

file path=\$(USRDIR)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib/\$(MACH64)/mod_${i}.so
file path=\$(USRDIR)/lib/lighttpd/\$(LIGHTTPD_MAJOR)/lib/mod_${i}.so

EOF


done
