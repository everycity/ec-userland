prefix=/ec
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/64
includedir=${prefix}/include

Name: libgmpxx
Description: The GNU Multiple Precision Bignum Library
Version: 6.1.2
Libs: -L${libdir} -lgmp -lgmpxx
Cflags: -I${includedir}
