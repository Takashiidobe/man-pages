.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sighold(3p) — Linux manual page
===============================

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

   SIGHOLD(3P)             POSIX Programmer's Manual            SIGHOLD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sighold, sigignore, sigpause, sigrelse, sigset — signal
          management


---------------------------------------------------------

::

          #include <signal.h>

          int sighold(int sig);
          int sigignore(int sig);
          int sigpause(int sig);
          int sigrelse(int sig);
          void (*sigset(int sig, void (*disp)(int)))(int);


---------------------------------------------------------------

::

          Use of any of these functions is unspecified in a multi-threaded
          process.

          The sighold(), sigignore(), sigpause(), sigrelse(), and sigset()
          functions provide simplified signal management.

          The sigset() function shall modify signal dispositions. The sig
          argument specifies the signal, which may be any signal except
          SIGKILL and SIGSTOP. The disp argument specifies the signal's
          disposition, which may be SIG_DFL, SIG_IGN, or the address of a
          signal handler. If sigset() is used, and disp is the address of a
          signal handler, the system shall add sig to the signal mask of
          the calling process before executing the signal handler; when the
          signal handler returns, the system shall restore the signal mask
          of the calling process to its state prior to the delivery of the
          signal. In addition, if sigset() is used, and disp is equal to
          SIG_HOLD, sig shall be added to the signal mask of the calling
          process and sig's disposition shall remain unchanged. If sigset()
          is used, and disp is not equal to SIG_HOLD, sig shall be removed
          from the signal mask of the calling process.

          The sighold() function shall add sig to the signal mask of the
          calling process.

          The sigrelse() function shall remove sig from the signal mask of
          the calling process.

          The sigignore() function shall set the disposition of sig to
          SIG_IGN.

          The sigpause() function shall remove sig from the signal mask of
          the calling process and suspend the calling process until a
          signal is received. The sigpause() function shall restore the
          signal mask of the process to its original state before
          returning.

          If the action for the SIGCHLD signal is set to SIG_IGN, child
          processes of the calling processes shall not be transformed into
          zombie processes when they terminate. If the calling process
          subsequently waits for its children, and the process has no
          unwaited-for children that were transformed into zombie
          processes, it shall block until all of its children terminate,
          and wait(), waitid(), and waitpid() shall fail and set errno to
          [ECHILD].


-----------------------------------------------------------------

::

          Upon successful completion, sigset() shall return SIG_HOLD if the
          signal had been blocked and the signal's previous disposition if
          it had not been blocked. Otherwise, SIG_ERR shall be returned and
          errno set to indicate the error.

          The sigpause() function shall suspend execution of the thread
          until a signal is received, whereupon it shall return -1 and set
          errno to [EINTR].

          For all other functions, upon successful completion, 0 shall be
          returned.  Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          These functions shall fail if:

          EINVAL The sig argument is an illegal signal number.

          The sigset() and sigignore() functions shall fail if:

          EINVAL An attempt is made to catch a signal that cannot be
                 caught, or to ignore a signal that cannot be ignored.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The sigaction() function provides a more comprehensive and
          reliable mechanism for controlling signals; new applications
          should use the sigaction() function instead of the obsolescent
          sigset() function.

          The sighold() function, in conjunction with sigrelse() or
          sigpause(), may be used to establish critical regions of code
          that require the delivery of a signal to be temporarily deferred.
          For broader portability, the pthread_sigmask() or sigprocmask()
          functions should be used instead of the obsolescent sighold() and
          sigrelse() functions.

          For broader portability, the sigsuspend() function should be used
          instead of the obsolescent sigpause() function.


-----------------------------------------------------------

::

          Each of these historic functions has a direct analog in the other
          functions which are required to be per-thread and thread-safe
          (aside from sigprocmask(), which is replaced by
          pthread_sigmask()).  The sigset() function can be implemented as
          a simple wrapper for sigaction().  The sighold() function is
          equivalent to sigprocmask() or pthread_sigmask() with SIG_BLOCK
          set. The sigignore() function is equivalent to sigaction() with
          SIG_IGN set. The sigpause() function is equivalent to
          sigsuspend().  The sigrelse() function is equivalent to
          sigprocmask() or pthread_sigmask() with SIG_UNBLOCK set.


---------------------------------------------------------------------------

::

          These functions may be removed in a future version.


---------------------------------------------------------

::

          Section 2.4, Signal Concepts, exec(1p), pause(3p),
          pthread_sigmask(3p), sigaction(3p), signal(3p), sigsuspend(3p),
          wait(3p), waitid(3p)

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

   IEEE/The Open Group               2017                       SIGHOLD(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`sigpause(3p) <../man3/sigpause.3p.html>`__, 
`sigrelse(3p) <../man3/sigrelse.3p.html>`__

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
