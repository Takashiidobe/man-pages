.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shm_unlink(3p) — Linux manual page
==================================

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

   SHM_UNLINK(3P)          POSIX Programmer's Manual         SHM_UNLINK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          shm_unlink — remove a shared memory object (REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int shm_unlink(const char *name);


---------------------------------------------------------------

::

          The shm_unlink() function shall remove the name of the shared
          memory object named by the string pointed to by name.

          If one or more references to the shared memory object exist when
          the object is unlinked, the name shall be removed before
          shm_unlink() returns, but the removal of the memory object
          contents shall be postponed until all open and map references to
          the shared memory object have been removed.

          Even if the object continues to exist after the last
          shm_unlink(), reuse of the name shall subsequently cause
          shm_open() to behave as if no shared memory object of this name
          exists (that is, shm_open() will fail if O_CREAT is not set, or
          will create a new shared memory object if O_CREAT is set).


-----------------------------------------------------------------

::

          Upon successful completion, a value of zero shall be returned.
          Otherwise, a value of -1 shall be returned and errno set to
          indicate the error. If -1 is returned, the named shared memory
          object shall not be changed by this function call.


-----------------------------------------------------

::

          The shm_unlink() function shall fail if:

          EACCES Permission is denied to unlink the named shared memory
                 object.

          ENOENT The named shared memory object does not exist.

          The shm_unlink() function may fail if:

          ENAMETOOLONG
                 The length of the name argument exceeds {_POSIX_PATH_MAX}
                 on systems that do not support the XSI option or exceeds
                 {_XOPEN_PATH_MAX} on XSI systems, or has a pathname
                 component that is longer than {_POSIX_NAME_MAX} on systems
                 that do not support the XSI option or longer than
                 {_XOPEN_NAME_MAX} on XSI systems.  A call to shm_unlink()
                 with a name argument that contains the same shared memory
                 object name as was previously used in a successful
                 shm_open() call shall not give an [ENAMETOOLONG] error.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Names of memory objects that were allocated with open() are
          deleted with unlink() in the usual fashion. Names of memory
          objects that were allocated with shm_open() are deleted with
          shm_unlink().  Note that the actual memory object is not
          destroyed until the last close and unmap on it have occurred if
          it was already in use.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          A future version might require the shm_open() and shm_unlink()
          functions to have semantics similar to normal file system
          operations.


---------------------------------------------------------

::

          close(3p), mmap(3p), munmap(3p), shmat(3p), shmctl(3p),
          shmdt(3p), shm_open(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_mman.h(0p)


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

   IEEE/The Open Group               2017                    SHM_UNLINK(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmctl(3p) <../man3/shmctl.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`shmget(3p) <../man3/shmget.3p.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__

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
