.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

timer_settime(2) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIMER_SETTIME(2)        Linux Programmer's Manual       TIMER_SETTIME(2)

NAME
-------------------------------------------------

::

          timer_settime, timer_gettime - arm/disarm and fetch state of
          POSIX per-process timer


---------------------------------------------------------

::

          #include <time.h>

          int timer_settime(timer_t timerid, int flags,
                            const struct itimerspec *restrict new_value,
                            struct itimerspec *restrict old_value);
          int timer_gettime(timer_t timerid, struct itimerspec *curr_value);

          Link with -lrt.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          timer_settime(), timer_gettime():
              _POSIX_C_SOURCE >= 199309L


---------------------------------------------------------------

::

          timer_settime() arms or disarms the timer identified by timerid.
          The new_value argument is pointer to an itimerspec structure that
          specifies the new initial value and the new interval for the
          timer.  The itimerspec structure is defined as follows:

              struct timespec {
                  time_t tv_sec;                /* Seconds */
                  long   tv_nsec;               /* Nanoseconds */
              };

              struct itimerspec {
                  struct timespec it_interval;  /* Timer interval */
                  struct timespec it_value;     /* Initial expiration */
              };

          Each of the substructures of the itimerspec structure is a
          timespec structure that allows a time value to be specified in
          seconds and nanoseconds.  These time values are measured
          according to the clock that was specified when the timer was
          created by timer_create(2).

          If new_value->it_value specifies a nonzero value (i.e., either
          subfield is nonzero), then timer_settime() arms (starts) the
          timer, setting it to initially expire at the given time.  (If the
          timer was already armed, then the previous settings are
          overwritten.)  If new_value->it_value specifies a zero value
          (i.e., both subfields are zero), then the timer is disarmed.

          The new_value->it_interval field specifies the period of the
          timer, in seconds and nanoseconds.  If this field is nonzero,
          then each time that an armed timer expires, the timer is reloaded
          from the value specified in new_value->it_interval.  If
          new_value->it_interval specifies a zero value, then the timer
          expires just once, at the time specified by it_value.

          By default, the initial expiration time specified in
          new_value->it_value is interpreted relative to the current time
          on the timer's clock at the time of the call.  This can be
          modified by specifying TIMER_ABSTIME in flags, in which case
          new_value->it_value is interpreted as an absolute value as
          measured on the timer's clock; that is, the timer will expire
          when the clock value reaches the value specified by
          new_value->it_value.  If the specified absolute time has already
          passed, then the timer expires immediately, and the overrun count
          (see timer_getoverrun(2)) will be set correctly.

          If the value of the CLOCK_REALTIME clock is adjusted while an
          absolute timer based on that clock is armed, then the expiration
          of the timer will be appropriately adjusted.  Adjustments to the
          CLOCK_REALTIME clock have no effect on relative timers based on
          that clock.

          If old_value is not NULL, then it points to a buffer that is used
          to return the previous interval of the timer (in
          old_value->it_interval) and the amount of time until the timer
          would previously have next expired (in old_value->it_value).

          timer_gettime() returns the time until next expiration, and the
          interval, for the timer specified by timerid, in the buffer
          pointed to by curr_value.  The time remaining until the next
          timer expiration is returned in curr_value->it_value; this is
          always a relative value, regardless of whether the TIMER_ABSTIME
          flag was used when arming the timer.  If the value returned in
          curr_value->it_value is zero, then the timer is currently
          disarmed.  The timer interval is returned in
          curr_value->it_interval.  If the value returned in
          curr_value->it_interval is zero, then this is a "one-shot" timer.


-----------------------------------------------------------------

::

          On success, timer_settime() and timer_gettime() return 0.  On
          error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          These functions may fail with the following errors:

          EFAULT new_value, old_value, or curr_value is not a valid
                 pointer.

          EINVAL timerid is invalid.

          timer_settime() may fail with the following errors:

          EINVAL new_value.it_value is negative; or
                 new_value.it_value.tv_nsec is negative or greater than
                 999,999,999.


---------------------------------------------------------

::

          These system calls are available since Linux 2.6.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          See timer_create(2).


---------------------------------------------------------

::

          timer_create(2), timer_getoverrun(2), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               TIMER_SETTIME(2)

--------------

Pages that refer to this page:
`getitimer(2) <../man2/getitimer.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`timer_delete(2) <../man2/timer_delete.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`timer_getoverrun(2) <../man2/timer_getoverrun.2.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time_namespaces(7) <../man7/time_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/timer_settime.2.license.html>`__

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
