# mkfilter - a commandline tool for generating IIR and FIR filter co-efficients.


Cleaned up to compile cleanly on modern (2016) OSx.
Source was tested on OSx 10.11 (you will need to install xcode) but should also compile on other Unix variants.
Uses Clang (rather than gcc).


For detailed usage see doc.pdf (converted from doc.ps).


#The mkfilter Digital Filter Generation Program
(mkfilter vsn. 4.5 and friends)

*Cleaned up to compile cleanly on modern (2016) OSx.
Source was tested on OSx 10.11 (you will need to install xcode) but should also compile on other Unix variants.
Uses Clang (rather than gcc).*

1. Introduction

mkfilter is a program which designs an infinite impulse response digital filter from
parameters specified on the command line. Lowpass, highpass, bandpass and
bandstop filters, with Butterworth, Bessel or Chebyshev characteristics, are designed
using the bilinear transform or matched z-transform method. For most applications
the bilinear transform method is recommended. The program can also design
resonators with bandpass, bandstop or allpass characteristics. A companion program,
mkshape, designs raised-cosine finite-impulse-response filters and Hilbert transformers.
Other programs generate “C” code (in a variety of formats) from the compiled
filter specification, and generate various graphs in “gif” format.

The source code of the programs (in C++) is at
http://www-users.cs.york.ac.uk/~fisher/software/mkfilter
and there is a World Wide Web form-based front end at
http://www-users.cs.york.ac.uk/~fisher/mkfilter

The WWW front end is recommended. For most applications, it is the most convenient
way to use the mkfilter package.
