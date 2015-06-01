--- exim-4.85/src/EDITME.~1~	2015-01-05 23:40:11.000000000 +0000
+++ exim-4.85/src/EDITME	2015-03-18 14:14:41.118489430 +0000
@@ -98,7 +98,7 @@
 # /usr/local/sbin. The installation script will try to create this directory,
 # and any superior directories, if they do not exist.
 
-BIN_DIRECTORY=/usr/exim/bin
+BIN_DIRECTORY=/ec/bin
 
 
 #------------------------------------------------------------------------------
@@ -114,7 +114,7 @@
 # don't exist. It will also install a default runtime configuration if this
 # file does not exist.
 
-CONFIGURE_FILE=/usr/exim/configure
+CONFIGURE_FILE=/ec/etc/exim/exim.conf
 
 # It is possible to specify a colon-separated list of files for CONFIGURE_FILE.
 # In this case, Exim will use the first of them that exists when it is run.
@@ -131,7 +131,7 @@
 # deliveries. (Local deliveries run as various non-root users, typically as the
 # owner of a local mailbox.) Specifying these values as root is not supported.
 
-EXIM_USER=
+EXIM_USER=456
 
 # If you specify EXIM_USER as a name, this is looked up at build time, and the
 # uid number is built into the binary. However, you can specify that this
@@ -152,7 +152,7 @@
 # for EXIM_USER (e.g. EXIM_USER=exim), you don't need to set EXIM_GROUP unless
 # you want to use a group other than the default group for the given user.
 
-# EXIM_GROUP=
+EXIM_GROUP=456
 
 # Many sites define a user called "exim", with an appropriate default group,
 # and use
@@ -173,7 +173,7 @@
 
 # Almost all installations choose this:
 
-SPOOL_DIRECTORY=/var/spool/exim
+SPOOL_DIRECTORY=/ec/var/spool/exim
 
 
 
@@ -241,7 +241,7 @@
 # MBX, is included only when requested. If you do not know what this is about,
 # leave these settings commented out.
 
-# SUPPORT_MAILDIR=yes
+SUPPORT_MAILDIR=yes
 # SUPPORT_MAILSTORE=yes
 # SUPPORT_MBX=yes
 
@@ -294,17 +294,17 @@
 
 LOOKUP_DBM=yes
 LOOKUP_LSEARCH=yes
-LOOKUP_DNSDB=yes
+#LOOKUP_DNSDB=yes
 
 # LOOKUP_CDB=yes
-# LOOKUP_DSEARCH=yes
+LOOKUP_DSEARCH=yes
 # LOOKUP_IBASE=yes
-# LOOKUP_LDAP=yes
-# LOOKUP_MYSQL=yes
+LOOKUP_LDAP=yes
+LOOKUP_MYSQL=yes
 # LOOKUP_NIS=yes
 # LOOKUP_NISPLUS=yes
 # LOOKUP_ORACLE=yes
-# LOOKUP_PASSWD=yes
+LOOKUP_PASSWD=yes
 # LOOKUP_PGSQL=yes
 # LOOKUP_SQLITE=yes
 # LOOKUP_SQLITE_PC=sqlite3
@@ -327,7 +327,7 @@
 # with Solaris 7 onwards. Uncomment whichever of these you are using.
 
 # LDAP_LIB_TYPE=OPENLDAP1
-# LDAP_LIB_TYPE=OPENLDAP2
+LDAP_LIB_TYPE=OPENLDAP2
 # LDAP_LIB_TYPE=NETSCAPE
 # LDAP_LIB_TYPE=SOLARIS
 
@@ -363,6 +363,8 @@
 
 # LOOKUP_INCLUDE=-I /usr/local/ldap/include -I /usr/local/mysql/include -I /usr/local/pgsql/include
 # LOOKUP_LIBS=-L/usr/local/lib -lldap -llber -lmysqlclient -lpq -lgds -lsqlite3
+LOOKUP_INCLUDE=-I/ec/lib/mysql/5.5/include -I/ec/lib/mysql/5.5/include/mysql
+LOOKUP_LIBS=-L/ec/lib/mysql/5.5/lib -R/ec/lib/mysql/5.5/lib -lmysqlclient -lldap -llber
 
 
 #------------------------------------------------------------------------------
@@ -373,7 +375,7 @@
 # files are defaulted in the OS/Makefile-Default file, but can be overridden in
 # local OS-specific make files.
 
-EXIM_MONITOR=eximon.bin
+# EXIM_MONITOR=eximon.bin
 
 
 #------------------------------------------------------------------------------
@@ -383,7 +385,7 @@
 # and the MIME ACL. Please read the documentation to learn more about these
 # features.
 
-# WITH_CONTENT_SCAN=yes
+WITH_CONTENT_SCAN=yes
 
 # If you want to use the deprecated "demime" condition in the DATA ACL,
 # uncomment the line below. Doing so will also explicitly turn on the
@@ -577,6 +579,7 @@
 # the TRUSTED_CONFIG_LIST file, then root privileges are not dropped by Exim.
 
 # TRUSTED_CONFIG_LIST=/usr/exim/trusted_configs
+TRUSTED_CONFIG_LIST=/ec/etc/exim/trusted_configs.conf
 
 
 #------------------------------------------------------------------------------
@@ -621,15 +624,15 @@
 # included in the Exim binary. You will then need to set up the run time
 # configuration to make use of the mechanism(s) selected.
 
-# AUTH_CRAM_MD5=yes
+AUTH_CRAM_MD5=yes
 # AUTH_CYRUS_SASL=yes
-# AUTH_DOVECOT=yes
+AUTH_DOVECOT=yes
 # AUTH_GSASL=yes
 # AUTH_GSASL_PC=libgsasl
 # AUTH_HEIMDAL_GSSAPI=yes
 # AUTH_HEIMDAL_GSSAPI_PC=heimdal-gssapi
-# AUTH_PLAINTEXT=yes
-# AUTH_SPA=yes
+AUTH_PLAINTEXT=yes
+AUTH_SPA=yes
 
 
 #------------------------------------------------------------------------------
@@ -677,9 +680,9 @@
 # and its header file are not in the default places. You might need to use
 # something like this:
 #
-# HAVE_ICONV=yes
-# CFLAGS=-O -I/usr/local/include
-# EXTRALIBS_EXIM=-L/usr/local/lib -liconv
+HAVE_ICONV=yes
+CFLAGS=-I/ec/include -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
+EXTRALIBS_EXIM=-L/ec/lib -liconv
 #
 # but of course there may need to be other things in CFLAGS and EXTRALIBS_EXIM
 # as well.
@@ -698,7 +701,7 @@
 # "{crypt16}". If you want the default handling (without any preceding
 # indicator) to use crypt16(), uncomment the following line:
 
-# DEFAULT_CRYPT=crypt16
+DEFAULT_CRYPT=crypt16
 
 # If you do that, you can still access the basic crypt() function by preceding
 # an encrypted password with "{crypt}". For more details, see the description
@@ -732,11 +735,11 @@
 # leave these settings commented out.
 
 # This setting is required for any TLS support (either OpenSSL or GnuTLS)
-# SUPPORT_TLS=yes
+SUPPORT_TLS=yes
 
 # Uncomment one of these settings if you are using OpenSSL; pkg-config vs not
 # USE_OPENSSL_PC=openssl
-# TLS_LIBS=-lssl -lcrypto
+TLS_LIBS=-lssl -lcrypto
 
 # Uncomment the first and either the second or the third of these if you
 # are using GnuTLS.  If you have pkg-config, then the second, else the third.
@@ -769,7 +772,7 @@
 # with all your other libraries. If they are in a special directory, you may
 # need something like
 
-# TLS_LIBS=-L/usr/local/openssl/lib -lssl -lcrypto
+TLS_LIBS=-L/ec/lib -lssl -lcrypto
 # or
 # TLS_LIBS=-L/opt/gnu/lib -lgnutls -ltasn1 -lgcrypt
 
@@ -777,7 +780,7 @@
 # auxiliary programs. If the include files are not in a standard place, you can
 # set TLS_INCLUDE to specify where they are, for example:
 
-# TLS_INCLUDE=-I/usr/local/openssl/include/
+TLS_INCLUDE=-I/ec/include -I/ec/include/openssl
 # or
 # TLS_INCLUDE=-I/opt/gnu/include
 
@@ -814,7 +817,7 @@
 # %s. This will be replaced by one of the strings "main", "panic", or "reject"
 # to form the final file names. Some installations may want something like this:
 
-# LOG_FILE_PATH=/var/log/exim_%slog
+LOG_FILE_PATH=/ec/var/log/exim/%s.log
 
 # which results in files with names /var/log/exim_mainlog, etc. The directory
 # in which the log files are placed must exist; Exim does not try to create
@@ -863,7 +866,7 @@
 # files. Both the name of the command and the suffix that it adds to files
 # need to be defined here. See also the EXICYCLOG_MAX configuration.
 
-COMPRESS_COMMAND=/usr/bin/gzip
+COMPRESS_COMMAND=/ec/bin/gzip
 COMPRESS_SUFFIX=gz
 
 
@@ -871,7 +874,7 @@
 # If the exigrep utility is fed compressed log files, it tries to uncompress
 # them using this command.
 
-ZCAT_COMMAND=/usr/bin/zcat
+ZCAT_COMMAND=/ec/bin/zcat
 
 
 #------------------------------------------------------------------------------
@@ -900,8 +903,7 @@
 # support, which is intended for use in conjunction with the SMTP AUTH
 # facilities, is included only when requested by the following setting:
 
-# SUPPORT_PAM=yes
-
+SUPPORT_PAM=yes
 # You probably need to add -lpam to EXTRALIBS, and in some releases of
 # GNU/Linux -ldl is also needed.
 
@@ -1016,7 +1018,7 @@
 # aliases). The following setting can be changed to specify a different
 # location for the system alias file.
 
-SYSTEM_ALIASES_FILE=/etc/aliases
+SYSTEM_ALIASES_FILE=/ec/etc/exim/aliases.conf
 
 
 #------------------------------------------------------------------------------
@@ -1035,7 +1037,8 @@
 # is "yes", as well as supporting line editing, a history of input lines in the
 # current run is maintained.
 
-# USE_READLINE=yes
+USE_READLINE=yes
+EXTRALIBS=-ldl
 
 # You may need to add -ldl to EXTRALIBS when you set USE_READLINE=yes.
 # Note that this option adds to the size of the Exim binary, because the
@@ -1272,7 +1275,7 @@
 # (process id) to a file so that it can easily be identified. The path of the
 # file can be specified here. Some installations may want something like this:
 
-# PID_FILE_PATH=/var/lock/exim.pid
+PID_FILE_PATH=/var/run/ec_exim.pid
 
 # If PID_FILE_PATH is not defined, Exim writes a file in its spool directory
 # using the name "exim-daemon.pid".
@@ -1343,4 +1346,6 @@
 
 # ENABLE_DISABLE_FSYNC=yes
 
+EXTRALIBS_EXIM=-L/ec/lib -liconv -lpam -R/ec/lib
+
 # End of EDITME for Exim 4.
