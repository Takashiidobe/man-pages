.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-column(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-COLUMN(1)                  Git Manual                  GIT-COLUMN(1)

NAME
-------------------------------------------------

::

          git-column - Display data in columns


---------------------------------------------------------

::

          git column [--command=<name>] [--[raw-]mode=<mode>] [--width=<width>]
                       [--indent=<string>] [--nl=<string>] [--padding=<n>]


---------------------------------------------------------------

::

          This command formats the lines of its standard input into a table
          with multiple columns. Each input line occupies one cell of the
          table. It is used internally by other git commands to format
          output into columns.


-------------------------------------------------------

::

          --command=<name>
              Look up layout mode using configuration variable
              column.<name> and column.ui.

          --mode=<mode>
              Specify layout mode. See configuration variable column.ui for
              option syntax in git-config(1).

          --raw-mode=<n>
              Same as --mode but take mode encoded as a number. This is
              mainly used by other commands that have already parsed layout
              mode.

          --width=<width>
              Specify the terminal width. By default git column will detect
              the terminal width, or fall back to 80 if it is unable to do
              so.

          --indent=<string>
              String to be printed at the beginning of each line.

          --nl=<N>
              String to be printed at the end of each line, including
              newline character.

          --padding=<N>
              The number of spaces between columns. One space by default.


---------------------------------------------------------

::

          Format data by columns:

              $ seq 1 24 | git column --mode=column --padding=5
              1      4      7      10     13     16     19     22
              2      5      8      11     14     17     20     23
              3      6      9      12     15     18     21     24

          Format data by rows:

              $ seq 1 21 | git column --mode=row --padding=5
              1      2      3      4      5      6      7
              8      9      10     11     12     13     14
              15     16     17     18     19     20     21

          List some tags in a table with unequal column widths:

              $ git tag --list 'v2.4.*' --column=row,dense
              v2.4.0  v2.4.0-rc0  v2.4.0-rc1  v2.4.0-rc2  v2.4.0-rc3
              v2.4.1  v2.4.10     v2.4.11     v2.4.12     v2.4.2
              v2.4.3  v2.4.4      v2.4.5      v2.4.6      v2.4.7
              v2.4.8  v2.4.9


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021                  GIT-COLUMN(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__

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
