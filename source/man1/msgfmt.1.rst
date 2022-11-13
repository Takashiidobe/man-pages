.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgfmt(1) — Linux manual page
=============================

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

   MSGFMT(1)                     User Commands                    MSGFMT(1)

NAME
-------------------------------------------------

::

          msgfmt - compile message catalog to binary format


---------------------------------------------------------

::

          msgfmt [OPTION] filename.po ...


---------------------------------------------------------------

::

          Generate binary message catalog from textual translation
          description.

          Mandatory arguments to long options are mandatory for short
          options too.  Similarly for optional arguments.

      Input file location:
          filename.po ...
                 input files

          -D, --directory=DIRECTORY
                 add DIRECTORY to list for input files search

          If input file is -, standard input is read.

      Operation mode:
          -j, --java
                 Java mode: generate a Java ResourceBundle class

          --java2
                 like --java, and assume Java2 (JDK 1.2 or higher)

          --csharp
                 C# mode: generate a .NET .dll file

          --csharp-resources
                 C# resources mode: generate a .NET .resources file

          --tcl  Tcl mode: generate a tcl/msgcat .msg file

          --qt   Qt mode: generate a Qt .qm file

          --desktop
                 Desktop Entry mode: generate a .desktop file

          --xml  XML mode: generate XML file

      Output file location:
          -o, --output-file=FILE
                 write output to specified file

          --strict
                 enable strict Uniforum mode

          If output file is -, output is written to standard output.

      Output file location in Java mode:
          -r, --resource=RESOURCE
                 resource name

          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          --source
                 produce a .java file, instead of a .class file

          -d DIRECTORY
                 base directory of classes directory hierarchy

          The class name is determined by appending the locale name to the
          resource name, separated with an underscore.  The -d option is
          mandatory.  The class is written under the specified directory.

      Output file location in C# mode:
          -r, --resource=RESOURCE
                 resource name

          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -d DIRECTORY
                 base directory for locale dependent .dll files

          The -l and -d options are mandatory.  The .dll file is written in
          a subdirectory of the specified directory whose name depends on
          the locale.

      Output file location in Tcl mode:
          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -d DIRECTORY
                 base directory of .msg message catalogs

          The -l and -d options are mandatory.  The .msg file is written in
          the specified directory.

      Desktop Entry mode options:
          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -o, --output-file=FILE
                 write output to specified file

          --template=TEMPLATE
                 a .desktop file used as a template

          -d DIRECTORY
                 base directory of .po files

          -kWORD, --keyword=WORD
                 look for WORD as an additional keyword

          -k, --keyword
                 do not to use default keywords

          The -l, -o, and --template options are mandatory.  If -D is
          specified, input files are read from the directory instead of the
          command line arguments.

      XML mode options:
          -l, --locale=LOCALE
                 locale name, either language or language_COUNTRY

          -L, --language=NAME
                 recognise the specified XML language

          -o, --output-file=FILE
                 write output to specified file

          --template=TEMPLATE
                 an XML file used as a template

          -d DIRECTORY
                 base directory of .po files

          The -l, -o, and --template options are mandatory.  If -D is
          specified, input files are read from the directory instead of the
          command line arguments.

      Input file syntax:
          -P, --properties-input
                 input files are in Java .properties syntax

          --stringtable-input
                 input files are in NeXTstep/GNUstep .strings syntax

      Input file interpretation:
          -c, --check
                 perform all the checks implied by --check-format,
                 --check-header, --check-domain

          --check-format
                 check language dependent format strings

          --check-header
                 verify presence and contents of the header entry

          --check-domain
                 check for conflicts between domain directives and the
                 --output-file option

          -C, --check-compatibility
                 check that GNU msgfmt behaves like X/Open msgfmt

          --check-accelerators[=CHAR]
                 check presence of keyboard accelerators for menu items

          -f, --use-fuzzy
                 use fuzzy entries in output

      Output details:
          -a, --alignment=NUMBER
                 align strings to NUMBER bytes (default: 1)

          --endianness=BYTEORDER
                 write out 32-bit numbers in the given byte order (big or
                 little, default depends on platform)

          --no-hash
                 binary file will not include the hash table

      Informative output:
          -h, --help
                 display this help and exit

          -V, --version
                 output version information and exit

          --statistics
                 print statistics about translations

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

          The full documentation for msgfmt is maintained as a Texinfo
          manual.  If the info and msgfmt programs are properly installed
          at your site, the command

                 info msgfmt

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

   GNU gettext-tools 20200704      July 2020                      MSGFMT(1)

--------------

Pages that refer to this page: `gettext(3) <../man3/gettext.3.html>`__

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
