.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tmpfile(3) — Linux manual page
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

   TMPFILE(3)              Linux Programmer's Manual             TMPFILE(3)

NAME
-------------------------------------------------

::

          tmpfile - create a temporary file


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *tmpfile(void);


---------------------------------------------------------------

::

          The tmpfile() function opens a unique temporary file in binary
          read/write (w+b) mode.  The file will be automatically deleted
          when it is closed or the program terminates.


-----------------------------------------------------------------

::

          The tmpfile() function returns a stream descriptor, or NULL if a
          unique filename cannot be generated or the unique file cannot be
          opened.  In the latter case, errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Search permission denied for directory in file's path
                 prefix.

          EEXIST Unable to generate a unique filename.

          EINTR  The call was interrupted by a signal; see signal(7).

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOSPC There was no room in the directory to add the new
                 filename.

          EROFS  Read-only filesystem.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │tmpfile()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD, SUSv2.


---------------------------------------------------

::

          POSIX.1-2001 specifies: an error message may be written to stdout
          if the stream cannot be opened.

          The standard does not specify the directory that tmpfile() will
          use.  Glibc will try the path prefix P_tmpdir defined in
          <stdio.h>, and if that fails, then the directory /tmp.


---------------------------------------------------------

::

          exit(3), mkstemp(3), mktemp(3), tempnam(3), tmpnam(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     TMPFILE(3)

--------------

Pages that refer to this page: `getpid(2) <../man2/getpid.2.html>`__, 
`open(2) <../man2/open.2.html>`__,  `exit(3) <../man3/exit.3.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`tmpnam(3) <../man3/tmpnam.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/tmpfile.3.license.html>`__

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
