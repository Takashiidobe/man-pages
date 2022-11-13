.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

timeout(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIMEOUT(1)                    User Commands                   TIMEOUT(1)

NAME
-------------------------------------------------

::

          timeout - run a command with a time limit


---------------------------------------------------------

::

          timeout [OPTION] DURATION COMMAND [ARG]...
          timeout [OPTION]


---------------------------------------------------------------

::

          Start COMMAND, and kill it if still running after DURATION.

          Mandatory arguments to long options are mandatory for short
          options too.

          --preserve-status

                 exit with the same status as COMMAND, even when the

                 command times out

          --foreground

                 when not running timeout directly from a shell prompt,

                 allow COMMAND to read from the TTY and get TTY signals; in
                 this mode, children of COMMAND will not be timed out

          -k, --kill-after=DURATION

                 also send a KILL signal if COMMAND is still running

                 this long after the initial signal was sent

          -s, --signal=SIGNAL

                 specify the signal to be sent on timeout;

                 SIGNAL may be a name like 'HUP' or a number; see 'kill -l'
                 for a list of signals

          -v, --verbose
                 diagnose to stderr any signal sent upon timeout

          --help display this help and exit

          --version
                 output version information and exit

          DURATION is a floating point number with an optional suffix: 's'
          for seconds (the default), 'm' for minutes, 'h' for hours or 'd'
          for days.  A duration of 0 disables the associated timeout.

          If the command times out, and --preserve-status is not set, then
          exit with status 124.  Otherwise, exit with the status of
          COMMAND.  If no signal is specified, send the TERM signal upon
          timeout.  The TERM signal kills any process that does not block
          or catch that signal.  It may be necessary to use the KILL (9)
          signal, since this signal cannot be caught, in which case the
          exit status is 128+9 rather than 124.


-------------------------------------------------

::

          Some platforms don't currently support timeouts beyond the year
          2038.


-----------------------------------------------------

::

          Written by Padraig Brady.


---------------------------------------------------------------------

::

          GNU coreutils online help:
          <https://www.gnu.org/software/coreutils/>
          Report any translation bugs to
          <https://translationproject.org/team/>


-----------------------------------------------------------

::

          Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+:
          GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          kill(1)

          Full documentation
          <https://www.gnu.org/software/coreutils/timeout>
          or available locally via: info '(coreutils) timeout invocation'

COLOPHON
---------------------------------------------------------

::

          This page is part of the coreutils (basic file, shell and text
          manipulation utilities) project.  Information about the project
          can be found at ⟨http://www.gnu.org/software/coreutils/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://www.gnu.org/software/coreutils/⟩.  This page was obtained
          from the tarball coreutils-8.32.tar.xz fetched from
          ⟨http://ftp.gnu.org/gnu/coreutils/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU coreutils 8.32             March 2020                     TIMEOUT(1)

--------------

Pages that refer to this page: `time(7) <../man7/time.7.html>`__

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
