.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_filenames(5) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `Compression of [22mroff        |                                   |
| [24m [1mfiles <#Compression_of_ |                                   |
| %5B22mroff%5B24m_%5B1mfiles>`__ |                                   |
| \| `Man pages <#Man_pages>`__ \|  |                                   |
| `Traditional [22mtroff[24m [1  |                                   |
| mextensions <#Traditional_%5B22m |                                   |
| troff%5B24m_%5B1mextensions>`__ |                                   |
| \|                                |                                   |
| `New [22mgroff                  |                                   |
| [24m [1mextensions <#New_%5B22m |                                   |
| groff%5B24m_%5B1mextensions>`__ |                                   |
| \| `Authors <#Authors>`__ \|      |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_filenames(5)         File Formats Manual        groff_filenames(5)


-------------------------------------------------

::

          groff_filenames - filename conventions used in roff systems


---------------------------------------------------------------

::

          Since the evolution of roff in the 1970s, a whole bunch of
          filename extensions for roff files were used.

          The roff extensions refer to preprocessors or macro packages.
          These extensions are fixed in all Unix-like operating systems.

          Later on, groff added some more extensions.  This man page is
          about these filename extensions.


-----------------------------------------------------------------------------------------------------------------------------

::

          Each roff file can be optionally compressed.  That means that the
          total filename ends with a compressor name.  So the whole
          filename has the structure <name>.<extension>[.<compression>].

          Best-known are the compressor extensions .Z, .gz, and .bzip2.
          Relatively new is .xz.

          From now on, we will ignore the compressions and only comment the
          structure <name>.<extension>.


-----------------------------------------------------------

::

          The Unix manual pages are widely called man pages.  The man page
          style is the best-known part of the roff language.

          The extensions for man should be better documented.  So this is
          documented here.

          Files written in the man language use the following extension:
          *.<section>[<group>].

      Man page sections
          The traditional man page <section> is a digit from 1 to 8.

          <name>.1
          <name>.2
          <name>.3
          <name>.4
          <name>.5
          <name>.6
          <name>.7
          <name>.8
                 Classic man page sections.

          In older commercial Unix systems, the 3 characters l, n, and o
          were also used as section names.  This is today deprecated, but
          there are still documents in this format.

          <name>.l
          <name>.n
          <name>.o
                 Deprecated man page sections, which stood for “local”,
                 “new”, and “old”, respectively.

      Man page group extensions
          The <group> extension in .<section>[<group>] is optional, but it
          can be any string of word characters.  Usually programmers use a
          group name that is already used, e.g., x for X Window System
          documents or tcl to refer to the Tcl programming language.

          Examples:

          groff.1
                 is the man page for groff in section 1 without a group

          xargs.1posix.gz
                 is the man page for the program xargs in section 1 and
                 group posix; moreover it is compressed with gz (gzip).

          config.5ssl
                 OpenSSL CONF library configuration files from section 5
                 with group ssl.

          dpkg-reconfigure.8cdebconf
                 man page for the program dpkg-reconfigure in section 8 and
                 group cdebconf.

      Source of man pages
          There are 2 roff languages for writing man pages: man and mdoc.

          The names of these 2 styles are taken as extensions for the
          source code files of man pages in the groff package.

          <name>.man
                 traditional Unix-like man page format within groff source
                 files.

          <name>.n
                 A temporary man page file produced from a name.man man
                 page by a run of make within the groff source package.

          <name>.mdoc
                 Man page format in BSD.


-----------------------------------------------------------------------------------------------------------------------------------

::

      Files using macro packages
          The classical roff languages were interpreted by the traditional
          troff and nroff programs.

          There were several roff languages, each represented by a macro-
          package.  Each of these provided a suitable file name extension:

          <name>.me
                 roff file using the me macro package.

          <name>.mm
                 roff file using the mm macro package

          <name>.ms
                 roff file using the ms macro package

          All of these classical roff languages and their extensions are
          still very active in groff.

      Source code for macro packages (tmac files)
          In traditional roff the source code for the macro packages was
          stored in TMAC files.  Their file names have the form:

          tmac.<package>,
                 <package> is the name of the macro package without the
                 leading m character, which is reintegrated by the option
                 -m.

          For example, tmac.an is the source for the man macro package.

          In the groff source, more suitable file names were integrated;
          see later on.

      Preprocessors
          Moreover, the following preprocessors were used as filename
          extension:

          <name>.chem
                 for the integration of chemical formulas

          <name>.eqn
                 for the mathematical use of equations

          <name>.pic
                 graphical tool

          <name>.tbl
                 for tables with tbl

          <name>.ref
                 for files using the prefer preprocessor

      roff files
          <name>.t
          <name>.tr
                 for files using the roff language of any kind


-------------------------------------------------------------------------------------------------------------------

::

          GNU roff groff is the actual roff standard, both for classical
          roff and new extensions.  So even the used new extensions in the
          source code should be regarded as actual standard.  The following
          extensions are used instead of classical .t or .tr:

          <name>.groff
          <name>.roff
                 general ending for files using the groff language

      Source code for macro packages (tmac files)
          As the classical form tmac.<package_without_m>, of the TMAC file
          names is quite strange, groff added the following structures:

          <package_without_m>.tmac
          m<package>.tmac
          groff_m<package>.tmac

      Files using new macro packages
          Groff uses the following new macro packages:

          <name>.mmse
                 file with swedish mm macros for groff

          <name>.mom
                 files written in the groff macro package mom

          <name>.www
                 files written in HTML-like groff macros.

      Preprocessors and postprocessors
          <name>.hdtbl
                 Heidelberger tables, an alternative to the preprocessor
                 tbl.  See groff_hdtbl(7).

          <name>.grap
                 files written for the graphical grap processor.

          <name>.grn
                 for including gremlin(1), pictures, see grn(1).

          <name>.pdfroff
                 transform this file with pdfroff of the groff system


-------------------------------------------------------

::

          This document was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩.


---------------------------------------------------------

::

          History and future
                 roff(7), man-pages(7), groff_diff(7), groff(7)

          Compression
                 uncompress(1posix), gzip2(1), bzip2(1), xz(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩.  If you have a bug report
          for this manual page, see ⟨http://www.gnu.org/software/groff/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021           groff_filenames(5)

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
