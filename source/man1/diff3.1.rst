.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

diff3(1) — Linux manual page
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

   DIFF3(1)                      User Commands                     DIFF3(1)

NAME
-------------------------------------------------

::

          diff3 - compare three files line by line


---------------------------------------------------------

::

          diff3 [OPTION]... MYFILE OLDFILE YOURFILE


---------------------------------------------------------------

::

          Compare three files line by line.

          Mandatory arguments to long options are mandatory for short
          options too.

          -A, --show-all
                 output all changes, bracketing conflicts

          -e, --ed
                 output ed script incorporating changes from OLDFILE to
                 YOURFILE into MYFILE

          -E, --show-overlap
                 like -e, but bracket conflicts

          -3, --easy-only
                 like -e, but incorporate only nonoverlapping changes

          -x, --overlap-only
                 like -e, but incorporate only overlapping changes

          -X     like -x, but bracket conflicts

          -i     append 'w' and 'q' commands to ed scripts

          -m, --merge
                 output actual merged file, according to -A if no other
                 options are given

          -a, --text
                 treat all files as text

          --strip-trailing-cr
                 strip trailing carriage return on input

          -T, --initial-tab
                 make tabs line up by prepending a tab

          --diff-program=PROGRAM
                 use PROGRAM to compare files

          -L, --label=LABEL
                 use LABEL instead of file name (can be repeated up to
                 three times)

          --help display this help and exit

          -v, --version
                 output version information and exit

          The default output format is a somewhat human-readable
          representation of the changes.

          The -e, -E, -x, -X (and corresponding long) options cause an ed
          script to be output instead of the default.

          Finally, the -m (--merge) option causes diff3 to do the merge
          internally and output the actual merged file.  For unusual input,
          this is more robust than using ed.

          If a FILE is '-', read standard input.  Exit status is 0 if
          successful, 1 if conflicts, 2 if trouble.


-----------------------------------------------------

::

          Written by Randy Smith.


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

          cmp(1), diff(1), sdiff(1)

          The full documentation for diff3 is maintained as a Texinfo
          manual.  If the info and diff3 programs are properly installed at
          your site, the command

                 info diff3

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

   diffutils 3.8.20-b05f-dirty    August 2021                      DIFF3(1)

--------------

Pages that refer to this page: `cmp(1) <../man1/cmp.1.html>`__, 
`diff(1) <../man1/diff.1.html>`__, 
`patch(1) <../man1/patch.1.html>`__, 
`sdiff(1) <../man1/sdiff.1.html>`__

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
