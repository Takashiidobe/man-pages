.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

futimens(3p) — Linux manual page
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

   FUTIMENS(3P)            POSIX Programmer's Manual           FUTIMENS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          futimens, utimensat, utimes — set file access and modification
          times


---------------------------------------------------------

::

          #include <sys/stat.h>

          int futimens(int fd, const struct timespec times[2]);

          #include <fcntl.h>

          int utimensat(int fd, const char *path, const struct timespec times[2],
              int flag);

          #include <sys/time.h>

          int utimes(const char *path, const struct timeval times[2]);


---------------------------------------------------------------

::

          The futimens() and utimensat() functions shall set the access and
          modification times of a file to the values of the times argument.
          The futimens() function changes the times of the file associated
          with the file descriptor fd.  The utimensat() function changes
          the times of the file pointed to by the path argument, relative
          to the directory associated with the file descriptor fd.  Both
          functions allow time specifications accurate to the nanosecond.

          For futimens() and utimensat(), the times argument is an array of
          two timespec structures. The first array member represents the
          date and time of last access, and the second member represents
          the date and time of last modification. The times in the timespec
          structure are measured in seconds and nanoseconds since the
          Epoch. The file's relevant timestamp shall be set to the greatest
          value supported by the file system that is not greater than the
          specified time.

          If the tv_nsec field of a timespec structure has the special
          value UTIME_NOW, the file's relevant timestamp shall be set to
          the greatest value supported by the file system that is not
          greater than the current time. If the tv_nsec field has the
          special value UTIME_OMIT, the file's relevant timestamp shall not
          be changed. In either case, the tv_sec field shall be ignored.

          If the times argument is a null pointer, both the access and
          modification timestamps shall be set to the greatest value
          supported by the file system that is not greater than the current
          time. If utimensat() is passed a relative path in the path
          argument, the file to be used shall be relative to the directory
          associated with the file descriptor fd instead of the current
          working directory. If the access mode of the open file
          description associated with the file descriptor is not O_SEARCH,
          the function shall check whether directory searches are permitted
          using the current permissions of the directory underlying the
          file descriptor. If the access mode is O_SEARCH, the function
          shall not perform the check.

          If utimensat() is passed the special value AT_FDCWD in the fd
          parameter, the current working directory shall be used.

          Only a process with the effective user ID equal to the user ID of
          the file, or with write access to the file, or with appropriate
          privileges may use futimens() or utimensat() with a null pointer
          as the times argument or with both tv_nsec fields set to the
          special value UTIME_NOW. Only a process with the effective user
          ID equal to the user ID of the file or with appropriate
          privileges may use futimens() or utimensat() with a non-null
          times argument that does not have both tv_nsec fields set to
          UTIME_NOW and does not have both tv_nsec fields set to
          UTIME_OMIT. If both tv_nsec fields are set to UTIME_OMIT, no
          ownership or permissions check shall be performed for the file,
          but other error conditions may still be detected (including
          [EACCES] errors related to the path prefix).

          Values for the flag argument of utimensat() are constructed by a
          bitwise-inclusive OR of flags from the following list, defined in
          <fcntl.h>:

          AT_SYMLINK_NOFOLLOW
                If path names a symbolic link, then the access and
                modification times of the symbolic link are changed.

          Upon successful completion, futimens() and utimensat() shall mark
          the last file status change timestamp for update, with the
          exception that if both tv_nsec fields are set to UTIME_OMIT, the
          file status change timestamp need not be marked for update.

          The utimes() function shall be equivalent to the utimensat()
          function with the special value AT_FDCWD as the fd argument and
          the flag argument set to zero, except that the times argument is
          a timeval structure rather than a timespec structure, and
          accuracy is only to the microsecond, not nanosecond, and rounding
          towards the nearest second may occur.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return 0.
          Otherwise, these functions shall return -1 and set errno to
          indicate the error. If -1 is returned, the file times shall not
          be affected.


-----------------------------------------------------

::

          These functions shall fail if:

          EACCES The times argument is a null pointer, or both tv_nsec
                 values are UTIME_NOW, and the effective user ID of the
                 process does not match the owner of the file and write
                 access is denied.

          EINVAL Either of the times argument structures specified a
                 tv_nsec value that was neither UTIME_NOW nor UTIME_OMIT,
                 and was a value less than zero or greater than or equal to
                 1000 million.

          EINVAL A new file timestamp would be a value whose tv_sec
                 component is not a value supported by the file system.

          EPERM  The times argument is not a null pointer, does not have
                 both tv_nsec fields set to UTIME_NOW, does not have both
                 tv_nsec fields set to UTIME_OMIT, the calling process'
                 effective user ID does not match the owner of the file,
                 and the calling process does not have appropriate
                 privileges.

          EROFS  The file system containing the file is read-only.

          The futimens() function shall fail if:

          EBADF  The fd argument is not a valid file descriptor.

          The utimensat() function shall fail if:

          EACCES The access mode of the open file description associated
                 with fd is not O_SEARCH and the permissions of the
                 directory underlying fd do not permit directory searches.

          EBADF  The path argument does not specify an absolute path and
                 the fd argument is neither AT_FDCWD nor a valid file
                 descriptor open for reading or searching.

          ENOTDIR
                 The path argument is not an absolute path and fd is a file
                 descriptor associated with a non-directory file.

          The utimensat() and utimes() functions shall fail if:

          EACCES Search permission is denied by a component of the path
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

          The utimensat() and utimes() functions may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The utimensat() function may fail if:

          EINVAL The value of the flag argument is not valid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The purpose of the utimensat() function is to set the access and
          modification time of files in directories other than the current
          working directory without exposure to race conditions. Any part
          of the path of a file could be changed in parallel to a call to
          utimes(), resulting in unspecified behavior. By opening a file
          descriptor for the target directory and using the utimensat()
          function it can be guaranteed that the changed file is located
          relative to the desired directory.

          The standard developers considered including a special case for
          the permissions required by utimensat() when one tv_nsec field is
          UTIME_NOW and the other is UTIME_OMIT. One possibility would be
          to include this case in with the cases where times is a null
          pointer or both fields are UTIME_NOW, where the call is allowed
          if the process has write permission for the file. However,
          associating write permission with an update to just the last data
          access timestamp (which is normally updated by read()) did not
          seem appropriate. The other possibility would be to specify that
          this one case is allowed if the process has read permission, but
          this was felt to be too great a departure from the utime() and
          utimes() functions on which utimensat() is based. If an
          application needs to set the last data access timestamp to the
          current time for a file on which it has read permission but is
          not the owner, it can do so by opening the file, reading one or
          more bytes (or reading a directory entry, if the file is a
          directory), and then closing it.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          read(3p), utime(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          sys_stat.h(0p), sys_time.h(0p)


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

   IEEE/The Open Group               2017                      FUTIMENS(3P)

--------------

Pages that refer to this page:
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`sys_time.h(0p) <../man0/sys_time.h.0p.html>`__, 
`utime.h(0p) <../man0/utime.h.0p.html>`__, 
`touch(1p) <../man1/touch.1p.html>`__, 
`time(3p) <../man3/time.3p.html>`__, 
`utime(3p) <../man3/utime.3p.html>`__, 
`utimensat(3p) <../man3/utimensat.3p.html>`__

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
