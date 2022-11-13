.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

makeconv(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MAKECONV(1)                 ICU 70.0.1 Manual                MAKECONV(1)

NAME
-------------------------------------------------

::

          makeconv - compile a converter table


---------------------------------------------------------

::

          makeconv [ -h, -?, --help ] [ -c, --copyright ] [ -v, --verbose ]
          [ -d, --destdir destination ] convertertable ...


---------------------------------------------------------------

::

          makeconv converts the ICU converter table convertertable into a
          binary file. The binary file has the same base name as
          convertertable but has a .cnv extension (instead of the typical
          .ucm extension of the convertertable file).  This binary file can
          then be read directly by ICU, or used by pkgdata(1) for
          incorporation into a larger archive or library.

          The convertertable must be in the ICU ucm (Unicode Codepage
          Mapping) format in order to be understood by makeconv.  The ICU
          ucm format is similar to the IBM NLTC upmap/tpmap/rpmap files.
          Comments in the convertertable are handled as follows. If a
          comment (starting with a `#' sign) that is after some text does
          contain the fallback indicator `|' then only the text starting
          with the `#' sign, and ending before the `|' sign, is ignored.
          Otherwise, or if the comment is the first thing on the line, the
          comment runs up to the end of the line. This special handling of
          comments is to accommodate the practice of putting fallback
          information in comments in the strict IBM NLTC ucmap format.

          Note that new converters will be automatically found by ICU after
          their installation in ICU's data directory. They do not need to
          be listed in the convrtrs.txt(5) converters aliases file in order
          to be available to applications using ICU.  They do need to be
          listed there if one wants to give them aliases, or tags, though.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -c, --copyright
                 Include a copyright notice in the binary data.

          -v, --verbose
                 Display extra informative messages during execution.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is specified by the environment
                 variable ICU_DATA.


-------------------------------------------------------

::

          If an existing converter table is changed and recompiled using
          makeconv, the resulting binary file must be packaged in the same
          way that it was packaged initially. For example, if converters
          were grouped together in an archive or a library with pkgdata(1),
          then the archive or library must be rebuilt with the new binary
          file.  A standalone binary converter file will not take
          precedence over a packaged one.


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

          Copyright (C) 2000 IBM, Inc. and others.


---------------------------------------------------------

::

          convrtrs.txt(5)
          pkgdata(1)

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

   ICU MANPAGE                   16 April 2002                  MAKECONV(1)

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
