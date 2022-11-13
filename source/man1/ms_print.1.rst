.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ms_print(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MS_PRINT(1)                     ms_print                     MS_PRINT(1)

NAME
-------------------------------------------------

::

          ms_print - post-processing tool for Massif


---------------------------------------------------------

::

          ms_print [options] massif-out-file


---------------------------------------------------------------

::

          ms_print takes an output file produced by the Valgrind tool
          Massif and prints the information in an easy-to-read form.


-------------------------------------------------------

::

          -h --help
              Show the help message.

          --version
              Show the version number.

          --threshold=<m.n> [default: 1.0]
              Same as Massif's --threshold option, but applied after
              profiling rather than during.

          --x=<4..1000> [default: 72]
              Width of the graph, in columns.

          --y=<4..1000> [default: 20]
              Height of the graph, in rows.


---------------------------------------------------------

::

          valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or
          http://www.valgrind.org/docs/manual/index.html.


-----------------------------------------------------

::

          Nicholas Nethercote.

COLOPHON
---------------------------------------------------------

::

          This page is part of the valgrind (a system for debugging and
          profiling Linux programs) project.  Information about the project
          can be found at ⟨http://www.valgrind.org/⟩.  If you have a bug
          report for this manual page, see
          ⟨http://www.valgrind.org/support/bug_reports.html⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://sourceware.org/git/valgrind.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Release 3.17.0                 08/27/2021                    MS_PRINT(1)

--------------

Pages that refer to this page: `valgrind(1) <../man1/valgrind.1.html>`__

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
