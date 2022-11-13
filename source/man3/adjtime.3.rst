.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

adjtime(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ADJTIME(3)              Linux Programmer's Manual             ADJTIME(3)

NAME
-------------------------------------------------

::

          adjtime - correct the time to synchronize the system clock


---------------------------------------------------------

::

          #include <sys/time.h>

          int adjtime(const struct timeval *delta, struct timeval *olddelta);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          adjtime():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          The adjtime() function gradually adjusts the system clock (as
          returned by gettimeofday(2)).  The amount of time by which the
          clock is to be adjusted is specified in the structure pointed to
          by delta.  This structure has the following form:

              struct timeval {
                  time_t      tv_sec;     /* seconds */
                  suseconds_t tv_usec;    /* microseconds */
              };

          If the adjustment in delta is positive, then the system clock is
          speeded up by some small percentage (i.e., by adding a small
          amount of time to the clock value in each second) until the
          adjustment has been completed.  If the adjustment in delta is
          negative, then the clock is slowed down in a similar fashion.

          If a clock adjustment from an earlier adjtime() call is already
          in progress at the time of a later adjtime() call, and delta is
          not NULL for the later call, then the earlier adjustment is
          stopped, but any already completed part of that adjustment is not
          undone.

          If olddelta is not NULL, then the buffer that it points to is
          used to return the amount of time remaining from any previous
          adjustment that has not yet been completed.


-----------------------------------------------------------------

::

          On success, adjtime() returns 0.  On failure, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL The adjustment in delta is outside the permitted range.

          EPERM  The caller does not have sufficient privilege to adjust
                 the time.  Under Linux, the CAP_SYS_TIME capability is
                 required.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │adjtime()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.3BSD, System V.


---------------------------------------------------

::

          The adjustment that adjtime() makes to the clock is carried out
          in such a manner that the clock is always monotonically
          increasing.  Using adjtime() to adjust the time prevents the
          problems that can be caused for certain applications (e.g.,
          make(1)) by abrupt positive or negative jumps in the system time.

          adjtime() is intended to be used to make small adjustments to the
          system time.  Most systems impose a limit on the adjustment that
          can be specified in delta.  In the glibc implementation, delta
          must be less than or equal to (INT_MAX / 1000000 - 2) and greater
          than or equal to (INT_MIN / 1000000 + 2) (respectively 2145 and
          -2145 seconds on i386).


-------------------------------------------------

::

          A longstanding bug meant that if delta was specified as NULL, no
          valid information about the outstanding clock adjustment was
          returned in olddelta.  (In this circumstance, adjtime() should
          return the outstanding clock adjustment, without changing it.)
          This bug is fixed on systems with glibc 2.8 or later and Linux
          kernel 2.6.26 or later.


---------------------------------------------------------

::

          adjtimex(2), gettimeofday(2), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     ADJTIME(3)

--------------

Pages that refer to this page:
`adjtimex(2) <../man2/adjtimex.2.html>`__, 
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/adjtime.3.license.html>`__

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
