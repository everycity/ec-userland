prefix=/ec
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: libgmp
Description: The GNU Multiple Precision Bignum Library
Version: 6.1.2
Libs: -L${libdir} -lgmp
Cflags: -I${includedir}
