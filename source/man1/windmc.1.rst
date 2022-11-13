.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

windmc(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WINDMC(1)                 GNU Development Tools                WINDMC(1)

NAME
-------------------------------------------------

::

          windmc - generates Windows message resources


---------------------------------------------------------

::

          windmc [options] input-file


---------------------------------------------------------------

::

          windmc reads message definitions from an input file (.mc) and
          translate them into a set of output files.  The output files may
          be of four kinds:

          "h" A C header file containing the message definitions.

          "rc"
              A resource file compilable by the windres tool.

          "bin"
              One or more binary files containing the resource data for a
              specific message language.

          "dbg"
              A C include file that maps message id's to their symbolic
              name.

          The exact description of these different formats is available in
          documentation from Microsoft.

          When windmc converts from the "mc" format to the "bin" format,
          "rc", "h", and optional "dbg" it is acting like the Windows
          Message Compiler.


-------------------------------------------------------

::

          -a
          --ascii_in
              Specifies that the input file specified is ASCII. This is the
              default behaviour.

          -A
          --ascii_out
              Specifies that messages in the output "bin" files should be
              in ASCII format.

          -b
          --binprefix
              Specifies that "bin" filenames should have to be prefixed by
              the basename of the source file.

          -c
          --customflag
              Sets the customer bit in all message id's.

          -C codepage
          --codepage_in codepage
              Sets the default codepage to be used to convert input file to
              UTF16. The default is ocdepage 1252.

          -d
          --decimal_values
              Outputs the constants in the header file in decimal. Default
              is using hexadecimal output.

          -e ext
          --extension ext
              The extension for the header file. The default is .h
              extension.

          -F target
          --target target
              Specify the BFD format to use for a bin file as output.  This
              is a BFD target name; you can use the --help option to see a
              list of supported targets.  Normally windmc will use the
              default format, which is the first one listed by the --help
              option.

          -h path
          --headerdir path
              The target directory of the generated header file. The
              default is the current directory.

          -H
          --help
              Displays a list of command-line options and then exits.

          -m characters
          --maxlength characters
              Instructs windmc to generate a warning if the length of any
              message exceeds the number specified.

          -n
          --nullterminate
              Terminate message text in "bin" files by zero. By default
              they are terminated by CR/LF.

          -o
          --hresult_use
              Not yet implemented. Instructs "windmc" to generate an OLE2
              header file, using HRESULT definitions. Status codes are used
              if the flag is not specified.

          -O codepage
          --codepage_out codepage
              Sets the default codepage to be used to output text files.
              The default is ocdepage 1252.

          -r path
          --rcdir path
              The target directory for the generated "rc" script and the
              generated "bin" files that the resource compiler script
              includes. The default is the current directory.

          -u
          --unicode_in
              Specifies that the input file is UTF16.

          -U
          --unicode_out
              Specifies that messages in the output "bin" file should be in
              UTF16 format. This is the default behaviour.

          -v
          --verbose
              Enable verbose mode.

          -V
          --version
              Prints the version number for windmc.

          -x path
          --xdgb path
              The path of the "dbg" C include file that maps message id's
              to the symbolic name. No such file is generated without
              specifying the switch.

          @file
              Read command-line options from file.  The options read are
              inserted in place of the original @file option.  If file does
              not exist, or cannot be read, then the option will be treated
              literally, and not removed.

              Options in file are separated by whitespace.  A whitespace
              character may be included in an option by surrounding the
              entire option in either single or double quotes.  Any
              character (including a backslash) may be included by
              prefixing the character to be included with a backslash.  The
              file may itself contain additional @file options; any such
              options will be processed recursively.


---------------------------------------------------------

::

          the Info entries for binutils.


-----------------------------------------------------------

::

          Copyright (c) 1991-2021 Free Software Foundation, Inc.

          Permission is granted to copy, distribute and/or modify this
          document under the terms of the GNU Free Documentation License,
          Version 1.3 or any later version published by the Free Software
          Foundation; with no Invariant Sections, with no Front-Cover
          Texts, and with no Back-Cover Texts.  A copy of the license is
          included in the section entitled "GNU Free Documentation
          License".

COLOPHON
---------------------------------------------------------

::

          This page is part of the binutils (a collection of tools for
          working with executable binaries) project.  Information about the
          project can be found at ⟨http://www.gnu.org/software/binutils/⟩.
          If you have a bug report for this manual page, see
          ⟨http://sourceware.org/bugzilla/enter_bug.cgi?product=binutils⟩.
          This page was obtained from the tarball binutils-2.36.1.tar.gz
          fetched from ⟨https://ftp.gnu.org/gnu/binutils/⟩ on 2021-06-20.
          If you discover any rendering problems in this HTML version of
          the page, or you believe there is a better or more up-to-date
          source for the page, or you have corrections or improvements to
          the information in this COLOPHON (which is not part of the
          original manual page), send a mail to man-pages@man7.org

   binutils-2.36.1                2021-02-06                      WINDMC(1)

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
