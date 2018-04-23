--- serf-1.3.9/SConstruct.~1~   2015-09-17 12:46:24.000000000 +0000
+++ serf-1.3.9/SConstruct       2017-07-13 14:56:26.979478734 +0000
@@ -215,8 +215,7 @@
 # Unfortunately we can't set the .dylib compatibility_version option separately
 # from current_version, so don't use the PATCH level to avoid that build and
 # runtime patch levels have to be identical.
-if sys.platform != 'sunos5':
-  env['SHLIBVERSION'] = '%d.%d.%d' % (MAJOR, MINOR, 0)
+env['SHLIBVERSION'] = '%d.%d.%d' % (MAJOR, MINOR, 0)

 LIBNAME = 'libserf-%d' % (MAJOR,)
 if sys.platform != 'win32':
@@ -266,6 +265,9 @@
   if sys.platform == 'sunos5':
     env.Append(LIBS=['m'])
     env.Append(PLATFORM='posix')
+    env.Prepend(PATH='/ec/bin:/usr/bin')
+    env.Append(SHLINKFLAGS=['$LINKFLAGS','-shared'])
+    env.Append(SHCCFLAGS=['$CCFLAGS', '-fPIC'])
 else:
   # Warning level 4, no unused argument warnings
   env.Append(CCFLAGS=['/W4', '/wd4100'])
