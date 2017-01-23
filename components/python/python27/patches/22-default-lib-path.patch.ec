--- Python-2.7.13/Lib/ctypes/util.py.~1~	2016-12-17 20:05:05.000000000 +0000
+++ Python-2.7.13/Lib/ctypes/util.py	2016-12-21 19:08:33.140863506 +0000
@@ -188,39 +188,11 @@
 
     elif sys.platform == "sunos5":
 
-        def _findLib_crle(name, is64):
-            if not os.path.exists('/usr/bin/crle'):
-                return None
-
-            env = dict(os.environ)
-            env['LC_ALL'] = 'C'
-
+        def _findLib_path(name, is64):
             if is64:
-                args = ('/usr/bin/crle', '-64')
+                paths = "/ec/lib/64:/lib/64:/usr/lib/64"
             else:
-                args = ('/usr/bin/crle',)
-
-            paths = None
-            null = open(os.devnull, 'wb')
-            try:
-                with null:
-                    proc = subprocess.Popen(args,
-                                            stdout=subprocess.PIPE,
-                                            stderr=null,
-                                            env=env)
-            except OSError:  # E.g. bad executable
-                return None
-            try:
-                for line in proc.stdout:
-                    line = line.strip()
-                    if line.startswith(b'Default Library Path (ELF):'):
-                        paths = line.split()[4]
-            finally:
-                proc.stdout.close()
-                proc.wait()
-
-            if not paths:
-                return None
+                paths = "/ec/lib:/lib:/usr/lib"
 
             for dir in paths.split(":"):
                 libfile = os.path.join(dir, "lib%s.so" % name)
@@ -230,7 +202,7 @@
             return None
 
         def find_library(name, is64 = False):
-            return _get_soname(_findLib_crle(name, is64) or _findLib_gcc(name))
+            return _get_soname(_findLib_path(name, is64) or _findLib_gcc(name))
 
     else:
 
