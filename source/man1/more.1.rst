.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

more(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MORE(1)                       User Commands                      MORE(1)

NAME
-------------------------------------------------

::

          more - file perusal filter for crt viewing


---------------------------------------------------------

::

          more [options] file ...


---------------------------------------------------------------

::

          more is a filter for paging through text one screenful at a time.
          This version is especially primitive. Users should realize that
          less(1) provides more(1) emulation plus extensive enhancements.


-------------------------------------------------------

::

          Options are also taken from the environment variable MORE (make
          sure to precede them with a dash (-)) but command-line options
          will override those.

          -d, --silent
              Prompt with "[Press space to continue, 'q' to quit.]", and
              display "[Press 'h' for instructions.]" instead of ringing
              the bell when an illegal key is pressed.

          -l, --logical
              Do not pause after any line containing a ^L (form feed).

          -f, --no-pause
              Count logical lines, rather than screen lines (i.e., long
              lines are not folded).

          -p, --print-over
              Do not scroll. Instead, clear the whole screen and then
              display the text. Notice that this option is switched on
              automatically if the executable is named page.

          -c, --clean-print
              Do not scroll. Instead, paint each screen from the top,
              clearing the remainder of each line as it is displayed.

          -s, --squeeze
              Squeeze multiple blank lines into one.

          -u, --plain
              Suppress underlining. This option is silently ignored as
              backwards compatibility.

          -n, --lines number
              Specify the number of lines per screenful. The number
              argument is a positive decimal integer. The --lines option
              shall override any values obtained from any other source,
              such as number of lines reported by terminal.

          -number
              A numeric option means the same as --lines option argument.

          +number
              Start displaying each file at line number.

          +/string
              The string to be searched in each file before starting to
              display it.

          --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------

::

          Interactive commands for more are based on vi(1). Some commands
          may be preceded by a decimal number, called k in the descriptions
          below. In the following descriptions, ^X means control-X.

          h or ?
              Help; display a summary of these commands. If you forget all
              other commands, remember this one.

          SPACE
              Display next k lines of text. Defaults to current screen
              size.

          z
              Display next k lines of text. Defaults to current screen
              size. Argument becomes new default.

          RETURN
              Display next k lines of text. Defaults to 1. Argument becomes
              new default.

          d or ^D
              Scroll k lines. Default is current scroll size, initially 11.
              Argument becomes new default.

          q or Q or INTERRUPT
              Exit.

          s
              Skip forward k lines of text. Defaults to 1.

          f
              Skip forward k screenfuls of text. Defaults to 1.

          b or ^B
              Skip backwards k screenfuls of text. Defaults to 1. Only
              works with files, not pipes.

          '
              Go to the place where the last search started.

          =
              Display current line number.

          /pattern
              Search for kth occurrence of regular expression. Defaults to
              1.

          n
              Search for kth occurrence of last regular expression.
              Defaults to 1.

          !command or :!command
              Execute command in a subshell.

          v
              Start up an editor at current line. The editor is taken from
              the environment variable VISUAL if defined, or EDITOR if
              VISUAL is not defined, or defaults to vi(1) if neither VISUAL
              nor EDITOR is defined.

          ^L
              Redraw screen.

          :n
              Go to kth next file. Defaults to 1.

          :p
              Go to kth previous file. Defaults to 1.

          :f
              Display current file name and line number.

          .
              Repeat previous command.


---------------------------------------------------------------

::

          The more command respects the following environment variables, if
          they exist:

          MORE
              This variable may be set with favored options to more.

          SHELL
              Current shell in use (normally set by the shell at login
              time).

          TERM
              The terminal type used by more to get the terminal
              characteristics necessary to manipulate the screen.

          VISUAL
              The editor the user prefers. Invoked when command key v is
              pressed.

          EDITOR
              The editor of choice when VISUAL is not specified.


-------------------------------------------------------

::

          The more command appeared in 3.0BSD. This man page documents more
          version 5.19 (Berkeley 6/29/88), which is currently in use in the
          Linux community. Documentation was produced using several other
          versions of the man page, and extensive inspection of the source
          code.


-------------------------------------------------------

::

          Eric Shienbrood, UC Berkeley.

          Modified by Geoff Peck, UCB to add underlining, single spacing.

          Modified by John Foderaro, UCB to add -c and MORE environment
          variable.


---------------------------------------------------------

::

          less(1), vi(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The more command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                        MORE(1)

--------------

Pages that refer to this page: `colcrt(1) <../man1/colcrt.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`grotty(1) <../man1/grotty.1.html>`__, 
`homectl(1) <../man1/homectl.1.html>`__, 
`journalctl(1) <../man1/journalctl.1.html>`__, 
`less(1) <../man1/less.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`loginctl(1) <../man1/loginctl.1.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`more(1) <../man1/more.1.html>`__, 
`nroff(1) <../man1/nroff.1.html>`__, 
`portablectl(1) <../man1/portablectl.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-analyze(1) <../man1/systemd-analyze.1.html>`__, 
`systemd-inhibit(1) <../man1/systemd-inhibit.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`systemd-tmpfiles(8) <../man8/systemd-tmpfiles.8.html>`__

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
