prefix=/ec
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: libgmpxx
Description: The GNU Multiple Precision Bignum Library
Version: 4.3.2
Libs: -L${libdir} -lgmp -lgmpxx
Cflags: -I${includedir}
