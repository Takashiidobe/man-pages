.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readdir_r(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   READDIR_R(3)            Linux Programmer's Manual           READDIR_R(3)

NAME
-------------------------------------------------

::

          readdir_r - read a directory


---------------------------------------------------------

::

          #include <dirent.h>

          int readdir_r(DIR *restrict dirp, struct dirent *restrict entry,
                        struct dirent **restrict result);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          readdir_r():
              _POSIX_C_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          This function is deprecated; use readdir(3) instead.

          The readdir_r() function was invented as a reentrant version of
          readdir(3).  It reads the next directory entry from the directory
          stream dirp, and returns it in the caller-allocated buffer
          pointed to by entry.  For details of the dirent structure, see
          readdir(3).

          A pointer to the returned buffer is placed in *result; if the end
          of the directory stream was encountered, then NULL is instead
          returned in *result.

          It is recommended that applications use readdir(3) instead of
          readdir_r().  Furthermore, since version 2.24, glibc deprecates
          readdir_r().  The reasons are as follows:

          *  On systems where NAME_MAX is undefined, calling readdir_r()
             may be unsafe because the interface does not allow the caller
             to specify the length of the buffer used for the returned
             directory entry.

          *  On some systems, readdir_r() can't read directory entries with
             very long names.  When the glibc implementation encounters
             such a name, readdir_r() fails with the error ENAMETOOLONG
             after the final directory entry has been read.  On some other
             systems, readdir_r() may return a success status, but the
             returned d_name field may not be null terminated or may be
             truncated.

          *  In the current POSIX.1 specification (POSIX.1-2008),
             readdir(3) is not required to be thread-safe.  However, in
             modern implementations (including the glibc implementation),
             concurrent calls to readdir(3) that specify different
             directory streams are thread-safe.  Therefore, the use of
             readdir_r() is generally unnecessary in multithreaded
             programs.  In cases where multiple threads must read from the
             same directory stream, using readdir(3) with external
             synchronization is still preferable to the use of readdir_r(),
             for the reasons given in the points above.

          *  It is expected that a future version of POSIX.1 will make
             readdir_r() obsolete, and require that readdir(3) be thread-
             safe when concurrently employed on different directory
             streams.


-----------------------------------------------------------------

::

          The readdir_r() function returns 0 on success.  On error, it
          returns a positive error number (listed under ERRORS).  If the
          end of the directory stream is reached, readdir_r() returns 0,
          and returns NULL in *result.


-----------------------------------------------------

::

          EBADF  Invalid directory stream descriptor dirp.

          ENAMETOOLONG
                 A directory entry whose name was too long to be read was
                 encountered.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │readdir_r()                           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          readdir(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   READDIR_R(3)

--------------

Pages that refer to this page: `readdir(3) <../man3/readdir.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/readdir_r.3.license.html>`__

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
