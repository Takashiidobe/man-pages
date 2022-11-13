.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

utime(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UTIME(2)                Linux Programmer's Manual               UTIME(2)

NAME
-------------------------------------------------

::

          utime, utimes - change file last access and modification times


---------------------------------------------------------

::

          #include <utime.h>

          int utime(const char *filename, const struct utimbuf *times);

          #include <sys/time.h>

          int utimes(const char *filename, const struct timeval times[2]);


---------------------------------------------------------------

::

          Note: modern applications may prefer to use the interfaces
          described in utimensat(2).

          The utime() system call changes the access and modification times
          of the inode specified by filename to the actime and modtime
          fields of times respectively.

          If times is NULL, then the access and modification times of the
          file are set to the current time.

          Changing timestamps is permitted when: either the process has
          appropriate privileges, or the effective user ID equals the user
          ID of the file, or times is NULL and the process has write
          permission for the file.

          The utimbuf structure is:

              struct utimbuf {
                  time_t actime;       /* access time */
                  time_t modtime;      /* modification time */
              };

          The utime() system call allows specification of timestamps with a
          resolution of 1 second.

          The utimes() system call is similar, but the times argument
          refers to an array rather than a structure.  The elements of this
          array are timeval structures, which allow a precision of 1
          microsecond for specifying timestamps.  The timeval structure is:

              struct timeval {
                  long tv_sec;        /* seconds */
                  long tv_usec;       /* microseconds */
              };

          times[0] specifies the new access time, and times[1] specifies
          the new modification time.  If times is NULL, then analogously to
          utime(), the access and modification times of the file are set to
          the current time.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Search permission is denied for one of the directories in
                 the path prefix of path (see also path_resolution(7)).

          EACCES times is NULL, the caller's effective user ID does not
                 match the owner of the file, the caller does not have
                 write access to the file, and the caller is not privileged
                 (Linux: does not have either the CAP_DAC_OVERRIDE or the
                 CAP_FOWNER capability).

          ENOENT filename does not exist.

          EPERM  times is not NULL, the caller's effective UID does not
                 match the owner of the file, and the caller is not
                 privileged (Linux: does not have the CAP_FOWNER
                 capability).

          EROFS  path resides on a read-only filesystem.


-------------------------------------------------------------------

::

          utime(): SVr4, POSIX.1-2001.  POSIX.1-2008 marks utime() as
          obsolete.

          utimes(): 4.3BSD, POSIX.1-2001.


---------------------------------------------------

::

          Linux does not allow changing the timestamps on an immutable
          file, or setting the timestamps to something other than the
          current time on an append-only file.


---------------------------------------------------------

::

          chattr(1), touch(1), futimesat(2), stat(2), utimensat(2),
          futimens(3), futimes(3), inode(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       UTIME(2)

--------------

Pages that refer to this page: `indent(1) <../man1/indent.1.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`futimesat(2) <../man2/futimesat.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`futimes(3) <../man3/futimes.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`inode(7) <../man7/inode.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`time(7) <../man7/time.7.html>`__,  `mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/utime.2.license.html>`__

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
