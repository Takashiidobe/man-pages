.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fchown(3p) — Linux manual page
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

   FCHOWN(3P)              POSIX Programmer's Manual             FCHOWN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fchown — change owner and group of a file


---------------------------------------------------------

::

          #include <unistd.h>

          int fchown(int fildes, uid_t owner, gid_t group);


---------------------------------------------------------------

::

          The fchown() function shall be equivalent to chown() except that
          the file whose owner and group are changed is specified by the
          file descriptor fildes.


-----------------------------------------------------------------

::

          Upon successful completion, fchown() shall return 0. Otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The fchown() function shall fail if:

          EBADF  The fildes argument is not an open file descriptor.

          EPERM  The effective user ID does not match the owner of the file
                 or the process does not have appropriate privileges and
                 _POSIX_CHOWN_RESTRICTED indicates that such privilege is
                 required.

          EROFS  The file referred to by fildes resides on a read-only file
                 system.

          The fchown() function may fail if:

          EINVAL The owner or group ID is not a value supported by the
                 implementation.  The fildes argument refers to a pipe or
                 socket or an fattach()-ed STREAM and the implementation
                 disallows execution of fchown() on a pipe.

          EIO    A physical I/O error has occurred.

          EINTR  The fchown() function was interrupted by a signal which
                 was caught.

          The following sections are informative.


---------------------------------------------------------

::

      Changing the Current Owner of a File
          The following example shows how to change the owner of a file
          named /home/cnd/mod1 to ``jones'' and the group to ``cnd''.

          The numeric value for the user ID is obtained by extracting the
          user ID from the user database entry associated with ``jones''.
          Similarly, the numeric value for the group ID is obtained by
          extracting the group ID from the group database entry associated
          with ``cnd''. This example assumes the calling program has
          appropriate privileges.

              #include <sys/types.h>
              #include <unistd.h>
              #include <fcntl.h>
              #include <pwd.h>
              #include <grp.h>

              struct passwd *pwd;
              struct group  *grp;
              int            fildes;
              ...
              fildes = open("/home/cnd/mod1", O_RDWR);
              pwd = getpwnam("jones");
              grp = getgrnam("cnd");
              fchown(fildes, pwd->pw_uid, grp->gr_gid);


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

          chown(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


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

   IEEE/The Open Group               2017                        FCHOWN(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__

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
