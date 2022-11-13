.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fdopendir(3p) — Linux manual page
=================================

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

   FDOPENDIR(3P)           POSIX Programmer's Manual          FDOPENDIR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fdopendir, opendir — open directory associated with file
          descriptor


---------------------------------------------------------

::

          #include <dirent.h>

          DIR *fdopendir(int fd);
          DIR *opendir(const char *dirname);


---------------------------------------------------------------

::

          The fdopendir() function shall be equivalent to the opendir()
          function except that the directory is specified by a file
          descriptor rather than by a name. The file offset associated with
          the file descriptor at the time of the call determines which
          entries are returned.

          Upon successful return from fdopendir(), the file descriptor is
          under the control of the system, and if any attempt is made to
          close the file descriptor, or to modify the state of the
          associated description, other than by means of closedir(),
          readdir(), readdir_r(), rewinddir(), or seekdir(), the behavior
          is undefined. Upon calling closedir() the file descriptor shall
          be closed.

          It is unspecified whether the FD_CLOEXEC flag will be set on the
          file descriptor by a successful call to fdopendir().

          The opendir() function shall open a directory stream
          corresponding to the directory named by the dirname argument. The
          directory stream is positioned at the first entry. If the type
          DIR is implemented using a file descriptor, applications shall
          only be able to open up to a total of {OPEN_MAX} files and
          directories.

          If the type DIR is implemented using a file descriptor, the
          descriptor shall be obtained as if the O_DIRECTORY flag was
          passed to open().


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a
          pointer to an object of type DIR.  Otherwise, these functions
          shall return a null pointer and set errno to indicate the error.


-----------------------------------------------------

::

          The fdopendir() function shall fail if:

          EBADF  The fd argument is not a valid file descriptor open for
                 reading.

          ENOTDIR
                 The descriptor fd is not associated with a directory.

          The opendir() function shall fail if:

          EACCES Search permission is denied for the component of the path
                 prefix of dirname or read permission is denied for
                 dirname.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the dirname argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of dirname does not name an existing directory
                 or dirname is an empty string.

          ENOTDIR
                 A component of dirname names an existing file that is
                 neither a directory nor a symbolic link to a directory.

          The opendir() function may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the dirname argument.

          EMFILE All file descriptors available to the process are
                 currently open.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ENFILE Too many files are currently open in the system.

          The following sections are informative.


---------------------------------------------------------

::

      Open a Directory Stream
          The following program fragment demonstrates how the opendir()
          function is used.

              #include <dirent.h>
              ...
                  DIR *dir;
                  struct dirent *dp;
              ...
                  if ((dir = opendir (".")) == NULL) {
                      perror ("Cannot open .");
                      exit (1);
                  }

                  while ((dp = readdir (dir)) != NULL) {
              ...

      Find And Open a File
          The following program searches through a given directory looking
          for files whose name does not begin with a dot and whose size is
          larger than 1 MiB.

              #include <stdio.h>
              #include <dirent.h>
              #include <fcntl.h>
              #include <sys/stat.h>
              #include <stdint.h>
              #include <stdlib.h>
              #include <unistd.h>

              int
              main(int argc, char *argv[])
              {
                  struct stat statbuf;
                  DIR *d;
                  struct dirent *dp;
                  int dfd, ffd;

                  if ((d = fdopendir((dfd = open("./tmp", O_RDONLY)))) == NULL) {
                      fprintf(stderr, "Cannot open ./tmp directory\n");
                      exit(1);
                  }
                  while ((dp = readdir(d)) != NULL) {
                      if (dp->d_name[0] == '.')
                          continue;
                      /* there is a possible race condition here as the file
                       * could be renamed between the readdir and the open */
                      if ((ffd = openat(dfd, dp->d_name, O_RDONLY)) == -1) {
                          perror(dp->d_name);
                          continue;
                      }
                      if (fstat(ffd, &statbuf) == 0 && statbuf.st_size > (1024*1024)) {
                          /* found it ... */
                          printf("%s: %jdK\n", dp->d_name,
                              (intmax_t)(statbuf.st_size / 1024));
                      }
                      close(ffd);
                  }
                  closedir(d); // note this implicitly closes dfd
                  return 0;
              }


---------------------------------------------------------------------------

::

          The opendir() function should be used in conjunction with
          readdir(), closedir(), and rewinddir() to examine the contents of
          the directory (see the EXAMPLES section in readdir(3p)).  This
          method is recommended for portability.


-----------------------------------------------------------

::

          The purpose of the fdopendir() function is to enable opening
          files in directories other than the current working directory
          without exposure to race conditions. Any part of the path of a
          file could be changed in parallel to a call to opendir(),
          resulting in unspecified behavior.

          Based on historical implementations, the rules about file
          descriptors apply to directory streams as well. However, this
          volume of POSIX.1‐2017 does not mandate that the directory stream
          be implemented using file descriptors. The description of
          closedir() clarifies that if a file descriptor is used for the
          directory stream, it is mandatory that closedir() deallocate the
          file descriptor. When a file descriptor is used to implement the
          directory stream, it behaves as if the FD_CLOEXEC had been set
          for the file descriptor.

          The directory entries for dot and dot-dot are optional. This
          volume of POSIX.1‐2017 does not provide a way to test a priori
          for their existence because an application that is portable must
          be written to look for (and usually ignore) those entries.
          Writing code that presumes that they are the first two entries
          does not always work, as many implementations permit them to be
          other than the first two entries, with a ``normal'' entry
          preceding them. There is negligible value in providing a way to
          determine what the implementation does because the code to deal
          with dot and dot-dot must be written in any case and because such
          a flag would add to the list of those flags (which has proven in
          itself to be objectionable) and might be abused.

          Since the structure and buffer allocation, if any, for directory
          operations are defined by the implementation, this volume of
          POSIX.1‐2017 imposes no portability requirements for erroneous
          program constructs, erroneous data, or the use of unspecified
          values such as the use or referencing of a dirp value or a dirent
          structure value after a directory stream has been closed or after
          a fork() or one of the exec function calls.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          closedir(3p), dirfd(3p), fstatat(3p), open(3p), readdir(3p),
          rewinddir(3p), symlink(3p)

          The Base Definitions volume of POSIX.1‐2017, dirent.h(0p),
          sys_types.h(0p)


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

   IEEE/The Open Group               2017                     FDOPENDIR(3P)

--------------

Pages that refer to this page:
`dirent.h(0p) <../man0/dirent.h.0p.html>`__, 
`closedir(3p) <../man3/closedir.3p.html>`__, 
`dirfd(3p) <../man3/dirfd.3p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`ftw(3p) <../man3/ftw.3p.html>`__, 
`glob(3p) <../man3/glob.3p.html>`__, 
`nftw(3p) <../man3/nftw.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`opendir(3p) <../man3/opendir.3p.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__, 
`rewinddir(3p) <../man3/rewinddir.3p.html>`__, 
`seekdir(3p) <../man3/seekdir.3p.html>`__, 
`symlink(3p) <../man3/symlink.3p.html>`__, 
`telldir(3p) <../man3/telldir.3p.html>`__

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
