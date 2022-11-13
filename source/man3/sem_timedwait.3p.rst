.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_timedwait(3p) — Linux manual page
=====================================

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

   SEM_TIMEDWAIT(3P)       POSIX Programmer's Manual      SEM_TIMEDWAIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sem_timedwait — lock a semaphore


---------------------------------------------------------

::

          #include <semaphore.h>
          #include <time.h>

          int sem_timedwait(sem_t *restrict sem,
              const struct timespec *restrict abstime);


---------------------------------------------------------------

::

          The sem_timedwait() function shall lock the semaphore referenced
          by sem as in the sem_wait() function. However, if the semaphore
          cannot be locked without waiting for another process or thread to
          unlock the semaphore by performing a sem_post() function, this
          wait shall be terminated when the specified timeout expires.

          The timeout shall expire when the absolute time specified by
          abstime passes, as measured by the clock on which timeouts are
          based (that is, when the value of that clock equals or exceeds
          abstime), or if the absolute time specified by abstime has
          already been passed at the time of the call.

          The timeout shall be based on the CLOCK_REALTIME clock.  The
          resolution of the timeout shall be the resolution of the clock on
          which it is based. The timespec data type is defined as a
          structure in the <time.h> header.

          Under no circumstance shall the function fail with a timeout if
          the semaphore can be locked immediately. The validity of the
          abstime need not be checked if the semaphore can be locked
          immediately.


-----------------------------------------------------------------

::

          The sem_timedwait() function shall return zero if the calling
          process successfully performed the semaphore lock operation on
          the semaphore designated by sem.  If the call was unsuccessful,
          the state of the semaphore shall be unchanged, and the function
          shall return a value of -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The sem_timedwait() function shall fail if:

          EINVAL The process or thread would have blocked, and the abstime
                 parameter specified a nanoseconds field value less than
                 zero or greater than or equal to 1000 million.

          ETIMEDOUT
                 The semaphore could not be locked before the specified
                 timeout expired.

          The sem_timedwait() function may fail if:

          EDEADLK
                 A deadlock condition was detected.

          EINTR  A signal interrupted this function.

          EINVAL The sem argument does not refer to a valid semaphore.

          The following sections are informative.


---------------------------------------------------------

::

          The program shown below operates on an unnamed semaphore. The
          program expects two command-line arguments. The first argument
          specifies a seconds value that is used to set an alarm timer to
          generate a SIGALRM signal. This handler performs a sem_post(3) to
          increment the semaphore that is being waited on in main() using
          sem_timedwait().  The second command-line argument specifies the
          length of the timeout, in seconds, for sem_timedwait().

              #include <unistd.h>
              #include <stdio.h>
              #include <stdlib.h>
              #include <semaphore.h>
              #include <time.h>
              #include <assert.h>
              #include <errno.h>
              #include <signal.h>

              sem_t sem;

              static void
              handler(int sig)
              {
                  int sav_errno = errno;
                  static const char info_msg[] = "sem_post() from handler\n";
                  write(STDOUT_FILENO, info_msg, sizeof info_msg - 1);
                  if (sem_post(&sem) == -1) {
                      static const char err_msg[] = "sem_post() failed\n";
                      write(STDERR_FILENO, err_msg, sizeof err_msg - 1);
                      _exit(EXIT_FAILURE);
                  }
                  errno = sav_errno;
              }

              int
              main(int argc, char *argv[])
              {
                  struct sigaction sa;
                  struct timespec ts;
                  int s;

                  if (argc != 3) {
                      fprintf(stderr, "Usage: %s <alarm-secs> <wait-secs>\n",
                          argv[0]);
                      exit(EXIT_FAILURE);
                  }

                  if (sem_init(&sem, 0, 0) == -1) {
                      perror("sem_init");
                      exit(EXIT_FAILURE);
                  }

                  /* Establish SIGALRM handler; set alarm timer using argv[1] */

                  sa.sa_handler = handler;
                  sigemptyset(&sa.sa_mask);
                  sa.sa_flags = 0;
                  if (sigaction(SIGALRM, &sa, NULL) == -1) {
                      perror("sigaction");
                      exit(EXIT_FAILURE);
                  }

                  alarm(atoi(argv[1]));

                  /* Calculate relative interval as current time plus
                     number of seconds given argv[2] */

                  if (clock_gettime(CLOCK_REALTIME, &ts) == -1) {
                      perror("clock_gettime");
                      exit(EXIT_FAILURE);
                  }
                  ts.tv_sec += atoi(argv[2]);

                  printf("main() about to call sem_timedwait()\n");
                  while ((s = sem_timedwait(&sem, &ts)) == -1 && errno == EINTR)
                      continue;       /* Restart if interrupted by handler */

                  /* Check what happened */

                  if (s == -1) {
                      if (errno == ETIMEDOUT)
                          printf("sem_timedwait() timed out\n");
                      else
                          perror("sem_timedwait");
                  } else
                      printf("sem_timedwait() succeeded\n");

                  exit((s == 0) ? EXIT_SUCCESS : EXIT_FAILURE);
              }


---------------------------------------------------------------------------

::

          Applications using these functions may be subject to priority
          inversion, as discussed in the Base Definitions volume of
          POSIX.1‐2017, Section 3.291, Priority Inversion.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sem_post(3p), sem_trywait(3p), semctl(3p), semget(3p), semop(3p),
          time(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, semaphore.h(0p), time.h(0p)


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

   IEEE/The Open Group               2017                 SEM_TIMEDWAIT(3P)

--------------

Pages that refer to this page:
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`sem_init(3p) <../man3/sem_init.3p.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_trywait(3p) <../man3/sem_trywait.3p.html>`__

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
