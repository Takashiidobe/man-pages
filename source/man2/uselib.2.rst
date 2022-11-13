.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uselib(2) — Linux manual page
=============================

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

   USELIB(2)               Linux Programmer's Manual              USELIB(2)

NAME
-------------------------------------------------

::

          uselib - load shared library


---------------------------------------------------------

::

          #include <unistd.h>

          int uselib(const char *library);

          Note: No declaration of this system call is provided in glibc
          headers; see NOTES.


---------------------------------------------------------------

::

          The system call uselib() serves to load a shared library to be
          used by the calling process.  It is given a pathname.  The
          address where to load is found in the library itself.  The
          library can have any recognized binary format.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          In addition to all of the error codes returned by open(2) and
          mmap(2), the following may also be returned:

          EACCES The library specified by library does not have read or
                 execute permission, or the caller does not have search
                 permission for one of the directories in the path prefix.
                 (See also path_resolution(7).)

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOEXEC
                 The file specified by library is not an executable of a
                 known type; for example, it does not have the correct
                 magic numbers.


-------------------------------------------------------------------

::

          uselib() is Linux-specific, and should not be used in programs
          intended to be portable.


---------------------------------------------------

::

          This obsolete system call is not supported by glibc.  No
          declaration is provided in glibc headers, but, through a quirk of
          history, glibc versions before 2.23 did export an ABI for this
          system call.  Therefore, in order to employ this system call, it
          was sufficient to manually declare the interface in your code;
          alternatively, you could invoke the system call using syscall(2).

          In ancient libc versions (before glibc 2.0), uselib() was used to
          load the shared libraries with names found in an array of names
          in the binary.

          Since Linux 3.15, this system call is available only when the
          kernel is configured with the CONFIG_USELIB option.


---------------------------------------------------------

::

          ar(1), gcc(1), ld(1), ldd(1), mmap(2), open(2), dlopen(3),
          capabilities(7), ld.so(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      USELIB(2)

--------------

Pages that refer to this page:
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/uselib.2.license.html>`__

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
