--- jdk/make/sun/font/Makefile.~1~	2014-01-02 11:10:18.676180149 +0400
+++ jdk/make/sun/font/Makefile	2014-01-02 11:14:05.266338759 +0400
@@ -190,7 +190,7 @@
 ifeq ($(PLATFORM), solaris)
   # Note that on Solaris, fontmanager is built against the headless library.
   LDFLAGS      += -L$(LIBDIR)/$(LIBARCH)/headless
-  OTHER_LDLIBS += -lawt -L$(LIBDIR)/$(LIBARCH)/xawt -lmawt -lc $(LIBM) $(LIBCXX)
+  OTHER_LDLIBS += -lawt -L$(LIBDIR)/$(LIBARCH)/xawt -R/ec/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/xawt -lmawt -lc $(LIBM) $(LIBCXX)
 else # PLATFORM is linux
  OTHER_LDLIBS  += -lawt $(LIBM) $(LIBCXX)
   ifeq ("$(CC_VER_MAJOR)", "3")
--- jdk/make/sun/font/t2k/Makefile.~1~	2014-01-02 11:10:51.425535643 +0400
+++ jdk/make/sun/font/t2k/Makefile	2014-01-02 11:14:35.399856446 +0400
@@ -99,7 +99,7 @@
     endif                           
   else
     ifeq ($(PLATFORM), solaris)
-      OTHER_LDLIBS += -lawt -L$(LIBDIR)/$(LIBARCH)/xawt -lmawt
+      OTHER_LDLIBS += -lawt -L$(LIBDIR)/$(LIBARCH)/xawt -R/ec/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/xawt -lmawt
     endif
   endif
 endif
--- jdk/make/sun/jawt/Makefile.~1~	2014-01-02 11:11:03.852717421 +0400
+++ jdk/make/sun/jawt/Makefile	2014-01-02 11:15:43.613185103 +0400
@@ -116,9 +116,9 @@
 #
 ifeq ($(PLATFORM), solaris)
   ifndef BUILD_HEADLESS_ONLY
-    OTHER_LDLIBS = -L$(LIBDIR)/$(LIBARCH) -L$(OPENWIN_LIB) -L$(LIBDIR)/$(LIBARCH)/xawt -lmawt -L/usr/openwin/sfw/lib$(ISA_DIR) -lXrender
+    OTHER_LDLIBS = -L$(LIBDIR)/$(LIBARCH) -L$(OPENWIN_LIB) -L$(LIBDIR)/$(LIBARCH)/xawt -R/ec/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/xawt -lmawt -L/usr/openwin/sfw/lib$(ISA_DIR) -lXrender
   else
-    OTHER_LDLIBS = -L$(LIBDIR)/$(LIBARCH) -L$(OPENWIN_LIB) -L$(LIBDIR)/$(LIBARCH)/headless -lmawt -L/usr/openwin/sfw/lib$(ISA_DIR) -lXrender
+    OTHER_LDLIBS = -L$(LIBDIR)/$(LIBARCH) -L$(OPENWIN_LIB) -L$(LIBDIR)/$(LIBARCH)/headless -R/ec/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/headless -lmawt -L/usr/openwin/sfw/lib$(ISA_DIR) -lXrender
   endif
 endif # PLATFORM
 
