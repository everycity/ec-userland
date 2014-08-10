Index: Python-2.6.9/setup.py
===================================================================
--- Python-2.6.9/setup.py.orig
+++ Python-2.6.9/setup.py
@@ -1339,6 +1339,7 @@ class PyBuildExt(build_ext):
         exts.append(Extension('pyexpat',
                               define_macros = define_macros,
                               include_dirs = [expatinc],
+                              libraries = ['expat'],
                               sources = ['pyexpat.c',
                                          'expat/xmlparse.c',
                                          'expat/xmlrole.c',
