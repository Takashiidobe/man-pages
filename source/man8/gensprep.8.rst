.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gensprep(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   gensprep(8)                 ICU 70.0.1 Manual                gensprep(8)

NAME
-------------------------------------------------

::

          gensprep - compile StringPrep data from files filtered by
          filterRFC3454.pl


---------------------------------------------------------

::

          gensprep [ -h, -?, --help ] [ -v, --verbose ] [ -c, --copyright ]
          [ -s, --sourcedir source ] [ -d, --destdir destination ]


---------------------------------------------------------------

::

          gensprep reads filtered RFC 3454 files and compiles their
          information into a binary form.  The resulting file, <name>.icu,
          can then be read directly by ICU, or used by pkgdata(8) for
          incorporation into a larger archive or library.

          The files read by gensprep are described in the FILES section.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -v, --verbose
                 Display extra informative messages during execution.

          -c, --copyright
                 Include a copyright notice into the binary data.

          -s, --sourcedir source
                 Set the source directory to source.  The default source
                 directory is specified by the environment variable
                 ICU_DATA.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is specified by the environment
                 variable ICU_DATA.


---------------------------------------------------------------

::

          ICU_DATA
                 Specifies the directory containing ICU data. Defaults to
                 ${prefix}/share/icu/70.0.1/.  Some tools in ICU depend on
                 the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.


---------------------------------------------------

::

          The following files are read by gensprep and are looked for in
          the source /misc for rfc3454_*.txt files and in source /unidata
          for NormalizationCorrections.txt.

          rfc3453_A_1.txt
                 Contains the list of unassigned codepoints in Unicode
                 version 3.2.0....

          rfc3454_B_1.txt
                 Contains the list of code points that are commonly mapped
                 to nothing....

          rfc3454_B_2.txt
                 Contains the list of mappings for casefolding of  code
                 points when Normalization form NFKC is specified....

          rfc3454_C_X.txt
                 Contains the list of code points that are prohibited for
                 IDNA.

          NormalizationCorrections.txt
                 Contains the list of code points whose normalization has
                 changed since Unicode Version 3.2.0.


-------------------------------------------------------

::

          70.0.1


-----------------------------------------------------------

::

          Copyright (C) 2000-2002 IBM, Inc. and others.


---------------------------------------------------------

::

          pkgdata(8)

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

   ICU MANPAGE                   18 March 2003                  gensprep(8)

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
