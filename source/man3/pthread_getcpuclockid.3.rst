.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_getcpuclockid(3) — Linux manual page
============================================

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

   PTHREAD_GETCPUCLOCKID(3)Linux Programmer's ManualTHREAD_GETCPUCLOCKID(3)

NAME
-------------------------------------------------

::

          pthread_getcpuclockid - retrieve ID of a thread's CPU time clock


---------------------------------------------------------

::

          #include <pthread.h>
          #include <time.h>

          int pthread_getcpuclockid(pthread_t thread, clockid_t *clockid);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_getcpuclockid() function obtains the ID of the CPU-
          time clock of the thread whose ID is given in thread, and returns
          it in the location pointed to by clockid.


-----------------------------------------------------------------

::

          On success, this function returns 0; on error, it returns a
          nonzero error number.


-----------------------------------------------------

::

          ENOENT Per-thread CPU time clocks are not supported by the
                 system.

          ESRCH  No thread with the ID thread could be found.


---------------------------------------------------------

::

          This function is available in glibc since version 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_getcpuclockid()               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          When thread refers to the calling thread, this function returns
          an identifier that refers to the same clock manipulated by
          clock_gettime(2) and clock_settime(2) when given the clock ID
          CLOCK_THREAD_CPUTIME_ID.


---------------------------------------------------------

::

          The program below creates a thread and then uses clock_gettime(2)
          to retrieve the total process CPU time, and the per-thread CPU
          time consumed by the two threads.  The following shell session
          shows an example run:

              $ ./a.out
              Main thread sleeping
              Subthread starting infinite loop
              Main thread consuming some CPU time...
              Process total CPU time:    1.368
              Main thread CPU time:      0.376
              Subthread CPU time:        0.992

      Program source

          /* Link with "-lrt" */

          #include <time.h>
          #include <stdio.h>
          #include <stdint.h>
          #include <stdlib.h>
          #include <unistd.h>
          #include <pthread.h>
          #include <string.h>
          #include <errno.h>

          #define handle_error(msg) \
                  do { perror(msg); exit(EXIT_FAILURE); } while (0)

          #define handle_error_en(en, msg) \
                  do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

          static void *
          thread_start(void *arg)
          {
              printf("Subthread starting infinite loop\n");
              for (;;)
                  continue;
          }

          static void
          pclock(char *msg, clockid_t cid)
          {
              struct timespec ts;

              printf("%s", msg);
              if (clock_gettime(cid, &ts) == -1)
                  handle_error("clock_gettime");
              printf("%4jd.%03ld\n", (intmax_t) ts.tv_sec, ts.tv_nsec / 1000000);
          }

          int
          main(int argc, char *argv[])
          {
              pthread_t thread;
              clockid_t cid;
              int s;

              s = pthread_create(&thread, NULL, thread_start, NULL);
              if (s != 0)
                  handle_error_en(s, "pthread_create");

              printf("Main thread sleeping\n");
              sleep(1);

              printf("Main thread consuming some CPU time...\n");
              for (int j = 0; j < 2000000; j++)
                  getppid();

              pclock("Process total CPU time: ", CLOCK_PROCESS_CPUTIME_ID);

              s = pthread_getcpuclockid(pthread_self(), &cid);
              if (s != 0)
                  handle_error_en(s, "pthread_getcpuclockid");
              pclock("Main thread CPU time:   ", cid);

              /* The preceding 4 lines of code could have been replaced by:
                 pclock("Main thread CPU time:   ", CLOCK_THREAD_CPUTIME_ID); */

              s = pthread_getcpuclockid(thread, &cid);
              if (s != 0)
                  handle_error_en(s, "pthread_getcpuclockid");
              pclock("Subthread CPU time: 1    ", cid);

              exit(EXIT_SUCCESS);         /* Terminates both threads */
          }


---------------------------------------------------------

::

          clock_gettime(2), clock_settime(2), timer_create(2),
          clock_getcpuclockid(3), pthread_self(3), pthreads(7), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22       PTHREAD_GETCPUCLOCKID(3)

--------------

Pages that refer to this page:
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`clock_getcpuclockid(3) <../man3/clock_getcpuclockid.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_getcpuclockid.3.license.html>`__

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
