.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

split(1) — Linux manual page
============================

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

   SPLIT(1)                      User Commands                     SPLIT(1)

NAME
-------------------------------------------------

::

          split - split a file into pieces


---------------------------------------------------------

::

          split [OPTION]... [FILE [PREFIX]]


---------------------------------------------------------------

::

          Output pieces of FILE to PREFIXaa, PREFIXab, ...; default size is
          1000 lines, and default PREFIX is 'x'.

          With no FILE, or when FILE is -, read standard input.

          Mandatory arguments to long options are mandatory for short
          options too.

          -a, --suffix-length=N
                 generate suffixes of length N (default 2)

          --additional-suffix=SUFFIX
                 append an additional SUFFIX to file names

          -b, --bytes=SIZE
                 put SIZE bytes per output file

          -C, --line-bytes=SIZE
                 put at most SIZE bytes of records per output file

          -d     use numeric suffixes starting at 0, not alphabetic

          --numeric-suffixes[=FROM]
                 same as -d, but allow setting the start value

          -x     use hex suffixes starting at 0, not alphabetic

          --hex-suffixes[=FROM]
                 same as -x, but allow setting the start value

          -e, --elide-empty-files
                 do not generate empty output files with '-n'

          --filter=COMMAND
                 write to shell COMMAND; file name is $FILE

          -l, --lines=NUMBER
                 put NUMBER lines/records per output file

          -n, --number=CHUNKS
                 generate CHUNKS output files; see explanation below

          -t, --separator=SEP
                 use SEP instead of newline as the record separator; '\0'
                 (zero) specifies the NUL character

          -u, --unbuffered
                 immediately copy input to output with '-n r/...'

          --verbose
                 print a diagnostic just before each output file is opened

          --help display this help and exit

          --version
                 output version information and exit

          The SIZE argument is an integer and optional unit (example: 10K
          is 10*1024).  Units are K,M,G,T,P,E,Z,Y (powers of 1024) or
          KB,MB,... (powers of 1000).  Binary prefixes can be used, too:
          KiB=K, MiB=M, and so on.

      CHUNKS may be:
          N      split into N files based on size of input

          K/N    output Kth of N to stdout

          l/N    split into N files without splitting lines/records

          l/K/N  output Kth of N to stdout without splitting lines/records

          r/N    like 'l' but use round robin distribution

          r/K/N  likewise but only output Kth of N to stdout


-----------------------------------------------------

::

          Written by Torbjorn Granlund and Richard M. Stallman.


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

          Full documentation <https://www.gnu.org/software/coreutils/split>
          or available locally via: info '(coreutils) split invocation'

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

   GNU coreutils 8.32             March 2020                       SPLIT(1)

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
