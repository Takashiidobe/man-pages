.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

basenc(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENCODINGS                        |                                   |
| EXAMPLES <#ENCODINGS_EXAMPLES>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BASENC(1)                     User Commands                    BASENC(1)

NAME
-------------------------------------------------

::

          basenc - Encode/decode data and print to standard output


---------------------------------------------------------

::

          basenc [OPTION]... [FILE]


---------------------------------------------------------------

::

          basenc encode or decode FILE, or standard input, to standard
          output.

          With no FILE, or when FILE is -, read standard input.

          Mandatory arguments to long options are mandatory for short
          options too.

          --base64
                 same as 'base64' program (RFC4648 section 4)

          --base64url
                 file- and url-safe base64 (RFC4648 section 5)

          --base32
                 same as 'base32' program (RFC4648 section 6)

          --base32hex
                 extended hex alphabet base32 (RFC4648 section 7)

          --base16
                 hex encoding (RFC4648 section 8)

          --base2msbf
                 bit string with most significant bit (msb) first

          --base2lsbf
                 bit string with least significant bit (lsb) first

          -d, --decode
                 decode data

          -i, --ignore-garbage
                 when decoding, ignore non-alphabet characters

          -w, --wrap=COLS
                 wrap encoded lines after COLS character (default 76).  Use
                 0 to disable line wrapping

          --z85  ascii85-like encoding (ZeroMQ spec:32/Z85); when encoding,
                 input length must be a multiple of 4; when decoding, input
                 length must be a multiple of 5

          --help display this help and exit

          --version
                 output version information and exit

          When decoding, the input may contain newlines in addition to the
          bytes of the formal alphabet.  Use --ignore-garbage to attempt to
          recover from any other non-alphabet bytes in the encoded stream.


-----------------------------------------------------------------------------

::

                 $ printf '\376\117\202' | basenc --base64
                 /k+C

                 $ printf '\376\117\202' | basenc --base64url
                 _k-C

                 $ printf '\376\117\202' | basenc --base32
                 7ZHYE===

                 $ printf '\376\117\202' | basenc --base32hex
                 VP7O4===

                 $ printf '\376\117\202' | basenc --base16
                 FE4F82

                 $ printf '\376\117\202' | basenc --base2lsbf
                 011111111111001001000001

                 $ printf '\376\117\202' | basenc --base2msbf
                 111111100100111110000010

                 $ printf '\376\117\202\000' | basenc --z85
                 @.FaC


-----------------------------------------------------

::

          Written by Simon Josefsson and Assaf Gordon.


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

          Full documentation
          <https://www.gnu.org/software/coreutils/basenc>
          or available locally via: info '(coreutils) basenc invocation'

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

   GNU coreutils 8.32             March 2020                      BASENC(1)

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
