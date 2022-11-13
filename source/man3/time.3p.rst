.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

time(3p) — Linux manual page
============================

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

   TIME(3P)                POSIX Programmer's Manual               TIME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          time — get time


---------------------------------------------------------

::

          #include <time.h>

          time_t time(time_t *tloc);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The time() function shall return the value of time in seconds
          since the Epoch.

          The tloc argument points to an area where the return value is
          also stored. If tloc is a null pointer, no value is stored.


-----------------------------------------------------------------

::

          Upon successful completion, time() shall return the value of
          time. Otherwise, (time_t)-1 shall be returned.


-----------------------------------------------------

::

          The time() function may fail if:

          EOVERFLOW
                 The number of seconds since the Epoch will not fit in an
                 object of type time_t.

          The following sections are informative.


---------------------------------------------------------

::

      Getting the Current Time
          The following example uses the time() function to calculate the
          time elapsed, in seconds, since the Epoch, localtime() to convert
          that value to a broken-down time, and asctime() to convert the
          broken-down time values into a printable string.

              #include <stdio.h>
              #include <time.h>

              int main(void)
              {
              time_t result;

                  result = time(NULL);
                  printf("%s%ju secs since the Epoch\n",
                      asctime(localtime(&result)),
                          (uintmax_t)result);
                  return(0);
              }

          This example writes the current time to stdout in a form like
          this:

              Wed Jun 26 10:32:15 1996
              835810335 secs since the Epoch

      Timing an Event
          The following example gets the current time, prints it out in the
          user's format, and prints the number of minutes to an event being
          timed.

              #include <time.h>
              #include <stdio.h>
              ...
              time_t now;
              int minutes_to_event;
              ...
              time(&now);
              minutes_to_event = ...;
              printf("The time is ");
              puts(asctime(localtime(&now)));
              printf("There are %d minutes to the event.\n",
                  minutes_to_event);
              ...


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The time() function returns a value in seconds while
          clock_gettime() and gettimeofday() return a struct timespec
          (seconds and nanoseconds) and struct timeval (seconds and
          microseconds), respectively, and are therefore capable of
          returning more precise times. The times() function is also
          capable of more precision than time() as it returns a value in
          clock ticks, although it returns the elapsed time since an
          arbitrary point such as system boot time, not since the epoch.

          Implementations in which time_t is a 32-bit signed integer (many
          historical implementations) fail in the year 2038. POSIX.1‐2008
          does not address this problem. However, the use of the time_t
          type is mandated in order to ease the eventual fix.

          On some systems the time() function is implemented using a system
          call that does not return an error condition in addition to the
          return value. On these systems it is impossible to differentiate
          between valid and invalid return values and hence overflow
          conditions cannot be reliably detected.

          The use of the <time.h> header instead of <sys/types.h> allows
          compatibility with the ISO C standard.

          Many historical implementations (including Version 7) and the
          1984 /usr/group standard use long instead of time_t.  This volume
          of POSIX.1‐2017 uses the latter type in order to agree with the
          ISO C standard.


---------------------------------------------------------------------------

::

          In a future version of this volume of POSIX.1‐2017, time_t is
          likely to be required to be capable of representing times far in
          the future. Whether this will be mandated as a 64-bit type or a
          requirement that a specific date in the future be representable
          (for example, 10000 AD) is not yet determined. Systems purchased
          after the approval of this volume of POSIX.1‐2017 should be
          evaluated to determine whether their lifetime will extend past
          2038.


---------------------------------------------------------

::

          asctime(3p), clock(3p), clock_getres(3p), ctime(3p),
          difftime(3p), futimens(3p), gettimeofday(3p), gmtime(3p),
          localtime(3p), mktime(3p), strftime(3p), strptime(3p), times(3p),
          utime(3p)

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

   IEEE/The Open Group               2017                          TIME(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`touch(1p) <../man1/touch.1p.html>`__, 
`asctime(3p) <../man3/asctime.3p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`getrusage(3p) <../man3/getrusage.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_send(3p) <../man3/mq_send.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`pthread_mutex_timedlock(3p) <../man3/pthread_mutex_timedlock.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`strptime(3p) <../man3/strptime.3p.html>`__, 
`times(3p) <../man3/times.3p.html>`__

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
