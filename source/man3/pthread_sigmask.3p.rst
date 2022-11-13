.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_sigmask(3p) — Linux manual page
=======================================

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

   PTHREAD_SIGMASK(3P)     POSIX Programmer's Manual    PTHREAD_SIGMASK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_sigmask, sigprocmask — examine and change blocked signals


---------------------------------------------------------

::

          #include <signal.h>

          int pthread_sigmask(int how, const sigset_t *restrict set,
              sigset_t *restrict oset);
          int sigprocmask(int how, const sigset_t *restrict set,
              sigset_t *restrict oset);


---------------------------------------------------------------

::

          The pthread_sigmask() function shall examine or change (or both)
          the calling thread's signal mask, regardless of the number of
          threads in the process. The function shall be equivalent to
          sigprocmask(), without the restriction that the call be made in a
          single-threaded process.

          In a single-threaded process, the sigprocmask() function shall
          examine or change (or both) the signal mask of the calling
          thread.

          If the argument set is not a null pointer, it points to a set of
          signals to be used to change the currently blocked set.

          The argument how indicates the way in which the set is changed,
          and the application shall ensure it consists of one of the
          following values:

          SIG_BLOCK   The resulting set shall be the union of the current
                      set and the signal set pointed to by set.

          SIG_SETMASK The resulting set shall be the signal set pointed to
                      by set.

          SIG_UNBLOCK The resulting set shall be the intersection of the
                      current set and the complement of the signal set
                      pointed to by set.

          If the argument oset is not a null pointer, the previous mask
          shall be stored in the location pointed to by oset.  If set is a
          null pointer, the value of the argument how is not significant
          and the thread's signal mask shall be unchanged; thus the call
          can be used to enquire about currently blocked signals.

          If there are any pending unblocked signals after the call to
          sigprocmask(), at least one of those signals shall be delivered
          before the call to sigprocmask() returns.

          It is not possible to block those signals which cannot be
          ignored.  This shall be enforced by the system without causing an
          error to be indicated.

          If any of the SIGFPE, SIGILL, SIGSEGV, or SIGBUS signals are
          generated while they are blocked, the result is undefined, unless
          the signal was generated by the action of another process, or by
          one of the functions kill(), pthread_kill(), raise(), or
          sigqueue().

          If sigprocmask() fails, the thread's signal mask shall not be
          changed.

          The use of the sigprocmask() function is unspecified in a multi-
          threaded process.


-----------------------------------------------------------------

::

          Upon successful completion pthread_sigmask() shall return 0;
          otherwise, it shall return the corresponding error number.

          Upon successful completion, sigprocmask() shall return 0;
          otherwise, -1 shall be returned, errno shall be set to indicate
          the error, and the signal mask of the process shall be unchanged.


-----------------------------------------------------

::

          The pthread_sigmask() and sigprocmask() functions shall fail if:

          EINVAL The value of the how argument is not equal to one of the
                 defined values.

          The pthread_sigmask() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

      Signaling in a Multi-Threaded Process
          This example shows the use of pthread_sigmask() in order to deal
          with signals in a multi-threaded process. It provides a fairly
          general framework that could be easily adapted/extended.

              #include <stdio.h>
              #include <stdlib.h>
              #include <pthread.h>
              #include <signal.h>
              #include <string.h>
              #include <errno.h>
              ...

              static sigset_t   signal_mask;  /* signals to block         */

              int main (int argc, char *argv[])
              {
                  pthread_t  sig_thr_id;      /* signal handler thread ID */
                  int        rc;              /* return code              */

                  sigemptyset (&signal_mask);
                  sigaddset (&signal_mask, SIGINT);
                  sigaddset (&signal_mask, SIGTERM);
                  rc = pthread_sigmask (SIG_BLOCK, &signal_mask, NULL);
                  if (rc != 0) {
                      /* handle error */
                      ...
                  }
                  /* any newly created threads inherit the signal mask */

                  rc = pthread_create (&sig_thr_id, NULL, signal_thread, NULL);
                  if (rc != 0) {
                      /* handle error */
                      ...
                  }

                  /* APPLICATION CODE */
                  ...
              }

              void *signal_thread (void *arg)
              {
                  int       sig_caught;    /* signal caught       */
                  int       rc;            /* returned code       */

                  rc = sigwait (&signal_mask, &sig_caught);
                  if (rc != 0) {
                      /* handle error */
                  }
                  switch (sig_caught)
                  {
                  case SIGINT:     /* process SIGINT  */
                      ...
                      break;
                  case SIGTERM:    /* process SIGTERM */
                      ...
                      break;
                  default:         /* should normally not happen */
                      fprintf (stderr, "\nUnexpected signal %d\n", sig_caught);
                      break;
                  }
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          When a thread's signal mask is changed in a signal-catching
          function that is installed by sigaction(), the restoration of the
          signal mask on return from the signal-catching function overrides
          that change (see sigaction()).  If the signal-catching function
          was installed with signal(), it is unspecified whether this
          occurs.

          See kill() for a discussion of the requirement on delivery of
          signals.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), kill(3p), sigaction(3p), sigaddset(3p), sigdelset(3p),
          sigemptyset(3p), sigfillset(3p), sigismember(3p), sigpending(3p),
          sigqueue(3p), sigsuspend(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p)


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

   IEEE/The Open Group               2017               PTHREAD_SIGMASK(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sigaddset(3p) <../man3/sigaddset.3p.html>`__, 
`sigdelset(3p) <../man3/sigdelset.3p.html>`__, 
`sigemptyset(3p) <../man3/sigemptyset.3p.html>`__, 
`sigfillset(3p) <../man3/sigfillset.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`sigismember(3p) <../man3/sigismember.3p.html>`__, 
`siglongjmp(3p) <../man3/siglongjmp.3p.html>`__, 
`sigpending(3p) <../man3/sigpending.3p.html>`__, 
`sigprocmask(3p) <../man3/sigprocmask.3p.html>`__, 
`sigsetjmp(3p) <../man3/sigsetjmp.3p.html>`__, 
`sigtimedwait(3p) <../man3/sigtimedwait.3p.html>`__, 
`sigwait(3p) <../man3/sigwait.3p.html>`__

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
