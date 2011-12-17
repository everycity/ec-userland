--- gcc-4.4.5/gcc/config/sparc/sol2-bi.h	2007-10-19 04:29:38.000000000 +0000
+++ gcc-richlowe/gcc/config/sparc/sol2-bi.h	2011-12-17 01:45:30.272696897 +0000
@@ -172,12 +172,12 @@
    %{YP,*} \
    %{R*} \
    %{compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/ucblib/sparcv9:/usr/lib/libp/sparcv9:/usr/lib/sparcv9} \
-       %{!p:%{!pg:-Y P,/usr/ucblib/sparcv9:/usr/lib/sparcv9}}} \
+     %{!YP,*:%{p|pg:-Y P,/usr/ucblib/64:/usr/lib/libp/64:/lib/64:/usr/lib/64} \
+       %{!p:%{!pg:-Y P,/usr/ucblib/64:/lib/64:/usr/lib/64}}} \
      -R /usr/ucblib/sparcv9} \
    %{!compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/lib/libp/sparcv9:/usr/lib/sparcv9} \
-       %{!p:%{!pg:-Y P,/usr/lib/sparcv9}}}}"
+     %{!YP,*:%{p|pg:-Y P,/usr/lib/libp/64:/lib/64:/usr/lib/64} \
+       %{!p:%{!pg:-Y P,/lib/64:/usr/lib/64}}}}"
 
 #define LINK_ARCH64_SPEC LINK_ARCH64_SPEC_BASE
 
