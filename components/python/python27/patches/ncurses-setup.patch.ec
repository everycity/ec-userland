--- Python-2.7.8/setup.py.~7~	2014-07-09 10:01:47.977524330 +0400
+++ Python-2.7.8/setup.py	2014-07-09 10:06:22.690906040 +0400
@@ -1364,20 +1364,37 @@
 
         # Curses support, requiring the System V version of curses, often
         # provided by the ncurses library.
+        curses_lib_dirs = []
+        curses_inc_dirs = []
+        curses_incs = []
+        if host_platform == 'sunos5':
+            # look for ncurses in /usr/gnu on Solaris
+            curses_inc_dirs.append('/ec/include/ncursesw')
+            curses_lib_dirs.append('/usr/gnu/lib')
+            if os.path.exists('/usr/gnu/lib/sparcv9'):
+                curses_lib_dirs.append('/usr/gnu/lib/sparcv9')
+            else:
+                curses_lib_dirs.append('/usr/gnu/lib/amd64')
         panel_library = 'panel'
-        curses_incs = None
-        if curses_library.startswith('ncurses'):
-            if curses_library == 'ncursesw':
-                # Bug 1464056: If _curses.so links with ncursesw,
-                # _curses_panel.so must link with panelw.
-                panel_library = 'panelw'
-            curses_libs = [curses_library]
+        if (self.compiler.find_library_file(lib_dirs, 'ncursesw')):
+            curses_libs = ['ncursesw']
+            # Bug 1464056: If _curses.so links with ncursesw,
+            # _curses_panel.so must link with panelw.
+            panel_library = 'panelw'
             curses_incs = find_file('curses.h', inc_dirs,
                                     [os.path.join(d, 'ncursesw') for d in inc_dirs])
             exts.append( Extension('_curses', ['_cursesmodule.c'],
                                    include_dirs = curses_incs,
                                    libraries = curses_libs) )
-        elif curses_library == 'curses' and host_platform != 'darwin':
+        elif (self.compiler.find_library_file(lib_dirs + curses_lib_dirs, 'ncurses')):
+            curses_libs = ['ncurses']
+            exts.append( Extension('_curses', ['_cursesmodule.c'],
+                           libraries = curses_libs,
+                           library_dirs = curses_lib_dirs,
+                           runtime_library_dirs = curses_lib_dirs,
+                           include_dirs = curses_inc_dirs ) )
+        elif (self.compiler.find_library_file(lib_dirs, 'curses')
+              and host_platform != 'darwin'):
                 # OSX has an old Berkeley curses, not good enough for
                 # the _curses module.
             if (self.compiler.find_library_file(lib_dirs, 'terminfo')):
@@ -1394,10 +1411,12 @@
 
         # If the curses module is enabled, check for the panel module
         if (module_enabled(exts, '_curses') and
-            self.compiler.find_library_file(lib_dirs, panel_library)):
+            self.compiler.find_library_file(lib_dirs + curses_lib_dirs, panel_library)):
             exts.append( Extension('_curses_panel', ['_curses_panel.c'],
                                    include_dirs = curses_incs,
-                                   libraries = [panel_library] + curses_libs) )
+                                   libraries = [panel_library] + curses_libs,
+                                   library_dirs = curses_lib_dirs,
+                                   runtime_library_dirs = curses_lib_dirs ) )
         else:
             missing.append('_curses_panel')
 
