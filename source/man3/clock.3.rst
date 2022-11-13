.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

clock(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CLOCK(3)                Linux Programmer's Manual               CLOCK(3)

NAME
-------------------------------------------------

::

          clock - determine processor time


---------------------------------------------------------

::

          #include <time.h>

          clock_t clock(void);


---------------------------------------------------------------

::

          The clock() function returns an approximation of processor time
          used by the program.


-----------------------------------------------------------------

::

          The value returned is the CPU time used so far as a clock_t; to
          get the number of seconds used, divide by CLOCKS_PER_SEC.  If the
          processor time used is not available or its value cannot be
          represented, the function returns the value (clock_t) -1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │clock()                               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99.  XSI requires that
          CLOCKS_PER_SEC equals 1000000 independent of the actual
          resolution.


---------------------------------------------------

::

          The C standard allows for arbitrary values at the start of the
          program; subtract the value returned from a call to clock() at
          the start of the program to get maximum portability.

          Note that the time can wrap around.  On a 32-bit system where
          CLOCKS_PER_SEC equals 1000000 this function will return the same
          value approximately every 72 minutes.

          On several other implementations, the value returned by clock()
          also includes the times of any children whose status has been
          collected via wait(2) (or another wait-type call).  Linux does
          not include the times of waited-for children in the value
          returned by clock().  The times(2) function, which explicitly
          returns (separate) information about the caller and its children,
          may be preferable.

          In glibc 2.17 and earlier, clock() was implemented on top of
          times(2).  For improved accuracy, since glibc 2.18, it is
          implemented on top of clock_gettime(2) (using the
          CLOCK_PROCESS_CPUTIME_ID clock).


---------------------------------------------------------

::

          clock_gettime(2), getrusage(2), times(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       CLOCK(3)

--------------

Pages that refer to this page:
`getrusage(2) <../man2/getrusage.2.html>`__, 
`times(2) <../man2/times.2.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/clock.3.license.html>`__

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
