.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gcore(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GCORE(1)                  GNU Development Tools                 GCORE(1)

NAME
-------------------------------------------------

::

          gcore - Generate a core file of a running program


---------------------------------------------------------

::

          gcore [-a] [-o prefix] pid1 [pid2...pidN]


---------------------------------------------------------------

::

          Generate core dumps of one or more running programs with process
          IDs pid1, pid2, etc.  A core file produced by gcore is equivalent
          to one produced by the kernel when the process crashes (and when
          "ulimit -c" was used to set up an appropriate core dump limit).
          However, unlike after a crash, after gcore finishes its job the
          program remains running without any change.


-------------------------------------------------------

::

          -a  Dump all memory mappings.  The actual effect of this option
              depends on the Operating System.  On GNU/Linux, it will
              disable "use-coredump-filter" and enable
              "dump-excluded-mappings".

          -o prefix
              The optional argument prefix specifies the prefix to be used
              when composing the file names of the core dumps.  The file
              name is composed as prefix.pid, where pid is the process ID
              of the running program being analyzed by gcore.  If not
              specified, prefix defaults to gcore.


---------------------------------------------------------

::

          The full documentation for GDB is maintained as a Texinfo manual.
          If the "info" and "gdb" programs and GDB's Texinfo documentation
          are properly installed at your site, the command

                  info gdb

          should give you access to the complete manual.

          Using GDB: A Guide to the GNU Source-Level Debugger, Richard M.
          Stallman and Roland H. Pesch, July 1991.


-----------------------------------------------------------

::

          Copyright (c) 1988-2021 Free Software Foundation, Inc.

          Permission is granted to copy, distribute and/or modify this
          document under the terms of the GNU Free Documentation License,
          Version 1.3 or any later version published by the Free Software
          Foundation; with the Invariant Sections being "Free Software" and
          "Free Software Needs Free Documentation", with the Front-Cover
          Texts being "A GNU Manual," and with the Back-Cover Texts as in
          (a) below.

          (a) The FSF's Back-Cover Text is: "You are free to copy and
          modify this GNU Manual.  Buying copies from GNU Press supports
          the FSF in developing GNU and promoting software freedom."

COLOPHON
---------------------------------------------------------

::

          This page is part of the gdb (GNU debugger) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/gdb/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.gnu.org/software/gdb/bugs/⟩.
          This page was obtained from the tarball gdb-10.2.tar.gz fetched
          from ⟨https://ftp.gnu.org/gnu/gdb/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   gdb-10.2                       2021-04-25                       GCORE(1)

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
