.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

timeradd(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIMERADD(3)             Linux Programmer's Manual            TIMERADD(3)

NAME
-------------------------------------------------

::

          timeradd, timersub, timercmp, timerclear, timerisset - timeval
          operations


---------------------------------------------------------

::

          #include <sys/time.h>

          void timeradd(struct timeval *a, struct timeval *b,
                        struct timeval *res);
          void timersub(struct timeval *a, struct timeval *b,
                        struct timeval *res);

          void timerclear(struct timeval *tvp);
          int timerisset(struct timeval *tvp);

          int timercmp(struct timeval *a, struct timeval *b, CMP);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          All functions shown above:
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          The macros are provided to operate on timeval structures, defined
          in <sys/time.h> as:

              struct timeval {
                  time_t      tv_sec;     /* seconds */
                  suseconds_t tv_usec;    /* microseconds */
              };

          timeradd() adds the time values in a and b, and places the sum in
          the timeval pointed to by res.  The result is normalized such
          that res->tv_usec has a value in the range 0 to 999,999.

          timersub() subtracts the time value in b from the time value in
          a, and places the result in the timeval pointed to by res.  The
          result is normalized such that res->tv_usec has a value in the
          range 0 to 999,999.

          timerclear() zeros out the timeval structure pointed to by tvp,
          so that it represents the Epoch: 1970-01-01 00:00:00 +0000 (UTC).

          timerisset() returns true (nonzero) if either field of the
          timeval structure pointed to by tvp contains a nonzero value.

          timercmp() compares the timer values in a and b using the
          comparison operator CMP, and returns true (nonzero) or false (0)
          depending on the result of the comparison.  Some systems (but not
          Linux/glibc), have a broken timercmp() implementation, in which
          CMP of >=, <=, and == do not work; portable applications can
          instead use

              !timercmp(..., <)
              !timercmp(..., >)
              !timercmp(..., !=)


-----------------------------------------------------------------

::

          timerisset() and timercmp() return true (nonzero) or false (0).


-----------------------------------------------------

::

          No errors are defined.


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on most BSD derivatives.


---------------------------------------------------------

::

          gettimeofday(2), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    TIMERADD(3)

--------------

Pages that refer to this page:
`gettimeofday(2) <../man2/gettimeofday.2.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/timeradd.3.license.html>`__

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
