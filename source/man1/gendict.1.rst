.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gendict(1) — Linux manual page
==============================

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

   GENDICT(1)                  ICU 70.0.1 Manual                 GENDICT(1)

NAME
-------------------------------------------------

::

          gendict - Compiles word list into ICU string trie dictionary


---------------------------------------------------------

::

          gendict [ --uchars | --bytes --transform transform ] [ -h, -?,
          --help ] [ -V, --version ] [ -c, --copyright ] [ -v, --verbose ]
          [ -i, --icudatadir directory ]  input-file  output-file


---------------------------------------------------------------

::

          gendict reads the word list from dictionary-file and creates a
          string trie dictionary file. Normally this data file has the
          .dict extension.

          Words begin at the beginning of a line and are terminated by the
          first whitespace.  Lines that begin with whitespace are ignored.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -V, --version
                 Print the version of gendict and exit.

          -c, --copyright
                 Embeds the standard ICU copyright into the output-file.

          -v, --verbose
                 Display extra informative messages during execution.

          -i, --icudatadir directory
                 Look for any necessary ICU data files in directory.  For
                 example, the file pnames.icu must be located when ICU's
                 data is not built as a shared library.  The default ICU
                 data directory is specified by the environment variable
                 ICU_DATA.  Most configurations of ICU do not require this
                 argument.

          --uchars
                 Set the output trie type to UChar. Mutually exclusive with
                 --bytes.

          --bytes
                 Set the output trie type to Bytes. Mutually exclusive with
                 --uchars.

          --transform
                 Set the transform type. Should only be specified with
                 --bytes.  Currently supported transforms are: offset-<hex-
                 number>, which specifies an offset to subtract from all
                 input characters.  It should be noted that the offset
                 transform also maps U+200D to 0xFF and U+200C to 0xFE, in
                 order to offer compatibility to languages that require
                 these characters.  A transform must be specified for a
                 bytes trie, and when applied to the non-value characters
                 in the input-file must produce output between 0x00 and
                 0xFF.

           input-file
                 The source file to read.

           output-file
                 The file to write the output dictionary to.


-------------------------------------------------------

::

          The input-file is assumed to be encoded in UTF-8.  The integers
          in the input-file that are used as values must be made up of
          ASCII digits. They may be specified either in hex, by using a 0x
          prefix, or in decimal.  Either --bytes or --uchars must be
          specified.


---------------------------------------------------------------

::

          ICU_DATA
                 Specifies the directory containing ICU data. Defaults to
                 ${prefix}/share/icu/70.0.1/.  Some tools in ICU depend on
                 the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.


-------------------------------------------------------

::

          Maxime Serrano


-------------------------------------------------------

::

          1.0


-----------------------------------------------------------

::

          Copyright (C) 2012 International Business Machines Corporation
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

   ICU MANPAGE                    1 June 2012                    GENDICT(1)

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
