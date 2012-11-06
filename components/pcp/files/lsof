#!/ec/bin/bash

cat<<EOF

 Unfortunately lsof is not available within Solaris Zones due to a limitation
 of the method it uses to obtain the information (via protected kernel
 interfaces).

 There are however native alternatives via the "proc tools" collection. The
 closest alternative to lsof is "pfiles" which works like so:

   # pfiles <pid of process>

 To get a list of everything that's running you can simply do this (as root):

   # pfiles \`ls -1 /proc\`

 You may wish to set this as an alias in your .bashrc file. There is more
 information in the pfiles man page which you can reach with:

   # man pfiles

 There is another handy utility, "pcp", which shows open TCP connections,
 e.g (as root):

   # pcp -a

EOF
 
