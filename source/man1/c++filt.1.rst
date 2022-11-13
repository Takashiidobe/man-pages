.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

c++filt(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FOOTNOTES <#FOOTNOTES>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   C++FILT(1)                GNU Development Tools               C++FILT(1)

NAME
-------------------------------------------------

::

          c++filt - demangle C++ and Java symbols


---------------------------------------------------------

::

          c++filt [-_|--strip-underscore]
                  [-n|--no-strip-underscore]
                  [-p|--no-params]
                  [-t|--types]
                  [-i|--no-verbose]
                  [-r|--no-recurse-limit]
                  [-R|--recurse-limit]
                  [-s format|--format=format]
                  [--help]  [--version]  [symbol...]


---------------------------------------------------------------

::

          The C++ and Java languages provide function overloading, which
          means that you can write many functions with the same name,
          providing that each function takes parameters of different types.
          In order to be able to distinguish these similarly named
          functions C++ and Java encode them into a low-level assembler
          name which uniquely identifies each different version.  This
          process is known as mangling. The c++filt [1] program does the
          inverse mapping: it decodes (demangles) low-level names into
          user-level names so that they can be read.

          Every alphanumeric word (consisting of letters, digits,
          underscores, dollars, or periods) seen in the input is a
          potential mangled name.  If the name decodes into a C++ name, the
          C++ name replaces the low-level name in the output, otherwise the
          original word is output.  In this way you can pass an entire
          assembler source file, containing mangled names, through c++filt
          and see the same source file containing demangled names.

          You can also use c++filt to decipher individual symbols by
          passing them on the command line:

                  c++filt <symbol>

          If no symbol arguments are given, c++filt reads symbol names from
          the standard input instead.  All the results are printed on the
          standard output.  The difference between reading names from the
          command line versus reading names from the standard input is that
          command-line arguments are expected to be just mangled names and
          no checking is performed to separate them from surrounding text.
          Thus for example:

                  c++filt -n _Z1fv

          will work and demangle the name to "f()" whereas:

                  c++filt -n _Z1fv,

          will not work.  (Note the extra comma at the end of the mangled
          name which makes it invalid).  This command however will work:

                  echo _Z1fv, | c++filt -n

          and will display "f(),", i.e., the demangled name followed by a
          trailing comma.  This behaviour is because when the names are
          read from the standard input it is expected that they might be
          part of an assembler source file where there might be extra,
          extraneous characters trailing after a mangled name.  For
          example:

                      .type   _Z1fv, @function


-------------------------------------------------------

::

          -_
          --strip-underscore
              On some systems, both the C and C++ compilers put an
              underscore in front of every name.  For example, the C name
              "foo" gets the low-level name "_foo".  This option removes
              the initial underscore.  Whether c++filt removes the
              underscore by default is target dependent.

          -n
          --no-strip-underscore
              Do not remove the initial underscore.

          -p
          --no-params
              When demangling the name of a function, do not display the
              types of the function's parameters.

          -t
          --types
              Attempt to demangle types as well as function names.  This is
              disabled by default since mangled types are normally only
              used internally in the compiler, and they can be confused
              with non-mangled names.  For example, a function called "a"
              treated as a mangled type name would be demangled to "signed
              char".

          -i
          --no-verbose
              Do not include implementation details (if any) in the
              demangled output.

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

          -s format
          --format=format
              c++filt can decode various methods of mangling, used by
              different compilers.  The argument to this option selects
              which method it uses:

              "auto"
                  Automatic selection based on executable (the default
                  method)

              "gnu"
                  the one used by the GNU C++ compiler (g++)

              "lucid"
                  the one used by the Lucid compiler (lcc)

              "arm"
                  the one specified by the C++ Annotated Reference Manual

              "hp"
                  the one used by the HP compiler (aCC)

              "edg"
                  the one used by the EDG compiler

              "gnu-v3"
                  the one used by the GNU C++ compiler (g++) with the V3
                  ABI.

              "java"
                  the one used by the GNU Java compiler (gcj)

              "gnat"
                  the one used by the GNU Ada compiler (GNAT).

          --help
              Print a summary of the options to c++filt and exit.

          --version
              Print the version number of c++filt and exit.

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


-----------------------------------------------------------

::

          1.  MS-DOS does not allow "+" characters in file names, so on MS-
              DOS this program is named CXXFILT.


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

   binutils-2.36.1                2021-02-06                     C++FILT(1)

--------------

Pages that refer to this page:
`dpkg-gensymbols(1) <../man1/dpkg-gensymbols.1.html>`__

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
