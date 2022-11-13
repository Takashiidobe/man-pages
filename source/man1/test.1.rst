.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

test(1) — Linux manual page
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

   TEST(1)                       User Commands                      TEST(1)

NAME
-------------------------------------------------

::

          test - check file types and compare values


---------------------------------------------------------

::

          test EXPRESSION
          test
          [ EXPRESSION ]
          [ ]
          [ OPTION


---------------------------------------------------------------

::

          Exit with the status determined by EXPRESSION.

          --help display this help and exit

          --version
                 output version information and exit

          An omitted EXPRESSION defaults to false.  Otherwise, EXPRESSION
          is true or false and sets exit status.  It is one of:

          ( EXPRESSION )
                 EXPRESSION is true

          ! EXPRESSION
                 EXPRESSION is false

          EXPRESSION1 -a EXPRESSION2
                 both EXPRESSION1 and EXPRESSION2 are true

          EXPRESSION1 -o EXPRESSION2
                 either EXPRESSION1 or EXPRESSION2 is true

          -n STRING
                 the length of STRING is nonzero

          STRING equivalent to -n STRING

          -z STRING
                 the length of STRING is zero

          STRING1 = STRING2
                 the strings are equal

          STRING1 != STRING2
                 the strings are not equal

          INTEGER1 -eq INTEGER2
                 INTEGER1 is equal to INTEGER2

          INTEGER1 -ge INTEGER2
                 INTEGER1 is greater than or equal to INTEGER2

          INTEGER1 -gt INTEGER2
                 INTEGER1 is greater than INTEGER2

          INTEGER1 -le INTEGER2
                 INTEGER1 is less than or equal to INTEGER2

          INTEGER1 -lt INTEGER2
                 INTEGER1 is less than INTEGER2

          INTEGER1 -ne INTEGER2
                 INTEGER1 is not equal to INTEGER2

          FILE1 -ef FILE2
                 FILE1 and FILE2 have the same device and inode numbers

          FILE1 -nt FILE2
                 FILE1 is newer (modification date) than FILE2

          FILE1 -ot FILE2
                 FILE1 is older than FILE2

          -b FILE
                 FILE exists and is block special

          -c FILE
                 FILE exists and is character special

          -d FILE
                 FILE exists and is a directory

          -e FILE
                 FILE exists

          -f FILE
                 FILE exists and is a regular file

          -g FILE
                 FILE exists and is set-group-ID

          -G FILE
                 FILE exists and is owned by the effective group ID

          -h FILE
                 FILE exists and is a symbolic link (same as -L)

          -k FILE
                 FILE exists and has its sticky bit set

          -L FILE
                 FILE exists and is a symbolic link (same as -h)

          -N FILE
                 FILE exists and has been modified since it was last read

          -O FILE
                 FILE exists and is owned by the effective user ID

          -p FILE
                 FILE exists and is a named pipe

          -r FILE
                 FILE exists and read permission is granted

          -s FILE
                 FILE exists and has a size greater than zero

          -S FILE
                 FILE exists and is a socket

          -t FD  file descriptor FD is opened on a terminal

          -u FILE
                 FILE exists and its set-user-ID bit is set

          -w FILE
                 FILE exists and write permission is granted

          -x FILE
                 FILE exists and execute (or search) permission is granted

          Except for -h and -L, all FILE-related tests dereference symbolic
          links.  Beware that parentheses need to be escaped (e.g., by
          backslashes) for shells.  INTEGER may also be -l STRING, which
          evaluates to the length of STRING.

          NOTE: Binary -a and -o are inherently ambiguous.  Use 'test EXPR1
          && test EXPR2' or 'test EXPR1 || test EXPR2' instead.

          NOTE: [ honors the --help and --version options, but test does
          not.  test treats each of those as it treats any other nonempty
          STRING.

          NOTE: your shell may have its own version of test and/or [, which
          usually supersedes the version described here.  Please refer to
          your shell's documentation for details about the options it
          supports.


-----------------------------------------------------

::

          Written by Kevin Braunsdorf and Matthew Bradburn.


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

          Full documentation <https://www.gnu.org/software/coreutils/[>
          or available locally via: info '(coreutils) test invocation'

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

   GNU coreutils 8.32             March 2020                        TEST(1)

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
