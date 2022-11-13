.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_detach(3) — Linux manual page
=====================================

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

   PTHREAD_DETACH(3)       Linux Programmer's Manual      PTHREAD_DETACH(3)

NAME
-------------------------------------------------

::

          pthread_detach - detach a thread


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_detach(pthread_t thread);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_detach() function marks the thread identified by
          thread as detached.  When a detached thread terminates, its
          resources are automatically released back to the system without
          the need for another thread to join with the terminated thread.

          Attempting to detach an already detached thread results in
          unspecified behavior.


-----------------------------------------------------------------

::

          On success, pthread_detach() returns 0; on error, it returns an
          error number.


-----------------------------------------------------

::

          EINVAL thread is not a joinable thread.

          ESRCH  No thread with the ID thread could be found.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_detach()                      │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Once a thread has been detached, it can't be joined with
          pthread_join(3) or be made joinable again.

          A new thread can be created in a detached state using
          pthread_attr_setdetachstate(3) to set the detached attribute of
          the attr argument of pthread_create(3).

          The detached attribute merely determines the behavior of the
          system when the thread terminates; it does not prevent the thread
          from being terminated if the process terminates using exit(3) (or
          equivalently, if the main thread returns).

          Either pthread_join(3) or pthread_detach() should be called for
          each thread that an application creates, so that system resources
          for the thread can be released.  (But note that the resources of
          any threads for which one of these actions has not been done will
          be freed when the process terminates.)


---------------------------------------------------------

::

          The following statement detaches the calling thread:

              pthread_detach(pthread_self());


---------------------------------------------------------

::

          pthread_attr_setdetachstate(3), pthread_cancel(3),
          pthread_create(3), pthread_exit(3), pthread_join(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22              PTHREAD_DETACH(3)

--------------

Pages that refer to this page:
`pthread_attr_setdetachstate(3) <../man3/pthread_attr_setdetachstate.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_join(3) <../man3/pthread_join.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_detach.3.license.html>`__

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
