.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

genbrk(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GENBRK(1)                   ICU 70.0.1 Manual                  GENBRK(1)

NAME
-------------------------------------------------

::

          genbrk - Compiles ICU break iteration rules source files into
          binary data files


---------------------------------------------------------

::

          genbrk [ -h, -?, --help ] [ -V, --version ] [ -c, --copyright ] [
          -v, --verbose ] [ -d, --destdir destination ] [ -i, --icudatadir
          directory ] -r, --rules rule-file -o, --out output-file


---------------------------------------------------------------

::

          genbrk reads the break (boundary) rule source code from rule-file
          and creates a break iteration data file. Normally this data file
          has the .brk extension.

          The details of the rule syntax can be found in ICU's User Guide.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -V, --version
                 Print the version of genbrk and exit.

          -c, --copyright
                 Embeds the standard ICU copyright into the output-file.

          -v, --verbose
                 Display extra informative messages during execution.

          -d, --destdir destination
                 Set the destination directory of the output-file to
                 destination.

          -i, --icudatadir directory
                 Look for any necessary ICU data files in directory.  For
                 example, the file pnames.icu must be located when ICU's
                 data is not built as a shared library.  The default ICU
                 data directory is specified by the environment variable
                 ICU_DATA.  Most configurations of ICU do not require this
                 argument.

          -r, --rules rule-file
                 The source file to read.

          -o, --out output-file
                 The output data file to write.


-------------------------------------------------------

::

          When the rule-file contains a byte order mark (BOM) at the
          beginning of the file, which is the Unicode character U+FEFF,
          then the rule-file is interpreted as Unicode. Without the BOM,
          the file is interpreted in the current operating system default
          codepage.  In order to eliminate any ambiguity of the encoding
          for how the rule-file was written, it is recommended that you
          write this file in UTF-8 with the BOM.


---------------------------------------------------------------

::

          ICU_DATA
                 Specifies the directory containing ICU data. Defaults to
                 ${prefix}/share/icu/70.0.1/.  Some tools in ICU depend on
                 the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.


-------------------------------------------------------

::

          George Rhoten
          Andy Heninger


-------------------------------------------------------

::

          1.0


-----------------------------------------------------------

::

          Copyright (C) 2005 International Business Machines Corporation
          and others


---------------------------------------------------------

::

          http://www.icu-project.org/userguide/boundaryAnalysis.html 

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

   ICU MANPAGE                  2 December 2005                   GENBRK(1)

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
