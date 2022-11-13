.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gcov-dump(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GCOV-DUMP(1)                       GNU                      GCOV-DUMP(1)

NAME
-------------------------------------------------

::

          gcov-dump - offline gcda and gcno profile dump tool


---------------------------------------------------------

::

          gcov-dump [-v|--version]
               [-h|--help]
               [-l|--long]
               [-p|--positions]
               gcovfiles


---------------------------------------------------------------

::

          gcov-dump is a tool you can use in conjunction with GCC to dump
          content of gcda and gcno profile files offline.


-------------------------------------------------------

::

          -h
          --help
              Display help about using gcov-dump (on the standard output),
              and exit without doing any further processing.

          -l
          --long
              Dump content of records.

          -p
          --positions
              Dump positions of records.

          -v
          --version
              Display the gcov-dump version number (on the standard
              output), and exit without doing any further processing.


-----------------------------------------------------------

::

          Copyright (c) 2017-2019 Free Software Foundation, Inc.

          Permission is granted to copy, distribute and/or modify this
          document under the terms of the GNU Free Documentation License,
          Version 1.3 or any later version published by the Free Software
          Foundation; with the Invariant Sections being "GNU General Public
          License" and "Funding Free Software", the Front-Cover texts being
          (a) (see below), and with the Back-Cover Texts being (b) (see
          below).  A copy of the license is included in the gfdl(7) man
          page.

          (a) The FSF's Front-Cover Text is:

               A GNU Manual

          (b) The FSF's Back-Cover Text is:

               You have freedom to copy and modify this GNU Manual, like GNU
               software.  Copies published by the Free Software Foundation raise
               funds for GNU development.

COLOPHON
---------------------------------------------------------

::

          This page is part of the gcc (GNU Compiler Collection) project.
          Information about the project can be found at 
          ⟨http://gcc.gnu.org/⟩.  If you have a bug report for this manual
          page, see ⟨http://gcc.gnu.org/bugs/⟩.  This page was obtained
          from the tarball gcc-9.4.0.tar.gz fetched from
          ⟨ftp://ftp.gwdg.de/pub/misc/gcc/releases/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   gcc-9.4.0                      2021-06-01                   GCOV-DUMP(1)

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
