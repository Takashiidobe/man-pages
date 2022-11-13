.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readdir(3) — Linux manual page
==============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   READDIR(3)              Linux Programmer's Manual             READDIR(3)

NAME
-------------------------------------------------

::

          readdir - read a directory


---------------------------------------------------------

::

          #include <dirent.h>

          struct dirent *readdir(DIR *dirp);


---------------------------------------------------------------

::

          The readdir() function returns a pointer to a dirent structure
          representing the next directory entry in the directory stream
          pointed to by dirp.  It returns NULL on reaching the end of the
          directory stream or if an error occurred.

          In the glibc implementation, the dirent structure is defined as
          follows:

              struct dirent {
                  ino_t          d_ino;       /* Inode number */
                  off_t          d_off;       /* Not an offset; see below */
                  unsigned short d_reclen;    /* Length of this record */
                  unsigned char  d_type;      /* Type of file; not supported
                                                 by all filesystem types */
                  char           d_name[256]; /* Null-terminated filename */
              };

          The only fields in the dirent structure that are mandated by
          POSIX.1 are d_name and d_ino.  The other fields are
          unstandardized, and not present on all systems; see NOTES below
          for some further details.

          The fields of the dirent structure are as follows:

          d_ino  This is the inode number of the file.

          d_off  The value returned in d_off is the same as would be
                 returned by calling telldir(3) at the current position in
                 the directory stream.  Be aware that despite its type and
                 name, the d_off field is seldom any kind of directory
                 offset on modern filesystems.  Applications should treat
                 this field as an opaque value, making no assumptions about
                 its contents; see also telldir(3).

          d_reclen
                 This is the size (in bytes) of the returned record.  This
                 may not match the size of the structure definition shown
                 above; see NOTES.

          d_type This field contains a value indicating the file type,
                 making it possible to avoid the expense of calling
                 lstat(2) if further actions depend on the type of the
                 file.

                 When a suitable feature test macro is defined
                 (_DEFAULT_SOURCE on glibc versions since 2.19, or
                 _BSD_SOURCE on glibc versions 2.19 and earlier), glibc
                 defines the following macro constants for the value
                 returned in d_type:

                 DT_BLK This is a block device.

                 DT_CHR This is a character device.

                 DT_DIR This is a directory.

                 DT_FIFO
                        This is a named pipe (FIFO).

                 DT_LNK This is a symbolic link.

                 DT_REG This is a regular file.

                 DT_SOCK
                        This is a UNIX domain socket.

                 DT_UNKNOWN
                        The file type could not be determined.

                 Currently, only some filesystems (among them: Btrfs, ext2,
                 ext3, and ext4) have full support for returning the file
                 type in d_type.  All applications must properly handle a
                 return of DT_UNKNOWN.

          d_name This field contains the null terminated filename.  See
                 NOTES.

          The data returned by readdir() may be overwritten by subsequent
          calls to readdir() for the same directory stream.


-----------------------------------------------------------------

::

          On success, readdir() returns a pointer to a dirent structure.
          (This structure may be statically allocated; do not attempt to
          free(3) it.)

          If the end of the directory stream is reached, NULL is returned
          and errno is not changed.  If an error occurs, NULL is returned
          and errno is set to indicate the error.  To distinguish end of
          stream from an error, set errno to zero before calling readdir()
          and then check the value of errno if NULL is returned.


-----------------------------------------------------

::

          EBADF  Invalid directory stream descriptor dirp.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────┬───────────────┬──────────────────────────┐
          │Interface            │ Attribute     │ Value                    │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │readdir()            │ Thread safety │ MT-Unsafe race:dirstream │
          └─────────────────────┴───────────────┴──────────────────────────┘

          In the current POSIX.1 specification (POSIX.1-2008), readdir() is
          not required to be thread-safe.  However, in modern
          implementations (including the glibc implementation), concurrent
          calls to readdir() that specify different directory streams are
          thread-safe.  In cases where multiple threads must read from the
          same directory stream, using readdir() with external
          synchronization is still preferable to the use of the deprecated
          readdir_r(3) function.  It is expected that a future version of
          POSIX.1 will require that readdir() be thread-safe when
          concurrently employed on different directory streams.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          A directory stream is opened using opendir(3).

          The order in which filenames are read by successive calls to
          readdir() depends on the filesystem implementation; it is
          unlikely that the names will be sorted in any fashion.

          Only the fields d_name and (as an XSI extension) d_ino are
          specified in POSIX.1.  Other than Linux, the d_type field is
          available mainly only on BSD systems.  The remaining fields are
          available on many, but not all systems.  Under glibc, programs
          can check for the availability of the fields not defined in
          POSIX.1 by testing whether the macros _DIRENT_HAVE_D_NAMLEN,
          _DIRENT_HAVE_D_RECLEN, _DIRENT_HAVE_D_OFF, or _DIRENT_HAVE_D_TYPE
          are defined.

      The d_name field
          The dirent structure definition shown above is taken from the
          glibc headers, and shows the d_name field with a fixed size.

          Warning: applications should avoid any dependence on the size of
          the d_name field.  POSIX defines it as char d_name[], a character
          array of unspecified size, with at most NAME_MAX characters
          preceding the terminating null byte ('\0').

          POSIX.1 explicitly notes that this field should not be used as an
          lvalue.  The standard also notes that the use of sizeof(d_name)
          is incorrect; use strlen(d_name) instead.  (On some systems, this
          field is defined as char d_name[1]!)  By implication, the use
          sizeof(struct dirent) to capture the size of the record including
          the size of d_name is also incorrect.

          Note that while the call

              fpathconf(fd, _PC_NAME_MAX)

          returns the value 255 for most filesystems, on some filesystems
          (e.g., CIFS, Windows SMB servers), the null-terminated filename
          that is (correctly) returned in d_name can actually exceed this
          size.  In such cases, the d_reclen field will contain a value
          that exceeds the size of the glibc dirent structure shown above.


---------------------------------------------------------

::

          getdents(2), read(2), closedir(3), dirfd(3), ftw(3), offsetof(3),
          opendir(3), readdir_r(3), rewinddir(3), scandir(3), seekdir(3),
          telldir(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     READDIR(3)

--------------

Pages that refer to this page:
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`getdents(2) <../man2/getdents.2.html>`__, 
`readdir(2) <../man2/readdir.2.html>`__, 
`closedir(3) <../man3/closedir.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__,  `fts(3) <../man3/fts.3.html>`__, 
`ftw(3) <../man3/ftw.3.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`opendir(3) <../man3/opendir.3.html>`__, 
`readdir_r(3) <../man3/readdir_r.3.html>`__, 
`rewinddir(3) <../man3/rewinddir.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`telldir(3) <../man3/telldir.3.html>`__, 
`mkfs.xfs(8) <../man8/mkfs.xfs.8.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/readdir.3.license.html>`__

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
