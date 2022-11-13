.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sort(1) — Linux manual page
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

   SORT(1)                       User Commands                      SORT(1)

NAME
-------------------------------------------------

::

          sort - sort lines of text files


---------------------------------------------------------

::

          sort [OPTION]... [FILE]...
          sort [OPTION]... --files0-from=F


---------------------------------------------------------------

::

          Write sorted concatenation of all FILE(s) to standard output.

          With no FILE, or when FILE is -, read standard input.

          Mandatory arguments to long options are mandatory for short
          options too.  Ordering options:

          -b, --ignore-leading-blanks
                 ignore leading blanks

          -d, --dictionary-order
                 consider only blanks and alphanumeric characters

          -f, --ignore-case
                 fold lower case to upper case characters

          -g, --general-numeric-sort
                 compare according to general numerical value

          -i, --ignore-nonprinting
                 consider only printable characters

          -M, --month-sort
                 compare (unknown) < 'JAN' < ... < 'DEC'

          -h, --human-numeric-sort
                 compare human readable numbers (e.g., 2K 1G)

          -n, --numeric-sort
                 compare according to string numerical value

          -R, --random-sort
                 shuffle, but group identical keys.  See shuf(1)

          --random-source=FILE
                 get random bytes from FILE

          -r, --reverse
                 reverse the result of comparisons

          --sort=WORD
                 sort according to WORD: general-numeric -g, human-numeric
                 -h, month -M, numeric -n, random -R, version -V

          -V, --version-sort
                 natural sort of (version) numbers within text

          Other options:

          --batch-size=NMERGE
                 merge at most NMERGE inputs at once; for more use temp
                 files

          -c, --check, --check=diagnose-first
                 check for sorted input; do not sort

          -C, --check=quiet, --check=silent
                 like -c, but do not report first bad line

          --compress-program=PROG
                 compress temporaries with PROG; decompress them with PROG
                 -d

          --debug
                 annotate the part of the line used to sort, and warn about
                 questionable usage to stderr

          --files0-from=F
                 read input from the files specified by NUL-terminated
                 names in file F; If F is - then read names from standard
                 input

          -k, --key=KEYDEF
                 sort via a key; KEYDEF gives location and type

          -m, --merge
                 merge already sorted files; do not sort

          -o, --output=FILE
                 write result to FILE instead of standard output

          -s, --stable
                 stabilize sort by disabling last-resort comparison

          -S, --buffer-size=SIZE
                 use SIZE for main memory buffer

          -t, --field-separator=SEP
                 use SEP instead of non-blank to blank transition

          -T, --temporary-directory=DIR
                 use DIR for temporaries, not $TMPDIR or /tmp; multiple
                 options specify multiple directories

          --parallel=N
                 change the number of sorts run concurrently to N

          -u, --unique
                 with -c, check for strict ordering; without -c, output
                 only the first of an equal run

          -z, --zero-terminated
                 line delimiter is NUL, not newline

          --help display this help and exit

          --version
                 output version information and exit

          KEYDEF is F[.C][OPTS][,F[.C][OPTS]] for start and stop position,
          where F is a field number and C a character position in the
          field; both are origin 1, and the stop position defaults to the
          line's end.  If neither -t nor -b is in effect, characters in a
          field are counted from the beginning of the preceding whitespace.
          OPTS is one or more single-letter ordering options [bdfgiMhnRrV],
          which override global ordering options for that key.  If no key
          is given, use the entire line as the key.  Use --debug to
          diagnose incorrect key usage.

          SIZE may be followed by the following multiplicative suffixes: %
          1% of memory, b 1, K 1024 (default), and so on for M, G, T, P, E,
          Z, Y.

          *** WARNING *** The locale specified by the environment affects
          sort order.  Set LC_ALL=C to get the traditional sort order that
          uses native byte values.


-----------------------------------------------------

::

          Written by Mike Haertel and Paul Eggert.


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

          shuf(1), uniq(1)

          Full documentation <https://www.gnu.org/software/coreutils/sort>
          or available locally via: info '(coreutils) sort invocation'

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

   GNU coreutils 8.32             March 2020                        SORT(1)

--------------

Pages that refer to this page: `column(1) <../man1/column.1.html>`__, 
`grep(1) <../man1/grep.1.html>`__,  `look(1) <../man1/look.1.html>`__, 
`procps(1) <../man1/procps.1.html>`__,  `ps(1) <../man1/ps.1.html>`__, 
`uniq(1) <../man1/uniq.1.html>`__, 
`qsort(3) <../man3/qsort.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__

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
