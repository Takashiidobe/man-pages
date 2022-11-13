.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

time(2) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   TIME(2)                 Linux Programmer's Manual                TIME(2)

NAME
-------------------------------------------------

::

          time - get time in seconds


---------------------------------------------------------

::

          #include <time.h>

          time_t time(time_t *tloc);


---------------------------------------------------------------

::

          time() returns the time as the number of seconds since the Epoch,
          1970-01-01 00:00:00 +0000 (UTC).

          If tloc is non-NULL, the return value is also stored in the
          memory pointed to by tloc.


-----------------------------------------------------------------

::

          On success, the value of time in seconds since the Epoch is
          returned.  On error, ((time_t) -1) is returned, and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EFAULT tloc points outside your accessible address space (but see
                 BUGS).

                 On systems where the C library time() wrapper function
                 invokes an implementation provided by the vdso(7) (so that
                 there is no trap into the kernel), an invalid address may
                 instead trigger a SIGSEGV signal.


-------------------------------------------------------------------

::

          SVr4, 4.3BSD, C89, C99, POSIX.1-2001.  POSIX does not specify any
          error conditions.


---------------------------------------------------

::

          POSIX.1 defines seconds since the Epoch using a formula that
          approximates the number of seconds between a specified time and
          the Epoch.  This formula takes account of the facts that all
          years that are evenly divisible by 4 are leap years, but years
          that are evenly divisible by 100 are not leap years unless they
          are also evenly divisible by 400, in which case they are leap
          years.  This value is not the same as the actual number of
          seconds between the time and the Epoch, because of leap seconds
          and because system clocks are not required to be synchronized to
          a standard reference.  The intention is that the interpretation
          of seconds since the Epoch values be consistent; see POSIX.1-2008
          Rationale A.4.15 for further rationale.

          On Linux, a call to time() with tloc specified as NULL cannot
          fail with the error EOVERFLOW, even on ABIs where time_t is a
          signed 32-bit integer and the clock reaches or exceeds 2**31
          seconds (2038-01-19 03:14:08 UTC, ignoring leap seconds).
          (POSIX.1 permits, but does not require, the EOVERFLOW error in
          the case where the seconds since the Epoch will not fit in
          time_t.)  Instead, the behavior on Linux is undefined when the
          system time is out of the time_t range.  Applications intended to
          run after 2038 should use ABIs with time_t wider than 32 bits.


-------------------------------------------------

::

          Error returns from this system call are indistinguishable from
          successful reports that the time is a few seconds before the
          Epoch, so the C library wrapper function never sets errno as a
          result of this call.

          The tloc argument is obsolescent and should always be NULL in new
          code.  When tloc is NULL, the call cannot fail.

      C library/kernel differences
          On some architectures, an implementation of time() is provided in
          the vdso(7).


---------------------------------------------------------

::

          date(1), gettimeofday(2), ctime(3), ftime(3), time(7), vdso(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        TIME(2)

--------------

Pages that refer to this page:
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`gettimeofday(2) <../man2/gettimeofday.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`difftime(3) <../man3/difftime.3.html>`__, 
`ftime(3) <../man3/ftime.3.html>`__, 
`getdate(3) <../man3/getdate.3.html>`__, 
`misc_conv(3) <../man3/misc_conv.3.html>`__, 
`pmtimeval(3) <../man3/pmtimeval.3.html>`__, 
`\__ppc_get_timebase(3) <../man3/__ppc_get_timebase.3.html>`__, 
`pthread_tryjoin_np(3) <../man3/pthread_tryjoin_np.3.html>`__, 
`strftime(3) <../man3/strftime.3.html>`__, 
`strptime(3) <../man3/strptime.3.html>`__, 
`tzset(3) <../man3/tzset.3.html>`__, 
`uuid_time(3) <../man3/uuid_time.3.html>`__, 
`rtc(4) <../man4/rtc.4.html>`__, 
`tzfile(5) <../man5/tzfile.5.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__,  `lsof(8) <../man8/lsof.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/time.2.license.html>`__

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
