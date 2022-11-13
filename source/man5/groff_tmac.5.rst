.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_tmac(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `Ma                               |                                   |
| cro packages <#Macro_packages>`__ |                                   |
| \| `Naming <#Naming>`__ \|        |                                   |
| `Inclusion <#Inclusion>`__ \|     |                                   |
| `Wr                               |                                   |
| iting macros <#Writing_macros>`__ |                                   |
| \| `Authors <#Authors>`__ \|      |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_tmac(5)              File Formats Manual             groff_tmac(5)


-------------------------------------------------

::

          groff_tmac - macro files in the GNU roff typesetting system


---------------------------------------------------------------

::

          Definitions of macros, strings, and registers for use in a
          roff(7) document can be collected into macro files, roff input
          files designed to produce no output themselves but instead ease
          the preparation of other roff documents.  There is no syntactical
          difference between a macro file and any other roff document; only
          its purpose distinguishes it.  When a macro file is installed at
          a standard location and suitable for use by a general audience,
          it is often termed a macro package.  Macro packages can be loaded
          by supplying the -m option to groff(1) or troff(1).
          Alternatively, a groff document wishing to use a macro package
          can load it with the mso (“macro source”) request.

          Each macro package stores its macro, string, and register
          definitions in one or more tmac files.  This name originated in
          early Unix culture as an abbreviation of “troff macros”.

          A macro package must be named name.tmac and be placed in a “tmac
          directory” to be loadable with the -m option.  Section
          “Environment” of troff(1) lists these directories.  Like any
          other roff document, a macro package can use the “so” request
          (“source”) to load further files relative to its own location.


---------------------------------------------------------------------

::

          Macro packages come in two varieties; those which assume
          responsibility for page layout and other critical functions
          (“major” or “full-service”) and those which do not
          (“supplemental” or “auxiliary”).  GNU roff provides most major
          macro packages found in AT&T and BSD Unix systems, an additional
          full-service package, and many supplemental packages.  Multiple
          full-service macro packages cannot be used by the same document.
          Auxiliary packages can generally be freely combined, though
          attention to their use of the groff language name spaces for
          identifiers (particularly registers, macros, strings, and
          diversions) should be paid.  Name space management was a
          significant challenge in AT&T troff; groff's support for
          arbitrarily long identifiers affords few excuses for name
          collisions, apart from attempts at compatibility with the demands
          of historical documents.

      Man pages
          an
          man    an is used to compose man pages in the format originating
                 in Version 7 Unix (1979).  It has a small macro interface
                 and is widely used; see groff_man(7).

          doc
          mdoc   doc is used to compose man pages in the format originating
                 in 4.3BSD-Reno (1990).  It provides many more features
                 than an, but is also larger, more complex, and not as
                 widely adopted; see groff_mdoc(7).

          Because readers of man pages often do not know in advance which
          macros are used to format a given document, a wrapper is
          available.

          andoc
          mandoc This macro file, specific to groff, recognizes whether a
                 document uses man or mdoc format and loads the
                 corresponding macro package.  Multiple man pages, in
                 either format, can be handled; andoc reloads each macro
                 package as necessary.

      Full-service packages
          The packages in this section provide a complete set of macros for
          writing documents of any kind, up to whole books.  They are
          similar in functionality; it is a matter of taste which one to
          use.

          me     The classical me macro package; see groff_me(7).

          mm     The semi-classical mm macro package; see groff_mm(7).

          mom    The mom macro package, only available in groff.  As this
                 was not based on other packages, it was freely designed as
                 quite a nice, modern macro package.  See groff_mom(7).

          ms     The classical ms macro package; see groff_ms(7).

      Localization packages
          For Western languages, the localization file sets the hyphenation
          mode and loads hyphenation patterns and exceptions.  Localization
          files can also adjust the date format and provide translations of
          strings used by some of the full-service macro packages; alter
          the input encoding (see the next section); and change the amount
          of inter-sentence space.  By default, troffrc loads the
          localization file for English.

          As of groff 1.23.0, the following localization files exist.

          cs     Czech; localizes me, mm, mom, and ms.  Sets the input
                 encoding to Latin-2 by loading latin2.tmac.

          de
          den    German; localizes me, mm, mom, and ms.  Sets the input
                 encoding to Latin-1 by loading latin1.tmac.

                 de.tmac selects hyphenation patterns for traditional
                 orthography, and den.tmac does the same for the new
                 orthography (“Rechtschreibreform”).

          en     English.

          fr     French; localizes me, mm, mom, and ms.  Sets the input
                 encoding to Latin-9 by loading latin9.tmac.

          it     Italian; localizes me, mm, mom, and ms.

          ja     Japanese.

          sv     Swedish; localizes me, mm, mom, and ms.  Sets the input
                 encoding to Latin-1 by loading latin1.tmac.  Some of the
                 localization of the mm package is handled separately; see
                 groff_mmse(7).

          zh     Chinese.

      Input encodings
          latin1
          latin2
          latin5
          latin9 Various input encodings supported directly by groff.
                 Normally, this macro is loaded at the very beginning of a
                 document or specified as the first macro argument on the
                 command line.  groff loads latin1 by default at start-up.
                 These macro packages don't work on EBCDIC hosts.

          cp1047 Encoding support for EBCDIC.  On those platforms it is
                 loaded automatically at start-up.  Due to different
                 character ranges used in groff it doesn't work on
                 architectures which are based on ASCII.

          Some input encoding characters may not be available for a
          particular output device.  For example, saying

          groff -Tlatin1 -mlatin9 ...

          fails if you use the Euro character in the input.  Usually, this
          limitation is present only for drivers which have a limited set
          of output glyphs (ascii, latin1); for other drivers it is usually
          sufficient to install proper fonts which contain the necessary
          glyphs.

      Auxiliary packages
          The macro packages in this section are not intended for stand-
          alone use, but can add functionality to any other macro package
          or to plain (or “raw”) groff documents.

          62bit  Provides macros for addition, multiplication, and division
                 of 62-bit integers (allowing safe multiplication of 31-bit
                 integers, for example).

          ec     Switch to the EC and TC font families.  To be used with
                 grodvi(1) — this man page also gives more details of how
                 to use it.

          hdtbl  The Heidelberger table macros, contributed by Joachim
                 Walsdorff, allow the generation of tables through a syntax
                 similar to the HTML table model.  Note that hdtbl is a
                 macro package, not a preprocessor like tbl(1).  hdtbl
                 works only with the ps and pdf output drivers.  See
                 groff_hdtbl(7).

          papersize
                 This macro file is normally loaded at start-up by the
                 troffrc file.  It provides an interface to set the paper
                 size on the command line with the option -d paper=size or
                 troff.  Possible values for size are the ISO and DIN
                 formats “A0–A6”, “B0–B6”, “C0–C6”, and “D0–D6”; the U.S.
                 formats “letter”, “legal”, “tabloid”, “ledger”,
                 “statement”, and “executive”; and the envelope formats
                 “com10”, “monarch”, and “DL”.  All formats, even those for
                 envelopes, are in portrait orientation, with their longer
                 dimension as the length.  Appending “l” (ell) to any of
                 these denotes landscape orientation instead.  An output
                 device typically requires command-line options -p and -l
                 to override the paper dimensions and orientation,
                 respectively, defined in its DESC file; see subsection
                 “Paper sizes” of groff(1).

          pdfpic A single macro is provided in this file, PDFPIC, to
                 include a PDF graphic in a document, i.e., under the
                 output driver pdf.  For all other drivers, pspic is used.
                 So pdfpic is an extension of pspic.  This means you can
                 safely replace all PSPIC with PDFPIC; nothing gets lost by
                 that.  The options of PDFPIC are identical to the PSDIF
                 options.

          pic    This file provides proper definitions for the macros PS
                 and PE, needed for the pic(1) preprocessor.  They center
                 each picture.  Use it only if your macro package doesn't
                 provide proper definitions for those two macros (most of
                 them already do).

          pspic  A single macro is provided in this file, PSPIC, to include
                 a PostScript graphic in a document.  The ps, dvi, html,
                 and xhtml output drivers support inclusion of PS images;
                 for all other drivers the image is replaced with a hollow
                 rectangle of the same size.  This macro file is
                 automatically loaded at start-up by troff so it isn't
                 necessary to call it explicitly.

                 Syntax:

                        .PSPIC [-L|-R|-C|-I n] file [width [height]]

                 file is the name of the PostScript file; width and height
                 give the desired width and height of the image.  If
                 neither a width nor a height argument is specified, the
                 image's natural width (as given in the file's bounding
                 box) or the current line length is used as the width,
                 whatever is smaller.  The width and height arguments may
                 have scaling indicators attached; the default scaling
                 indicator is i.  This macro scales the graphic uniformly
                 in the x and y directions so that it is no more than width
                 wide and height high.  Option -C centers the graphic
                 horizontally, which is the default.  The -L and -R options
                 left-align and right-align the graphic, respectively.  The
                 -I option indents the graphic by n (default scaling
                 indicator is m).

                 For use of .PSPIC within a diversion it is recommended to
                 extend it with the following code, assuring that the
                 diversion's width completely covers the image's width.

                        .am PSPIC
                        .  vpt 0
                        \h'(\\n[ps-offset]u + \\n[ps-deswid]u)'
                        .  sp -1
                        .  vpt 1
                        ..

          ptx    A single macro is provided in this file, xx, for
                 formatting permuted index entries as produced by the GNU
                 ptx(1) program.  If you need different formatting, copy
                 the macro into your document and adapt it to your needs.

          rfc1345
                 defines special character escape sequences based on the
                 glyph mnemonics specified in RFC 1345 and the digraph
                 table of the text editor Vim.  See groff_rfc1345(7).

          trace  Use this for tracing macro calls.  It is only useful for
                 debugging.  See groff_trace(7).

          tty-char
                 Defines fallback definitions of roff special characters
                 for terminal devices.  These definitions more poorly
                 optically approximate typeset output compared to those of
                 the tty file in favor of communicating more semantic
                 information, which can allow easier processing with
                 critical equipment.

          www    Additions of elements known from the HTML format, as used
                 in World Wide Web pages; this includes URL links and mail
                 addresses.  See groff_www(7).


-----------------------------------------------------

::

          Classical roff systems were designed before the conventions of
          the modern C getopt(3) call evolved, and used a naming scheme for
          macro packages that looks odd to modern eyes.  Macro packages
          were always included with the option -m; when this option was
          directly followed by its argument without an intervening space,
          this looked like a long option preceded by a single minus — a
          sensation in the computer stone age.  To make this invocation
          form work, classical troff macro packages used names that started
          with the letter ‘m’, which was omitted in the naming of the macro
          file.

          For example, the macro package for the man pages was called man,
          while its macro file tmac.an.  So it could be activated by the
          argument an to option -m, or -man for short.

          For similar reasons, macro packages that did not start with an
          ‘m’ had a leading ‘m’ added in the documentation and in speech;
          for example, the package corresponding to tmac.doc was called
          mdoc in the documentation, although a more suitable name would be
          doc.  For, when omitting the space between the option and its
          argument, the command-line option for activating this package
          reads -mdoc.

          To cope with all situations, actual versions of groff(1) are
          smart about both naming schemes by providing two macro files for
          the inflicted macro packages; one with a leading ‘m’ the other
          one without it.  So in groff, the man macro package may be
          specified as one of the following four methods:

                 sh# groff -m man
                 sh# groff -man
                 sh# groff -mman
                 sh# groff -m an

          Recent packages that do not start with ‘m’ do not use an
          additional ‘m’ in the documentation.  For example, the www macro
          package may be specified only as one of the two methods:

                 sh# groff -m www
                 sh# groff -mwww

          Obviously, variants like -mmwww would not make much sense.

          A second strange feature of classical troff was to name macro
          files in the form tmac.name.  In modern operating systems, the
          type of a file is specified as a postfix, the file name
          extension.  Again, groff copes with this situation by searching
          for both anything.tmac and tmac.anything if only anything is
          specified.

          The easiest way to find out which macro packages are available on
          a system is to check the man page groff(1), or the contents of
          the tmac directories.

          In groff, most macro packages are described in man pages called
          groff_name(7), with a leading ‘m’ for the classical packages.


-----------------------------------------------------------

::

          There are several ways to use a macro package in a document.  The
          classical way is to specify the troff/groff option -m name at run
          time; this makes the contents of the macro package name
          available.  In groff, the file name.tmac is searched within the
          tmac path; if not found, tmac.name is searched for instead.

          Alternatively, it is also possible to include a macro file by
          adding the request .so filename to the document; the argument
          must be the full file name of an existing file, possibly with the
          directory where it is kept.  In groff, this was improved by the
          similar request .mso package, which added searching in the tmac
          path, just like option -m does.

          In order to resolve the .so and .mso requests, the roff
          preprocessor soelim(1) must be called if the files to be included
          need preprocessing.  This can be done either directly by a
          pipeline on the command line or by using the troff/groff option
          -s.  man calls soelim automatically.

          For example, suppose a macro file is stored as

                 /usr/local/share/groff/1.23.0/tmac/macros.tmac

          and is used in some document called docu.roff.

          At run time, the formatter call for this is

                 sh# groff -m macros docu.roff

          To include the macro file directly in the document, use either

                 .mso macros.tmac

          or

                 .so /usr/local/share/groff/1.23.0/tmac/macros.tmac

          In both cases, the formatter should be called with option -s to
          invoke soelim.

                 sh# groff -s docu.roff


---------------------------------------------------------------------

::

          A roff(7) document is a text file that is enriched by predefined
          formatting constructs, such as requests, escape sequences,
          strings, numeric registers, and macros from a macro package.
          These elements are described in roff(7).

          To give a document a personal style, it is most useful to extend
          the existing elements by defining some macros for repeating
          tasks; the best place for this is near the beginning of the
          document or in a separate file.

          Macros without arguments are just like strings.  But the full
          power of macros occurs when arguments are passed with a macro
          call.  Within the macro definition, the arguments are available
          as the escape sequences \$1, ..., \$9, \$[...], \$*, and \$@, the
          name under which the macro was called is in \$0, and the number
          of arguments is in register \n[.$]; see groff(7).

      Draft mode
          Writing groff macros is easy when the escaping mechanism is
          temporarily disabled.  In groff, this is done by enclosing the
          macro definition(s) within a pair of .eo and .ec requests.  Then
          the body in the macro definition is just like a normal part of
          the document — text enhanced by calls of requests, macros,
          strings, registers, etc.  For example, the code above can be
          written in a simpler way by

                 .eo
                 .ds midpart was called with the following
                 .de print_args
                 \f[I]\$0\f[] \*[midpart] \n[.$] arguments:
                 \$*
                 ..
                 .ec

          Unfortunately, draft mode cannot be used universally.  Although
          it is good enough for defining normal macros, draft mode fails
          with advanced applications, such as indirectly defined strings,
          registers, etc.  An optimal way is to define and test all macros
          in draft mode and then do the backslash doubling as a final step;
          do not forget to remove the .eo request.

      Tips for macro definitions
          •      Start every line with a dot, for example, by using the
                 groff request .nop for text lines, or write your own macro
                 that handles also text lines with a leading dot.

                        .de Text
                        .  if (\\n[.$] == 0) \
                        .    return
                        .  nop \)\\$*\)
                        ..

          •      Write a comment macro that works both for copy and draft
                 modes; since the escape character is off in draft mode,
                 trouble might occur when comment escapes are used.  For
                 example, the following macro just ignores its arguments,
                 so it acts like a comment line:

                        .de c
                        ..
                        .c This is like a comment line.

          •      In long macro definitions, make ample use of comment lines
                 or almost-empty lines (this is, lines which have a leading
                 dot and nothing else) for a better structuring.

          •      To increase readability, use groff's indentation facility
                 for requests and macro calls (arbitrary whitespace after
                 the leading dot).

      Diversions
          Diversions can be used to implement quite advanced programming
          constructs.  They are comparable to pointers to large data
          structures in the C programming language, but their usage is
          quite different.

          In their simplest form, diversions are multi-line strings, but
          diversions get their power when used dynamically within macros.
          The (formatted) information stored in a diversion can be
          retrieved by calling the diversion just like a macro.

          Most of the problems arising with diversions can be avoided if
          you remember that diversions always store complete lines.  Using
          diversions when the line buffer has not been flushed produces
          strange results; not knowing this, many people get desperate
          about diversions.  To ensure that a diversion works, add line
          breaks at the right places.  To be safe, enclose everything that
          has to do with diversions within a pair of line breaks; for
          example, by explicitly using .br requests.  This rule should be
          applied to diversion definition, both inside and outside, and to
          all calls of diversions.  This is a bit of overkill, but it works
          nicely.

          (If you really need diversions which should ignore the current
          partial line, use environments to save the current partial line
          and/or use the .box request.)

          The most powerful feature using diversions is to start a
          diversion within a macro definition and end it within another
          macro.  Then everything between each call of this macro pair is
          stored within the diversion and can be manipulated from within
          the macros.


-------------------------------------------------------

::

          This document was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩ and Werner Lemberg ⟨wl@gnu.org⟩.


---------------------------------------------------------

::

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          The Filesystem Hierarchy Standard 
          ⟨https://wiki.linuxfoundation.org/lsb/fhs⟩ is maintained by the
          Linux Foundation.

          groff(1)
                 is an overview of the groff system.

          groff_man(7),
          groff_mdoc(7),
          groff_me(7),
          groff_mm(7),
          groff_mom(7),
          groff_ms(7),
          groff_rfc1345(7),
          groff_trace(7),
                  and
          groff_www(7)
                 are groff macro packages.

          groff(7)
                 summarizes the language recognized by GNU troff.

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                groff_tmac(5)

--------------

Pages that refer to this page:
`glilypond(1) <../man1/glilypond.1.html>`__, 
`grodvi(1) <../man1/grodvi.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`grops(1) <../man1/grops.1.html>`__, 
`troff(1) <../man1/troff.1.html>`__, 
`groff(7) <../man7/groff.7.html>`__, 
`groff_trace(7) <../man7/groff_trace.7.html>`__, 
`roff(7) <../man7/roff.7.html>`__

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
