diff -ruN httpd-2.2.17.orig/support/apachectl.in httpd-2.2.17/support/apachectl.in
--- httpd-2.2.17.orig/support/apachectl.in	2011-04-04 16:35:25.000000000 +0100
+++ httpd-2.2.17/support/apachectl.in	2011-04-04 16:44:54.361910997 +0100
@@ -93,6 +93,17 @@
     ARGV="-h"
 fi
 
+if [ ! -d "@exp_runtimedir@" ]; then
+    mkdir -p @exp_runtimedir@
+    chown -R webservd @exp_runtimedir@
+    chgrp -R webservd @exp_runtimedir@
+fi
+
+OPTS_32=""
+OPTS_64="-D 64bit"
+
+HTTPD="$HTTPD $OPTS_::BITS::"
+
 case $ACMD in
 start|stop|restart|graceful|graceful-stop)
     $HTTPD -k $ARGV
