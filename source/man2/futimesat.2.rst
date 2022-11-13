.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

futimesat(2) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FUTIMESAT(2)            Linux Programmer's Manual           FUTIMESAT(2)

NAME
-------------------------------------------------

::

          futimesat - change timestamps of a file relative to a directory
          file descriptor


---------------------------------------------------------

::

          #include <fcntl.h>            /* Definition of AT_* constants */
          #include <sys/time.h>

          int futimesat(int dirfd, const char *pathname,
                        const struct timeval times[2]);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          futimesat():
              _GNU_SOURCE


---------------------------------------------------------------

::

          This system call is obsolete.  Use utimensat(2) instead.

          The futimesat() system call operates in exactly the same way as
          utimes(2), except for the differences described in this manual
          page.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by utimes(2) for a
          relative pathname).

          If pathname is relative and dirfd is the special value AT_FDCWD,
          then pathname is interpreted relative to the current working
          directory of the calling process (like utimes(2)).

          If pathname is absolute, then dirfd is ignored.  (See openat(2)
          for an explanation of why the dirfd argument is useful.)


-----------------------------------------------------------------

::

          On success, futimesat() returns a 0.  On error, -1 is returned
          and errno is set to indicate the error.


-----------------------------------------------------

::

          The same errors that occur for utimes(2) can also occur for
          futimesat().  The following additional errors can occur for
          futimesat():

          EBADF  pathname is relative but dirfd is neither AT_FDCWD nor a
                 valid file descriptor.

          ENOTDIR
                 pathname is relative and dirfd is a file descriptor
                 referring to a file other than a directory.


---------------------------------------------------------

::

          futimesat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          This system call is nonstandard.  It was implemented from a
          specification that was proposed for POSIX.1, but that
          specification was replaced by the one for utimensat(2).

          A similar system call exists on Solaris.


---------------------------------------------------

::

      Glibc notes
          If pathname is NULL, then the glibc futimesat() wrapper function
          updates the times for the file referred to by dirfd.


---------------------------------------------------------

::

          stat(2), utimensat(2), utimes(2), futimes(3), path_resolution(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                   FUTIMESAT(2)

--------------

Pages that refer to this page: `open(2) <../man2/open.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`utime(2) <../man2/utime.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/futimesat.2.license.html>`__

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
