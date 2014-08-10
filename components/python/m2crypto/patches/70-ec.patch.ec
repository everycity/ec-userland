Index: M2Crypto-0.21.1/setup.py
===================================================================
--- M2Crypto-0.21.1/setup.py.orig
+++ M2Crypto-0.21.1/setup.py
@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_
             self.openssl = 'c:\\pkg'
         else:
             self.libraries = ['ssl', 'crypto']
-            self.openssl = '/usr'
+            self.openssl = '/ec'
        
     
     def finalize_options(self):
