prefix=/ec
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/64
includedir=${prefix}/include

Name: libgmp
Description: The GNU Multiple Precision Bignum Library
Version: 4.3.2
Libs: -L${libdir} -lgmp
Cflags: -I${includedir}