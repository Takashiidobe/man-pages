.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

scriptlive(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCRIPTLIVE(1)                 User Commands                SCRIPTLIVE(1)

NAME
-------------------------------------------------

::

          scriptlive - re-run session typescripts, using timing information


---------------------------------------------------------

::

          scriptlive [options] [-t] timingfile [-I|-B] typescript


---------------------------------------------------------------

::

          This program re-runs a typescript, using stdin typescript and
          timing information to ensure that input happens in the same
          rhythm as it originally appeared when the script was recorded.

          The session is executed in a newly created pseudoterminal with
          the user’s $SHELL (or defaults to /bin/bash).

          Be careful! Do not forget that the typescript may contains
          arbitrary commands. It is recommended to use "scriptreplay
          --stream in --log-in typescript" (or with --log-io instead of
          --log-in) to verify the typescript before it is executed by
          scriptlive.

          The timing information is what script1 outputs to file specified
          by --log-timing. The typescript has to contain stdin information
          and it is what script1 outputs to file specified by --log-in or
          --log-io.


-------------------------------------------------------

::

          -I, --log-in file
              File containing script’s terminal input.

          -B, --log-io file
              File containing script’s terminal output and input.

          -t, --timing file
              File containing script’s timing output. This option overrides
              old-style arguments.

          -T, --log-timing file
              Aliased to -t, maintained for compatibility with script(1)
              command-line options.

          -d, --divisor number
              Speed up the replay displaying this number of times. The
              argument is a floating-point number. It’s called divisor
              because it divides the timings by this factor. This option
              overrides old-style arguments.

          -m, --maxdelay number
              Set the maximum delay between updates to number of seconds.
              The argument is a floating-point number. This can be used to
              avoid long pauses in the typescript replay.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------

::

              % script --log-timing file.tm --log-in script.in
              Script started, file is script.out
              % date
              <etc, etc>
              % exit
              Script done, file is script.out
              % scriptlive --log-timing file.tm --log-in script.in


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>


-----------------------------------------------------------

::

          Copyright © 2019 Karel Zak

          This is free software; see the source for copying conditions.
          There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR
          A PARTICULAR PURPOSE.

          Released under the GNU General Public License version 2 or later.


---------------------------------------------------------

::

          script(1), scriptreplay(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The scriptlive command is part of the util-linux package which
          can be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-28                  SCRIPTLIVE(1)

--------------

Pages that refer to this page: `script(1) <../man1/script.1.html>`__, 
`scriptreplay(1) <../man1/scriptreplay.1.html>`__

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
