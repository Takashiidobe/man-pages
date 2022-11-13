.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cmp(1) — Linux manual page
==========================

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

   CMP(1)                        User Commands                       CMP(1)

NAME
-------------------------------------------------

::

          cmp - compare two files byte by byte


---------------------------------------------------------

::

          cmp [OPTION]... FILE1 [FILE2 [SKIP1 [SKIP2]]]


---------------------------------------------------------------

::

          Compare two files byte by byte.

          The optional SKIP1 and SKIP2 specify the number of bytes to skip
          at the beginning of each file (zero by default).

          Mandatory arguments to long options are mandatory for short
          options too.

          -b, --print-bytes
                 print differing bytes

          -i, --ignore-initial=SKIP
                 skip first SKIP bytes of both inputs

          -i, --ignore-initial=SKIP1:SKIP2
                 skip first SKIP1 bytes of FILE1 and first SKIP2 bytes of
                 FILE2

          -l, --verbose
                 output byte numbers and differing byte values

          -n, --bytes=LIMIT
                 compare at most LIMIT bytes

          -s, --quiet, --silent
                 suppress all normal output

          --help display this help and exit

          -v, --version
                 output version information and exit

          SKIP values may be followed by the following multiplicative
          suffixes: kB 1000, K 1024, MB 1,000,000, M 1,048,576, GB
          1,000,000,000, G 1,073,741,824, and so on for T, P, E, Z, Y.

          If a FILE is '-' or missing, read standard input.  Exit status is
          0 if inputs are the same, 1 if different, 2 if trouble.


-----------------------------------------------------

::

          Written by Torbjörn Granlund and David MacKenzie.


---------------------------------------------------------------------

::

          Report bugs to: bug-diffutils@gnu.org
          GNU diffutils home page: <http://www.gnu.org/software/diffutils/>
          General help using GNU software: <https://www.gnu.org/gethelp/>


-----------------------------------------------------------

::

          Copyright © 2019 Free Software Foundation, Inc.  License GPLv3+:
          GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          diff(1), diff3(1), sdiff(1)

          The full documentation for cmp is maintained as a Texinfo manual.
          If the info and cmp programs are properly installed at your site,
          the command

                 info cmp

          should give you access to the complete manual.

COLOPHON
---------------------------------------------------------

::

          This page is part of the diffutils (GNU diff utilities) project.
          Information about the project can be found at 
          ⟨http://savannah.gnu.org/projects/diffutils/⟩.  If you have a bug
          report for this manual page, send it to bug-diffutils@gnu.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.savannah.gnu.org/diffutils.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-22.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   diffutils 3.8.20-b05f-dirty    August 2021                        CMP(1)

--------------

Pages that refer to this page: `diff(1) <../man1/diff.1.html>`__, 
`diff3(1) <../man1/diff3.1.html>`__, 
`grep(1) <../man1/grep.1.html>`__,  `sdiff(1) <../man1/sdiff.1.html>`__

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
