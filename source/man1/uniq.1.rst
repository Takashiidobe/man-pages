.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uniq(1) — Linux manual page
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

   UNIQ(1)                       User Commands                      UNIQ(1)

NAME
-------------------------------------------------

::

          uniq - report or omit repeated lines


---------------------------------------------------------

::

          uniq [OPTION]... [INPUT [OUTPUT]]


---------------------------------------------------------------

::

          Filter adjacent matching lines from INPUT (or standard input),
          writing to OUTPUT (or standard output).

          With no options, matching lines are merged to the first
          occurrence.

          Mandatory arguments to long options are mandatory for short
          options too.

          -c, --count
                 prefix lines by the number of occurrences

          -d, --repeated
                 only print duplicate lines, one for each group

          -D     print all duplicate lines

          --all-repeated[=METHOD]
                 like -D, but allow separating groups with an empty line;
                 METHOD={none(default),prepend,separate}

          -f, --skip-fields=N
                 avoid comparing the first N fields

          --group[=METHOD]
                 show all items, separating groups with an empty line;
                 METHOD={separate(default),prepend,append,both}

          -i, --ignore-case
                 ignore differences in case when comparing

          -s, --skip-chars=N
                 avoid comparing the first N characters

          -u, --unique
                 only print unique lines

          -z, --zero-terminated
                 line delimiter is NUL, not newline

          -w, --check-chars=N
                 compare no more than N characters in lines

          --help display this help and exit

          --version
                 output version information and exit

          A field is a run of blanks (usually spaces and/or TABs), then
          non-blank characters.  Fields are skipped before chars.

          Note: 'uniq' does not detect repeated lines unless they are
          adjacent.  You may want to sort the input first, or use 'sort -u'
          without 'uniq'.


-----------------------------------------------------

::

          Written by Richard M. Stallman and David MacKenzie.


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

          comm(1), join(1), sort(1)

          Full documentation <https://www.gnu.org/software/coreutils/uniq>
          or available locally via: info '(coreutils) uniq invocation'

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

   GNU coreutils 8.32             March 2020                        UNIQ(1)

--------------

Pages that refer to this page: `comm(1) <../man1/comm.1.html>`__, 
`join(1) <../man1/join.1.html>`__,  `sort(1) <../man1/sort.1.html>`__

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
