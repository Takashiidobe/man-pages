.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nanosleep(3p) — Linux manual page
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

   NANOSLEEP(3P)           POSIX Programmer's Manual          NANOSLEEP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          nanosleep — high resolution sleep


---------------------------------------------------------

::

          #include <time.h>

          int nanosleep(const struct timespec *rqtp, struct timespec *rmtp);


---------------------------------------------------------------

::

          The nanosleep() function shall cause the current thread to be
          suspended from execution until either the time interval specified
          by the rqtp argument has elapsed or a signal is delivered to the
          calling thread, and its action is to invoke a signal-catching
          function or to terminate the process. The suspension time may be
          longer than requested because the argument value is rounded up to
          an integer multiple of the sleep resolution or because of the
          scheduling of other activity by the system. But, except for the
          case of being interrupted by a signal, the suspension time shall
          not be less than the time specified by rqtp, as measured by the
          system clock CLOCK_REALTIME.

          The use of the nanosleep() function has no effect on the action
          or blockage of any signal.


-----------------------------------------------------------------

::

          If the nanosleep() function returns because the requested time
          has elapsed, its return value shall be zero.

          If the nanosleep() function returns because it has been
          interrupted by a signal, it shall return a value of -1 and set
          errno to indicate the interruption. If the rmtp argument is non-
          NULL, the timespec structure referenced by it is updated to
          contain the amount of time remaining in the interval (the
          requested time minus the time actually slept). The rqtp and rmtp
          arguments can point to the same object. If the rmtp argument is
          NULL, the remaining time is not returned.

          If nanosleep() fails, it shall return a value of -1 and set errno
          to indicate the error.


-----------------------------------------------------

::

          The nanosleep() function shall fail if:

          EINTR  The nanosleep() function was interrupted by a signal.

          EINVAL The rqtp argument specified a nanosecond value less than
                 zero or greater than or equal to 1000 million.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          It is common to suspend execution of a thread for an interval in
          order to poll the status of a non-interrupting function. A large
          number of actual needs can be met with a simple extension to
          sleep() that provides finer resolution.

          In the POSIX.1‐1990 standard and SVR4, it is possible to
          implement such a routine, but the frequency of wakeup is limited
          by the resolution of the alarm() and sleep() functions. In 4.3
          BSD, it is possible to write such a routine using no static
          storage and reserving no system facilities. Although it is
          possible to write a function with similar functionality to
          sleep() using the remainder of the timer_*() functions, such a
          function requires the use of signals and the reservation of some
          signal number. This volume of POSIX.1‐2017 requires that
          nanosleep() be non-intrusive of the signals function.

          The nanosleep() function shall return a value of 0 on success and
          -1 on failure or if interrupted. This latter case is different
          from sleep().  This was done because the remaining time is
          returned via an argument structure pointer, rmtp, instead of as
          the return value.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          clock_nanosleep(3p), sleep(3p)

          The Base Definitions volume of POSIX.1‐2017, time.h(0p)


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

   IEEE/The Open Group               2017                     NANOSLEEP(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`clock_nanosleep(3p) <../man3/clock_nanosleep.3p.html>`__, 
`sleep(3p) <../man3/sleep.3p.html>`__

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
