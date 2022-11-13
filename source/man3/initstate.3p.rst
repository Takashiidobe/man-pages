.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

initstate(3p) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INITSTATE(3P)           POSIX Programmer's Manual          INITSTATE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          initstate, random, setstate, srandom — pseudo-random number
          functions


---------------------------------------------------------

::

          #include <stdlib.h>

          char *initstate(unsigned seed, char *state, size_t size);
          long random(void);
          char *setstate(char *state);
          void srandom(unsigned seed);


---------------------------------------------------------------

::

          The random() function shall use a non-linear additive feedback
          random-number generator employing a default state array size of
          31 long integers to return successive pseudo-random numbers in
          the range from 0 to 231-1. The period of this random-number
          generator is approximately 16 x (231-1). The size of the state
          array determines the period of the random-number generator.
          Increasing the state array size shall increase the period.

          With 256 bytes of state information, the period of the random-
          number generator shall be greater than 269.

          Like rand(), random() shall produce by default a sequence of
          numbers that can be duplicated by calling srandom() with 1 as the
          seed.

          The srandom() function shall initialize the current state array
          using the value of seed.

          The initstate() and setstate() functions handle restarting and
          changing random-number generators. The initstate() function
          allows a state array, pointed to by the state argument, to be
          initialized for future use. The size argument, which specifies
          the size in bytes of the state array, shall be used by
          initstate() to decide what type of random-number generator to
          use; the larger the state array, the more random the numbers.
          Values for the amount of state information are 8, 32, 64, 128,
          and 256 bytes. Other values greater than 8 bytes are rounded down
          to the nearest one of these values. If initstate() is called with
          8≤size<32, then random() shall use a simple linear congruential
          random number generator. The seed argument specifies a starting
          point for the random-number sequence and provides for restarting
          at the same point. The initstate() function shall return a
          pointer to the previous state information array.

          If initstate() has not been called, then random() shall behave as
          though initstate() had been called with seed=1 and size=128.

          Once a state has been initialized, setstate() allows switching
          between state arrays. The array defined by the state argument
          shall be used for further random-number generation until
          initstate() is called or setstate() is called again. The
          setstate() function shall return a pointer to the previous state
          array.


-----------------------------------------------------------------

::

          If initstate() is called with size less than 8, it shall return
          NULL.

          The random() function shall return the generated pseudo-random
          number.

          The srandom() function shall not return a value.

          Upon successful completion, initstate() and setstate() shall
          return a pointer to the previous state array; otherwise, a null
          pointer shall be returned.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          After initialization, a state array can be restarted at a
          different point in one of two ways:

           1. The initstate() function can be used, with the desired seed,
              state array, and size of the array.

           2. The setstate() function, with the desired state, can be used,
              followed by srandom() with the desired seed. The advantage of
              using both of these functions is that the size of the state
              array does not have to be saved once it is initialized.

          Although some implementations of random() have written messages
          to standard error, such implementations do not conform to
          POSIX.1‐2008.

          Issue 5 restored the historical behavior of this function.

          Threaded applications should use erand48(), nrand48(), or
          jrand48() instead of random() when an independent random number
          sequence in multiple threads is required.

          These functions should be avoided whenever non-trivial
          requirements (including safety) have to be fulfilled.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          drand48(3p), rand(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                     INITSTATE(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`drand48(3p) <../man3/drand48.3p.html>`__, 
`gethostid(3p) <../man3/gethostid.3p.html>`__, 
`rand(3p) <../man3/rand.3p.html>`__, 
`random(3p) <../man3/random.3p.html>`__, 
`setstate(3p) <../man3/setstate.3p.html>`__, 
`srandom(3p) <../man3/srandom.3p.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
