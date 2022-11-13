.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_open(3p) — Linux manual page
================================

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

   SEM_OPEN(3P)            POSIX Programmer's Manual           SEM_OPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sem_open — initialize and open a named semaphore


---------------------------------------------------------

::

          #include <semaphore.h>

          sem_t *sem_open(const char *name, int oflag, ...);


---------------------------------------------------------------

::

          The sem_open() function shall establish a connection between a
          named semaphore and a process. Following a call to sem_open()
          with semaphore name name, the process may reference the semaphore
          associated with name using the address returned from the call.
          This semaphore may be used in subsequent calls to sem_wait(),
          sem_timedwait(), sem_trywait(), sem_post(), and sem_close().  The
          semaphore remains usable by this process until the semaphore is
          closed by a successful call to sem_close(), _exit(), or one of
          the exec functions.

          The oflag argument controls whether the semaphore is created or
          merely accessed by the call to sem_open().  The following flag
          bits may be set in oflag:

          O_CREAT   This flag is used to create a semaphore if it does not
                    already exist.  If O_CREAT is set and the semaphore
                    already exists, then O_CREAT has no effect, except as
                    noted under O_EXCL. Otherwise, sem_open() creates a
                    named semaphore. The O_CREAT flag requires a third and
                    a fourth argument: mode, which is of type mode_t, and
                    value, which is of type unsigned.  The semaphore is
                    created with an initial value of value.  Valid initial
                    values for semaphores are less than or equal to
                    {SEM_VALUE_MAX}.

                    The user ID of the semaphore shall be set to the
                    effective user ID of the process. The group ID of the
                    semaphore shall be set to the effective group ID of the
                    process; however, if the name argument is visible in
                    the file system, the group ID may be set to the group
                    ID of the containing directory. The permission bits of
                    the semaphore are set to the value of the mode argument
                    except those set in the file mode creation mask of the
                    process. When bits in mode other than the file
                    permission bits are specified, the effect is
                    unspecified.

                    After the semaphore named name has been created by
                    sem_open() with the O_CREAT flag, other processes can
                    connect to the semaphore by calling sem_open() with the
                    same value of name.

          O_EXCL    If O_EXCL and O_CREAT are set, sem_open() fails if the
                    semaphore name exists. The check for the existence of
                    the semaphore and the creation of the semaphore if it
                    does not exist are atomic with respect to other
                    processes executing sem_open() with O_EXCL and O_CREAT
                    set. If O_EXCL is set and O_CREAT is not set, the
                    effect is undefined.

                    If flags other than O_CREAT and O_EXCL are specified in
                    the oflag parameter, the effect is unspecified.

          The name argument points to a string naming a semaphore object.
          It is unspecified whether the name appears in the file system and
          is visible to functions that take pathnames as arguments. The
          name argument conforms to the construction rules for a pathname,
          except that the interpretation of <slash> characters other than
          the leading <slash> character in name is implementation-defined,
          and that the length limits for the name argument are
          implementation-defined and need not be the same as the pathname
          limits {PATH_MAX} and {NAME_MAX}.  If name begins with the
          <slash> character, then processes calling sem_open() with the
          same value of name shall refer to the same semaphore object, as
          long as that name has not been removed. If name does not begin
          with the <slash> character, the effect is implementation-defined.

          If a process makes multiple successful calls to sem_open() with
          the same value for name, the same semaphore address shall be
          returned for each such successful call, provided that there have
          been no calls to sem_unlink() for this semaphore, and at least
          one previous successful sem_open() call for this semaphore has
          not been matched with a sem_close() call.

          References to copies of the semaphore produce undefined results.


-----------------------------------------------------------------

::

          Upon successful completion, the sem_open() function shall return
          the address of the semaphore. Otherwise, it shall return a value
          of SEM_FAILED and set errno to indicate the error. The symbol
          SEM_FAILED is defined in the <semaphore.h> header. No successful
          return from sem_open() shall return the value SEM_FAILED.


-----------------------------------------------------

::

          If any of the following conditions occur, the sem_open() function
          shall return SEM_FAILED and set errno to the corresponding value:

          EACCES The named semaphore exists and the permissions specified
                 by oflag are denied, or the named semaphore does not exist
                 and permission to create the named semaphore is denied.

          EEXIST O_CREAT and O_EXCL are set and the named semaphore already
                 exists.

          EINTR  The sem_open() operation was interrupted by a signal.

          EINVAL The sem_open() operation is not supported for the given
                 name, or O_CREAT was specified in oflag and value was
                 greater than {SEM_VALUE_MAX}.

          EMFILE Too many semaphore descriptors or file descriptors are
                 currently in use by this process.

          ENFILE Too many semaphores are currently open in the system.

          ENOENT O_CREAT is not set and the named semaphore does not exist.

          ENOMEM There is insufficient memory for the creation of the new
                 named semaphore.

          ENOSPC There is insufficient space on a storage device for the
                 creation of the new named semaphore.

          If any of the following conditions occur, the sem_open() function
          may return SEM_FAILED and set errno to the corresponding value:

          ENAMETOOLONG
                 The length of the name argument exceeds {_POSIX_PATH_MAX}
                 on systems that do not support the XSI option or exceeds
                 {_XOPEN_PATH_MAX} on XSI systems, or has a pathname
                 component that is longer than {_POSIX_NAME_MAX} on systems
                 that do not support the XSI option or longer than
                 {_XOPEN_NAME_MAX} on XSI systems.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Early drafts required an error return value of -1 with the type
          sem_t * for the sem_open() function, which is not guaranteed to
          be portable across implementations. The revised text provides the
          symbolic error code SEM_FAILED to eliminate the type conflict.


---------------------------------------------------------------------------

::

          A future version might require the sem_open() and sem_unlink()
          functions to have semantics similar to normal file system
          operations.


---------------------------------------------------------

::

          semctl(3p), semget(3p), semop(3p), sem_close(3p), sem_post(3p),
          sem_timedwait(3p), sem_trywait(3p), sem_unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, semaphore.h(0p)


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

   IEEE/The Open Group               2017                      SEM_OPEN(3P)

--------------

Pages that refer to this page:
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`semctl(3p) <../man3/semctl.3p.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sem_unlink(3p) <../man3/sem_unlink.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`umask(3p) <../man3/umask.3p.html>`__

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
