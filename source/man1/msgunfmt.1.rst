.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgunfmt(1) — Linux manual page
===============================

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

   MSGUNFMT(1)                   User Commands                  MSGUNFMT(1)

NAME
-------------------------------------------------

::

          msgunfmt - uncompile message catalog from binary format


---------------------------------------------------------

::

          msgunfmt [OPTION] [FILE]...


---------------------------------------------------------------

::

          Convert binary message catalog to Uniforum style .po file.

          Mandatory arguments to long options are mandatory for short
          options too.

      Operation mode:
          -j, --java
                 Java mode: input is a Java ResourceBundle class

          --csharp
                 C# mode: input is a .NET .dll file

          --csharp-resources
                 C# resources mode: input is a .NET .resources file

          --tcl  Tcl mode: input is a tcl/msgcat .msg file

      Input file location:
          FILE ...
                 input .mo files

          If no input file is given or if it is -, standard input is read.

      Input file location in Java mode:
          -r, --resource=RESOURCE
                 resource name

          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          The class name is determined by appending the locale name to the
          resource name, separated with an underscore.  The class is
          located using the CLASSPATH.

      Input file location in C# mode:
          -r, --resource=RESOURCE
                 resource name

          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -d DIRECTORY
                 base directory for locale dependent .dll files

          The -l and -d options are mandatory.  The .dll file is located in
          a subdirectory of the specified directory whose name depends on
          the locale.

      Input file location in Tcl mode:
          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -d DIRECTORY
                 base directory of .msg message catalogs

          The -l and -d options are mandatory.  The .msg file is located in
          the specified directory.

      Output file location:
          -o, --output-file=FILE
                 write output to specified file

          The results are written to standard output if no output file is
          specified or if it is -.

      Output details:
          --color
                 use colors and other text attributes always

          --color=WHEN
                 use colors and other text attributes if WHEN.  WHEN may be
                 'always', 'never', 'auto', or 'html'.

          --style=STYLEFILE
                 specify CSS style rule file for --color

          -e, --no-escape
                 do not use C escapes in output (default)

          -E, --escape
                 use C escapes in output, no extended chars

          --force-po
                 write PO file even if empty

          -i, --indent
                 write indented output style

          --strict
                 write strict uniforum style

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

      Informative output:
          -h, --help
                 display this help and exit

          -V, --version
                 output version information and exit

          -v, --verbose
                 increase verbosity level


-----------------------------------------------------

::

          Written by Ulrich Drepper.


---------------------------------------------------------------------

::

          Report bugs in the bug tracker at
          <https://savannah.gnu.org/projects/gettext> or by email to
          <bug-gettext@gnu.org>.


-----------------------------------------------------------

::

          Copyright © 1995-2020 Free Software Foundation, Inc.  License
          GPLv3+: GNU GPL version 3 or later
          <https://gnu.org/licenses/gpl.html>
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          The full documentation for msgunfmt is maintained as a Texinfo
          manual.  If the info and msgunfmt programs are properly installed
          at your site, the command

                 info msgunfmt

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

   GNU gettext-tools 20200704      July 2020                    MSGUNFMT(1)

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
