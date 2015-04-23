This patch was developed in-house.  It has been submitted upstream:
http://bugs.python.org/issue23287

--- Python-2.7.9/Lib/ctypes/util.py.~1~	2014-12-10 07:59:34.000000000 -0800
+++ Python-2.7.9/Lib/ctypes/util.py	2015-01-20 15:22:03.139588641 -0800
@@ -182,22 +182,11 @@
 
     elif sys.platform == "sunos5":
 
-        def _findLib_crle(name, is64):
-            if not os.path.exists('/usr/bin/crle'):
-                return None
-
+        def _findLib_path(name, is64):
             if is64:
-                cmd = 'env LC_ALL=C /usr/bin/crle -64 2>/dev/null'
+                paths = "/ec/lib/64:/lib/64:/usr/lib/64"
             else:
-                cmd = 'env LC_ALL=C /usr/bin/crle 2>/dev/null'
-
-            for line in os.popen(cmd).readlines():
-                line = line.strip()
-                if line.startswith('Default Library Path (ELF):'):
-                    paths = line.split()[4]
-
-            if not paths:
-                return None
+                paths = "/ec/lib:/lib:/usr/lib"
 
             for dir in paths.split(":"):
                 libfile = os.path.join(dir, "lib%s.so" % name)
@@ -207,7 +196,7 @@
             return None
 
         def find_library(name, is64 = False):
-            return _get_soname(_findLib_crle(name, is64) or _findLib_gcc(name))
+            return _get_soname(_findLib_path(name, is64) or _findLib_gcc(name))
 
     else:
 
