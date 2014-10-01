--- imap-2007e/src/osdep/unix/Makefile.orig	2011-04-14 19:34:16.291543822 +0100
+++ imap-2007e/src/osdep/unix/Makefile	2011-04-14 19:36:56.638711363 +0100
@@ -736,6 +736,16 @@
 	 BASELDFLAGS="-lsocket -lnsl -lgen" \
 	 RANLIB=true CC=/opt/SUNWspro/bin/cc
 
+ec:	os_sol.h	# Solaris EveryCity
+	$(BUILD) `$(CAT) SPECIALS` OS=sol \
+	 SIGTYPE=psx CHECKPW=psx CRXTYPE=nfs \
+	 SPOOLDIR=/ec/var/spool MAILSPOOL=/ec/var/mail \
+	 ACTIVEFILE=/ec/share/news/active \
+	 RSHPATH=/ec/bin/rsh \
+	 BASECFLAGS="$$CFLAGS" \
+	 BASELDFLAGS="-lsocket -lnsl -lgen -fPIC" \
+	 RANLIB=true CC=$$CC
+
 
 # Note: It is a long and disgusting story about why cc is set to ucbcc.  You
 # need to invoke the C compiler so that it links with the SVR4 libraries and
