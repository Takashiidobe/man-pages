.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

genccode(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GENCCODE(8)                 ICU 70.0.1 Manual                GENCCODE(8)

NAME
-------------------------------------------------

::

          genccode - generate C or platform specific assembly code from an
          ICU data file.


---------------------------------------------------------

::

          genccode [ -h, -?, --help ] [ -a, --assembly name ] [ -d,
          --destdir destination ] [ -n, --name name ] [ -e, --entrypoint
          name ] [ -f, --filename name ] [ filename ...  ]


---------------------------------------------------------------

::

          genccode reads each of the supplied filename and writes out a C
          file containing a compilable definition of the data in the data
          file.  The C file name is made by taking the base name of the
          data filename, replacing dots by underscores, and adding a .c
          file extension.

          If the -a option is used, platform specific assembly code is
          generated instead of C code.  Most C compilers will accept both C
          and assembly files.  Instead of writing a filename with a .c file
          extension, a filename with a .s will be written instead.

          If genccode is called with no filename it terminates gracefully.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -a, --assembly name
                 Output assembly code instead of C code.  Use -h to see the
                 list of available types of assembly to generate and to
                 specify for this option.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is the current directory.

          -n, --name name
                 Set the data name to name instead of the default. This
                 name is also used as the base name of the output. The
                 default name is made of the icudt prefix, followed by a
                 two-digit version number corresponding to the current
                 version of the ICU release, and a single letter indicating
                 the endianness of the data (the letter b indicated big
                 endian data, and the letter l indicates little endian
                 ones).

          -f, --filename name
                 Normally, an ICU data file such as mydata.icu will be
                 turned into mydata_icu.c and mydata_icu.o.  However, if
                 this parameter was set to "somedata", the output files
                 will be somedata.o and somedata.c, respectively.

          -e, --entrypoint name
                 Set the data entry point (used for linking against the
                 data in a shared library form) to name.  The default entry
                 point name is made of the data (set by the -n, --name
                 option) followed by an underscore and the type of the data
                 (set by the -t, --type option).


-------------------------------------------------------

::

          70.0.1


-----------------------------------------------------------

::

          Copyright (C) 2000-2004 IBM, Inc. and others.

COLOPHON
---------------------------------------------------------

::

          This page is part of the ICU (International Components for
          Unicode) project.  Information about the project can be found at
          ⟨http://site.icu-project.org/home⟩.  If you have a bug report for
          this manual page, see ⟨http://site.icu-project.org/bugs⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://github.com/unicode-org/icu⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   ICU MANPAGE                   11 March 2004                  GENCCODE(8)

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
