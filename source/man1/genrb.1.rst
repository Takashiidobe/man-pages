.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

genrb(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `INVARIANT CHAR                   |                                   |
| ACTERS <#INVARIANT_CHARACTERS>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `VERSION <#VERSION>`__ \|      |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GENRB(1)                    ICU 70.0.1 Manual                   GENRB(1)

NAME
-------------------------------------------------

::

          genrb - compile a resource bundle


---------------------------------------------------------

::

          genrb [ -h, -?, --help ] [ -V, --version ] [ -v, --verbose ] [
          -e, --encoding encoding ] [ -j, --write-java [ encoding ] ] [ -s,
          --sourcedir source ] [ -d, --destdir destination ] [ -i,
          --icudatadir directory ] bundle ...


---------------------------------------------------------------

::

          genrb converts the resource bundle source files passed on the
          command line to their binary form or to a Java source file for
          use with ICU4J.  The resulting binary files have a .res extension
          while resource bundle source files typically have a .txt
          extension. Java source files have a java extension and follow the
          ICU4J naming conventions.

          It is customary to name the resource bundles by their locale
          name, i.e. to use a local identifier for the bundle filename,
          e.g.  ja_JP.txt for Japanese (Japan) data, or root.txt for the
          root bundle.  In any case, genrb will produce a file whose base
          name is the name of the locale found in the resource file, not
          the base name of the resource file itself.

          The binary files can be read directly by ICU, or used by
          pkgdata(1) for incorporation into a larger archive or library.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -V, --version
                 Print the version of genrb and exit.

          -v, --verbose
                 Display extra informative messages during execution.

          -e, --encoding encoding
                 Set the encoding used to read input files to encoding.
                 The default encoding is the invariant (subset of ASCII or
                 EBCDIC) codepage for the system (see section INVARIANT
                 CHARACTERS).  The encodings UTF-8, UTF-16BE, and UTF-16LE
                 are automatically detected if a byte order mark (BOM) is
                 present.

          -j, --write-java [ encoding ]
                 Generate a Java source code for use with ICU4J. An
                 optional encoding for the Java file can be given.

          -s, --sourcedir source
                 Set the source directory to source.  The default source
                 directory is specified by the environment variable
                 ICU_DATA, or the location set when ICU was built if
                 ICU_DATA is not set.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is specified by the environment
                 variable ICU_DATA or is the location set when ICU was
                 built if ICU_DATA is not set.

          -i, --icudatadir directory
                 Look for any necessary ICU data files in directory.  For
                 example, when processing collation overrides, the file
                 ucadata.dat must be located.  The default ICU data
                 directory is specified by the environment variable
                 ICU_DATA.


---------------------------------------------------------------------------------

::

          The invariant character set consists of the following set of
          characters, expressed as a standard POSIX regular expression: [a-
          z]|[A-Z]|[0-9]|_| |+|-|*|/.  This is the set which is guaranteed
          to be available regardless of code page.


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

          Copyright (C) 2000-2002 IBM, Inc. and others.


---------------------------------------------------------

::

          derb(1)
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

   ICU MANPAGE                   16 April 2002                     GENRB(1)

--------------

Pages that refer to this page: `derb(1) <../man1/derb.1.html>`__, 
`icupkg(8) <../man8/icupkg.8.html>`__

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
