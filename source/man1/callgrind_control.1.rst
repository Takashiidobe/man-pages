.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

callgrind_control(1) — Linux manual page
========================================

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

   CALLGRIND CONTROL(1)        callgrind_control       CALLGRIND CONTROL(1)

NAME
-------------------------------------------------

::

          callgrind_control - observe and control programs being run by
          Callgrind


---------------------------------------------------------

::

          callgrind_control [options] [pid|program-name...]


---------------------------------------------------------------

::

          callgrind_control controls programs being run by the Valgrind
          tool Callgrind. When a pid/program name argument is not
          specified, all applications currently being run by Callgrind on
          this system will be used for actions given by the specified
          option(s). The default action is to give some brief information
          about the applications being run by Callgrind.


-------------------------------------------------------

::

          -h --help
              Show a short description, usage, and summary of options.

          --version
              Show version of callgrind_control.

          -l --long
              Show also the working directory, in addition to the brief
              information given by default.

          -s --stat
              Show statistics information about active Callgrind runs.

          -b --back
              Show stack/back traces of each thread in active Callgrind
              runs. For each active function in the stack trace, also the
              number of invocations since program start (or last dump) is
              shown. This option can be combined with -e to show inclusive
              cost of active functions.

          -e [A,B,...]  (default: all)
              Show the current per-thread, exclusive cost values of event
              counters. If no explicit event names are given, figures for
              all event types which are collected in the given Callgrind
              run are shown. Otherwise, only figures for event types A, B,
              ... are shown. If this option is combined with -b, inclusive
              cost for the functions of each active stack frame is
              provided, too.

          --dump[=<desc>]  (default: no description)
              Request the dumping of profile information. Optionally, a
              description can be specified which is written into the dump
              as part of the information giving the reason which triggered
              the dump action. This can be used to distinguish multiple
              dumps.

          -z --zero
              Zero all event counters.

          -k --kill
              Force a Callgrind run to be terminated.

          --instr=<on|off>
              Switch instrumentation mode on or off. If a Callgrind run has
              instrumentation disabled, no simulation is done and no events
              are counted. This is useful to skip uninteresting program
              parts, as there is much less slowdown (same as with the
              Valgrind tool "none"). See also the Callgrind option
              --instr-atstart.

          --vgdb-prefix=<prefix>
              Specify the vgdb prefix to use by callgrind_control.
              callgrind_control internally uses vgdb to find and control
              the active Callgrind runs. If the --vgdb-prefix option was
              used for launching valgrind, then the same option must be
              given to callgrind_control.


---------------------------------------------------------

::

          valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or
          http://www.valgrind.org/docs/manual/index.html.


-----------------------------------------------------

::

          Josef Weidendorfer <Josef.Weidendorfer@gmx.de>.

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

   Release 3.17.0                 08/27/2021           CALLGRIND CONTROL(1)

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
