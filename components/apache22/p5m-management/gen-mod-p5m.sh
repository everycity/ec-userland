#!/bin/bash

# We assume any module that gets loaded is a module that needs a p5m file

for mod in `ls -1 p5m-management/modules/load`
do
  cat p5m-management/apache22-modtemplate.p5m | sed "s/JJ/${mod}/g" > apache22-mod-${mod}.p5m

  if [ -e p5m-management/modules/headers/${mod} ]
  then
    cat <<EOF >> apache22-mod-${mod}.p5m
dir path=\$(ECPREFIX)/include
dir path=\$(ECPREFIX)/include/apache
dir path=\$(ECPREFIX)/include/apache/2.2
EOF
  fi

  cat <<EOF >> apache22-mod-${mod}.p5m
dir path=\$(ECPREFIX)/lib
dir path=\$(ECPREFIX)/lib/apache
dir path=\$(ECPREFIX)/lib/apache/2.2
dir path=\$(ECPREFIX)/lib/apache/2.2/modules
dir path=\$(ECPREFIX)/lib/apache/2.2/modules/\$(MACH64)
EOF

  if [ -e p5m-management/modules/conf/${mod} ]
  then
    cat <<EOF >> apache22-mod-${mod}.p5m
file path=\$(ECPREFIX)/etc/apache/2.2/mods-available/${mod}.conf preserve=true
EOF
  fi

  echo "file path=\$(ECPREFIX)/etc/apache/2.2/mods-available/${mod}.load preserve=true" >> apache22-mod-${mod}.p5m

  if [ -e p5m-management/modules/headers/${mod} ]
  then
    echo "file path=\$(ECPREFIX)/include/apache/2.2/mod_${mod}.h" >> apache22-mod-${mod}.p5m
  fi

  cat <<EOF >> apache22-mod-${mod}.p5m
file path=\$(ECPREFIX)/lib/apache/2.2/modules/\$(MACH64)/mod_${mod}.so
file path=\$(ECPREFIX)/lib/apache/2.2/modules/mod_${mod}.so
EOF

  if [ -e p5m-management/modules/enabled/${mod} ]
  then
    if [ -e p5m-management/modules/conf/${mod} ]
    then
      cat <<EOF >> apache22-mod-${mod}.p5m
link path=\$(ECPREFIX)/etc/apache/2.2/mods-enabled/${mod}.conf \\
    target=../mods-available/${mod}.conf preserve=true
EOF
    fi
    cat <<EOF >> apache22-mod-${mod}.p5m
link path=\$(ECPREFIX)/etc/apache/2.2/mods-enabled/${mod}.load \\
    target=../mods-available/${mod}.load preserve=true
EOF
  fi
done


