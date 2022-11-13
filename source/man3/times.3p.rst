.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

times(3p) — Linux manual page
=============================

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

   TIMES(3P)               POSIX Programmer's Manual              TIMES(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          times — get process and waited-for child process times


---------------------------------------------------------

::

          #include <sys/times.h>

          clock_t times(struct tms *buffer);


---------------------------------------------------------------

::

          The times() function shall fill the tms structure pointed to by
          buffer with time-accounting information. The tms structure is
          defined in <sys/times.h>.

          All times are measured in terms of the number of clock ticks
          used.

          The times of a terminated child process shall be included in the
          tms_cutime and tms_cstime elements of the parent when wait(),
          waitid(), or waitpid() returns the process ID of this terminated
          child. If a child process has not waited for its children, their
          times shall not be included in its times.

           *  The tms_utime structure member is the CPU time charged for
              the execution of user instructions of the calling process.

           *  The tms_stime structure member is the CPU time charged for
              execution by the system on behalf of the calling process.

           *  The tms_cutime structure member is the sum of the tms_utime
              and tms_cutime times of the child processes.

           *  The tms_cstime structure member is the sum of the tms_stime
              and tms_cstime times of the child processes.


-----------------------------------------------------------------

::

          Upon successful completion, times() shall return the elapsed real
          time, in clock ticks, since an arbitrary point in the past (for
          example, system start-up time). This point does not change from
          one invocation of times() within the process to another. The
          return value may overflow the possible range of type clock_t.  If
          times() fails, (clock_t)-1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The times() function shall fail if:

          EOVERFLOW
                 The return value would overflow the range of clock_t.

          The following sections are informative.


---------------------------------------------------------

::

      Timing a Database Lookup
          The following example defines two functions, start_clock() and
          end_clock(), that are used to time a lookup. It also defines
          variables of type clock_t and tms to measure the duration of
          transactions. The start_clock() function saves the beginning
          times given by the times() function. The end_clock() function
          gets the ending times and prints the difference between the two
          times.

              #include <sys/times.h>
              #include <stdio.h>
              ...
              void start_clock(void);
              void end_clock(char *msg);
              ...
              static clock_t st_time;
              static clock_t en_time;
              static struct tms st_cpu;
              static struct tms en_cpu;
              ...
              void
              start_clock()
              {
                  st_time = times(&st_cpu);
              }

              /* This example assumes that the result of each subtraction
                 is within the range of values that can be represented in
                 an integer type. */
              void
              end_clock(char *msg)
              {
                  en_time = times(&en_cpu);

                  fputs(msg,stdout);
                  printf("Real Time: %jd, User Time %jd, System Time %jd\n",
                      (intmax_t)(en_time - st_time),
                      (intmax_t)(en_cpu.tms_utime - st_cpu.tms_utime),
                      (intmax_t)(en_cpu.tms_stime - st_cpu.tms_stime));
              }


---------------------------------------------------------------------------

::

          Applications should use sysconf(_SC_CLK_TCK) to determine the
          number of clock ticks per second as it may vary from system to
          system.


-----------------------------------------------------------

::

          The accuracy of the times reported is intentionally left
          unspecified to allow implementations flexibility in design, from
          uniprocessor to multi-processor networks.

          The inclusion of times of child processes is recursive, so that a
          parent process may collect the total times of all of its
          descendants.  But the times of a child are only added to those of
          its parent when its parent successfully waits on the child. Thus,
          it is not guaranteed that a parent process can always see the
          total times of all its descendants; see also the discussion of
          the term ``realtime'' in alarm(3p).

          If the type clock_t is defined to be a signed 32-bit integer, it
          overflows in somewhat more than a year if there are 60 clock
          ticks per second, or less than a year if there are 100. There are
          individual systems that run continuously for longer than that.
          This volume of POSIX.1‐2017 permits an implementation to make the
          reference point for the returned value be the start-up time of
          the process, rather than system start-up time.

          The term ``charge'' in this context has nothing to do with
          billing for services. The operating system accounts for time used
          in this way. That information must be correct, regardless of how
          that information is used.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          alarm(3p), exec(1p), fork(3p), sysconf(3p), time(3p), wait(3p),
          waitid(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_times.h(0p)


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

   IEEE/The Open Group               2017                         TIMES(3P)

--------------

Pages that refer to this page:
`sys_times.h(0p) <../man0/sys_times.h.0p.html>`__, 
`time(1p) <../man1/time.1p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`getdate(3p) <../man3/getdate.3p.html>`__, 
`getrusage(3p) <../man3/getrusage.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`time(3p) <../man3/time.3p.html>`__

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
