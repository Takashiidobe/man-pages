.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupstestppd(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cupstestppd(1)                 Apple Inc.                 cupstestppd(1)

NAME
-------------------------------------------------

::

          cupstestppd - test conformance of ppd files


---------------------------------------------------------

::

          cupstestppd [ -I category ] [ -R rootdir ] [ -W category ] [ -q ]
          [ -r ] [ -v[v] ] filename.ppd[.gz] [ ...  filename.ppd[.gz] ]
          cupstestppd [ -R rootdir ] [ -W category ] [ -q ] [ -r ] [ -v[v]
          ] -


---------------------------------------------------------------

::

          cupstestppd tests the conformance of PPD files to the Adobe
          PostScript Printer Description file format specification version
          4.3.  It can also be used to list the supported options and
          available fonts in a PPD file.  The results of testing and any
          other output are sent to the standard output.

          The first form of cupstestppd tests one or more PPD files on the
          command-line.  The second form tests the PPD file provided on the
          standard input.


-------------------------------------------------------

::

          cupstestppd supports the following options:

          -I filename
               Ignores all PCFileName warnings.

          -I filters
               Ignores all filter errors.

          -I profiles
               Ignores all profile errors.

          -R rootdir
               Specifies an alternate root directory for the filter, pre-
               filter, and other support file checks.

          -W constraints
               Report all UIConstraint errors as warnings.

          -W defaults
               Except for size-related options, report all default option
               errors as warnings.

          -W filters
               Report all filter errors as warnings.

          -W profiles
               Report all profile errors as warnings.

          -W sizes
               Report all media size errors as warnings.

          -W translations
               Report all translation errors as warnings.

          -W all
               Report all of the previous errors as warnings.

          -W none
               Report all of the previous errors as errors.

          -q   Specifies that no information should be displayed.

          -r   Relaxes the PPD conformance requirements so that common
               whitespace, control character, and formatting problems are
               not treated as hard errors.

          -v   Specifies that detailed conformance testing results should
               be displayed rather than the concise PASS/FAIL/ERROR status.

          -vv  Specifies that all information in the PPD file should be
               displayed in addition to the detailed conformance testing
               results.

          The -q, -v, and -vv options are mutually exclusive.


---------------------------------------------------------------

::

          cupstestppd returns zero on success and non-zero on error.  The
          error codes are as follows:

          1    Bad command-line arguments or missing PPD filename.

          2    Unable to open or read PPD file.

          3    The PPD file contains format errors that cannot be skipped.

          4    The PPD file does not conform to the Adobe PPD
               specification.


---------------------------------------------------------

::

          The following command will test all PPD files under the current
          directory and print the names of each file that does not conform:

              find . -name \*.ppd \! -exec cupstestppd -q '{}' \; -print

          The next command tests all PPD files under the current directory
          and print detailed conformance testing results for the files that
          do not conform:

              find . -name \*.ppd \! -exec cupstestppd -q '{}' \; \
                  -exec cupstestppd -v '{}' \;


---------------------------------------------------

::

          PPD files are deprecated and will no longer be supported in a
          future feature release of CUPS.  Printers that do not support IPP
          can be supported using applications such as ippeveprinter(1).


---------------------------------------------------------

::

          lpadmin(8), CUPS Online Help (http://localhost:631/help), Adobe
          PostScript Printer Description File Format Specification, Version
          4.3.


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

   26 April 2019                     CUPS                    cupstestppd(1)

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
