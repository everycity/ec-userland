Index: Python-2.7.6/setup.py
===================================================================
--- Python-2.7.6/setup.py.orig
+++ Python-2.7.6/setup.py
@@ -501,11 +501,14 @@ class PyBuildExt(build_ext):
         lib_dirs = self.compiler.library_dirs[:]
         if not cross_compiling:
             for d in (
+                '/ec/include',
                 '/usr/include',
                 ):
                 add_dir_to_list(inc_dirs, d)
             for d in (
-                '/lib64', '/usr/lib64',
+                '/ec/lib/64', '/ec/lib/64',
+                '/ec/lib', '/ec/lib',
+                '/lib/64', '/usr/lib/64',
                 '/lib', '/usr/lib',
                 ):
                 add_dir_to_list(lib_dirs, d)
