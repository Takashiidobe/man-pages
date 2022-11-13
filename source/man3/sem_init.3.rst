.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_init(3) — Linux manual page
===============================

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

   SEM_INIT(3)             Linux Programmer's Manual            SEM_INIT(3)

NAME
-------------------------------------------------

::

          sem_init - initialize an unnamed semaphore


---------------------------------------------------------

::

          #include <semaphore.h>

          int sem_init(sem_t *sem, int pshared, unsigned int value);

          Link with -pthread.


---------------------------------------------------------------

::

          sem_init() initializes the unnamed semaphore at the address
          pointed to by sem.  The value argument specifies the initial
          value for the semaphore.

          The pshared argument indicates whether this semaphore is to be
          shared between the threads of a process, or between processes.

          If pshared has the value 0, then the semaphore is shared between
          the threads of a process, and should be located at some address
          that is visible to all threads (e.g., a global variable, or a
          variable allocated dynamically on the heap).

          If pshared is nonzero, then the semaphore is shared between
          processes, and should be located in a region of shared memory
          (see shm_open(3), mmap(2), and shmget(2)).  (Since a child
          created by fork(2) inherits its parent's memory mappings, it can
          also access the semaphore.)  Any process that can access the
          shared memory region can operate on the semaphore using
          sem_post(3), sem_wait(3), and so on.

          Initializing a semaphore that has already been initialized
          results in undefined behavior.


-----------------------------------------------------------------

::

          sem_init() returns 0 on success; on error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL value exceeds SEM_VALUE_MAX.

          ENOSYS pshared is nonzero, but the system does not support
                 process-shared semaphores (see sem_overview(7)).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sem_init()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001.


---------------------------------------------------

::

          Bizarrely, POSIX.1-2001 does not specify the value that should be
          returned by a successful call to sem_init().  POSIX.1-2008
          rectifies this, specifying the zero return on success.


---------------------------------------------------------

::

          See shm_open(3) and sem_wait(3).


---------------------------------------------------------

::

          sem_destroy(3), sem_post(3), sem_wait(3), sem_overview(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SEM_INIT(3)

--------------

Pages that refer to this page:
`sem_destroy(3) <../man3/sem_destroy.3.html>`__, 
`sem_overview(7) <../man7/sem_overview.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sem_init.3.license.html>`__

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
