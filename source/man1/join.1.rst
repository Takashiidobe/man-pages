.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

join(1) — Linux manual page
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

   JOIN(1)                       User Commands                      JOIN(1)

NAME
-------------------------------------------------

::

          join - join lines of two files on a common field


---------------------------------------------------------

::

          join [OPTION]... FILE1 FILE2


---------------------------------------------------------------

::

          For each pair of input lines with identical join fields, write a
          line to standard output.  The default join field is the first,
          delimited by blanks.

          When FILE1 or FILE2 (not both) is -, read standard input.

          -a FILENUM
                 also print unpairable lines from file FILENUM, where
                 FILENUM is 1 or 2, corresponding to FILE1 or FILE2

          -e EMPTY
                 replace missing input fields with EMPTY

          -i, --ignore-case
                 ignore differences in case when comparing fields

          -j FIELD
                 equivalent to '-1 FIELD -2 FIELD'

          -o FORMAT
                 obey FORMAT while constructing output line

          -t CHAR
                 use CHAR as input and output field separator

          -v FILENUM
                 like -a FILENUM, but suppress joined output lines

          -1 FIELD
                 join on this FIELD of file 1

          -2 FIELD
                 join on this FIELD of file 2

          --check-order
                 check that the input is correctly sorted, even if all
                 input lines are pairable

          --nocheck-order
                 do not check that the input is correctly sorted

          --header
                 treat the first line in each file as field headers, print
                 them without trying to pair them

          -z, --zero-terminated
                 line delimiter is NUL, not newline

          --help display this help and exit

          --version
                 output version information and exit

          Unless -t CHAR is given, leading blanks separate fields and are
          ignored, else fields are separated by CHAR.  Any FIELD is a field
          number counted from 1.  FORMAT is one or more comma or blank
          separated specifications, each being 'FILENUM.FIELD' or '0'.
          Default FORMAT outputs the join field, the remaining fields from
          FILE1, the remaining fields from FILE2, all separated by CHAR.
          If FORMAT is the keyword 'auto', then the first line of each file
          determines the number of fields output for each line.

          Important: FILE1 and FILE2 must be sorted on the join fields.
          E.g., use "sort -k 1b,1" if 'join' has no options, or use "join
          -t ''" if 'sort' has no options.  Note, comparisons honor the
          rules specified by 'LC_COLLATE'.  If the input is not sorted and
          some lines cannot be joined, a warning message will be given.


-----------------------------------------------------

::

          Written by Mike Haertel.


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

          comm(1), uniq(1)

          Full documentation <https://www.gnu.org/software/coreutils/join>
          or available locally via: info '(coreutils) join invocation'

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

   GNU coreutils 8.32             March 2020                        JOIN(1)

--------------

Pages that refer to this page: `comm(1) <../man1/comm.1.html>`__, 
`uniq(1) <../man1/uniq.1.html>`__

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
