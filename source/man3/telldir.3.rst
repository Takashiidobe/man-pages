.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

telldir(3) — Linux manual page
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

   TELLDIR(3)              Linux Programmer's Manual             TELLDIR(3)

NAME
-------------------------------------------------

::

          telldir - return current location in directory stream


---------------------------------------------------------

::

          #include <dirent.h>

          long telldir(DIR *dirp);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          telldir():
              _XOPEN_SOURCE
                 || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                 || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The telldir() function returns the current location associated
          with the directory stream dirp.


-----------------------------------------------------------------

::

          On success, the telldir() function returns the current location
          in the directory stream.  On error, -1 is returned, and errno is
          set to indicate the error.


-----------------------------------------------------

::

          EBADF  Invalid directory stream descriptor dirp.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │telldir()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

          In glibc up to version 2.1.1, the return type of telldir() was
          off_t.  POSIX.1-2001 specifies long, and this is the type used
          since glibc 2.1.2.

          In early filesystems, the value returned by telldir() was a
          simple file offset within a directory.  Modern filesystems use
          tree or hash structures, rather than flat tables, to represent
          directories.  On such filesystems, the value returned by
          telldir() (and used internally by readdir(3)) is a "cookie" that
          is used by the implementation to derive a position within a
          directory.  Application programs should treat this strictly as an
          opaque value, making no assumptions about its contents.


---------------------------------------------------------

::

          closedir(3), opendir(3), readdir(3), rewinddir(3), scandir(3),
          seekdir(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     TELLDIR(3)

--------------

Pages that refer to this page:
`closedir(3) <../man3/closedir.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__, 
`opendir(3) <../man3/opendir.3.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`rewinddir(3) <../man3/rewinddir.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/telldir.3.license.html>`__

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
