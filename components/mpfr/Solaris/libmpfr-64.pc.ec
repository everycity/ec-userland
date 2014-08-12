prefix=/ec
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/64
includedir=${prefix}/include

Name: libmpfr
Description: The GNU Multiple Precision Rounding Floating-Point Library
Version: 4.1.2
Libs: -L${libdir} -lmpfr
Cflags: -I${includedir} -I/usr/include
