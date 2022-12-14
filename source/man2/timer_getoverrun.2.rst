.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

timer_getoverrun(2) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIMER_GETOVERRUN(2)     Linux Programmer's Manual    TIMER_GETOVERRUN(2)

NAME
-------------------------------------------------

::

          timer_getoverrun - get overrun count for a POSIX per-process
          timer


---------------------------------------------------------

::

          #include <time.h>

          int timer_getoverrun(timer_t timerid);

          Link with -lrt.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          timer_getoverrun():
              _POSIX_C_SOURCE >= 199309L


---------------------------------------------------------------

::

          timer_getoverrun() returns the "overrun count" for the timer
          referred to by timerid.  An application can use the overrun count
          to accurately calculate the number of timer expirations that
          would have occurred over a given time interval.  Timer overruns
          can occur both when receiving expiration notifications via
          signals (SIGEV_SIGNAL), and via threads (SIGEV_THREAD).

          When expiration notifications are delivered via a signal,
          overruns can occur as follows.  Regardless of whether or not a
          real-time signal is used for timer notifications, the system
          queues at most one signal per timer.  (This is the behavior
          specified by POSIX.1.  The alternative, queuing one signal for
          each timer expiration, could easily result in overflowing the
          allowed limits for queued signals on the system.)  Because of
          system scheduling delays, or because the signal may be
          temporarily blocked, there can be a delay between the time when
          the notification signal is generated and the time when it is
          delivered (e.g., caught by a signal handler) or accepted (e.g.,
          using sigwaitinfo(2)).  In this interval, further timer
          expirations may occur.  The timer overrun count is the number of
          additional timer expirations that occurred between the time when
          the signal was generated and when it was delivered or accepted.

          Timer overruns can also occur when expiration notifications are
          delivered via invocation of a thread, since there may be an
          arbitrary delay between an expiration of the timer and the
          invocation of the notification thread, and in that delay
          interval, additional timer expirations may occur.


-----------------------------------------------------------------

::

          On success, timer_getoverrun() returns the overrun count of the
          specified timer; this count may be 0 if no overruns have
          occurred.  On failure, -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EINVAL timerid is not a valid timer ID.


---------------------------------------------------------

::

          This system call is available since Linux 2.6.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          When timer notifications are delivered via signals
          (SIGEV_SIGNAL), on Linux it is also possible to obtain the
          overrun count via the si_overrun field of the siginfo_t structure
          (see sigaction(2)).  This allows an application to avoid the
          overhead of making a system call to obtain the overrun count, but
          is a nonportable extension to POSIX.1.

          POSIX.1 discusses timer overruns only in the context of timer
          notifications using signals.


-------------------------------------------------

::

          POSIX.1 specifies that if the timer overrun count is equal to or
          greater than an implementation-defined maximum, DELAYTIMER_MAX,
          then timer_getoverrun() should return DELAYTIMER_MAX.  However,
          before Linux 4.19, if the timer overrun value exceeds the maximum
          representable integer, the counter cycles, starting once more
          from low values.  Since Linux 4.19, timer_getoverrun() returns
          DELAYTIMER_MAX (defined as INT_MAX in <limits.h>) in this case
          (and the overrun value is reset to 0).


---------------------------------------------------------

::

          See timer_create(2).


---------------------------------------------------------

::

          clock_gettime(2), sigaction(2), signalfd(2), sigwaitinfo(2),
          timer_create(2), timer_delete(2), timer_settime(2), signal(7),
          time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22            TIMER_GETOVERRUN(2)

--------------

Pages that refer to this page:
`sigaction(2) <../man2/sigaction.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`timer_delete(2) <../man2/timer_delete.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`timer_settime(2) <../man2/timer_settime.2.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/timer_getoverrun.2.license.html>`__

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
