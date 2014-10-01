diff -ruN uw-imap-2006b.dfsg.orig/src/imapd/imapd.8 uw-imap-2006b.dfsg/src/imapd/imapd.8
--- uw-imap-2006b.dfsg.orig/src/imapd/imapd.8	2006-10-09 18:48:56.000000000 +0200
+++ uw-imap-2006b.dfsg/src/imapd/imapd.8	2006-10-09 19:22:42.000000000 +0200
@@ -16,7 +16,7 @@
 .SH NAME
 IMAPd \- Internet Message Access Protocol server
 .SH SYNOPSIS
-.B /usr/etc/imapd
+.B /ec/sbin/imapd
 .SH DESCRIPTION
 .I imapd
 is a server which supports the
@@ -42,7 +42,7 @@
 by many Unix-based clients.  To do this, the
 .I imapd
 binary must have a link to
-.I /etc/rimapd
+.I /ec/sbin/rimapd
 since this is where this software expects it to be located.
 .SH "SEE ALSO"
 rsh(1) ipopd(8)
diff -ruN uw-imap-2006b.dfsg.orig/src/ipopd/ipopd.8 uw-imap-2006b.dfsg/src/ipopd/ipopd.8
--- uw-imap-2006b.dfsg.orig/src/ipopd/ipopd.8	2006-10-09 18:48:56.000000000 +0200
+++ uw-imap-2006b.dfsg/src/ipopd/ipopd.8	2006-10-09 19:22:42.000000000 +0200
@@ -16,9 +16,9 @@
 .SH NAME
 IPOPd \- Post Office Protocol server
 .SH SYNOPSIS
-.B /usr/etc/ipop2d
+.B /ec/sbin/ipop2d
 .PP
-.B /usr/etc/ipop3d
+.B /ec/sbin/ipop3d
 .SH DESCRIPTION
 .I ipop2d
 and
diff -ruN uw-imap-2006b.dfsg.orig/src/osdep/unix/tcp_unix.c uw-imap-2006b.dfsg/src/osdep/unix/tcp_unix.c
--- uw-imap-2006b.dfsg.orig/src/osdep/unix/tcp_unix.c	2006-10-09 18:48:56.000000000 +0200
+++ uw-imap-2006b.dfsg/src/osdep/unix/tcp_unix.c	2006-10-09 19:22:42.000000000 +0200
@@ -346,12 +346,12 @@
 				/* return immediately if ssh disabled */
     if (!(sshpath && (ti = sshtimeout))) return NIL;
 				/* ssh command prototype defined yet? */
-    if (!sshcommand) sshcommand = cpystr ("%s %s -l %s exec /etc/r%sd");
+    if (!sshcommand) sshcommand = cpystr ("%s %s -l %s exec /ec/sbin/r%sd");
   }
 				/* want rsh? */
   else if (rshpath && (ti = rshtimeout)) {
 				/* rsh command prototype defined yet? */
-    if (!rshcommand) rshcommand = cpystr ("%s %s -l %s exec /etc/r%sd");
+    if (!rshcommand) rshcommand = cpystr ("%s %s -l %s exec /ec/sbin/r%sd");
   }
   else return NIL;		/* rsh disabled */
 				/* look like domain literal? */
