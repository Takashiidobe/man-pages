.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgfilter(1) — Linux manual page
================================

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

   MSGFILTER(1)                  User Commands                 MSGFILTER(1)

NAME
-------------------------------------------------

::

          msgfilter - edit translations of message catalog


---------------------------------------------------------

::

          msgfilter [OPTION] FILTER [FILTER-OPTION]


---------------------------------------------------------------

::

          Applies a filter to all translations of a translation catalog.

          Mandatory arguments to long options are mandatory for short
          options too.

      Input file location:
          -i, --input=INPUTFILE
                 input PO file

          -D, --directory=DIRECTORY
                 add DIRECTORY to list for input files search

          If no input file is given or if it is -, standard input is read.

      Output file location:
          -o, --output-file=FILE
                 write output to specified file

          The results are written to standard output if no output file is
          specified or if it is -.

          The FILTER can be any program that reads a translation from
          standard input and writes a modified translation to standard
          output.

      Filter input and output:
          --newline
                 add a newline at the end of input and remove a newline
                 from the end of output

      Useful FILTER-OPTIONs when the FILTER is 'sed':
          -e, --expression=SCRIPT
                 add SCRIPT to the commands to be executed

          -f, --file=SCRIPTFILE
                 add the contents of SCRIPTFILE to the commands to be
                 executed

          -n, --quiet, --silent
                 suppress automatic printing of pattern space

      Input file syntax:
          -P, --properties-input
                 input file is in Java .properties syntax

          --stringtable-input
                 input file is in NeXTstep/GNUstep .strings syntax

      Output details:
          --color
                 use colors and other text attributes always

          --color=WHEN
                 use colors and other text attributes if WHEN.  WHEN may be
                 'always', 'never', 'auto', or 'html'.

          --style=STYLEFILE
                 specify CSS style rule file for --color

          --no-escape
                 do not use C escapes in output (default)

          -E, --escape
                 use C escapes in output, no extended chars

          --force-po
                 write PO file even if empty

          --indent
                 indented output style

          --keep-header
                 keep header entry unmodified, don't filter it

          --no-location
                 suppress '#: filename:line' lines

          -n, --add-location
                 preserve '#: filename:line' lines (default)

          --strict
                 strict Uniforum output style

          -p, --properties-output
                 write out a Java .properties file

          --stringtable-output
                 write out a NeXTstep/GNUstep .strings file

          -w, --width=NUMBER
                 set output page width

          --no-wrap
                 do not break long message lines, longer than the output
                 page width, into several lines

          -s, --sort-output
                 generate sorted output

          -F, --sort-by-file
                 sort output by file location

      Informative output:
          -h, --help
                 display this help and exit

          -V, --version
                 output version information and exit


-----------------------------------------------------

::

          Written by Bruno Haible.


---------------------------------------------------------------------

::

          Report bugs in the bug tracker at
          <https://savannah.gnu.org/projects/gettext> or by email to
          <bug-gettext@gnu.org>.


-----------------------------------------------------------

::

          Copyright © 2001-2020 Free Software Foundation, Inc.  License
          GPLv3+: GNU GPL version 3 or later
          <https://gnu.org/licenses/gpl.html>
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          The full documentation for msgfilter is maintained as a Texinfo
          manual.  If the info and msgfilter programs are properly
          installed at your site, the command

                 info msgfilter

          should give you access to the complete manual.

COLOPHON
---------------------------------------------------------

::

          This page is part of the gettext (message translation) project.
          Information about the project can be found at 
          ⟨http://www.gnu.org/software/gettext/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://savannah.gnu.org/projects/gettext/⟩.  This page was
          obtained from the tarball gettext-0.21.tar.gz fetched from
          ⟨https://ftp.gnu.org/gnu/gettext/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU gettext-tools 20200704      July 2020                   MSGFILTER(1)

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
