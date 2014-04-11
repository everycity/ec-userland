#!/bin/sh


for i in ../../build/prototype/*/ec/lib/apache/2.4/modules/mod_*; do
    m=`basename $i|sed s/mod_//|sed s/.so//`

    printf "<IfDefine 64bit>\nLoadModule ${m}_module modules/amd64/mod_${m}.so\n</IfDefine>\n" >$m.load
    printf "<IfDefine !64bit>\nLoadModule ${m}_module modules/mod_${m}.so\n</IfDefine>\n" >>$m.load

done
