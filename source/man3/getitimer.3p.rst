.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getitimer(3p) — Linux manual page
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

   GETITIMER(3P)           POSIX Programmer's Manual          GETITIMER(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getitimer, setitimer — get and set value of interval timer


---------------------------------------------------------

::

          #include <sys/time.h>

          int getitimer(int which, struct itimerval *value);
          int setitimer(int which, const struct itimerval *restrict value,
              struct itimerval *restrict ovalue);


---------------------------------------------------------------

::

          The getitimer() function shall store the current value of the
          timer specified by which into the structure pointed to by value.
          The setitimer() function shall set the timer specified by which
          to the value specified in the structure pointed to by value, and
          if ovalue is not a null pointer, store the previous value of the
          timer in the structure pointed to by ovalue.

          A timer value is defined by the itimerval structure, specified in
          <sys/time.h>.  If it_value is non-zero, it shall indicate the
          time to the next timer expiration.  If it_interval is non-zero,
          it shall specify a value to be used in reloading it_value when
          the timer expires. Setting it_value to 0 shall disable a timer,
          regardless of the value of it_interval.  Setting it_interval to 0
          shall disable a timer after its next expiration (assuming
          it_value is non-zero).

          Implementations may place limitations on the granularity of timer
          values. For each interval timer, if the requested timer value
          requires a finer granularity than the implementation supports,
          the actual timer value shall be rounded up to the next supported
          value.

          An XSI-conforming implementation provides each process with at
          least three interval timers, which are indicated by the which
          argument:

          ITIMER_PROF   Decrements both in process virtual time and when
                        the system is running on behalf of the process. It
                        is designed to be used by interpreters in
                        statistically profiling the execution of
                        interpreted programs. Each time the ITIMER_PROF
                        timer expires, the SIGPROF signal is delivered.

          ITIMER_REAL   Decrements in real time. A SIGALRM signal is
                        delivered when this timer expires.

          ITIMER_VIRTUAL
                        Decrements in process virtual time. It runs only
                        when the process is executing. A SIGVTALRM signal
                        is delivered when it expires.

          The interaction between setitimer() and alarm() or sleep() is
          unspecified.


-----------------------------------------------------------------

::

          Upon successful completion, getitimer() or setitimer() shall
          return 0; otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The setitimer() function shall fail if:

          EINVAL The value argument is not in canonical form. (In canonical
                 form, the number of microseconds is a non-negative integer
                 less than 1000000 and the number of seconds is a non-
                 negative integer.)

          The getitimer() and setitimer() functions may fail if:

          EINVAL The which argument is not recognized.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications should use the timer_gettime() and timer_settime()
          functions instead of the obsolescent getitimer() and setitimer()
          functions, respectively.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The getitimer() and setitimer() functions may be removed in a
          future version.


---------------------------------------------------------

::

          alarm(3p), exec(1p), sleep(3p), timer_getoverrun(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p),
          sys_time.h(0p)


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

   IEEE/The Open Group               2017                     GETITIMER(3P)

--------------

Pages that refer to this page:
`sys_time.h(0p) <../man0/sys_time.h.0p.html>`__, 
`alarm(3p) <../man3/alarm.3p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`setitimer(3p) <../man3/setitimer.3p.html>`__, 
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
