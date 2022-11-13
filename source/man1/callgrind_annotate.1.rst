.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

callgrind_annotate(1) — Linux manual page
=========================================

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

   CALLGRIND ANNOTATE(1)      callgrind_annotate      CALLGRIND ANNOTATE(1)

NAME
-------------------------------------------------

::

          callgrind_annotate - post-processing tool for the Callgrind


---------------------------------------------------------

::

          callgrind_annotate [options]
                             [callgrind-out-file [source-files...]]


---------------------------------------------------------------

::

          callgrind_annotate takes an output file produced by the Valgrind
          tool Callgrind and prints the information in an easy-to-read
          form.


-------------------------------------------------------

::

          -h --help
              Show summary of options.

          --version
              Show version of callgrind_annotate.

          --show=A,B,C [default: all]
              Only show figures for events A,B,C.

          --threshold=<0--100> [default: 99%]
              Percentage of counts (of primary sort event) we are
              interested in.

              callgrind_annotate stops printing functions when the sum of
              the cost percentage of the printed functions is bigger or
              equal to the given threshold percentage.

          --sort=A,B,C
              Sort columns by events A,B,C [event column order].

              Optionally, each event is followed by a : and a threshold, to
              specify different thresholds depending on the event.

              callgrind_annotate stops printing functions when the sum of
              the cost percentage of the printed functions for all the
              events is bigger or equal to the given event threshold
              percentages.

              When one or more thresholds are given via this option, the
              value of --threshold is ignored.

          --show-percs=<no|yes> [default: no]
              When enabled, a percentage is printed next to all event
              counts. This helps gauge the relative importance of each
              function and line.

          --auto=<yes|no> [default: yes]
              Annotate all source files containing functions that helped
              reach the event count threshold.

          --context=N [default: 8]
              Print N lines of context before and after annotated lines.

          --inclusive=<yes|no> [default: no]
              Add subroutine costs to functions calls.

          --tree=<none|caller|calling|both> [default: none]
              Print for each function their callers, the called functions
              or both.

          -I, --include=<dir>
              Add dir to the list of directories to search for source
              files.


---------------------------------------------------------

::

          valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or
          http://www.valgrind.org/docs/manual/index.html.


-----------------------------------------------------

::

          Josef Weidendorfer <Josef.Weidendorfer@gmx.de>.

          This manual page was written by Philipp Frauenfelder
          <pfrauenf@debian.org>.

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

   Release 3.17.0                 08/27/2021          CALLGRIND ANNOTATE(1)

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
