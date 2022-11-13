.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_setconcurrency(3) — Linux manual page
=============================================

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

   PTHREAD_SETCONCURRENCY(3)inux Programmer's ManualHREAD_SETCONCURRENCY(3)

NAME
-------------------------------------------------

::

          pthread_setconcurrency, pthread_getconcurrency - set/get the
          concurrency level


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_setconcurrency(int new_level);
          int pthread_getconcurrency(void);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_setconcurrency() function informs the implementation
          of the application's desired concurrency level, specified in
          new_level.  The implementation takes this only as a hint: POSIX.1
          does not specify the level of concurrency that should be provided
          as a result of calling pthread_setconcurrency().

          Specifying new_level as 0 instructs the implementation to manage
          the concurrency level as it deems appropriate.

          pthread_getconcurrency() returns the current value of the
          concurrency level for this process.


-----------------------------------------------------------------

::

          On success, pthread_setconcurrency() returns 0; on error, it
          returns a nonzero error number.

          pthread_getconcurrency() always succeeds, returning the
          concurrency level set by a previous call to
          pthread_setconcurrency(), or 0, if pthread_setconcurrency() has
          not previously been called.


-----------------------------------------------------

::

          pthread_setconcurrency() can fail with the following error:

          EINVAL new_level is negative.

          POSIX.1 also documents an EAGAIN error ("the value specified by
          new_level would cause a system resource to be exceeded").


---------------------------------------------------------

::

          These functions are available in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_setconcurrency(),             │ Thread safety │ MT-Safe │
          │pthread_getconcurrency()              │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          The default concurrency level is 0.

          Concurrency levels are meaningful only for M:N threading
          implementations, where at any moment a subset of a process's set
          of user-level threads may be bound to a smaller number of kernel-
          scheduling entities.  Setting the concurrency level allows the
          application to give the system a hint as to the number of kernel-
          scheduling entities that should be provided for efficient
          execution of the application.

          Both LinuxThreads and NPTL are 1:1 threading implementations, so
          setting the concurrency level has no meaning.  In other words, on
          Linux these functions merely exist for compatibility with other
          systems, and they have no effect on the execution of a program.


---------------------------------------------------------

::

          pthread_attr_setscope(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22      PTHREAD_SETCONCURRENCY(3)

--------------

`Copyright and license for this manual
page <../man3/pthread_setconcurrency.3.license.html>`__

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
