--- serf-1.3.3/SConstruct.~1~	2013-10-04 16:11:04.000000000 +0100
+++ serf-1.3.3/SConstruct	2013-12-30 01:37:11.556330321 +0000
@@ -248,6 +248,10 @@
 
   if sys.platform == 'sunos5':
     env.Append(LIBS='m')
+    env.Prepend(PATH='/ec/bin:/usr/bin')
+    env['PLATFORM'] = 'posix'
+    env['SHLINKFLAGS'] = ['$LINKFLAGS','-shared']
+    env['SHCCFLAGS'] = ['$CCFLAGS', '-fPIC']
 else:
   # Warning level 4, no unused argument warnings
   env.Append(CCFLAGS=['/W4', '/wd4100'])
