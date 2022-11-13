.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_open(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SEM_OPEN(3)             Linux Programmer's Manual            SEM_OPEN(3)

NAME
-------------------------------------------------

::

          sem_open - initialize and open a named semaphore


---------------------------------------------------------

::

          #include <fcntl.h>           /* For O_* constants */
          #include <sys/stat.h>        /* For mode constants */
          #include <semaphore.h>

          sem_t *sem_open(const char *name, int oflag);
          sem_t *sem_open(const char *name, int oflag,
                          mode_t mode, unsigned int value);

          Link with -pthread.


---------------------------------------------------------------

::

          sem_open() creates a new POSIX semaphore or opens an existing
          semaphore.  The semaphore is identified by name.  For details of
          the construction of name, see sem_overview(7).

          The oflag argument specifies flags that control the operation of
          the call.  (Definitions of the flags values can be obtained by
          including <fcntl.h>.)  If O_CREAT is specified in oflag, then the
          semaphore is created if it does not already exist.  The owner
          (user ID) of the semaphore is set to the effective user ID of the
          calling process.  The group ownership (group ID) is set to the
          effective group ID of the calling process.  If both O_CREAT and
          O_EXCL are specified in oflag, then an error is returned if a
          semaphore with the given name already exists.

          If O_CREAT is specified in oflag, then two additional arguments
          must be supplied.  The mode argument specifies the permissions to
          be placed on the new semaphore, as for open(2).  (Symbolic
          definitions for the permissions bits can be obtained by including
          <sys/stat.h>.)  The permissions settings are masked against the
          process umask.  Both read and write permission should be granted
          to each class of user that will access the semaphore.  The value
          argument specifies the initial value for the new semaphore.  If
          O_CREAT is specified, and a semaphore with the given name already
          exists, then mode and value are ignored.


-----------------------------------------------------------------

::

          On success, sem_open() returns the address of the new semaphore;
          this address is used when calling other semaphore-related
          functions.  On error, sem_open() returns SEM_FAILED, with errno
          set to indicate the error.


-----------------------------------------------------

::

          EACCES The semaphore exists, but the caller does not have
                 permission to open it.

          EEXIST Both O_CREAT and O_EXCL were specified in oflag, but a
                 semaphore with this name already exists.

          EINVAL value was greater than SEM_VALUE_MAX.

          EINVAL name consists of just "/", followed by no other
                 characters.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENAMETOOLONG
                 name was too long.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOENT The O_CREAT flag was not specified in oflag and no
                 semaphore with this name exists; or, O_CREAT was
                 specified, but name wasn't well formed.

          ENOMEM Insufficient memory.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sem_open()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          sem_close(3), sem_getvalue(3), sem_post(3), sem_unlink(3),
          sem_wait(3), sem_overview(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SEM_OPEN(3)

--------------

Pages that refer to this page: `umask(2) <../man2/umask.2.html>`__, 
`sem_close(3) <../man3/sem_close.3.html>`__, 
`sem_unlink(3) <../man3/sem_unlink.3.html>`__, 
`sem_overview(7) <../man7/sem_overview.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sem_open.3.license.html>`__

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
