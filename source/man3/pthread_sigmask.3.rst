.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_sigmask(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   PTHREAD_SIGMASK(3)      Linux Programmer's Manual     PTHREAD_SIGMASK(3)

NAME
-------------------------------------------------

::

          pthread_sigmask - examine and change mask of blocked signals


---------------------------------------------------------

::

          #include <signal.h>

          int pthread_sigmask(int how, const sigset_t *set, sigset_t *oldset);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_sigmask():
              _POSIX_C_SOURCE >= 199506L || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          The pthread_sigmask() function is just like sigprocmask(2), with
          the difference that its use in multithreaded programs is
          explicitly specified by POSIX.1.  Other differences are noted in
          this page.

          For a description of the arguments and operation of this
          function, see sigprocmask(2).


-----------------------------------------------------------------

::

          On success, pthread_sigmask() returns 0; on error, it returns an
          error number.


-----------------------------------------------------

::

          See sigprocmask(2).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_sigmask()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          A new thread inherits a copy of its creator's signal mask.

          The glibc pthread_sigmask() function silently ignores attempts to
          block the two real-time signals that are used internally by the
          NPTL threading implementation.  See nptl(7) for details.


---------------------------------------------------------

::

          The program below blocks some signals in the main thread, and
          then creates a dedicated thread to fetch those signals via
          sigwait(3).  The following shell session demonstrates its use:

              $ ./a.out &
              [1] 5423
              $ kill -QUIT %1
              Signal handling thread got signal 3
              $ kill -USR1 %1
              Signal handling thread got signal 10
              $ kill -TERM %1
              [1]+  Terminated              ./a.out

      Program source

          #include <pthread.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>
          #include <signal.h>
          #include <errno.h>

          /* Simple error handling functions */

          #define handle_error_en(en, msg) \
                  do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

          static void *
          sig_thread(void *arg)
          {
              sigset_t *set = arg;
              int s, sig;

              for (;;) {
                  s = sigwait(set, &sig);
                  if (s != 0)
                      handle_error_en(s, "sigwait");
                  printf("Signal handling thread got signal %d\n", sig);
              }
          }

          int
          main(int argc, char *argv[])
          {
              pthread_t thread;
              sigset_t set;
              int s;

              /* Block SIGQUIT and SIGUSR1; other threads created by main()
                 will inherit a copy of the signal mask. */

              sigemptyset(&set);
              sigaddset(&set, SIGQUIT);
              sigaddset(&set, SIGUSR1);
              s = pthread_sigmask(SIG_BLOCK, &set, NULL);
              if (s != 0)
                  handle_error_en(s, "pthread_sigmask");

              s = pthread_create(&thread, NULL, &sig_thread, &set);
              if (s != 0)
                  handle_error_en(s, "pthread_create");

              /* Main thread carries on to create other threads and/or do
                 other work. */

              pause();            /* Dummy pause so we can test program */
          }


---------------------------------------------------------

::

          sigaction(2), sigpending(2), sigprocmask(2),
          pthread_attr_setsigmask_np(3), pthread_create(3),
          pthread_kill(3), sigsetops(3), pthreads(7), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22             PTHREAD_SIGMASK(3)

--------------

Pages that refer to this page:
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`pthread_attr_setsigmask_np(3) <../man3/pthread_attr_setsigmask_np.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`pthread_sigqueue(3) <../man3/pthread_sigqueue.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sd_event_add_signal(3) <../man3/sd_event_add_signal.3.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_sigmask.3.license.html>`__

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
