.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

clock_getcpuclockid(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CLOCK_GETCPUCLOCKID(3)  Linux Programmer's Manual CLOCK_GETCPUCLOCKID(3)

NAME
-------------------------------------------------

::

          clock_getcpuclockid - obtain ID of a process CPU-time clock


---------------------------------------------------------

::

          #include <time.h>

          int clock_getcpuclockid(pid_t pid, clockid_t *clockid);

          Link with -lrt (only for glibc versions before 2.17).

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          clock_getcpuclockid():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The clock_getcpuclockid() function obtains the ID of the CPU-time
          clock of the process whose ID is pid, and returns it in the
          location pointed to by clockid.  If pid is zero, then the clock
          ID of the CPU-time clock of the calling process is returned.


-----------------------------------------------------------------

::

          On success, clock_getcpuclockid() returns 0; on error, it returns
          one of the positive error numbers listed in ERRORS.


-----------------------------------------------------

::

          ENOSYS The kernel does not support obtaining the per-process CPU-
                 time clock of another process, and pid does not specify
                 the calling process.

          EPERM  The caller does not have permission to access the CPU-time
                 clock of the process specified by pid.  (Specified in
                 POSIX.1-2001; does not occur on Linux unless the kernel
                 does not support obtaining the per-process CPU-time clock
                 of another process.)

          ESRCH  There is no process with the ID pid.


---------------------------------------------------------

::

          The clock_getcpuclockid() function is available in glibc since
          version 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │clock_getcpuclockid()                 │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Calling clock_gettime(2) with the clock ID obtained by a call to
          clock_getcpuclockid() with a pid of 0, is the same as using the
          clock ID CLOCK_PROCESS_CPUTIME_ID.


---------------------------------------------------------

::

          The example program below obtains the CPU-time clock ID of the
          process whose ID is given on the command line, and then uses
          clock_gettime(2) to obtain the time on that clock.  An example
          run is the following:

              $ ./a.out 1                 # Show CPU clock of init process
              CPU-time clock for PID 1 is 2.213466748 seconds

      Program source

          #define _XOPEN_SOURCE 600
          #include <stdint.h>
          #include <stdio.h>
          #include <unistd.h>
          #include <stdlib.h>
          #include <time.h>

          int
          main(int argc, char *argv[])
          {
              clockid_t clockid;
              struct timespec ts;

              if (argc != 2) {
                  fprintf(stderr, "%s <process-ID>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              if (clock_getcpuclockid(atoi(argv[1]), &clockid) != 0) {
                  perror("clock_getcpuclockid");
                  exit(EXIT_FAILURE);
              }

              if (clock_gettime(clockid, &ts) == -1) {
                  perror("clock_gettime");
                  exit(EXIT_FAILURE);
              }

              printf("CPU-time clock for PID %s is %jd.%09ld seconds\n",
                      argv[1], (intmax_t) ts.tv_sec, ts.tv_nsec);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          clock_getres(2), timer_create(2), pthread_getcpuclockid(3),
          time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22         CLOCK_GETCPUCLOCKID(3)

--------------

Pages that refer to this page:
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`pthread_getcpuclockid(3) <../man3/pthread_getcpuclockid.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/clock_getcpuclockid.3.license.html>`__

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
