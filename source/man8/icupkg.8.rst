.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

icupkg(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `LIST F                           |                                   |
| ILE SYNTAX <#LIST_FILE_SYNTAX>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ICUPKG(8)                   ICU 70.0.1 Manual                  ICUPKG(8)

NAME
-------------------------------------------------

::

          icupkg - extract or modify an ICU .dat archive


---------------------------------------------------------

::

          icupkg [ -h, -?, --help ] [ -tl, --type l | -tb, --type b | -te,
          --type e ] [ -c, --copyright | -C, --comment comment ] [ -a,
          --add list ] [ -r, --remove list ] [ -x, --extract list ] [ -l,
          --list ] [ -s, --sourcedir source ] [ -d, --destdir destination ]
          [ -w, --writepkg ] [ -m, --matchmode mode ] infilename [
          outfilename ]


---------------------------------------------------------------

::

          icupkg reads the input ICU .dat package file, modify it according
          to the options, swap it to the desired platform properties
          (charset & endianness), and optionally write the resulting ICU
          .dat package to the output file.  Items are removed, then added,
          then extracted and listed.  An ICU .dat package is written if
          items are removed or added, or if the input and output filenames
          differ, or if the -w, --writepkg option is set.

          If the input filename is "new" then an empty package is created.
          If the output filename is missing, then it is automatically
          generated from the input filename. If the input filename ends
          with an l, b, or e matching its platform properties, then the
          output filename will contain the letter from the -t, --type
          option.

          This tool can also be used to just swap a single ICU data file,
          replacing the former icuswap tool. For this mode, provide the
          infilename (and optional outfilename) for a non-package ICU data
          file.  Allowed options include -t, -w, -s and -d The filenames
          can be absolute, or relative to the source/dest dir paths.  Other
          options are not allowed in this mode.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -tl, --type l
                 Output for little-endian/ASCII charset family.  The output
                 type defaults to the input type.

          -tb, --type b
                 Output for big-endian/ASCII charset family.  The output
                 type defaults to the input type.

          -te, --type e
                 Output for big-endian/EBCDIC charset family.  The output
                 type defaults to the input type.

          -c,--copyright
                 Include the ICU copyright notice in the resulting data.

          -C, --comment comment
                 Include the specified comment in the resulting data
                 instead of the ICU copyright notice.

          -a, --add list
                 Add items from the list to the package. The list can be a
                 single filename with a .txt file extension containing a
                 list of item filenames, or an ICU .dat package filename.

          -r, --remove list
                 Remove items from the list from the package. The list can
                 be a single filename with a .txt file extension containing
                 a list of item filenames, or an ICU .dat package filename.

          -x, --extract list
                 Extract items from the list from the package. The list can
                 be a single filename with a .txt file extension containing
                 a list of item filenames, or an ICU .dat package filename.

          -m, --matchmode mode
                 Set the matching mode for item names with wildcards.

          -s, --sourcedir source
                 Set the source directory to source.  The default source
                 directory is the current directory.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is the current directory.

          -l, --list
                 List the package items to stdout (after modifying the
                 package).


-------------------------------------------------------------------------

::

          Items are listed on one or more lines and separated by whitespace
          (space+tab).  Comments begin with # and are ignored. Empty lines
          are ignored. Lines where the first non-whitespace character is
          one of "%&'()*+,-./:;<=>?_ are also ignored to reserve for future
          syntax.

          Items for removal or extraction may contain a single * wildcard
          character. The * matches zero or more characters. If -m,
          --matchmode noslash is set, then the * character does not match
          the / character.

          Items must be listed relative to the package, and the --sourcedir
          or the --destdir path will be prepended. The paths are only
          prepended to item filenames while adding or extracting items, not
          to ICU .dat package or list filenames.

          Paths may contain / instead of the platform's file separator
          character and are converted as appropriate.


-------------------------------------------------------

::

          Markus Scherer
          George Rhoten


-------------------------------------------------------

::

          1.0


-----------------------------------------------------------

::

          Copyright (C) 2006 IBM, Inc. and others.


---------------------------------------------------------

::

          pkgdata(1) genrb(1)

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

   ICU MANPAGE                  18 August 2006                    ICUPKG(8)

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
