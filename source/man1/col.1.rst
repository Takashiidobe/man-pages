.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

col(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   COL(1)                        User Commands                       COL(1)

NAME
-------------------------------------------------

::

          col - filter reverse line feeds from input


---------------------------------------------------------

::

          col options


---------------------------------------------------------------

::

          col filters out reverse (and half-reverse) line feeds so the
          output is in the correct order, with only forward and
          half-forward line feeds. It also replaces any whitespace
          characters with tabs where possible. This can be useful in
          processing the output of nroff(1) and tbl(1).

          col reads from standard input and writes to standard output.


-------------------------------------------------------

::

          -b, --no-backspaces
              Do not output any backspaces, printing only the last
              character written to each column position.

          -f, --fine
              Permit half-forward line feeds. Normally characters destined
              for a half-line boundary are printed on the following line.

          -h, --tabs
              Output tabs instead of multiple spaces.

          -l, --lines number
              Buffer at least number lines in memory. By default, 128 lines
              are buffered.

          -p, --pass
              Force unknown control sequences to be passed through
              unchanged. Normally col will filter out any control sequences
              other than those recognized and interpreted by itself, which
              are listed below.

          -x, --spaces
              Output multiple spaces instead of tabs.

          -V, --version
              Display version information and exit.

          -H, --help
              Display help text and exit.


-------------------------------------------------------------------

::

          The col utility conforms to the Single UNIX Specification,
          Version 2. The -l option is an extension to the standard.


---------------------------------------------------

::

          The control sequences for carriage motion that col understands
          and their decimal values are listed in the following table:

          ESC-7
              reverse line feed (escape then 7)

          ESC-8
              half reverse line feed (escape then 8)

          ESC-9
              half forward line feed (escape then 9)

          backspace
              moves back one column (8); ignored in the first column

          newline
              forward line feed (10); also does carriage return

          carriage return
              (13)

          shift in
              shift to normal character set (15)

          shift out
              shift to alternate character set (14)

          space
              moves forward one column (32)

          tab
              moves forward to next tab stop (9)

          vertical tab
              reverse line feed (11)

          All unrecognized control characters and escape sequences are
          discarded.

          col keeps track of the character set as characters are read and
          makes sure the character set is correct when they are output.

          If the input attempts to back up to the last flushed line, col
          will display a warning message.


-------------------------------------------------------

::

          A col command appeared in Version 6 AT&T UNIX.


---------------------------------------------------------

::

          expand(1), nroff(1), tbl(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The col command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                         COL(1)

--------------

Pages that refer to this page: `colcrt(1) <../man1/colcrt.1.html>`__, 
`grotty(1) <../man1/grotty.1.html>`__

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
