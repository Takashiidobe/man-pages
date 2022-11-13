.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tail(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   TAIL(1)                       User Commands                      TAIL(1)

NAME
-------------------------------------------------

::

          tail - output the last part of files


---------------------------------------------------------

::

          tail [OPTION]... [FILE]...


---------------------------------------------------------------

::

          Print the last 10 lines of each FILE to standard output.  With
          more than one FILE, precede each with a header giving the file
          name.

          With no FILE, or when FILE is -, read standard input.

          Mandatory arguments to long options are mandatory for short
          options too.

          -c, --bytes=[+]NUM
                 output the last NUM bytes; or use -c +NUM to output
                 starting with byte NUM of each file

          -f, --follow[={name|descriptor}]
                 output appended data as the file grows;

                 an absent option argument means 'descriptor'

          -F     same as --follow=name --retry

          -n, --lines=[+]NUM
                 output the last NUM lines, instead of the last 10; or use
                 -n +NUM to output starting with line NUM

          --max-unchanged-stats=N
                 with --follow=name, reopen a FILE which has not

                 changed size after N (default 5) iterations to see if it
                 has been unlinked or renamed (this is the usual case of
                 rotated log files); with inotify, this option is rarely
                 useful

          --pid=PID
                 with -f, terminate after process ID, PID dies

          -q, --quiet, --silent
                 never output headers giving file names

          --retry
                 keep trying to open a file if it is inaccessible

          -s, --sleep-interval=N
                 with -f, sleep for approximately N seconds (default 1.0)
                 between iterations; with inotify and --pid=P, check
                 process P at least once every N seconds

          -v, --verbose
                 always output headers giving file names

          -z, --zero-terminated
                 line delimiter is NUL, not newline

          --help display this help and exit

          --version
                 output version information and exit

          NUM may have a multiplier suffix: b 512, kB 1000, K 1024, MB
          1000*1000, M 1024*1024, GB 1000*1000*1000, G 1024*1024*1024, and
          so on for T, P, E, Z, Y.  Binary prefixes can be used, too:
          KiB=K, MiB=M, and so on.

          With --follow (-f), tail defaults to following the file
          descriptor, which means that even if a tail'ed file is renamed,
          tail will continue to track its end.  This default behavior is
          not desirable when you really want to track the actual name of
          the file, not the file descriptor (e.g., log rotation).  Use
          --follow=name in that case.  That causes tail to track the named
          file in a way that accommodates renaming, removal and creation.


-----------------------------------------------------

::

          Written by Paul Rubin, David MacKenzie, Ian Lance Taylor, and Jim
          Meyering.


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

          head(1)

          Full documentation <https://www.gnu.org/software/coreutils/tail>
          or available locally via: info '(coreutils) tail invocation'

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

   GNU coreutils 8.32             March 2020                        TAIL(1)

--------------

Pages that refer to this page: `head(1) <../man1/head.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmdalogger(1) <../man1/pmdalogger.1.html>`__, 
`pmdasystemd(1) <../man1/pmdasystemd.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pon(1) <../man1/pon.1.html>`__

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
