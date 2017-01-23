Index: Python-2.7.3/Makefile.pre.in
===================================================================
--- Python-2.7.3/Makefile.pre.in.orig
+++ Python-2.7.3/Makefile.pre.in
@@ -62,7 +62,7 @@ MAKESETUP=      $(srcdir)/Modules/makese
 # Compiler options
 OPT=		@OPT@
 BASECFLAGS=	@BASECFLAGS@
-CFLAGS=		$(BASECFLAGS) @CFLAGS@ $(OPT) $(EXTRA_CFLAGS)
+CFLAGS=		$(BASECFLAGS) -fPIC -DPIC $(OPT) $(EXTRA_CFLAGS)
 # Both CPPFLAGS and LDFLAGS need to contain the shell's value for setup.py to
 # be able to build extension modules using the directories specified in the
 # environment variables
@@ -71,7 +71,7 @@ LDFLAGS=	@LDFLAGS@
 LDLAST=		@LDLAST@
 SGI_ABI=	@SGI_ABI@
 CCSHARED=	@CCSHARED@
-LINKFORSHARED=	@LINKFORSHARED@
+LINKFORSHARED=	@LINKFORSHARED@ $(CFLAGS)
 ARFLAGS=	@ARFLAGS@
 # Extra C flags added for building the interpreter object files.
 CFLAGSFORSHARED=@CFLAGSFORSHARED@
@@ -108,8 +108,8 @@ LIBP=		$(LIBDIR)/python$(VERSION)
 
 # Symbols used for using shared libraries
 SO=		@SO@
-LDSHARED=	@LDSHARED@ $(LDFLAGS)
-BLDSHARED=	@BLDSHARED@ $(LDFLAGS)
+LDSHARED=	@LDSHARED@ $(CFLAGS) $(LDFLAGS)
+BLDSHARED=	@BLDSHARED@ $(CFLAGS) $(LDFLAGS)
 LDCXXSHARED=	@LDCXXSHARED@
 DESTSHARED=	$(BINLIBDEST)/lib-dynload
 
@@ -549,7 +549,7 @@ Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INP
 		-touch Parser/pgen.stamp
 
 $(PGEN):	$(PGENOBJS)
-		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+		$(CC) $(CFLAGS) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
 
 Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
 				$(srcdir)/Include/token.h \
Index: Python-2.7.13/setup.py
===================================================================
--- Python-2.7.13/setup.py.orig	2016-12-22 22:52:55.439899417 +0000
+++ Python-2.7.13/setup.py	2016-12-22 22:52:57.822489736 +0000
@@ -818,6 +818,7 @@
         # Detect SSL support for the socket module (via _ssl)
         search_for_ssl_incs_in = [
                               '/usr/local/ssl/include',
+                              '/ec/include',
                               '/usr/contrib/ssl/include/'
                              ]
         ssl_incs = find_file('openssl/ssl.h', inc_dirs,
