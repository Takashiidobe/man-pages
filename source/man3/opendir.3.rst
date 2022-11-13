.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

opendir(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   OPENDIR(3)              Linux Programmer's Manual             OPENDIR(3)

NAME
-------------------------------------------------

::

          opendir, fdopendir - open a directory


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <dirent.h>

          DIR *opendir(const char *name);
          DIR *fdopendir(int fd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fdopendir():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The opendir() function opens a directory stream corresponding to
          the directory name, and returns a pointer to the directory
          stream.  The stream is positioned at the first entry in the
          directory.

          The fdopendir() function is like opendir(), but returns a
          directory stream for the directory referred to by the open file
          descriptor fd.  After a successful call to fdopendir(), fd is
          used internally by the implementation, and should not otherwise
          be used by the application.


-----------------------------------------------------------------

::

          The opendir() and fdopendir() functions return a pointer to the
          directory stream.  On error, NULL is returned, and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EACCES Permission denied.

          EBADF  fd is not a valid file descriptor opened for reading.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOENT Directory does not exist, or name is an empty string.

          ENOMEM Insufficient memory to complete the operation.

          ENOTDIR
                 name is not a directory.


---------------------------------------------------------

::

          fdopendir() is available in glibc since version 2.4.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │opendir(), fdopendir()                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          opendir() is present on SVr4, 4.3BSD, and specified in
          POSIX.1-2001.  fdopendir() is specified in POSIX.1-2008.


---------------------------------------------------

::

          Filename entries can be read from a directory stream using
          readdir(3).

          The underlying file descriptor of the directory stream can be
          obtained using dirfd(3).

          The opendir() function sets the close-on-exec flag for the file
          descriptor underlying the DIR *.  The fdopendir() function leaves
          the setting of the close-on-exec flag unchanged for the file
          descriptor, fd.  POSIX.1-200x leaves it unspecified whether a
          successful call to fdopendir() will set the close-on-exec flag
          for the file descriptor, fd.


---------------------------------------------------------

::

          open(2), closedir(3), dirfd(3), readdir(3), rewinddir(3),
          scandir(3), seekdir(3), telldir(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     OPENDIR(3)

--------------

Pages that refer to this page:
`close_range(2) <../man2/close_range.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__,  `open(2) <../man2/open.2.html>`__, 
`closedir(3) <../man3/closedir.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__,  `fts(3) <../man3/fts.3.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`rewinddir(3) <../man3/rewinddir.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`telldir(3) <../man3/telldir.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/opendir.3.license.html>`__

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
