.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

skill(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `PROCESS SELECTION OPTION         |                                   |
| S <#PROCESS_SELECTION_OPTIONS>`__ |                                   |
| \| `SIGNALS <#SIGNALS>`__ \|      |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SKILL(1)                      User Commands                     SKILL(1)

NAME
-------------------------------------------------

::

          skill, snice - send a signal or report process status


---------------------------------------------------------

::

          skill [signal] [options] expression
          snice [new priority] [options] expression


---------------------------------------------------------------

::

          These tools are obsolete and unportable.  The command syntax is
          poorly defined.  Consider using the killall, pkill, and pgrep
          commands instead.

          The default signal for skill is TERM.  Use -l or -L to list
          available signals.  Particularly useful signals include HUP, INT,
          KILL, STOP, CONT, and 0.  Alternate signals may be specified in
          three ways: -9 -SIGKILL -KILL.

          The default priority for snice is +4.  Priority numbers range
          from +20 (slowest) to -20 (fastest).  Negative priority numbers
          are restricted to administrative users.


-------------------------------------------------------

::

          -f, --fast
                 Fast mode.  This option has not been implemented.

          -i, --interactive
                 Interactive use.  You will be asked to approve each
                 action.

          -l, --list
                 List all signal names.

          -L, --table
                 List all signal names in a nice table.

          -n, --no-action
                 No action; perform a simulation of events that would occur
                 but do not actually change the system.

          -v, --verbose
                 Verbose; explain what is being done.

          -w, --warnings
                 Enable warnings.  This option has not been implemented.

          -h, --help
                 Display help text and exit.

          -V, --version
                 Display version information.


-------------------------------------------------------------------------------------------

::

          Selection criteria can be: terminal, user, pid, command.  The
          options below may be used to ensure correct interpretation.

          -t, --tty tty
                 The next expression is a terminal (tty or pty).

          -u, --user user
                 The next expression is a username.

          -p, --pid pid
                 The next expression is a process ID number.

          -c, --command command
                 The next expression is a command name.

          --ns pid
                 Match the processes that belong to the same namespace as
                 pid.

          --nslist ns,...
                 list which namespaces will be considered for the --ns
                 option.  Available namespaces: ipc, mnt, net, pid, user,
                 uts.


-------------------------------------------------------

::

          The behavior of signals is explained in signal(7) manual page.


---------------------------------------------------------

::

          snice -c seti -c crack +7
                 Slow down seti and crack commands.

          skill -KILL -t /dev/pts/*
                 Kill users on PTY devices.

          skill -STOP -u viro -u lm -u davem
                 Stop three users.


---------------------------------------------------------

::

          kill(1), kill(2), killall(1), nice(1), pkill(1), renice(1),
          signal(7)


-----------------------------------------------------------

::

          No standards apply.


-----------------------------------------------------

::

          Albert Cahalan ⟨albert@users.sf.net⟩ wrote skill and snice in
          1999 as a replacement for a non-free version.


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                      2018-05-31                       SKILL(1)

--------------

Pages that refer to this page:
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`pgrep(1) <../man1/pgrep.1.html>`__

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
