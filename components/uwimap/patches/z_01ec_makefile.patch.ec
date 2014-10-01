--- imap-2007e/Makefile.orig	2011-04-14 19:11:12.780372883 +0100
+++ imap-2007e/Makefile	2011-04-14 19:18:13.018711766 +0100
@@ -377,6 +377,10 @@
 	$(BUILD) BUILDTYPE=lnps IP=$(IP6) \
 	SPECIALS="GSSDIR=/usr SSLDIR=/usr SSLINCLUDE=/usr/include/openssl SSLCERTS=/etc/ssl/certs SSLKEYS=/etc/ssl/private"
 
+ec:	an
+	$(BUILD) BUILDTYPE=ec IP=$(IP6) \
+	SPECIALS="CC=gcc GSSDIR=/usr SSLDIR=/ec SSLINCLUDE=/ec/include/openssl SSLCERTS=/ec/etc/openssl/certs SSLKEYS=/ec/etc/openssl/private"
+
 lmd:	an
 	$(BUILD) BUILDTYPE=lnp IP=$(IP6) \
 	SPECIALS="SSLINCLUDE=/usr/include/openssl SSLLIB=/usr/lib SSLCERTS=/usr/lib/ssl/certs SSLKEYS=/usr/lib/ssl/private GSSINCLUDE=/usr/include GSSLIB=/usr/lib"
