.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_kill(3p) — Linux manual page
====================================

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

   PTHREAD_KILL(3P)        POSIX Programmer's Manual       PTHREAD_KILL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_kill — send a signal to a thread


---------------------------------------------------------

::

          #include <signal.h>

          int pthread_kill(pthread_t thread, int sig);


---------------------------------------------------------------

::

          The pthread_kill() function shall request that a signal be
          delivered to the specified thread.

          As in kill(), if sig is zero, error checking shall be performed
          but no signal shall actually be sent.


-----------------------------------------------------------------

::

          Upon successful completion, the function shall return a value of
          zero.  Otherwise, the function shall return an error number. If
          the pthread_kill() function fails, no signal shall be sent.


-----------------------------------------------------

::

          The pthread_kill() function shall fail if:

          EINVAL The value of the sig argument is an invalid or unsupported
                 signal number.

          The pthread_kill() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The pthread_kill() function provides a mechanism for
          asynchronously directing a signal at a thread in the calling
          process. This could be used, for example, by one thread to affect
          broadcast delivery of a signal to a set of threads.

          Note that pthread_kill() only causes the signal to be handled in
          the context of the given thread; the signal action (termination
          or stopping) affects the process as a whole.


-----------------------------------------------------------

::

          If an implementation detects use of a thread ID after the end of
          its lifetime, it is recommended that the function should fail and
          report an [ESRCH] error.

          Existing implementations vary on the result of a pthread_kill()
          with a thread ID indicating an inactive thread (a terminated
          thread that has not been detached or joined). Some indicate
          success on such a call, while others give an error of [ESRCH].
          Since the definition of thread lifetime in this volume of
          POSIX.1‐2017 covers inactive threads, the [ESRCH] error as
          described is inappropriate in this case. In particular, this
          means that an application cannot have one thread check for
          termination of another with pthread_kill().


---------------------------------------------------------------------------

::

          A future version of this standard may require that pthread_kill()
          not fail with [ESRCH] in the case of sending signals to an
          inactive thread (a terminated thread not yet detached or joined),
          even though no signal will be delivered because the thread is no
          longer running.


---------------------------------------------------------

::

          kill(3p), pthread_self(3p), raise(3p)

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

   IEEE/The Open Group               2017                  PTHREAD_KILL(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__

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
