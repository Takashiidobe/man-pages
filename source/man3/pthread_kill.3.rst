.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_kill(3) — Linux manual page
===================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_KILL(3)         Linux Programmer's Manual        PTHREAD_KILL(3)

NAME
-------------------------------------------------

::

          pthread_kill - send a signal to a thread


---------------------------------------------------------

::

          #include <signal.h>

          int pthread_kill(pthread_t thread, int sig);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_kill():
              _POSIX_C_SOURCE >= 199506L || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          The pthread_kill() function sends the signal sig to thread, a
          thread in the same process as the caller.  The signal is
          asynchronously directed to thread.

          If sig is 0, then no signal is sent, but error checking is still
          performed.


-----------------------------------------------------------------

::

          On success, pthread_kill() returns 0; on error, it returns an
          error number, and no signal is sent.


-----------------------------------------------------

::

          EINVAL An invalid signal was specified.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_kill()                        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Signal dispositions are process-wide: if a signal handler is
          installed, the handler will be invoked in the thread thread, but
          if the disposition of the signal is "stop", "continue", or
          "terminate", this action will affect the whole process.

          The glibc implementation of pthread_kill() gives an error
          (EINVAL) on attempts to send either of the real-time signals used
          internally by the NPTL threading implementation.  See nptl(7) for
          details.

          POSIX.1-2008 recommends that if an implementation detects the use
          of a thread ID after the end of its lifetime, pthread_kill()
          should return the error ESRCH.  The glibc implementation returns
          this error in the cases where an invalid thread ID can be
          detected.  But note also that POSIX says that an attempt to use a
          thread ID whose lifetime has ended produces undefined behavior,
          and an attempt to use an invalid thread ID in a call to
          pthread_kill() can, for example, cause a segmentation fault.


---------------------------------------------------------

::

          kill(2), sigaction(2), sigpending(2), pthread_self(3),
          pthread_sigmask(3), raise(3), pthreads(7), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                PTHREAD_KILL(3)

--------------

Pages that refer to this page:
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`raise(3) <../man3/raise.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_kill.3.license.html>`__

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
