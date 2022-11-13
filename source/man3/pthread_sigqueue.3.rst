.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_sigqueue(3) — Linux manual page
=======================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_SIGQUEUE(3)     Linux Programmer's Manual    PTHREAD_SIGQUEUE(3)

NAME
-------------------------------------------------

::

          pthread_sigqueue - queue a signal and data to a thread


---------------------------------------------------------

::

          #include <signal.h>
          #include <pthread.h>

          int pthread_sigqueue(pthread_t thread, int sig,
                               const union sigval value);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_sigqueue():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The pthread_sigqueue() function performs a similar task to
          sigqueue(3), but, rather than sending a signal to a process, it
          sends a signal to a thread in the same process as the calling
          thread.

          The thread argument is the ID of a thread in the same process as
          the caller.  The sig argument specifies the signal to be sent.
          The value argument specifies data to accompany the signal; see
          sigqueue(3) for details.


-----------------------------------------------------------------

::

          On success, pthread_sigqueue() returns 0; on error, it returns an
          error number.


-----------------------------------------------------

::

          EAGAIN The limit of signals which may be queued has been reached.
                 (See signal(7) for further information.)

          EINVAL sig was invalid.

          ENOSYS pthread_sigqueue() is not supported on this system.

          ESRCH  thread is not valid.


---------------------------------------------------------

::

          The pthread_sigqueue() function first appeared in glibc 2.11.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_sigqueue()                    │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is a GNU extension.


---------------------------------------------------

::

          The glibc implementation of pthread_sigqueue() gives an error
          (EINVAL) on attempts to send either of the real-time signals used
          internally by the NPTL threading implementation.  See nptl(7) for
          details.


---------------------------------------------------------

::

          rt_tgsigqueueinfo(2), sigaction(2), pthread_sigmask(3),
          sigqueue(3), sigwait(3), pthreads(7), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22            PTHREAD_SIGQUEUE(3)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`rt_sigqueueinfo(2) <../man2/rt_sigqueueinfo.2.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_sigqueue.3.license.html>`__

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
