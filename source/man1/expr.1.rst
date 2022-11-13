.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

expr(1) — Linux manual page
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

   EXPR(1)                       User Commands                      EXPR(1)

NAME
-------------------------------------------------

::

          expr - evaluate expressions


---------------------------------------------------------

::

          expr EXPRESSION
          expr OPTION


---------------------------------------------------------------

::

          --help display this help and exit

          --version
                 output version information and exit

          Print the value of EXPRESSION to standard output.  A blank line
          below separates increasing precedence groups.  EXPRESSION may be:

          ARG1 | ARG2
                 ARG1 if it is neither null nor 0, otherwise ARG2

          ARG1 & ARG2
                 ARG1 if neither argument is null or 0, otherwise 0

          ARG1 < ARG2
                 ARG1 is less than ARG2

          ARG1 <= ARG2
                 ARG1 is less than or equal to ARG2

          ARG1 = ARG2
                 ARG1 is equal to ARG2

          ARG1 != ARG2
                 ARG1 is unequal to ARG2

          ARG1 >= ARG2
                 ARG1 is greater than or equal to ARG2

          ARG1 > ARG2
                 ARG1 is greater than ARG2

          ARG1 + ARG2
                 arithmetic sum of ARG1 and ARG2

          ARG1 - ARG2
                 arithmetic difference of ARG1 and ARG2

          ARG1 * ARG2
                 arithmetic product of ARG1 and ARG2

          ARG1 / ARG2
                 arithmetic quotient of ARG1 divided by ARG2

          ARG1 % ARG2
                 arithmetic remainder of ARG1 divided by ARG2

          STRING : REGEXP
                 anchored pattern match of REGEXP in STRING

          match STRING REGEXP
                 same as STRING : REGEXP

          substr STRING POS LENGTH
                 substring of STRING, POS counted from 1

          index STRING CHARS
                 index in STRING where any CHARS is found, or 0

          length STRING
                 length of STRING

          + TOKEN
                 interpret TOKEN as a string, even if it is a

                 keyword like 'match' or an operator like '/'

          ( EXPRESSION )
                 value of EXPRESSION

          Beware that many operators need to be escaped or quoted for
          shells.  Comparisons are arithmetic if both ARGs are numbers,
          else lexicographical.  Pattern matches return the string matched
          between \( and \) or null; if \( and \) are not used, they return
          the number of characters matched or 0.

          Exit status is 0 if EXPRESSION is neither null nor 0, 1 if
          EXPRESSION is null or 0, 2 if EXPRESSION is syntactically
          invalid, and 3 if an error occurred.


-----------------------------------------------------

::

          Written by Mike Parker, James Youngman, and Paul Eggert.


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

          Full documentation <https://www.gnu.org/software/coreutils/expr>
          or available locally via: info '(coreutils) expr invocation'

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

   GNU coreutils 8.32             March 2020                        EXPR(1)

--------------

Pages that refer to this page: `sysconf(3) <../man3/sysconf.3.html>`__

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
