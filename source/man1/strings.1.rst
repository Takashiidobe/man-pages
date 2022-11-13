.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strings(1) — Linux manual page
==============================

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

   STRINGS(1)                GNU Development Tools               STRINGS(1)

NAME
-------------------------------------------------

::

          strings - print the sequences of printable characters in files


---------------------------------------------------------

::

          strings [-afovV] [-min-len]
                  [-n min-len] [--bytes=min-len]
                  [-t radix] [--radix=radix]
                  [-e encoding] [--encoding=encoding]
                  [-] [--all] [--print-file-name]
                  [-T bfdname] [--target=bfdname]
                  [-w] [--include-all-whitespace]
                  [-s] [--output-separatorsep_string]
                  [--help] [--version] file...


---------------------------------------------------------------

::

          For each file given, GNU strings prints the printable character
          sequences that are at least 4 characters long (or the number
          given with the options below) and are followed by an unprintable
          character.

          Depending upon how the strings program was configured it will
          default to either displaying all the printable sequences that it
          can find in each file, or only those sequences that are in
          loadable, initialized data sections.  If the file type is
          unrecognizable, or if strings is reading from stdin then it will
          always display all of the printable sequences that it can find.

          For backwards compatibility any file that occurs after a command-
          line option of just - will also be scanned in full, regardless of
          the presence of any -d option.

          strings is mainly useful for determining the contents of non-text
          files.


-------------------------------------------------------

::

          -a
          --all
          -   Scan the whole file, regardless of what sections it contains
              or whether those sections are loaded or initialized.
              Normally this is the default behaviour, but strings can be
              configured so that the -d is the default instead.

              The - option is position dependent and forces strings to
              perform full scans of any file that is mentioned after the -
              on the command line, even if the -d option has been
              specified.

          -d
          --data
              Only print strings from initialized, loaded data sections in
              the file.  This may reduce the amount of garbage in the
              output, but it also exposes the strings program to any
              security flaws that may be present in the BFD library used to
              scan and load sections.  Strings can be configured so that
              this option is the default behaviour.  In such cases the -a
              option can be used to avoid using the BFD library and instead
              just print all of the strings found in the file.

          -f
          --print-file-name
              Print the name of the file before each string.

          --help
              Print a summary of the program usage on the standard output
              and exit.

          -min-len
          -n min-len
          --bytes=min-len
              Print sequences of characters that are at least min-len
              characters long, instead of the default 4.

          -o  Like -t o.  Some other versions of strings have -o act like
              -t d instead.  Since we can not be compatible with both ways,
              we simply chose one.

          -t radix
          --radix=radix
              Print the offset within the file before each string.  The
              single character argument specifies the radix of the
              offset---o for octal, x for hexadecimal, or d for decimal.

          -e encoding
          --encoding=encoding
              Select the character encoding of the strings that are to be
              found.  Possible values for encoding are: s =
              single-7-bit-byte characters (ASCII, ISO 8859, etc.,
              default), S = single-8-bit-byte characters, b = 16-bit
              bigendian, l = 16-bit littleendian, B = 32-bit bigendian, L =
              32-bit littleendian.  Useful for finding wide character
              strings. (l and b apply to, for example, Unicode UTF-16/UCS-2
              encodings).

          -T bfdname
          --target=bfdname
              Specify an object code format other than your system's
              default format.

          -v
          -V
          --version
              Print the program version number on the standard output and
              exit.

          -w
          --include-all-whitespace
              By default tab and space characters are included in the
              strings that are displayed, but other whitespace characters,
              such a newlines and carriage returns, are not.  The -w option
              changes this so that all whitespace characters are considered
              to be part of a string.

          -s
          --output-separator
              By default, output strings are delimited by a new-line. This
              option allows you to supply any string to be used as the
              output record separator.  Useful with
              --include-all-whitespace where strings may contain new-lines
              internally.

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

          ar(1), nm(1), objdump(1), ranlib(1), readelf(1) and the Info
          entries for binutils.


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

   binutils-2.36.1                2021-02-06                     STRINGS(1)

--------------

Pages that refer to this page: `elf(5) <../man5/elf.5.html>`__

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
