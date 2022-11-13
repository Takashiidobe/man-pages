.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readdir(3p) — Linux manual page
===============================

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

   READDIR(3P)             POSIX Programmer's Manual            READDIR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          readdir, readdir_r — read a directory


---------------------------------------------------------

::

          #include <dirent.h>

          struct dirent *readdir(DIR *dirp);
          int readdir_r(DIR *restrict dirp, struct dirent *restrict entry,
              struct dirent **restrict result);


---------------------------------------------------------------

::

          The type DIR, which is defined in the <dirent.h> header,
          represents a directory stream, which is an ordered sequence of
          all the directory entries in a particular directory. Directory
          entries represent files; files may be removed from a directory or
          added to a directory asynchronously to the operation of
          readdir().

          The readdir() function shall return a pointer to a structure
          representing the directory entry at the current position in the
          directory stream specified by the argument dirp, and position the
          directory stream at the next entry. It shall return a null
          pointer upon reaching the end of the directory stream. The
          structure dirent defined in the <dirent.h> header describes a
          directory entry. The value of the structure's d_ino member shall
          be set to the file serial number of the file named by the d_name
          member. If the d_name member names a symbolic link, the value of
          the d_ino member shall be set to the file serial number of the
          symbolic link itself.

          The readdir() function shall not return directory entries
          containing empty names. If entries for dot or dot-dot exist, one
          entry shall be returned for dot and one entry shall be returned
          for dot-dot; otherwise, they shall not be returned.

          The application shall not modify the structure to which the
          return value of readdir() points, nor any storage areas pointed
          to by pointers within the structure. The returned pointer, and
          pointers within the structure, might be invalidated or the
          structure or the storage areas might be overwritten by a
          subsequent call to readdir() on the same directory stream. They
          shall not be affected by a call to readdir() on a different
          directory stream. The returned pointer, and pointers within the
          structure, might also be invalidated if the calling thread is
          terminated.

          If a file is removed from or added to the directory after the
          most recent call to opendir() or rewinddir(), whether a
          subsequent call to readdir() returns an entry for that file is
          unspecified.

          The readdir() function may buffer several directory entries per
          actual read operation; readdir() shall mark for update the last
          data access timestamp of the directory each time the directory is
          actually read.

          After a call to fork(), either the parent or child (but not both)
          may continue processing the directory stream using readdir(),
          rewinddir(), or seekdir().  If both the parent and child
          processes use these functions, the result is undefined.

          The readdir() function need not be thread-safe.

          Applications wishing to check for error situations should set
          errno to 0 before calling readdir().  If errno is set to non-zero
          on return, an error occurred.

          The readdir_r() function shall initialize the dirent structure
          referenced by entry to represent the directory entry at the
          current position in the directory stream referred to by dirp,
          store a pointer to this structure at the location referenced by
          result, and position the directory stream at the next entry.

          The storage pointed to by entry shall be large enough for a
          dirent with an array of char d_name members containing at least
          {NAME_MAX}+1 elements.

          Upon successful return, the pointer returned at *result shall
          have the same value as the argument entry.  Upon reaching the end
          of the directory stream, this pointer shall have the value NULL.

          The readdir_r() function shall not return directory entries
          containing empty names.

          If a file is removed from or added to the directory after the
          most recent call to opendir() or rewinddir(), whether a
          subsequent call to readdir_r() returns an entry for that file is
          unspecified.

          The readdir_r() function may buffer several directory entries per
          actual read operation; readdir_r() shall mark for update the last
          data access timestamp of the directory each time the directory is
          actually read.


-----------------------------------------------------------------

::

          Upon successful completion, readdir() shall return a pointer to
          an object of type struct dirent.  When an error is encountered, a
          null pointer shall be returned and errno shall be set to indicate
          the error. When the end of the directory is encountered, a null
          pointer shall be returned and errno is not changed.

          If successful, the readdir_r() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          These functions shall fail if:

          EOVERFLOW
                 One of the values in the structure to be returned cannot
                 be represented correctly.

          These functions may fail if:

          EBADF  The dirp argument does not refer to an open directory
                 stream.

          ENOENT The current position of the directory stream is invalid.

          The following sections are informative.


---------------------------------------------------------

::

          The following sample program searches the current directory for
          each of the arguments supplied on the command line.

              #include <dirent.h>
              #include <errno.h>
              #include <stdio.h>
              #include <string.h>

              static void lookup(const char *arg)
              {
                  DIR *dirp;
                  struct dirent *dp;

                  if ((dirp = opendir(".")) == NULL) {
                      perror("couldn't open '.'");
                      return;
                  }

                  do {
                      errno = 0;
                      if ((dp = readdir(dirp)) != NULL) {
                          if (strcmp(dp->d_name, arg) != 0)
                              continue;

                          (void) printf("found %s\n", arg);
                          (void) closedir(dirp);
                              return;

                      }
                  } while (dp != NULL);

                  if (errno != 0)
                      perror("error reading directory");
                  else
                      (void) printf("failed to find %s\n", arg);
                  (void) closedir(dirp);
                  return;
              }

              int main(int argc, char *argv[])
              {
                  int i;
                  for (i = 1; i < argc; i++)
                      lookup(argv[i]);
                  return (0);
              }


---------------------------------------------------------------------------

::

          The readdir() function should be used in conjunction with
          opendir(), closedir(), and rewinddir() to examine the contents of
          the directory.

          The readdir_r() function is thread-safe and shall return values
          in a user-supplied buffer instead of possibly using a static data
          area that may be overwritten by each call.


-----------------------------------------------------------

::

          The returned value of readdir() merely represents a directory
          entry. No equivalence should be inferred.

          Historical implementations of readdir() obtain multiple directory
          entries on a single read operation, which permits subsequent
          readdir() operations to operate from the buffered information.
          Any wording that required each successful readdir() operation to
          mark the directory last data access timestamp for update would
          disallow such historical performance-oriented implementations.

          When returning a directory entry for the root of a mounted file
          system, some historical implementations of readdir() returned the
          file serial number of the underlying mount point, rather than of
          the root of the mounted file system. This behavior is considered
          to be a bug, since the underlying file serial number has no
          significance to applications.

          Since readdir() returns NULL when it detects an error and when
          the end of the directory is encountered, an application that
          needs to tell the difference must set errno to zero before the
          call and check it if NULL is returned.  Since the function must
          not change errno in the second case and must set it to a non-zero
          value in the first case, a zero errno after a call returning NULL
          indicates end-of-directory; otherwise, an error.

          Routines to deal with this problem more directly were proposed:

              int derror (dirp)
              DIR *dirp;

              void clearderr (dirp)
              DIR *dirp;

          The first would indicate whether an error had occurred, and the
          second would clear the error indication. The simpler method
          involving errno was adopted instead by requiring that readdir()
          not change errno when end-of-directory is encountered.

          An error or signal indicating that a directory has changed while
          open was considered but rejected.

          The thread-safe version of the directory reading function returns
          values in a user-supplied buffer instead of possibly using a
          static data area that may be overwritten by each call. Either the
          {NAME_MAX} compile-time constant or the corresponding pathconf()
          option can be used to determine the maximum sizes of returned
          pathnames.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          closedir(3p), dirfd(3p), exec(1p), fdopendir(3p), fstatat(3p),
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

   IEEE/The Open Group               2017                       READDIR(3P)

--------------

Pages that refer to this page:
`dirent.h(0p) <../man0/dirent.h.0p.html>`__, 
`dirfd(3p) <../man3/dirfd.3p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fdopendir(3p) <../man3/fdopendir.3p.html>`__, 
`glob(3p) <../man3/glob.3p.html>`__, 
`nftw(3p) <../man3/nftw.3p.html>`__, 
`rewinddir(3p) <../man3/rewinddir.3p.html>`__, 
`seekdir(3p) <../man3/seekdir.3p.html>`__, 
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
