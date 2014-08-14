Index: gcc-4.4.4/gcc/config/i386/sol2-10.h
===================================================================
--- gcc-4.4.4/gcc/config/i386/sol2-10.h
+++ gcc-4.4.4/gcc/config/i386/sol2-10.h
@@ -93,12 +93,12 @@ along with GCC; see the file COPYING3.  
    %{YP,*} \
    %{R*} \
    %{compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/ucblib/64:/usr/lib/libp/64:/lib/64:/usr/lib/64} \
-             %{!p:%{!pg:-Y P,/usr/ucblib/64:/lib:/usr/lib/64}}} \
-             -R /usr/ucblib/64} \
+     %{!YP,*:%{p|pg:-Y P,/ec/gcc/4.4/lib/64:/ec/lib/64:/usr/ucblib/64:/usr/lib/libp/64:/lib/64:/usr/lib/64 -R /ec/gcc/4.4/lib/64:/ec/lib/64} \
+             %{!p:%{!pg:-Y P,/ec/gcc/4.4/lib/64:/ec/lib/64:/usr/ucblib/64:/lib64:/usr/lib/64 -R /ec/gcc/4.4/lib/64:/ec/lib/64}}} \
+             -R /ec/gcc/4.4/lib/64:/ec/lib/64} \
    %{!compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/lib/libp/64:/lib/64:/usr/lib/64} \
-             %{!p:%{!pg:-Y P,/lib/64:/usr/lib/64}}}}"
+     %{!YP,*:%{p|pg:-Y P,/ec/gcc/4.4/lib/64:/ec/lib/64:/usr/lib/libp/64:/lib/64:/usr/lib/64 -R /ec/gcc/4.4/lib/64:/ec/lib/64} \
+             %{!p:%{!pg:-Y P,/ec/gcc/4.4/lib/64:/ec/lib/64:/lib/64:/usr/lib/64 -R /ec/gcc/4.4/lib/64:/ec/lib/64}}}}"
 
 #undef LINK_ARCH64_SPEC
 #define LINK_ARCH64_SPEC LINK_ARCH64_SPEC_BASE
