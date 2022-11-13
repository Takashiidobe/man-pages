.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cg_annotate(1) — Linux manual page
==================================

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

   CG_ANNOTATE(1)                 cg_annotate                CG_ANNOTATE(1)

NAME
-------------------------------------------------

::

          cg_annotate - post-processing tool for Cachegrind


---------------------------------------------------------

::

          cg_annotate [options] cachegrind-out-file [source-files...]


---------------------------------------------------------------

::

          cg_annotate takes an output file produced by the Valgrind tool
          Cachegrind and prints the information in an easy-to-read form.


-------------------------------------------------------

::

          -h --help
              Show the help message.

          --version
              Show the version number.

          --show=A,B,C [default: all, using order in cachegrind.out.<pid>]
              Specifies which events to show (and the column order).
              Default is to use all present in the cachegrind.out.<pid>
              file (and use the order in the file). Useful if you want to
              concentrate on, for example, I cache misses
              (--show=I1mr,ILmr), or data read misses (--show=D1mr,DLmr),
              or LL data misses (--show=DLmr,DLmw). Best used in
              conjunction with --sort.

          --sort=A,B,C [default: order in cachegrind.out.<pid>]
              Specifies the events upon which the sorting of the
              function-by-function entries will be based.

          --threshold=X [default: 0.1%]
              Sets the threshold for the function-by-function summary. A
              function is shown if it accounts for more than X% of the
              counts for the primary sort event. If auto-annotating, also
              affects which files are annotated.

              Note: thresholds can be set for more than one of the events
              by appending any events for the --sort option with a colon
              and a number (no spaces, though). E.g. if you want to see
              each function that covers more than 1% of LL read misses or
              1% of LL write misses, use this option:

              --sort=DLmr:1,DLmw:1

          --show-percs=<no|yes> [default: yes]
              When enabled, a percentage is printed next to all event
              counts. This helps gauge the relative importance of each
              function and line.

          --auto=<no|yes> [default: yes]
              When enabled, automatically annotates every file that is
              mentioned in the function-by-function summary that can be
              found. Also gives a list of those that couldn't be found.

          --context=N [default: 8]
              Print N lines of context before and after each annotated
              line. Avoids printing large sections of source files that
              were not executed. Use a large number (e.g. 100000) to show
              all source lines.

          -I<dir> --include=<dir> [default: none]
              Adds a directory to the list in which to search for files.
              Multiple -I/--include options can be given to add multiple
              directories.


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

   Release 3.17.0                 08/27/2021                 CG_ANNOTATE(1)

--------------

Pages that refer to this page: `cg_diff(1) <../man1/cg_diff.1.html>`__, 
`cg_merge(1) <../man1/cg_merge.1.html>`__, 
`valgrind(1) <../man1/valgrind.1.html>`__

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
