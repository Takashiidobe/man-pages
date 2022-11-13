.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getdtablesize(3) — Linux manual page
====================================

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

   GETDTABLESIZE(3)        Linux Programmer's Manual       GETDTABLESIZE(3)

NAME
-------------------------------------------------

::

          getdtablesize - get file descriptor table size


---------------------------------------------------------

::

          #include <unistd.h>

          int getdtablesize(void);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getdtablesize():
              Since glibc 2.20:
                  _DEFAULT_SOURCE || ! (_POSIX_C_SOURCE >= 200112L)
              Glibc 2.12 to 2.19:
                  _BSD_SOURCE || ! (_POSIX_C_SOURCE >= 200112L)
              Before glibc 2.12:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          getdtablesize() returns the maximum number of files a process can
          have open, one more than the largest possible value for a file
          descriptor.


-----------------------------------------------------------------

::

          The current limit on the number of open files per process.


-----------------------------------------------------

::

          On Linux, getdtablesize() can return any of the errors described
          for getrlimit(2); see NOTES below.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │getdtablesize()                       │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          SVr4, 4.4BSD (the getdtablesize() function first appeared in
          4.2BSD).  It is not specified in POSIX.1; portable applications
          should employ sysconf(_SC_OPEN_MAX) instead of this call.


---------------------------------------------------

::

          The glibc version of getdtablesize() calls getrlimit(2) and
          returns the current RLIMIT_NOFILE limit, or OPEN_MAX when that
          fails.


---------------------------------------------------------

::

          close(2), dup(2), getrlimit(2), open(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               GETDTABLESIZE(3)

--------------

`Copyright and license for this manual
page <../man3/getdtablesize.3.license.html>`__

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
