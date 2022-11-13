.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tr(1) — Linux manual page
=========================

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

   TR(1)                         User Commands                        TR(1)

NAME
-------------------------------------------------

::

          tr - translate or delete characters


---------------------------------------------------------

::

          tr [OPTION]... SET1 [SET2]


---------------------------------------------------------------

::

          Translate, squeeze, and/or delete characters from standard input,
          writing to standard output.

          -c, -C, --complement
                 use the complement of SET1

          -d, --delete
                 delete characters in SET1, do not translate

          -s, --squeeze-repeats
                 replace each sequence of a repeated character that is
                 listed in the last specified SET, with a single occurrence
                 of that character

          -t, --truncate-set1
                 first truncate SET1 to length of SET2

          --help display this help and exit

          --version
                 output version information and exit

          SETs are specified as strings of characters.  Most represent
          themselves.  Interpreted sequences are:

          \NNN   character with octal value NNN (1 to 3 octal digits)

          \\     backslash

          \a     audible BEL

          \b     backspace

          \f     form feed

          \n     new line

          \r     return

          \t     horizontal tab

          \v     vertical tab

          CHAR1-CHAR2
                 all characters from CHAR1 to CHAR2 in ascending order

          [CHAR*]
                 in SET2, copies of CHAR until length of SET1

          [CHAR*REPEAT]
                 REPEAT copies of CHAR, REPEAT octal if starting with 0

          [:alnum:]
                 all letters and digits

          [:alpha:]
                 all letters

          [:blank:]
                 all horizontal whitespace

          [:cntrl:]
                 all control characters

          [:digit:]
                 all digits

          [:graph:]
                 all printable characters, not including space

          [:lower:]
                 all lower case letters

          [:print:]
                 all printable characters, including space

          [:punct:]
                 all punctuation characters

          [:space:]
                 all horizontal or vertical whitespace

          [:upper:]
                 all upper case letters

          [:xdigit:]
                 all hexadecimal digits

          [=CHAR=]
                 all characters which are equivalent to CHAR

          Translation occurs if -d is not given and both SET1 and SET2
          appear.  -t may be used only when translating.  SET2 is extended
          to length of SET1 by repeating its last character as necessary.
          Excess characters of SET2 are ignored.  Only [:lower:] and
          [:upper:] are guaranteed to expand in ascending order; used in
          SET2 while translating, they may only be used in pairs to specify
          case conversion.  -s uses the last specified SET, and occurs
          after translation or deletion.


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

          Full documentation <https://www.gnu.org/software/coreutils/tr>
          or available locally via: info '(coreutils) tr invocation'

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

   GNU coreutils 8.32             March 2020                          TR(1)

--------------

Pages that refer to this page: `sed(1) <../man1/sed.1.html>`__, 
`proc(5) <../man5/proc.5.html>`__

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
