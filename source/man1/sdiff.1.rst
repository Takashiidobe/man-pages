.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sdiff(1) — Linux manual page
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

   SDIFF(1)                      User Commands                     SDIFF(1)

NAME
-------------------------------------------------

::

          sdiff - side-by-side merge of file differences


---------------------------------------------------------

::

          sdiff [OPTION]... FILE1 FILE2


---------------------------------------------------------------

::

          Side-by-side merge of differences between FILE1 and FILE2.

          Mandatory arguments to long options are mandatory for short
          options too.

          -o, --output=FILE
                 operate interactively, sending output to FILE

          -i, --ignore-case
                 consider upper- and lower-case to be the same

          -E, --ignore-tab-expansion
                 ignore changes due to tab expansion

          -Z, --ignore-trailing-space
                 ignore white space at line end

          -b, --ignore-space-change
                 ignore changes in the amount of white space

          -W, --ignore-all-space
                 ignore all white space

          -B, --ignore-blank-lines
                 ignore changes whose lines are all blank

          -I, --ignore-matching-lines=RE
                 ignore changes all whose lines match RE

          --strip-trailing-cr
                 strip trailing carriage return on input

          -a, --text
                 treat all files as text

          -w, --width=NUM
                 output at most NUM (default 130) print columns

          -l, --left-column
                 output only the left column of common lines

          -s, --suppress-common-lines
                 do not output common lines

          -t, --expand-tabs
                 expand tabs to spaces in output

          --tabsize=NUM
                 tab stops at every NUM (default 8) print columns

          -d, --minimal
                 try hard to find a smaller set of changes

          -H, --speed-large-files
                 assume large files, many scattered small changes

          --diff-program=PROGRAM
                 use PROGRAM to compare files

          --help display this help and exit

          -v, --version
                 output version information and exit

          If a FILE is '-', read standard input.  Exit status is 0 if
          inputs are the same, 1 if different, 2 if trouble.


-----------------------------------------------------

::

          Written by Thomas Lord.


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

          cmp(1), diff(1), diff3(1)

          The full documentation for sdiff is maintained as a Texinfo
          manual.  If the info and sdiff programs are properly installed at
          your site, the command

                 info sdiff

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

   diffutils 3.8.20-b05f-dirty    August 2021                      SDIFF(1)

--------------

Pages that refer to this page: `cmp(1) <../man1/cmp.1.html>`__, 
`diff(1) <../man1/diff.1.html>`__,  `diff3(1) <../man1/diff3.1.html>`__

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
