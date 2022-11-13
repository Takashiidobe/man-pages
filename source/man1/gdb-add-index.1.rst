.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gdb-add-index(1) — Linux manual page
====================================

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

   GDB-ADD-INDEX(1)          GNU Development Tools         GDB-ADD-INDEX(1)

NAME
-------------------------------------------------

::

          gdb-add-index - Add index files to speed up GDB


---------------------------------------------------------

::

          gdb-add-index filename


---------------------------------------------------------------

::

          When GDB finds a symbol file, it scans the symbols in the file in
          order to construct an internal symbol table.  This lets most GDB
          operations work quickly--at the cost of a delay early on.  For
          large programs, this delay can be quite lengthy, so GDB provides
          a way to build an index, which speeds up startup.

          To determine whether a file contains such an index, use the
          command "readelf -S filename": the index is stored in a section
          named ".gdb_index".  The index file can only be produced on
          systems which use ELF binaries and DWARF debug information (i.e.,
          sections named ".debug_*").

          gdb-add-index uses GDB and objdump found in the PATH environment
          variable.  If you want to use different versions of these
          programs, you can specify them through the GDB and OBJDUMP
          environment variables.

          See more in the GDB manual in node "Index Files" -- shell command
          "info -f gdb -n "Index Files"".


-------------------------------------------------------

::


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

   gdb-10.2                       2021-04-25               GDB-ADD-INDEX(1)

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
