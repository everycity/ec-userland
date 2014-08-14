Index: gcc-4.4.4/gcc/config/sol2.h
===================================================================
--- gcc-4.4.4/gcc/config/sol2.h
+++ gcc-4.4.4/gcc/config/sol2.h
@@ -123,12 +123,12 @@ along with GCC; see the file COPYING3.  
    %{YP,*} \
    %{R*} \
    %{compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/ucblib:/usr/ccs/lib/libp:/usr/lib/libp:/usr/ccs/lib:/usr/lib} \
-             %{!p:%{!pg:-Y P,/usr/ucblib:/usr/ccs/lib:/usr/lib}}} \
-             -R /usr/ucblib} \
+     %{!YP,*:%{p|pg:-Y P,/ec/gcc/4.4/lib:/ec/lib:/usr/ucblib:/usr/ccs/lib/libp:/usr/lib/libp:/usr/ccs/lib:/lib:/usr/lib -R /ec/gcc/4.4/lib:/ec/lib} \
+             %{!p:%{!pg:-Y P,/ec/gcc/4.4/lib:/ec/lib:/usr/ucblib:/usr/ccs/lib:/lib:/usr/lib -R /ec/gcc/4.4/lib:/ec/lib}}} \
+             -R /ec/gcc/4.4/lib:/ec/lib} \
    %{!compat-bsd: \
-     %{!YP,*:%{p|pg:-Y P,/usr/ccs/lib/libp:/usr/lib/libp:/usr/ccs/lib:/usr/lib} \
-             %{!p:%{!pg:-Y P,/usr/ccs/lib:/usr/lib}}}}"
+     %{!YP,*:%{p|pg:-Y P,/ec/gcc/4.4/lib:/ec/lib:/usr/ccs/lib/libp:/usr/lib/libp:/usr/ccs/lib:/lib:/usr/lib -R /ec/gcc/4.4/lib:/ec/lib} \
+             %{!p:%{!pg:-Y P,/ec/gcc/4.4/lib:/ec/lib:/usr/ccs/lib:/lib:/usr/lib -R /ec/gcc/4.4/lib:/ec/lib}}}}"
 
 #undef LINK_ARCH32_SPEC
 #define LINK_ARCH32_SPEC LINK_ARCH32_SPEC_BASE
