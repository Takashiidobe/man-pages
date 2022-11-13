.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gencmn(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GENCMN(8)                   ICU 70.0.1 Manual                  GENCMN(8)

NAME
-------------------------------------------------

::

          gencmn - generate an ICU memory-mappable data file


---------------------------------------------------------

::

          gencmn [ -h, -?, --help ] [ -v, --verbose ] [ -c, --copyright |
          -C, --comment comment ] [ -d, --destdir destination ] [ -n,
          --name name ] [ -t, --type fileext ] [ -S, --source ] [ -e,
          --entrypoint name ] maxsize [ listfilename ]


---------------------------------------------------------------

::

          gencmn takes a set of files and packages them as an ICU memory-
          mappable data file. The resulting data file can then be used
          directly by ICU.

          gencmn reads a list of files to be packaged from either the
          supplied listfilename file, or from its standard output. It
          packages all the files from the list that are not bigger than
          maxsize bytes, except if maxsize is 0, which indicates that there
          is no size limit on files.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -v, --verbose
                 Display extra informative messages during execution.

          -c,--copyright
                 Include the ICU copyright notice in the resulting data.

          -C, --comment comment
                 Include the specified comment in the resulting data
                 instead of the ICU copyright notice.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is specified by the environment
                 variable ICU_DATA.

          -n, --name name
                 Set the data name to name instead of the default. This
                 name is also used as the base name of the output. The
                 default name is made of the icudt prefix, followed by a
                 two-digit version number corresponding to the current
                 version of the ICU release, and a single letter indicating
                 the endianness of the data (the letter b indicated big
                 endian data, and the letter l indicates little endian
                 ones).

          -t, --type type
                 Use type as the type of the data. This type is also used
                 as the extension of the generated data file. The default
                 type ie dat.

          -S, --source
                 Write a C source file with the table of contents of the
                 data.

          -e, --entrypoint name
                 Set the data entry point (used for linking against the
                 data in a shared library form) to name.  The default entry
                 point name is made of the data (set by the -n, --name
                 option) followed by an underscore and the type of the data
                 (set by the -t, --type option).


---------------------------------------------------------------

::

          ICU_DATA
                 Specifies the directory containing ICU data. Defaults to
                 ${prefix}/share/icu/70.0.1/.  Some tools in ICU depend on
                 the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.


-------------------------------------------------------

::

          70.0.1


-----------------------------------------------------------

::

          Copyright (C) 2000-2001 IBM, Inc. and others.


---------------------------------------------------------

::

          decmn(8)

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

   ICU MANPAGE                  5 November 2001                   GENCMN(8)

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
