.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-list(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TRACE-CMD-LIST(1)                                      TRACE-CMD-LIST(1)

NAME
-------------------------------------------------

::

          trace-cmd-list - list available plugins, events or options for
          Ftrace.


---------------------------------------------------------

::

          trace-cmd list [OPTIONS]


---------------------------------------------------------------

::

          The trace-cmd(1) list displays the available plugins, events or
          Ftrace options that are configured on the current machine. If no
          option is given, then it lists all plugins, event systems, events
          and Ftrace options to standard output.


-------------------------------------------------------

::

          -e [regex]
              This option will list the available events that are enabled
              on the local system.

                  It takes an optional argument that uses 'regcomp(3)' expressions to seach.

                  trace-cmd list -e '^sys.*'

          -F
              Used with -e regex to show those events formats.

          -l
              Used with -e regex to show those events filters.

          -R
              Used with -e regex to show those events triggers.

          -s
              This option will list the available event systems.

          -t
              This option will list the available tracers that are enabled
              on the local system.

          -p
              Same as -t and only for legacy purposes.

          -o
              This option will list the available Ftrace options that are
              configured on the local system.

          -f [regex]
              This option will list the available filter functions. These
              are the list of functions on the system that you can trace,
              or filter on. It takes an optional argument that uses
              regcomp(3) expressions to seach.

                  trace-cmd list -f '^sched.*'

          -P
              List the plugin files that get loaded on trace-cmd report.

          -O
              List plugin options that can be used by trace-cmd report -O
              option.

          -B
              List defined buffer instances (sub buffers).

          -C
              List defined clocks that can be used with trace-cmd record
              -C. The one in brackets ([]) is the active clock.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-split(1), trace-cmd-listen(1)


-----------------------------------------------------

::

          Written by Steven Rostedt, <rostedt@goodmis.org[1]>


-----------------------------------------------------------

::

          git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git


-------------------------------------------------------

::

          Copyright (C) 2010 Red Hat, Inc. Free use of this software is
          granted under the terms of the GNU Public License (GPL).


---------------------------------------------------

::

           1. rostedt@goodmis.org
              mailto:rostedt@goodmis.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the trace-cmd (a front-end for Ftrace)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to Steven Rostedt
          <rostedt@goodmis.org>.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  05/27/2020              TRACE-CMD-LIST(1)

--------------

Pages that refer to this page:
`trace-cmd(1) <../man1/trace-cmd.1.html>`__, 
`trace-cmd-check-events(1) <../man1/trace-cmd-check-events.1.html>`__, 
`trace-cmd-clear(1) <../man1/trace-cmd-clear.1.html>`__, 
`trace-cmd-extract(1) <../man1/trace-cmd-extract.1.html>`__, 
`trace-cmd-listen(1) <../man1/trace-cmd-listen.1.html>`__, 
`trace-cmd-options(1) <../man1/trace-cmd-options.1.html>`__, 
`trace-cmd-profile(1) <../man1/trace-cmd-profile.1.html>`__, 
`trace-cmd-record(1) <../man1/trace-cmd-record.1.html>`__, 
`trace-cmd-report(1) <../man1/trace-cmd-report.1.html>`__, 
`trace-cmd-reset(1) <../man1/trace-cmd-reset.1.html>`__, 
`trace-cmd-restore(1) <../man1/trace-cmd-restore.1.html>`__, 
`trace-cmd-set(1) <../man1/trace-cmd-set.1.html>`__, 
`trace-cmd-show(1) <../man1/trace-cmd-show.1.html>`__, 
`trace-cmd-snapshot(1) <../man1/trace-cmd-snapshot.1.html>`__, 
`trace-cmd-split(1) <../man1/trace-cmd-split.1.html>`__, 
`trace-cmd-stack(1) <../man1/trace-cmd-stack.1.html>`__, 
`trace-cmd-start(1) <../man1/trace-cmd-start.1.html>`__, 
`trace-cmd-stop(1) <../man1/trace-cmd-stop.1.html>`__, 
`trace-cmd-stream(1) <../man1/trace-cmd-stream.1.html>`__, 
`trace-cmd.dat(5) <../man5/trace-cmd.dat.5.html>`__

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
