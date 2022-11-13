.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

addr2line(1) — Linux manual page
================================

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

   ADDR2LINE(1)              GNU Development Tools             ADDR2LINE(1)

NAME
-------------------------------------------------

::

          addr2line - convert addresses into file names and line numbers


---------------------------------------------------------

::

          addr2line [-a|--addresses]
                    [-b bfdname|--target=bfdname]
                    [-C|--demangle[=style]]
                    [-r|--no-recurse-limit]
                    [-R|--recurse-limit]
                    [-e filename|--exe=filename]
                    [-f|--functions] [-s|--basename]
                    [-i|--inlines]
                    [-p|--pretty-print]
                    [-j|--section=name]
                    [-H|--help] [-V|--version]
                    [addr addr ...]


---------------------------------------------------------------

::

          addr2line translates addresses into file names and line numbers.
          Given an address in an executable or an offset in a section of a
          relocatable object, it uses the debugging information to figure
          out which file name and line number are associated with it.

          The executable or relocatable object to use is specified with the
          -e option.  The default is the file a.out.  The section in the
          relocatable object to use is specified with the -j option.

          addr2line has two modes of operation.

          In the first, hexadecimal addresses are specified on the command
          line, and addr2line displays the file name and line number for
          each address.

          In the second, addr2line reads hexadecimal addresses from
          standard input, and prints the file name and line number for each
          address on standard output.  In this mode, addr2line may be used
          in a pipe to convert dynamically chosen addresses.

          The format of the output is FILENAME:LINENO.  By default each
          input address generates one line of output.

          Two options can generate additional lines before each
          FILENAME:LINENO line (in that order).

          If the -a option is used then a line with the input address is
          displayed.

          If the -f option is used, then a line with the FUNCTIONNAME is
          displayed.  This is the name of the function containing the
          address.

          One option can generate additional lines after the
          FILENAME:LINENO line.

          If the -i option is used and the code at the given address is
          present there because of inlining by the compiler then additional
          lines are displayed afterwards.  One or two extra lines (if the
          -f option is used) are displayed for each inlined function.

          Alternatively if the -p option is used then each input address
          generates a single, long, output line containing the address, the
          function name, the file name and the line number.  If the -i
          option has also been used then any inlined functions will be
          displayed in the same manner, but on separate lines, and prefixed
          by the text (inlined by).

          If the file name or function name can not be determined,
          addr2line will print two question marks in their place.  If the
          line number can not be determined, addr2line will print 0.


-------------------------------------------------------

::

          The long and short forms of options, shown here as alternatives,
          are equivalent.

          -a
          --addresses
              Display the address before the function name, file and line
              number information.  The address is printed with a 0x prefix
              to easily identify it.

          -b bfdname
          --target=bfdname
              Specify that the object-code format for the object files is
              bfdname.

          -C
          --demangle[=style]
              Decode (demangle) low-level symbol names into user-level
              names.  Besides removing any initial underscore prepended by
              the system, this makes C++ function names readable.
              Different compilers have different mangling styles. The
              optional demangling style argument can be used to choose an
              appropriate demangling style for your compiler.

          -e filename
          --exe=filename
              Specify the name of the executable for which addresses should
              be translated.  The default file is a.out.

          -f
          --functions
              Display function names as well as file and line number
              information.

          -s
          --basenames
              Display only the base of each file name.

          -i
          --inlines
              If the address belongs to a function that was inlined, the
              source information for all enclosing scopes back to the first
              non-inlined function will also be printed.  For example, if
              "main" inlines "callee1" which inlines "callee2", and address
              is from "callee2", the source information for "callee1" and
              "main" will also be printed.

          -j
          --section
              Read offsets relative to the specified section instead of
              absolute addresses.

          -p
          --pretty-print
              Make the output more human friendly: each location are
              printed on one line.  If option -i is specified, lines for
              all enclosing scopes are prefixed with (inlined by).

          -r
          -R
          --recurse-limit
          --no-recurse-limit
          --recursion-limit
          --no-recursion-limit
              Enables or disables a limit on the amount of recursion
              performed whilst demangling strings.  Since the name mangling
              formats allow for an infinite level of recursion it is
              possible to create strings whose decoding will exhaust the
              amount of stack space available on the host machine,
              triggering a memory fault.  The limit tries to prevent this
              from happening by restricting recursion to 2048 levels of
              nesting.

              The default is for this limit to be enabled, but disabling it
              may be necessary in order to demangle truly complicated
              names.  Note however that if the recursion limit is disabled
              then stack exhaustion is possible and any bug reports about
              such an event will be rejected.

              The -r option is a synonym for the --no-recurse-limit option.
              The -R option is a synonym for the --recurse-limit option.

              Note this option is only effective if the -C or --demangle
              option has been enabled.

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

          Info entries for binutils.


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

   binutils-2.36.1                2021-02-06                   ADDR2LINE(1)

--------------

Pages that refer to this page:
`backtrace(3) <../man3/backtrace.3.html>`__

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
