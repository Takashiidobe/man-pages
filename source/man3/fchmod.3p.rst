.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fchmod(3p) — Linux manual page
==============================

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

   FCHMOD(3P)              POSIX Programmer's Manual             FCHMOD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fchmod — change mode of a file


---------------------------------------------------------

::

          #include <sys/stat.h>

          int fchmod(int fildes, mode_t mode);


---------------------------------------------------------------

::

          The fchmod() function shall be equivalent to chmod() except that
          the file whose permissions are changed is specified by the file
          descriptor fildes.

          If fildes references a shared memory object, the fchmod()
          function need only affect the S_IRUSR, S_IWUSR, S_IRGRP, S_IWGRP,
          S_IROTH, and S_IWOTH file permission bits.

          If fildes references a typed memory object, the behavior of
          fchmod() is unspecified.

          If fildes refers to a socket, the behavior of fchmod() is
          unspecified.

          If fildes refers to a STREAM (which is fattach()-ed into the file
          system name space) the call returns successfully, doing nothing.


-----------------------------------------------------------------

::

          Upon successful completion, fchmod() shall return 0. Otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The fchmod() function shall fail if:

          EBADF  The fildes argument is not an open file descriptor.

          EPERM  The effective user ID does not match the owner of the file
                 and the process does not have appropriate privileges.

          EROFS  The file referred to by fildes resides on a read-only file
                 system.

          The fchmod() function may fail if:

          EINTR  The fchmod() function was interrupted by a signal.

          EINVAL The value of the mode argument is invalid.

          EINVAL The fildes argument refers to a pipe and the
                 implementation disallows execution of fchmod() on a pipe.

          The following sections are informative.


---------------------------------------------------------

::

      Changing the Current Permissions for a File
          The following example shows how to change the permissions for a
          file named /home/cnd/mod1 so that the owner and group have
          read/write/execute permissions, but the world only has read/write
          permissions.

              #include <sys/stat.h>
              #include <fcntl.h>

              mode_t mode;
              int    fildes;
              ...
              fildes = open("/home/cnd/mod1", O_RDWR);
              fchmod(fildes, S_IRWXU | S_IRWXG | S_IROTH | S_IWOTH);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          chmod(3p), chown(3p), creat(3p), fcntl(3p), fstatat(3p),
          fstatvfs(3p), mknod(3p), open(3p), read(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_stat.h(0p)


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

   IEEE/The Open Group               2017                        FCHMOD(3P)

--------------

Pages that refer to this page:
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__

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
