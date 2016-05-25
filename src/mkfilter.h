// mkfilter -- given n, compute recurrence relation
// to implement Butterworth, Bessel or Chebyshev filter of order n
// A.J. Fisher, University of York   <fisher@minster.york.ac.uk>
// September 1992

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

#define global
#define unless(x) if(!(x))
#define until(x)  while(!(x))

#define VERSION   "4.6"
#undef  PI
// Microsoft C++ does not define M_PI !
#define PI        3.14159265358979323846
#define TWOPI     (2.0 * PI)
#define EPS       1e-10
#define MAXORDER  10
#define MAXPZ     512
// .ge. 2*MAXORDER, to allow for doubling of poles in BP filter;
// high values needed for FIR filters
#define MAXSTRING   256

typedef void (*proc)();
typedef unsigned int uint;

extern const char *progname;
extern void readdata(char*, double&, int&, double*, int&, double*);

inline double sqr(double x) { return x*x; }
inline bool seq(const char *s1, const char *s2) { return strcmp(s1,s2) == 0; }
inline bool onebit(uint m) { return (m != 0) && ((m & (m-1)) == 0); }

inline double asinh(double x)
{	// Microsoft C++ does not define
	return log(x + sqrt(1.0 + sqr(x)));
}


inline double fix(double x)
{	// nearest integer
	return (x >= 0.0) ? floor(0.5+x) : -floor(0.5-x);
}

