.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__ppc_get_timebase(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   __PPC_GET_TIMEBASE(3)   Linux Programmer'sManual   __PPC_GET_TIMEBASE(3)

NAME
-------------------------------------------------

::

          __ppc_get_timebase, __ppc_get_timebase_freq - get the current
          value
           of the Time Base Register on Power architecture and its
          frequency.


---------------------------------------------------------

::

          #include <sys/platform/ppc.h>

          uint64_t __ppc_get_timebase(void);
          uint64_t __ppc_get_timebase_freq(void);


---------------------------------------------------------------

::

          __ppc_get_timebase() reads the current value of the Time Base
          Register and returns its value, while __ppc_get_timebase_freq()
          returns the frequency in which the Time Base Register is updated.

          The Time Base Register is a 64-bit register provided by Power
          Architecture processors.  It stores a monotonically incremented
          value that is updated at a system-dependent frequency that may be
          different from the processor frequency.


-----------------------------------------------------------------

::

          __ppc_get_timebase() returns a 64-bit unsigned integer that
          represents the current value of the Time Base Register.

          __ppc_get_timebase_freq() returns a 64-bit unsigned integer that
          represents the frequency at which the Time Base Register is
          updated.


---------------------------------------------------------

::

          GNU C Library support for __ppc_get_timebase() has been provided
          since version 2.16 and __ppc_get_timebase_freq() has been
          available since version 2.17.


-------------------------------------------------------------------

::

          Both functions are nonstandard GNU extensions.


---------------------------------------------------------

::

          The following program will calculate the time, in microseconds,
          spent between two calls to __ppc_get_timebase().

      Program source

          #include <inttypes.h>
          #include <stdint.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <sys/platform/ppc.h>

          /* Maximum value of the Time Base Register: 2^60 - 1.
             Source: POWER ISA.  */
          #define MAX_TB 0xFFFFFFFFFFFFFFF

          int
          main(void)
          {
              uint64_t tb1, tb2, diff;

              uint64_t freq = __ppc_get_timebase_freq();
              printf("Time Base frequency = %"PRIu64" Hz\n", freq);

              tb1 = __ppc_get_timebase();

              // Do some stuff...

              tb2 = __ppc_get_timebase();

              if (tb2 > tb1) {
                  diff = tb2 - tb1;
              } else {
                  /* Treat Time Base Register overflow.  */
                  diff = (MAX_TB - tb2) + tb1;
              }

              printf("Elapsed time  = %1.2f usecs\n",
                      (double) diff * 1000000 / freq );

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          time(2), usleep(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU C Library                  2021-03-22          __PPC_GET_TIMEBASE(3)

--------------

`Copyright and license for this manual
page <../man3/__ppc_get_timebase.3.license.html>`__

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
