.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fstatvfs(3p) — Linux manual page
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

   FSTATVFS(3P)            POSIX Programmer's Manual           FSTATVFS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fstatvfs, statvfs — get file system information


---------------------------------------------------------

::

          #include <sys/statvfs.h>

          int fstatvfs(int fildes, struct statvfs *buf);
          int statvfs(const char *restrict path, struct statvfs *restrict buf);


---------------------------------------------------------------

::

          The fstatvfs() function shall obtain information about the file
          system containing the file referenced by fildes.

          The statvfs() function shall obtain information about the file
          system containing the file named by path.

          For both functions, the buf argument is a pointer to a statvfs
          structure that shall be filled. Read, write, or execute
          permission of the named file is not required.

          The following flags can be returned in the f_flag member:

          ST_RDONLY   Read-only file system.

          ST_NOSUID   Setuid/setgid bits ignored by exec.

          It is unspecified whether all members of the statvfs structure
          have meaningful values on all file systems.


-----------------------------------------------------------------

::

          Upon successful completion, statvfs() shall return 0. Otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The fstatvfs() and statvfs() functions shall fail if:

          EIO    An I/O error occurred while reading the file system.

          EINTR  A signal was caught during execution of the function.

          EOVERFLOW
                 One of the values to be returned cannot be represented
                 correctly in the structure pointed to by buf.

          The fstatvfs() function shall fail if:

          EBADF  The fildes argument is not an open file descriptor.

          The statvfs() function shall fail if:

          EACCES Search permission is denied on a component of the path
                 prefix.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of path does not name an existing file or path
                 is an empty string.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory,
                 or the path argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters and the last pathname component names an
                 existing file that is neither a directory nor a symbolic
                 link to a directory.

          The statvfs() function may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

      Obtaining File System Information Using fstatvfs()
          The following example shows how to obtain file system information
          for the file system upon which the file named /home/cnd/mod1
          resides, using the fstatvfs() function. The /home/cnd/mod1 file
          is opened with read/write privileges and the open file descriptor
          is passed to the fstatvfs() function.

              #include <sys/statvfs.h>
              #include <fcntl.h>

              struct statvfs buffer;
              int            status;
              ...
              fildes = open("/home/cnd/mod1", O_RDWR);
              status  = fstatvfs(fildes, &buffer);

      Obtaining File System Information Using statvfs()
          The following example shows how to obtain file system information
          for the file system upon which the file named /home/cnd/mod1
          resides, using the statvfs() function.

              #include <sys/statvfs.h>

              struct statvfs buffer;
              int            status;
              ...
              status = statvfs("/home/cnd/mod1", &buffer);


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

          chmod(3p), chown(3p), creat(3p), dup(3p), exec(1p), fcntl(3p),
          link(3p), mknod(3p), open(3p), pipe(3p), read(3p), time(3p),
          unlink(3p), utime(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_statvfs.h(0p)


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

   IEEE/The Open Group               2017                      FSTATVFS(3P)

--------------

Pages that refer to this page:
`sys_statvfs.h(0p) <../man0/sys_statvfs.h.0p.html>`__, 
`chmod(3p) <../man3/chmod.3p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fchmod(3p) <../man3/fchmod.3p.html>`__, 
`statvfs(3p) <../man3/statvfs.3p.html>`__

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
