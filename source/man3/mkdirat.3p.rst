.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkdir(3p) — Linux manual page
=============================

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

   MKDIR(3P)               POSIX Programmer's Manual              MKDIR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mkdir, mkdirat — make a directory


---------------------------------------------------------

::

          #include <sys/stat.h>

          int mkdir(const char *path, mode_t mode);

          #include <fcntl.h>

          int mkdirat(int fd, const char *path, mode_t mode);


---------------------------------------------------------------

::

          The mkdir() function shall create a new directory with name path.
          The file permission bits of the new directory shall be
          initialized from mode.  These file permission bits of the mode
          argument shall be modified by the process' file creation mask.

          When bits in mode other than the file permission bits are set,
          the meaning of these additional bits is implementation-defined.

          The directory's user ID shall be set to the process' effective
          user ID.  The directory's group ID shall be set to the group ID
          of the parent directory or to the effective group ID of the
          process. Implementations shall provide a way to initialize the
          directory's group ID to the group ID of the parent directory.
          Implementations may, but need not, provide an implementation-
          defined way to initialize the directory's group ID to the
          effective group ID of the calling process.

          The newly created directory shall be an empty directory.

          If path names a symbolic link, mkdir() shall fail and set errno
          to [EEXIST].

          Upon successful completion, mkdir() shall mark for update the
          last data access, last data modification, and last file status
          change timestamps of the directory. Also, the last data
          modification and last file status change timestamps of the
          directory that contains the new entry shall be marked for update.

          The mkdirat() function shall be equivalent to the mkdir()
          function except in the case where path specifies a relative path.
          In this case the newly created directory is created relative to
          the directory associated with the file descriptor fd instead of
          the current working directory. If the access mode of the open
          file description associated with the file descriptor is not
          O_SEARCH, the function shall check whether directory searches are
          permitted using the current permissions of the directory
          underlying the file descriptor. If the access mode is O_SEARCH,
          the function shall not perform the check.

          If mkdirat() is passed the special value AT_FDCWD in the fd
          parameter, the current working directory shall be used and the
          behavior shall be identical to a call to mkdir().


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return 0.
          Otherwise, these functions shall return -1 and set errno to
          indicate the error. If -1 is returned, no directory shall be
          created.


-----------------------------------------------------

::

          These functions shall fail if:

          EACCES Search permission is denied on a component of the path
                 prefix, or write permission is denied on the parent
                 directory of the directory to be created.

          EEXIST The named file exists.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          EMLINK The link count of the parent directory would exceed
                 {LINK_MAX}.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of the path prefix specified by path does not
                 name an existing directory or path is an empty string.

          ENOSPC The file system does not contain enough space to hold the
                 contents of the new directory or to extend the parent
                 directory of the new directory.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory.

          EROFS  The parent directory resides on a read-only file system.

          In addition, the mkdirat() function shall fail if:

          EACCES The access mode of the open file description associated
                 with fd is not O_SEARCH and the permissions of the
                 directory underlying fd do not permit directory searches.

          EBADF  The path argument does not specify an absolute path and
                 the fd argument is neither AT_FDCWD nor a valid file
                 descriptor open for reading or searching.

          ENOTDIR
                 The path argument is not an absolute path and fd is a file
                 descriptor associated with a non-directory file.

          These functions may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

      Creating a Directory
          The following example shows how to create a directory named
          /home/cnd/mod1, with read/write/search permissions for owner and
          group, and with read/search permissions for others.

              #include <sys/types.h>
              #include <sys/stat.h>

              int status;
              ...
              status = mkdir("/home/cnd/mod1", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The mkdir() function originated in 4.2 BSD and was added to
          System V in Release 3.0.

          4.3 BSD detects [ENAMETOOLONG].

          The POSIX.1‐1990 standard required that the group ID of a newly
          created directory be set to the group ID of its parent directory
          or to the effective group ID of the creating process. FIPS 151‐2
          required that implementations provide a way to have the group ID
          be set to the group ID of the containing directory, but did not
          prohibit implementations also supporting a way to set the group
          ID to the effective group ID of the creating process.  Conforming
          applications should not assume which group ID will be used. If it
          matters, an application can use chown() to set the group ID after
          the directory is created, or determine under what conditions the
          implementation will set the desired group ID.

          The purpose of the mkdirat() function is to create a directory in
          directories other than the current working directory without
          exposure to race conditions. Any part of the path of a file could
          be changed in parallel to the call to mkdir(), resulting in
          unspecified behavior. By opening a file descriptor for the target
          directory and using the mkdirat() function it can be guaranteed
          that the newly created directory is located relative to the
          desired directory.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          chmod(3p), mkdtemp(3p), mknod(3p), umask(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          sys_stat.h(0p), sys_types.h(0p)


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

   IEEE/The Open Group               2017                         MKDIR(3P)

--------------

Pages that refer to this page:
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`mkdir(1p) <../man1/mkdir.1p.html>`__, 
`pax(1p) <../man1/pax.1p.html>`__, 
`chmod(3p) <../man3/chmod.3p.html>`__, 
`mkdtemp(3p) <../man3/mkdtemp.3p.html>`__, 
`mknod(3p) <../man3/mknod.3p.html>`__, 
`rmdir(3p) <../man3/rmdir.3p.html>`__, 
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
