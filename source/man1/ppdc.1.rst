.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ppdc(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ppdc(1)                        Apple Inc.                        ppdc(1)

NAME
-------------------------------------------------

::

          ppdc - cups ppd compiler (deprecated)


---------------------------------------------------------

::

          ppdc [ -D name[=value] ] [ -I include-directory ] [ -c message-
          catalog ] [ -d output-directory ] [ -l language(s) ] [ -m ] [ -t
          ] [ -v ] [ -z ] [ --cr ] [ --crlf ] [ --lf ] source-file


---------------------------------------------------------------

::

          ppdc compiles PPDC source files into one or more PPD files.  This
          program is deprecated and will be removed in a future release of
          CUPS.


-------------------------------------------------------

::

          ppdc supports the following options:

          -D name[=value]
               Sets the named variable for use in the source file.  It is
               equivalent to using the #define directive in the source
               file.

          -I include-directory
               Specifies an alternate include directory.  Multiple -I
               options can be supplied to add additional directories.

          -c message-catalog
               Specifies a single message catalog file in GNU gettext
               (filename.po) or Apple strings (filename.strings) format to
               be used for localization.

          -d output-directory
               Specifies the output directory for PPD files.  The default
               output directory is "ppd".

          -l language(s)
               Specifies one or more languages to use when localizing the
               PPD file(s).  The default language is "en" (English).
               Separate multiple languages with commas, for example
               "de_DE,en_UK,es_ES,es_MX,es_US,fr_CA,fr_FR,it_IT" will
               create PPD files with German, UK English, Spanish (Spain,
               Mexico, and US), French (France and Canada), and Italian
               languages in each file.

          -m   Specifies that the output filename should be based on the
               ModelName value instead of FileName or PCFilenName.

          -t   Specifies that PPD files should be tested instead of
               generated.

          -v   Specifies verbose output, basically a running status of
               which files are being loaded or written.  -z Generates
               compressed PPD files (filename.ppd.gz).  The default is to
               generate uncompressed PPD files.

          --cr

          --crlf

          --lf Specifies the line ending to use - carriage return, carriage
               return and line feed, or line feed alone.  The default is to
               use the line feed character alone.


---------------------------------------------------

::

          PPD files are deprecated and will no longer be supported in a
          future feature release of CUPS.  Printers that do not support IPP
          can be supported using applications such as ippeveprinter(1).


---------------------------------------------------------

::

          ppdhtml(1), ppdi(1), ppdmerge(1), ppdpo(1), ppdcfile(5), CUPS
          Online Help (http://localhost:631/help)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                           ppdc(1)

--------------

Pages that refer to this page: `ppdhtml(1) <../man1/ppdhtml.1.html>`__, 
`ppdi(1) <../man1/ppdi.1.html>`__, 
`ppdmerge(1) <../man1/ppdmerge.1.html>`__, 
`ppdpo(1) <../man1/ppdpo.1.html>`__, 
`ppdcfile(5) <../man5/ppdcfile.5.html>`__

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
