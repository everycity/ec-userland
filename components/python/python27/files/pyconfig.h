#ifndef _LP64
#if defined(amd64) || defined(__amd64) || defined(sparcv9) || defined(__sparcv9)
#define _LP64
#endif
#endif

#ifdef _LP64
#include <python2.7/pyconfig-64.h>
#else
#include <python2.7/pyconfig-32.h>
#endif
