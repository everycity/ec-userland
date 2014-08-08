Index: gcc-4.8.2/gcc/config/sol2.h
===================================================================
--- gcc-4.8.2/gcc/config/sol2.h
+++ gcc-4.8.2/gcc/config/sol2.h
@@ -149,8 +149,8 @@ along with GCC; see the file COPYING3.  
   "%{G:-G} \
    %{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/ccs/lib/libp:%R/usr/lib/libp:%R/usr/ccs/lib:%R/lib:%R/usr/lib} \
-	   %{!p:%{!pg:-Y P,%R/usr/ccs/lib:%R/lib:%R/usr/lib}}}"
+   %{!YP,*:%{p|pg:-Y P,%R/ec/gcc/4.8/lib:%R/ec/lib/:%R/usr/lib/libp:%R/usr/lib:%R/lib -R /ec/gcc/4.8/lib:/ec/lib} \
+	   %{!p:%{!pg:-Y P,%R/ec/gcc/4.8/lib:%R/ec/lib:%R/usr/lib:%R/lib -R /ec/gcc/4.8/lib:/ec/lib}}}"
 
 #undef LINK_ARCH32_SPEC
 #define LINK_ARCH32_SPEC LINK_ARCH32_SPEC_BASE
