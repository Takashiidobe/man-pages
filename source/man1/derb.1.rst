.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

derb(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `INVARIANT CHAR                   |                                   |
| ACTERS <#INVARIANT_CHARACTERS>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DERB(1)                     ICU 70.0.1 Manual                    DERB(1)

NAME
-------------------------------------------------

::

          derb - disassemble a resource bundle


---------------------------------------------------------

::

          derb [ -h, -?, --help ] [ -V, --version ] [ -v, --verbose ] [ -e,
          --encoding encoding ] [ --bom ] [ -t, --truncate [ size ] ] [ -s,
          --sourcedir source ] [ -d, --destdir destination ] [ -i,
          --icudatadir directory ] [ -c, --to-stdout ] bundle ...


---------------------------------------------------------------

::

          derb reads the compiled resource bundle files passed on the
          command line and write them back in text form.  The resulting
          text files have a .txt extension while compiled resource bundle
          source files typically have a .res extension.

          It is customary to name the resource bundles by their locale
          name, i.e. to use a local identifier for the bundle filename,
          e.g.  ja_JP.res for Japanese (Japan) data, or root.res for the
          root bundle.  This is especially important for derb since the
          locale name is not accessible directly from the compiled resource
          bundle, and to know which locale to ask for when opening the
          bundle.  derb will produce a file whose base name is the base
          name of the compiled resource file itself.  If the --to-stdout,
          -c option is used, however, the text will be written on the
          standard output.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -V, --version
                 Print the version of derb and exit.

          -v, --verbose
                 Display extra informative messages during execution.

          -A, --suppressAliases
                 Don't follow aliases when producing output.

          -e, --encoding encoding
                 Set the encoding used to write output files to encoding.
                 The default encoding is the invariant (subset of ASCII or
                 EBCDIC) codepage for the system (see section INVARIANT
                 CHARACTERS).  The choice of the encoding does not affect
                 the data, just their representation. Characters that
                 cannot be represented in the encoding will be represented
                 using \uhhhh escape sequences.

          --bom  Write a byte order mark (BOM) at the beginning of the
                 file.

          -l, --locale locale
                 Set the locale for the resource bundle, which is used both
                 in the generated text and as the base name of the output
                 file.

          -t, --truncate [ size ]
                 Truncate individual resources (strings or binary data) to
                 size bytes. The default if size is not specified is 80
                 bytes.

          -s, --sourcedir source
                 Set the source directory to source.  The default source
                 directory is the current directory.  If - is passed for
                 source, then the bundle will be looked for in its default
                 location, specified by the ICU_DATA environment variable
                 (or defaulting to the location set when ICU was built if
                 ICU_DATA is not set).

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

          -c, --to-stdout
                 Write the disassembled bundle on standard output instead
                 of into a file.


-------------------------------------------------------

::

          When the option --bom is used, the character U+FEFF is written in
          the destination encoding regardless of whether it is a Unicode
          transformation format (UTF) or not.  This option should only be
          used with an UTF encoding, as byte order marks are not meaningful
          for other encodings.


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

          Vladimir Weinstein
          Yves Arrouye


-------------------------------------------------------

::

          1.0


-----------------------------------------------------------

::

          Copyright (C) 2002 IBM, Inc. and others.


---------------------------------------------------------

::

          genrb(1)

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

   ICU MANPAGE                    7 Mar 2014                        DERB(1)

--------------

Pages that refer to this page: `genrb(1) <../man1/genrb.1.html>`__

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
