.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

time.h(0p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   time.h(0P)              POSIX Programmer's Manual             time.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          time.h — time types


---------------------------------------------------------

::

          #include <time.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <time.h> header shall define the clock_t, size_t, time_t,
          types as described in <sys/types.h>.

          The <time.h> header shall define the clockid_t and timer_t types
          as described in <sys/types.h>.

          The <time.h> header shall define the locale_t type as described
          in <locale.h>.

          The <time.h> header shall define the pid_t type as described in
          <sys/types.h>.

          The tag sigevent shall be declared as naming an incomplete
          structure type, the contents of which are described in the
          <signal.h> header.

          The <time.h> header shall declare the tm structure, which shall
          include at least the following members:

              int    tm_sec   Seconds [0,60].
              int    tm_min   Minutes [0,59].
              int    tm_hour  Hour [0,23].
              int    tm_mday  Day of month [1,31].
              int    tm_mon   Month of year [0,11].
              int    tm_year  Years since 1900.
              int    tm_wday  Day of week [0,6] (Sunday =0).
              int    tm_yday  Day of year [0,365].
              int    tm_isdst Daylight Savings flag.

          The value of tm_isdst shall be positive if Daylight Savings Time
          is in effect, 0 if Daylight Savings Time is not in effect, and
          negative if the information is not available.

          The <time.h> header shall declare the timespec structure, which
          shall include at least the following members:

              time_t  tv_sec    Seconds.
              long    tv_nsec   Nanoseconds.

          The <time.h> header shall also declare the itimerspec structure,
          which shall include at least the following members:

              struct timespec  it_interval  Timer period.
              struct timespec  it_value     Timer expiration.

          The <time.h> header shall define the following macros:

          NULL          As described in <stddef.h>.

          CLOCKS_PER_SEC
                        A number used to convert the value returned by the
                        clock() function into seconds. The value shall be
                        an expression with type clock_t.  The value of
                        CLOCKS_PER_SEC shall be 1 million on XSI-conformant
                        systems. However, it may be variable on other
                        systems, and it should not be assumed that
                        CLOCKS_PER_SEC is a compile-time constant.

          The <time.h> header shall define the following symbolic
          constants. The values shall have a type that is assignment-
          compatible with clockid_t.

          CLOCK_MONOTONIC
                        The identifier for the system-wide monotonic clock,
                        which is defined as a clock measuring real time,
                        whose value cannot be set via clock_settime() and
                        which cannot have negative clock jumps. The maximum
                        possible clock jump shall be implementation-
                        defined.

          CLOCK_PROCESS_CPUTIME_ID
                        The identifier of the CPU-time clock associated
                        with the process making a clock() or timer*()
                        function call.

          CLOCK_REALTIME
                        The identifier of the system-wide clock measuring
                        real time.

          CLOCK_THREAD_CPUTIME_ID
                        The identifier of the CPU-time clock associated
                        with the thread making a clock() or timer*()
                        function call.

          The <time.h> header shall define the following symbolic constant:

          TIMER_ABSTIME Flag indicating time is absolute. For functions
                        taking timer objects, this refers to the clock
                        associated with the timer.

          The <time.h> header shall provide a declaration or definition for
          getdate_err.  The getdate_err symbol shall expand to an
          expression of type int.  It is unspecified whether getdate_err is
          a macro or an identifier declared with external linkage, and
          whether or not it is a modifiable lvalue. If a macro definition
          is suppressed in order to access an actual object, or a program
          defines an identifier with the name getdate_err, the behavior is
          undefined.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              char      *asctime(const struct tm *);
              char      *asctime_r(const struct tm *restrict, char *restrict);
              clock_t    clock(void);
              int        clock_getcpuclockid(pid_t, clockid_t *);
              int        clock_getres(clockid_t, struct timespec *);
              int        clock_gettime(clockid_t, struct timespec *);
              int        clock_nanosleep(clockid_t, int, const struct timespec *,
                             struct timespec *);
              int        clock_settime(clockid_t, const struct timespec *);
              char      *ctime(const time_t *);
              char      *ctime_r(const time_t *, char *);
              double     difftime(time_t, time_t);
              struct tm *getdate(const char *);
              struct tm *gmtime(const time_t *);
              struct tm *gmtime_r(const time_t *restrict, struct tm *restrict);
              struct tm *localtime(const time_t *);
              struct tm *localtime_r(const time_t *restrict, struct tm *restrict);
              time_t     mktime(struct tm *);
              int        nanosleep(const struct timespec *, struct timespec *);
              size_t     strftime(char *restrict, size_t, const char *restrict,
                         const struct tm *restrict);
              size_t     strftime_l(char *restrict, size_t, const char *restrict,
                             const struct tm *restrict, locale_t);
              char      *strptime(const char *restrict, const char *restrict,
                             struct tm *restrict);
              time_t     time(time_t *);
              int        timer_create(clockid_t, struct sigevent *restrict,
                             timer_t *restrict);
              int        timer_delete(timer_t);
              int        timer_getoverrun(timer_t);
              int        timer_gettime(timer_t, struct itimerspec *);
              int        timer_settime(timer_t, int, const struct itimerspec *restrict,
                             struct itimerspec *restrict);
              void       tzset(void);

          The <time.h> header shall declare the following as variables:

              extern int    daylight;
              extern long   timezone;
              extern char  *tzname[];

          Inclusion of the <time.h> header may make visible all symbols
          from the <signal.h> header.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The range [0,60] for tm_sec allows for the occasional leap
          second.

          tm_year is a signed value; therefore, years before 1900 may be
          represented.

          To obtain the number of clock ticks per second returned by the
          times() function, applications should call sysconf(_SC_CLK_TCK).


-----------------------------------------------------------

::

          The range [0,60] seconds allows for positive or negative leap
          seconds.  The formal definition of UTC does not permit double
          leap seconds, so all mention of double leap seconds has been
          removed, and the range shortened from the former [0,61] seconds
          seen in earlier versions of this standard.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          locale.h(0p), signal.h(0p), stddef.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, asctime(3p), clock(3p),
          clock_getcpuclockid(3p), clock_getres(3p), clock_nanosleep(3p),
          ctime(3p), difftime(3p), getdate(3p), gmtime(3p), localtime(3p),
          mktime(3p), mq_receive(3p), mq_send(3p), nanosleep(3p),
          pthread_getcpuclockid(3p), pthread_mutex_timedlock(3p),
          pthread_rwlock_timedrdlock(3p), pthread_rwlock_timedwrlock(3p),
          sem_timedwait(3p), strftime(3p), strptime(3p), sysconf(3p),
          time(3p), timer_create(3p), timer_delete(3p),
          timer_getoverrun(3p), tzset(3p), utime(3p)


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

   IEEE/The Open Group               2017                        time.h(0P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__, 
`mqueue.h(0p) <../man0/mqueue.h.0p.html>`__, 
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`sched.h(0p) <../man0/sched.h.0p.html>`__, 
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`sys_select.h(0p) <../man0/sys_select.h.0p.html>`__, 
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`sys_types.h(0p) <../man0/sys_types.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`asctime(3p) <../man3/asctime.3p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`clock_getcpuclockid(3p) <../man3/clock_getcpuclockid.3p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`clock_nanosleep(3p) <../man3/clock_nanosleep.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
`getdate(3p) <../man3/getdate.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_send(3p) <../man3/mq_send.3p.html>`__, 
`nanosleep(3p) <../man3/nanosleep.3p.html>`__, 
`posix_trace_attr_getclockres(3p) <../man3/posix_trace_attr_getclockres.3p.html>`__, 
`pthread_getcpuclockid(3p) <../man3/pthread_getcpuclockid.3p.html>`__, 
`pthread_mutex_timedlock(3p) <../man3/pthread_mutex_timedlock.3p.html>`__, 
`pthread_rwlock_timedrdlock(3p) <../man3/pthread_rwlock_timedrdlock.3p.html>`__, 
`pthread_rwlock_timedwrlock(3p) <../man3/pthread_rwlock_timedwrlock.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sigtimedwait(3p) <../man3/sigtimedwait.3p.html>`__, 
`sigwait(3p) <../man3/sigwait.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`strptime(3p) <../man3/strptime.3p.html>`__, 
`time(3p) <../man3/time.3p.html>`__, 
`timer_create(3p) <../man3/timer_create.3p.html>`__, 
`timer_delete(3p) <../man3/timer_delete.3p.html>`__, 
`timer_getoverrun(3p) <../man3/timer_getoverrun.3p.html>`__, 
`tzset(3p) <../man3/tzset.3p.html>`__

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
