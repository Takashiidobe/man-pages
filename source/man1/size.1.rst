.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

size(1) — Linux manual page
===========================

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

   SIZE(1)                   GNU Development Tools                  SIZE(1)

NAME
-------------------------------------------------

::

          size - list section sizes and total size of binary files


---------------------------------------------------------

::

          size [-A|-B|-G|--format=compatibility]
               [--help]
               [-d|-o|-x|--radix=number]
               [--common]
               [-t|--totals]
               [--target=bfdname] [-V|--version]
               [objfile...]


---------------------------------------------------------------

::

          The GNU size utility lists the section sizes and the total size
          for each of the binary files objfile on its argument list.  By
          default, one line of output is generated for each file or each
          module if the file is an archive.

          objfile... are the files to be examined.  If none are specified,
          the file "a.out" will be used instead.


-------------------------------------------------------

::

          The command-line options have the following meanings:

          -A
          -B
          -G
          --format=compatibility
              Using one of these options, you can choose whether the output
              from GNU size resembles output from System V size (using -A,
              or --format=sysv), or Berkeley size (using -B, or
              --format=berkeley).  The default is the one-line format
              similar to Berkeley's.  Alternatively, you can choose the GNU
              format output (using -G, or --format=gnu), this is similar to
              Berkeley's output format, but sizes are counted differently.

              Here is an example of the Berkeley (default) format of output
              from size:

                      $ size --format=Berkeley ranlib size
                         text    data     bss     dec     hex filename
                       294880   81920   11592  388392   5ed28 ranlib
                       294880   81920   11888  388688   5ee50 size

              The Berkeley style output counts read only data in the "text"
              column, not in the "data" column, the "dec" and "hex" columns
              both display the sum of the "text", "data", and "bss" columns
              in decimal and hexadecimal respectively.

              The GNU format counts read only data in the "data" column,
              not the "text" column, and only displays the sum of the
              "text", "data", and "bss" columns once, in the "total"
              column.  The --radix option can be used to change the number
              base for all columns.  Here is the same data displayed with
              GNU conventions:

                      $ size --format=GNU ranlib size
                            text       data        bss      total filename
                          279880      96920      11592     388392 ranlib
                          279880      96920      11888     388688 size

              This is the same data, but displayed closer to System V
              conventions:

                      $ size --format=SysV ranlib size
                      ranlib  :
                      section         size         addr
                      .text         294880         8192
                      .data          81920       303104
                      .bss           11592       385024
                      Total         388392

                      size  :
                      section         size         addr
                      .text         294880         8192
                      .data          81920       303104
                      .bss           11888       385024
                      Total         388688

          --help
              Show a summary of acceptable arguments and options.

          -d
          -o
          -x
          --radix=number
              Using one of these options, you can control whether the size
              of each section is given in decimal (-d, or --radix=10);
              octal (-o, or --radix=8); or hexadecimal (-x, or --radix=16).
              In --radix=number, only the three values (8, 10, 16) are
              supported.  The total size is always given in two radices;
              decimal and hexadecimal for -d or -x output, or octal and
              hexadecimal if you're using -o.

          --common
              Print total size of common symbols in each file.  When using
              Berkeley or GNU format these are included in the bss size.

          -t
          --totals
              Show totals of all objects listed (Berkeley or GNU format
              mode only).

          --target=bfdname
              Specify that the object-code format for objfile is bfdname.
              This option may not be necessary; size can automatically
              recognize many formats.

          -V
          --version
              Display the version number of size.

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

          ar(1), objdump(1), readelf(1), and the Info entries for binutils.


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

   binutils-2.36.1                2021-02-06                        SIZE(1)

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
