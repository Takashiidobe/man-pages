.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

od(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   OD(1)                         User Commands                        OD(1)

NAME
-------------------------------------------------

::

          od - dump files in octal and other formats


---------------------------------------------------------

::

          od [OPTION]... [FILE]...
          od [-abcdfilosx]... [FILE] [[+]OFFSET[.][b]]
          od --traditional [OPTION]... [FILE] [[+]OFFSET[.][b]
          [+][LABEL][.][b]]


---------------------------------------------------------------

::

          Write an unambiguous representation, octal bytes by default, of
          FILE to standard output.  With more than one FILE argument,
          concatenate them in the listed order to form the input.

          With no FILE, or when FILE is -, read standard input.

          If first and second call formats both apply, the second format is
          assumed if the last operand begins with + or (if there are 2
          operands) a digit.  An OFFSET operand means -j OFFSET.  LABEL is
          the pseudo-address at first byte printed, incremented when dump
          is progressing.  For OFFSET and LABEL, a 0x or 0X prefix
          indicates hexadecimal; suffixes may be . for octal and b for
          multiply by 512.

          Mandatory arguments to long options are mandatory for short
          options too.

          -A, --address-radix=RADIX
                 output format for file offsets; RADIX is one of [doxn],
                 for Decimal, Octal, Hex or None

          --endian={big|little}
                 swap input bytes according the specified order

          -j, --skip-bytes=BYTES
                 skip BYTES input bytes first

          -N, --read-bytes=BYTES
                 limit dump to BYTES input bytes

          -S BYTES, --strings[=BYTES]
                 output strings of at least BYTES graphic chars; 3 is
                 implied when BYTES is not specified

          -t, --format=TYPE
                 select output format or formats

          -v, --output-duplicates
                 do not use * to mark line suppression

          -w[BYTES], --width[=BYTES]
                 output BYTES bytes per output line; 32 is implied when
                 BYTES is not specified

          --traditional
                 accept arguments in third form above

          --help display this help and exit

          --version
                 output version information and exit

      Traditional format specifications may be intermixed; they accumulate:
          -a     same as -t a,  select named characters, ignoring
                 high-order bit

          -b     same as -t o1, select octal bytes

          -c     same as -t c,  select printable characters or backslash
                 escapes

          -d     same as -t u2, select unsigned decimal 2-byte units

          -f     same as -t fF, select floats

          -i     same as -t dI, select decimal ints

          -l     same as -t dL, select decimal longs

          -o     same as -t o2, select octal 2-byte units

          -s     same as -t d2, select decimal 2-byte units

          -x     same as -t x2, select hexadecimal 2-byte units

      TYPE is made up of one or more of these specifications:
          a      named character, ignoring high-order bit

          c      printable character or backslash escape

          d[SIZE]
                 signed decimal, SIZE bytes per integer

          f[SIZE]
                 floating point, SIZE bytes per float

          o[SIZE]
                 octal, SIZE bytes per integer

          u[SIZE]
                 unsigned decimal, SIZE bytes per integer

          x[SIZE]
                 hexadecimal, SIZE bytes per integer

          SIZE is a number.  For TYPE in [doux], SIZE may also be C for
          sizeof(char), S for sizeof(short), I for sizeof(int) or L for
          sizeof(long).  If TYPE is f, SIZE may also be F for
          sizeof(float), D for sizeof(double) or L for sizeof(long double).

          Adding a z suffix to any type displays printable characters at
          the end of each output line.

      BYTES is hex with 0x or 0X prefix, and may have a multiplier suffix:
          b      512

          KB     1000

          K      1024

          MB     1000*1000

          M      1024*1024

          and so on for G, T, P, E, Z, Y.  Binary prefixes can be used,
          too: KiB=K, MiB=M, and so on.


---------------------------------------------------------

::

          od -A x -t x1z -v
                 Display hexdump format output

          od -A o -t oS -w16
                 The default output format used by od


-----------------------------------------------------

::

          Written by Jim Meyering.


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

          Full documentation <https://www.gnu.org/software/coreutils/od>
          or available locally via: info '(coreutils) od invocation'

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

   GNU coreutils 8.32             March 2020                          OD(1)

--------------

Pages that refer to this page: `scr_dump(5) <../man5/scr_dump.5.html>`__

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
