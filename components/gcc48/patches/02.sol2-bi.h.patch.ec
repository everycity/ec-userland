Index: gcc-4.8.2/gcc/config/sol2-bi.h
===================================================================
--- gcc-4.8.2/gcc/config/sol2-bi.h
+++ gcc-4.8.2/gcc/config/sol2-bi.h
@@ -74,8 +74,8 @@
   "%{G:-G} \
    %{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}	\
-	   %{!p:%{!pg:-Y P,%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}}}"
+   %{!YP,*:%{p|pg:-Y P,%R/ec/gcc/4.8/lib/" ARCH64_SUBDIR ":%R/ec/lib/" ARCH64_SUBDIR ":%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR " -R /ec/gcc/4.8/lib/64:/ec/lib/64} \
+	   %{!p:%{!pg:-Y P,%R/ec/gcc/4.8/lib/" ARCH64_SUBDIR ":%R/ec/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR " -R /ec/gcc/4.8/lib/64:/ec/lib/64}}}"
 
 #undef LINK_ARCH64_SPEC
 #ifndef USE_GLD
