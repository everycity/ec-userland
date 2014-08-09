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
Index: Python-2.7.6/setup.py
===================================================================
--- Python-2.7.6/setup.py.orig
+++ Python-2.7.6/setup.py
@@ -788,11 +788,11 @@ class PyBuildExt(build_ext):
 
         # socket(2)
         exts.append( Extension('_socket', ['socketmodule.c', 'timemodule.c'],
-                               depends=['socketmodule.h'],
-                               libraries=math_libs) )
+    			       libraries = ['socket', 'nsl', 'm'],
+                               depends=['socketmodule.h']) )
         # Detect SSL support for the socket module (via _ssl)
         search_for_ssl_incs_in = [
-                              '/usr/local/ssl/include',
+                              '/ec/include',
                               '/usr/contrib/ssl/include/'
                              ]
         ssl_incs = find_file('openssl/ssl.h', inc_dirs,
@@ -1616,9 +1616,14 @@ class PyBuildExt(build_ext):
                 sysconfig.get_config_var('POSIX_SEMAPHORES_NOT_ENABLED')):
                 multiprocessing_srcs.append('_multiprocessing/semaphore.c')
 
+	multiproc_libs = []
+	if host_platform == 'sunos5':
+	    multiproc_libs = [ "xnet" ]
+
         if sysconfig.get_config_var('WITH_THREAD'):
             exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
                                     define_macros=macros.items(),
+                                    libraries=multiproc_libs,
                                     include_dirs=["Modules/_multiprocessing"]))
         else:
             missing.append('_multiprocessing')
Index: Python-2.7.6/Modules/readline.c
===================================================================
--- Python-2.7.6/Modules/readline.c.orig
+++ Python-2.7.6/Modules/readline.c
@@ -911,12 +911,12 @@ setup_readline(void)
     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
     /* Set our hook functions */
-    rl_startup_hook = (Function *)on_startup_hook;
+    rl_startup_hook = on_startup_hook;
 #ifdef HAVE_RL_PRE_INPUT_HOOK
-    rl_pre_input_hook = (Function *)on_pre_input_hook;
+    rl_pre_input_hook = on_pre_input_hook;
 #endif
     /* Set our completion function */
-    rl_attempted_completion_function = (CPPFunction *)flex_complete;
+    rl_attempted_completion_function = flex_complete;
     /* Set Python word break characters */
     completer_word_break_characters =
         rl_completer_word_break_characters =
