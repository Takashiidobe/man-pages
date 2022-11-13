.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

watch(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WATCH(1)                      User Commands                     WATCH(1)

NAME
-------------------------------------------------

::

          watch - execute a program periodically, showing output fullscreen


---------------------------------------------------------

::

          watch [options] command


---------------------------------------------------------------

::

          watch runs command repeatedly, displaying its output and errors
          (the first screenfull).  This allows you to watch the program
          output change over time.  By default, command is run every 2
          seconds and watch will run until interrupted.


-------------------------------------------------------

::

          -d, --differences[=permanent]
                 Highlight the differences between successive updates. If
                 the optional permanent argument is specified then watch
                 will show all changes since the first iteration.

          -n, --interval seconds
                 Specify update interval.  The command will not allow
                 quicker than 0.1 second interval, in which the smaller
                 values are converted. Both '.' and ',' work for any
                 locales. The WATCH_INTERVAL environment can be used to
                 persistently set a non-default interval (following the
                 same rules and formatting).

          -p, --precise
                 Make watch attempt to run command every --interval
                 seconds.  Try it with ntptime (if present) and notice how
                 the fractional seconds stays (nearly) the same, as opposed
                 to normal mode where they continuously increase.

          -t, --no-title
                 Turn off the header showing the interval, command, and
                 current time at the top of the display, as well as the
                 following blank line.

          -b, --beep
                 Beep if command has a non-zero exit.

          -e, --errexit
                 Freeze updates on command error, and exit after a key
                 press.

          -g, --chgexit
                 Exit when the output of command changes.

          -c, --color
                 Interpret ANSI color and style sequences.

          -x, --exec
                 Pass command to exec(2) instead of sh -c which reduces the
                 need to use extra quoting to get the desired effect.

          -w, --no-linewrap
                 Turn off line wrapping. Long lines will be truncated
                 instead of wrapped to the next line.

          -h, --help
                 Display help text and exit.

          -v, --version
                 Display version information and exit.


---------------------------------------------------------------

::

                 0      Success.
                 1      Various failures.
                 2      Forking the process to watch failed.
                 3      Replacing child process stdout with write side pipe
                        failed.
                 4      Command execution failed.
                 5      Closing child process write pipe failed.
                 7      IPC pipe creation failed.
                 8      Getting child process return value with waitpid(2)
                        failed, or command exited up on error.
                 other  The watch will propagate command exit status as
                        child exit status.


---------------------------------------------------------------

::

          The behaviour of watch is affected by the following environment
          variables.

          WATCH_INTERVAL
                 Update interval, follows the same rules as the --interval
                 command line option.


---------------------------------------------------

::

          POSIX option processing is used (i.e., option processing stops at
          the first non-option argument).  This means that flags after
          command don't get interpreted by watch itself.


-------------------------------------------------

::

          Upon terminal resize, the screen will not be correctly repainted
          until the next scheduled update.  All --differences highlighting
          is lost on that update as well.

          Non-printing characters are stripped from program output.  Use
          cat -v as part of the command pipeline if you want to see them.

          Combining Characters that are supposed to display on the
          character at the last column on the screen may display one column
          early, or they may not display at all.

          Combining Characters never count as different in --differences
          mode.  Only the base character counts.

          Blank lines directly after a line which ends in the last column
          do not display.

          --precise mode doesn't yet have advanced temporal distortion
          technology to compensate for a command that takes more than
          --interval seconds to execute.  watch also can get into a state
          where it rapid-fires as many executions of command as it can to
          catch up from a previous executions running longer than
          --interval (for example, netstat taking ages on a DNS lookup).


---------------------------------------------------------

::

          To watch for mail, you might do
                 watch -n 60 from
          To watch the contents of a directory change, you could use
                 watch -d ls -l
          If you're only interested in files owned by user joe, you might
          use
                 watch -d 'ls -l | fgrep joe'
          To see the effects of quoting, try these out
                 watch echo $$
                 watch echo '$$'
                 watch echo "'"'$$'"'"
          To see the effect of precision time keeping, try adding -p to
                 watch -n 10 sleep 1
          You can watch for your administrator to install the latest kernel
          with
                 watch uname -r
          (Note that -p isn't guaranteed to work across reboots, especially
          in the face of ntpdate (if present) or other bootup time-changing
          mechanisms)

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

   procps-ng                      2020-12-06                       WATCH(1)

--------------

Pages that refer to this page: `lsblk(8) <../man8/lsblk.8.html>`__

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
