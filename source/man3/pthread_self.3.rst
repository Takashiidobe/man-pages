.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_self(3) — Linux manual page
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

   PTHREAD_SELF(3)         Linux Programmer's Manual        PTHREAD_SELF(3)

NAME
-------------------------------------------------

::

          pthread_self - obtain ID of the calling thread


---------------------------------------------------------

::

          #include <pthread.h>

          pthread_t pthread_self(void);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_self() function returns the ID of the calling thread.
          This is the same value that is returned in *thread in the
          pthread_create(3) call that created this thread.


-----------------------------------------------------------------

::

          This function always succeeds, returning the calling thread's ID.


-----------------------------------------------------

::

          This function always succeeds.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_self()                        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          POSIX.1 allows an implementation wide freedom in choosing the
          type used to represent a thread ID; for example, representation
          using either an arithmetic type or a structure is permitted.
          Therefore, variables of type pthread_t can't portably be compared
          using the C equality operator (==); use pthread_equal(3) instead.

          Thread identifiers should be considered opaque: any attempt to
          use a thread ID other than in pthreads calls is nonportable and
          can lead to unspecified results.

          Thread IDs are guaranteed to be unique only within a process.  A
          thread ID may be reused after a terminated thread has been
          joined, or a detached thread has terminated.

          The thread ID returned by pthread_self() is not the same thing as
          the kernel thread ID returned by a call to gettid(2).


---------------------------------------------------------

::

          pthread_create(3), pthread_equal(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                PTHREAD_SELF(3)

--------------

Pages that refer to this page: `gettid(2) <../man2/gettid.2.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_equal(3) <../man3/pthread_equal.3.html>`__, 
`pthread_getcpuclockid(3) <../man3/pthread_getcpuclockid.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`pthread_setaffinity_np(3) <../man3/pthread_setaffinity_np.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`pthread_setschedprio(3) <../man3/pthread_setschedprio.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_self.3.license.html>`__

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
