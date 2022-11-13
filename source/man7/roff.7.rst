.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

roff(7) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `History <#History>`__ \|         |                                   |
| `Using [22mroff[24m [1m <#Us   |                                   |
| ing_%5B22mroff%5B24m_%5B1m>`__ |                                   |
| \|                                |                                   |
| `roff <#%3Ci%3Ero                 |                                   |
| ff%3C/i%3E%3Ch2%3Eprogramming>`__ |                                   |
|                                   |                                   |
| programming \|                    |                                   |
| `File name exte                   |                                   |
| nsions <#File_name_extensions>`__ |                                   |
| \|                                |                                   |
| `E                                |                                   |
| diting [22mroff[24m [1m <#Edit |                                   |
| ing_%5B22mroff%5B24m_%5B1m>`__ |                                   |
| \| `Authors <#Authors>`__ \|      |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   roff(7)             Miscellaneous Information Manual             roff(7)


-------------------------------------------------

::

          roff - concepts and history of roff typesetting


---------------------------------------------------------------

::

          The term roff describes a family of document formatting systems
          known by names like troff, nroff, ditroff, and groff.  A roff
          system consists of an extensible text formatting language and a
          set of programs for printing and converting to other text
          formats.  Unix-like operating systems often distribute a roff
          system as a core package.

          The most common roff system today is GNU roff, groff(1).  groff
          retains the input conventions and functionality of its ancestors,
          with many extensions.  The ancestry of roff is described in
          section “History” below.  In this document, the term roff
          generally refers to this class of programs, with the exception of
          a roff(1) command provided in early Unix systems.  In spite of
          its age, roff remains in wide use today; for example, the manual
          pages on Unix systems (“man pages”), books about software and
          programming, and technical memoranda are written in roff.

          This document describes the history of the development of the
          “roff system”, typographical concepts that form the common
          background of all roff implementations, details on the roff
          pipeline which is usually hidden behind front ends like groff(1),
          a general overview of the formatting language, some tips for
          editing roff files, and many suggestions for further reading.


-------------------------------------------------------

::

          Computer-driven document formatting dates back to the 1960s.  The
          roff system itself is intimately connected with the Unix
          operating system, but its roots go back to the earlier operating
          systems CTSS and Multics.

      The predecessor—RUNOFF
          roff's ancestor RUNOFF was written in the MAD language by Jerry
          Saltzer to prepare his Ph.D. thesis using the Compatible Time
          Sharing System (CTSS), a project of the Massachusetts Institute
          of Technology (MIT).  The program is generally referred to in
          full capitals, both to distinguish it from its many descendants,
          and because bits were expensive in those days; five- and six-bit
          character encodings were still in widespread usage, and mixed-
          case alphabetics seen as a luxury.  RUNOFF introduced a syntax of
          inlining formatting directives amid document text, by beginning a
          line with a period (an unlikely occurrence in human-readable
          material) followed by a “control word”.  Control words with
          obvious meaning like “.line length n” were supported as well as
          an abbreviation system; the latter came to overwhelm the former
          in popular usage and later derivatives of the program.  A sample
          of control words from a RUNOFF manual of December 1966 
          ⟨http://web.mit.edu/Saltzer/www/publications/ctss/AH.9.01.html⟩
          was documented as follows with only a slight update to parameter
          syntax.  They will be familiar to roff veterans.

                           Abbreviation   Control word
                                    .ad   .adjust
                                    .bp   .begin page
                                    .br   .break
                                    .ce   .center
                                    .in   .indent n
                                    .ll   .line length n
                                    .nf   .nofill
                                    .pl   .paper length n
                                    .sp   .space [n]

          In 1965, MIT's Project MAC teamed with Bell Telephone
          Laboratories and General Electric (GE) to inaugurate the Multics
          ⟨http://www.multicians.org⟩ project.  After a few years, Bell
          Labs discontinued its participation in Multics, famously
          prompting the development of Unix.  Meanwhile, Saltzer's RUNOFF
          proved influential, seeing many ports and derivations elsewhere.

          In 1969, Doug McIlroy wrote one such reimplementation of RUNOFF
          in the BCPL language for a GE 645 running GECOS at the Bell Labs
          location in Murray Hill, New Jersey.  In its manual, the control
          commands were termed “requests”, their two-letter names were
          canonical, and the control character was configurable with a .cc
          request.  Other familiar requests emerged at this time; no-adjust
          (.na), need (.ne), page offset (.po), tab configuration (.ta,
          though it worked differently), temporary indent (.ti), character
          translation (.tr), and automatic underlining (.ul; on RUNOFF you
          had to backspace and underscore in the input yourself).  .fi to
          enable filling of output lines got the name it retains to this
          day.

      Unix and roff
          By 1971, McIlroy's runoff had been rewritten in DEC PDP-11
          assembly language by Dennis Ritchie for the fledgling Unix
          operating system and seen its name shortened to roff (perhaps
          under the influence of Ken Thompson), but had added support for
          automatic hyphenation with .hc and .hy requests; a generalization
          of line spacing control with the .ls request; and what later
          roffs would call diversions, with “footnote” requests.  This roff
          indirectly funded operating systems research at Murray Hill, for
          it was used to prepare patent applications for AT&T to the U.S.
          government.  This arrangement enabled the group to acquire the
          aforementioned PDP-11; roff promptly proved equal to the task of
          typesetting the first edition of the manual for what would later
          become known as “v1 Unix”, dated November 1971.

          Output from all of the foregoing programs was limited to line
          printers and paper terminals such the IBM 2471 (based on the
          Selectric line of typewriters) and the Teletype Corporation Model
          37.  Proportionally-spaced type was unknown.

      New roff and Typesetter roff
          The first years of Unix were spent in rapid evolution.  The
          practicalities of preparing standardized documents like patent
          applications (and Unix manual pages), combined with McIlroy's
          enthusiasm for macro languages, perhaps created an irresistible
          pressure to make roff extensible.  Joe Ossanna's nroff, literally
          a “new roff”, was the outlet for this pressure.  By the time of
          Version 3 Unix (February 1973)—and still in PDP-11 assembly
          language—it sported a swath of features now considered essential
          to roff systems; definition of macros (.de), diversion of text
          thence (.di), and removal thereof (.rm); trap planting (.wh;
          “when”) and relocation (.ch; “change”); conditional processing
          (.if); and environments (.ev).  Incremental improvements included
          assignment of the next page number (.pn); no-space mode (.ns) and
          restoration of vertical spacing (.rs); the saving (.sv) and
          output (.os) of vertical space; specification of replacement
          characters for tabs (.tc) and leaders (.lc); configuration of the
          no-break control character (.c2); shorthand to disable automatic
          hyphenation (.nh); a condensation of what were formerly six
          different requests for configuration of page “titles” (headers
          and footers) into one (.tl) with a length controlled separately
          from the line length (.lt); automatic line numbering (.nm);
          interactive input (.rd), which necessitated buffer-flushing
          (.fl), and was made convenient with early program cessation
          (.ex); source file inclusion in its modern form (.so; though
          RUNOFF had an “.append” control word for a similar purpose) and
          early advance to the next file argument (.nx); ignorable content
          (.ig); and programmable abort (.ab).

          Third Edition Unix also brought the pipe(2) system call, the
          explosive growth of a componentized system based around it, and a
          “filter model” that remains perceptible today.  Around this time,
          Michael Lesk developed the tbl preprocessor for formatting
          tables.  Equally importantly, the Bell Labs site in Murray Hill
          acquired a Graphic Systems C/A/T phototypesetter, and with it
          came the necessity of expanding the capabilities of a roff system
          to cope with proportionally-spaced type, multiple point sizes,
          and a variety of fonts.  Ossanna wrote a parallel implementation
          of nroff for the C/A/T, dubbing it troff (for “typesetter roff”).
          Unfortunately, surviving documentation does not illustrate what
          requests were implemented at this time for C/A/T support; the
          troff(1) man page in Fourth Edition Unix (November 1973) does not
          feature a request list, unlike nroff(1).  Apart from typesetter-
          driven features, Version 4 Unix roffs added string definitions
          (.ds); made the escape character configurable (.ec); and enabled
          the user to write diagnostics to the standard error stream (.tm).
          Around 1974, empowered with multiple type sizes, italics, and a
          symbol font specially commissioned by Bell Labs from Graphic
          Systems, Brian Kernighan and Lorinda Cherry implemented eqn for
          typesetting mathematics.  In the same year, for Fifth Edition
          Unix, Ossanna combined and reimplemented the two roffs in C,
          using preprocessor conditions of that language to generate both
          from a single source tree.

          Ossanna documented the syntax of the input language to the nroff
          and troff programs in the “Troff User's Manual”, first published
          in 1976, with further revisions as late as 1992 by Kernighan.
          (The original version was entitled “Nroff/Troff User's Manual”,
          which may partially explain why roff practitioners have tended to
          refer to it by its AT&T document identifier, “CSTR #54”.)  Its
          final revision serves as the de facto specification of AT&T
          troff, and all subsequent implementors of roff systems have done
          so in its shadow.

          A small and simple set of roff macros was first used for the
          manual pages of Version 4 Unix and persisted for two further
          releases, but the first macro package to be formally described
          and installed was ms by Lesk in Version 6.  He also wrote a
          manual, “Typing Documents on the Unix System”, describing ms and
          basic nroff/troff usage, updating it as the package accrued
          features.

          For Version 7 Unix (January 1979), McIlroy designed, implemented,
          and documented the man macro package, introducing most of the
          macros described in groff_man(7) today, and edited volume 1 of
          the Version 7 manual using it.  Documents composed using ms
          featured in volume 2, edited by Kernighan.

          Ossanna had passed away unexpectedly in 1977, and after the
          release of Version 7, with the C/A/T typesetter becoming
          supplanted by alternative devices, Kernighan undertook a revision
          and rewrite of troff to generalize its design.  To implement this
          revised architecture, he developed the font and device
          description file formats and the device-independent output format
          that remain in use today.  He described these novelties in the
          article “A Typesetter-independent TROFF”, last revised in 1982,
          and like the troff manual itself, it is widely known by a
          shorthand, “CSTR #97”.

          Kernighan's innovations prepared troff well for the introduction
          of the Adobe PostScript language in 1982 and a vibrant market in
          laser printers with built-in interpreters for it.  An output
          driver for PostScript, dpost, was swiftly developed.  However,
          due to AT&T software licensing practices, Ossanna's troff, with
          its tight coupling to the capabilities of the C/A/T, remained in
          parallel distribution with device-independent troff throughout
          the 1980s, leading some developers to contrive translators for
          C/A/T-formatted documents to other devices.  An example was
          vtroff for Versatec and Benson-Varian plotters.  Today, however,
          all actively maintained troffs follow Kernighan's device-
          independent design.

      groff—a free roff from GNU
          The most important free roff project historically has been groff,
          the GNU implementation of troff, developed from scratch by James
          Clark starting in 1989 and distributed under copyleft 
          ⟨http://www.gnu.org/copyleft⟩ licenses, ensuring to all the
          availability of source code and the freedom to modify and
          redistribute it, properties unprecedented in roff systems to that
          point.  groff rapidly attracted contributors, and has served as a
          complete replacement for almost all applications of AT&T troff
          (exceptions include mv, a macro package for preparation of
          viewgraphs and slides, and the ideal preprocessor for producing
          diagrams from a constraint-based language).  Beyond that, it has
          added numerous features; see groff_diff(7).  Since its inception
          and for at least the following three decades, it has been used by
          practically all GNU/Linux and BSD operating systems.

          groff continues to be developed, is available for almost all
          operating systems in common use (along with several obscure
          ones), and it is free.  These factors make groff the de facto
          roff standard today.

      Heirloom Doctools troff
          An alternative is Gunnar Ritter's Heirloom roff project 
          ⟨https://github.com/n-t-roff/heirloom-doctools⟩ project, started
          in 2005, which provides enhanced versions of the various roff
          tools found in the OpenSolaris and Plan 9 operating systems, now
          available under free licenses.  You can get this package with the
          shell command:
                 $ git clone https://github.com/n-t-roff/heirloom-doctools

          Moreover, one finds there the Original Documenter's Workbench
          Release 3.3 ⟨https://github.com/n-t-roff/DWB3.3⟩.


-------------------------------------------------------------------------------------------------

::

          Many people use roff frequently without knowing it.  When you
          read a system manual page (man page), it is often a roff working
          in the background to render it.  But using a roff explicitly
          isn't difficult.

          Some roff implementations provide wrapper programs that make it
          easy to use the roff system from the shell's command line.  These
          can be specific to a macro package, like mmroff(1), or more
          general.  groff(1) provides command-line options sparing the user
          from constructing the long, order-dependent pipelines familiar to
          AT&T troff users.  Further, a heuristic program, grog(1), is
          available to infer from a document's contents which groff
          arguments should be used to process it.

      The roff pipeline
          Each roff system consists of preprocessors, one or more roff
          formatter programs, and a set of output drivers (or “device
          postprocessors”).  This arrangement is designed to take advantage
          of a landmark Unix innovation in inter-process communication: the
          pipe.  That is, a series of programs termed a “pipeline” is
          called together where the output of each program in the sequence
          is taken as the input for the next program, without (necessarily)
          passing through temporary files on a disk.  (On non-Unix systems,
          pipelines may have to be simulated.)

                 $ preproc1 < input-file | preproc2 | ... | troff [option  ...] \
                     | output-driver

          One all preprocessors have run, they deliver a pure roff document
          to the formatter, which in turn generates intermediate output
          that is fed into an output driver for viewing, printing, or
          further processing.

          All of these parts use programming languages of their own; each
          language is totally unrelated to the other parts.  Moreover, roff
          macro packages that are tailored for special purposes can be
          included.

          Most roff input files use the macros of a document formatting
          package, intermixed with instructions for one or more
          preprocessors, seasoned with escape sequences and requests
          directly from the roff language.  Some documents are simpler
          still, since their formatting packages discourage direct use of
          roff requests; man pages are a prominent example.  The full power
          of the roff formatting language is seldom needed by users; only
          programmers of macro packages need a substantial command of it.

      Preprocessors
          A roff preprocessor is any program that generates output that
          syntactically obeys the rules of the roff formatting language.
          Each preprocessor defines a language of its own that is
          translated into roff code when run through the preprocessor
          program.  Parts written in these languages may be included within
          a roff document; they are identified by special roff requests or
          macros.  Each document that is enhanced by preprocessor code must
          be run through all corresponding preprocessors before it is fed
          into the actual roff formatter program, for the formatter just
          ignores all alien code.  The preprocessor programs extract and
          transform only the document parts that are determined for them.

          There are a lot of free and commercial roff preprocessors.  Some
          of them aren't available on each system, but there is a small set
          of preprocessors that are considered as an integral part of each
          roff system.  The classical preprocessors are

                 tbl      for tables.
                 eqn      for mathematical formulae.
                 pic      for drawing diagrams.
                 refer    for bibliographic references.
                 soelim   for including macro files from standard locations.
                 chem     for drawing chemical formulæ.

          Other known preprocessors that are not available on all systems
          include

                 grap   for constructing graphical elements.
                 grn    for including gremlin(1) pictures.

      Formatter programs
          In the context of roff systems, the formatter is the program that
          parses documents written in the roff language.  It generates
          intermediate output, which is intended to be fed into an output
          driver (also known as a device postprocessor), the identity of
          which must be known prior to processing.  The documents must
          already have been run through all necessary preprocessors to
          render correctly.

          The output produced by a roff formatter is represented in another
          language, termed the “intermediate output format”.  As noted in
          section “History” above, this language was first specified in
          CSTR #97; GNU extensions to it are documented in groff_out(5).
          Intermediate output is in specialized in its parameters, but not
          its syntax, for the output driver used; the format is device-
          independent, but not device-agnostic.

          The formatter is the heart of the roff system.  AT&T had two
          formatters: nroff for terminals, and troff for typesetters.

          Often, the name troff is used as a general term to refer to both
          formatters.  When speaking that generally, groff documentation
          prefers the term “roff”.

      Devices and output drivers
          To a roff system, a device is a hardware interface like a
          printer, a text or graphical terminal, or a standardized file
          format that unrelated software can interpret.

          A roff output driver is a program that parses the device-
          independent intermediate output format of troff and produces
          instructions specific to the device or file format it supports.

          The names of the devices and their driver programs are not
          standardized.  Technologies change; the devices used for document
          preparation have greatly changed since CSTR #54 was first written
          in the 1970s.  Such hardware is no longer used in production
          environments, and device capabilities (including resolution,
          color drawing, and font repertoire) have tended to increase.  The
          PostScript output driver dpost(1) from an AT&T troff of 1980s
          vintage had a resolution of 720 units per inch, whereas groff's
          grops(1) uses 72 000.

*roff*

programming
-----------

::

          Documents using roff are normal text files interleaved with roff
          formatting elements.  roff languages are powerful enough to
          support arbitrary computation and supply facilities that
          encourage their extension.  The primary such facility is macro
          definition; with this feature, macro packages have been developed
          that are tailored for particular applications.

      Macro packages
          Macro packages can have a much smaller vocabulary than roff
          itself; this trait combined with their domain-specific nature can
          make them easy to acquire and master.  The macro definitions of a
          package are typically kept in a file called name.tmac
          (historically, tmac.name).  All tmac files are stored in one or
          more directories at standardized positions.  Details on the
          naming of macro packages and their placement is found in
          groff_tmac(5).

          A macro package anticipated for use in a document can be delcared
          to the formatter by the command-line option -m; see troff(1).  It
          can alternatively be specified within a document using the file
          inclusion requests of the roff language; see groff(7).

          Well-known macro packages include man for traditional man pages
          and mdoc for BSD-style manual pages.  Macro packages for
          typesetting books, articles, and letters include ms (from
          “manuscript macros”), me (named by a system administrator from
          the first name of its creator, Eric Allman), mm (from “memorandum
          macros”), and mom, a punningly-named package exercising many
          groff extensions.

      The roff formatting language
          The canonical reference for the AT&T troff language is Ossanna's
          “Troff User's Manual”, CSTR #54, in its 1992 revision by
          Kernighan.  roff languages provide requests, escape sequences,
          macro definition facilities, string variables, registers for
          storage of numbers or dimensions, and control of execution flow.
          The theoretically-minded will observe that a roff is not a mere
          markup language, but Turing-complete, and would be even stripped
          of its macro-definition facility.  It has storage (registers); it
          can perform tests (as in conditional expressions like “(\n[i] >=
          1)”); and it can jump or branch using the .if request.

          Requests and escape sequences are instructions, predefined parts
          of the language, that perform formatting operations or otherwise
          change the state of the parser.  The user can define their own
          request-like elements by composing together text, requests, and
          escape sequences ad libitum.  A document writer will not
          (usually) note any difference in usage for requests or macros;
          both are written on a line on their own starting with a dot.
          However, there is a distinction; requests take either a fixed
          number of arguments (sometimes zero), silently ignoring any
          excess, or consume the rest of the input line, whereas macros can
          take a variable number of arguments.  Since arguments are
          separated by spaces, macros require a means of embedding a space
          in an argument; in other words, of quoting it.  This then demands
          a mechanism of embedding the quoting character itself, in case it
          is needed literally in a macro argument.  AT&T troff had complex
          rules involving the placement and repetition of the double quote
          to achieve both aims.  groff cuts this knot by supporting a
          special character escape sequence for the double quote, “\[dq]”,
          which never performs quoting in the typesetting language, but is
          simply a glyph, ‘"’.

          Escape sequences start with a backslash, “\”.  They can appear
          almost anywhere, even in the midst of text on a line, and
          implement various features, including the insertion of special
          characters with “\(” or “\[]”, break suppression at input line
          endings with “\c”, font changes with “\f”, point size changes
          with “\s”, in-line comments with “\"”, and many others.

          Strings are variables that can store a string.  A string is
          stored by the .ds request.  The stored string can be retrieved
          later by the \* escape sequence.

          Registers store numbers and sizes.  A register can be set with
          the request .nr and its value can be retrieved by the escape
          sequence \n.


---------------------------------------------------------------------------------

::

          Manual pages (man pages) take the section number as a file name
          extension, e.g., the file name for this document is roff.7, i.e.,
          it is kept in section 7 of the man pages.

          The classical macro packages take the package name as an
          extension, e.g., file.me for a document using the me macro
          package, file.mm for mm, file.ms for ms, file.pic for pic files,
          and so on.

          There is no general naming scheme for roff documents, though
          file.t for “troff file” is seen now and then.

          File name extensions can be handy in conjunction with the less(1)
          pager.  It provides the possibility to feed all input into a
          command-line pipe that is specified in the shell environment
          variable LESSOPEN.  This process is not well documented, so here
          is an example.

                 LESSOPEN='|lesspipe %s'

          where lesspipe is either a system-supplied command or a shell
          script of your own.

          See groff_filenames(5) for more on file name extensions.


-----------------------------------------------------------------------------------------------------

::

          All roff formatters provide automated line breaks and horizontal
          and vertical spacing.  In order to not disturb this, the
          following tips can be helpful.

          •      Never include empty or blank lines in a roff document.
                 Instead, use the empty request (a line consisting of a dot
                 only) or a line comment .\" if a structuring element is
                 needed.

          •      Never start a line with whitespace because this can lead
                 to unexpected behavior.  Indented paragraphs can be
                 constructed in a controlled way by roff requests.

          •      Start each sentence on a line of its own, for the spacing
                 after a dot is handled differently depending on whether it
                 terminates an abbreviation or a sentence.  To distinguish
                 both cases, do a line break after each sentence.

          •      To additionally use the auto-fill mode in Emacs, it is
                 best to insert an empty roff request (a line consisting of
                 a dot only) after each sentence.

          The following example shows judicious line breaking in a roff
          input file.

                 This is an example of a
                 .I roff
                 document that you can type into your text editor.
                 .
                 This is the next sentence in the same paragraph.
                 .
                 This is a longer sentence stretching over several input lines;
                 abbreviations like cf. are easily identified because the dot is
                 not followed by a line break.
                 .
                 In the output, this sentence continues the same paragraph.

      Editing with Emacs
          Official GNU doctrine holds that the best program for editing a
          roff document is Emacs; see emacs(1).  It provides an nroff major
          mode that is suitable for all kinds of roff dialects.  This mode
          can be activated by the following methods.

          When editing a file within Emacs the mode can be changed by
          typing ‘M-x nroff-mode’, where M-x means to hold down the Meta
          key (or Alt) and press the x key at the same time.

          But it is also possible to have the mode automatically selected
          when the file is loaded into the editor.

          •      The most general method is to include the following 3
                 comment lines at the end of the file.

                        .\" Local Variables:
                        .\" mode: nroff
                        .\" End:

          •      There is a set of file name extensions, e.g., the man
                 pages that trigger the automatic activation of the nroff
                 mode.

          •      Theoretically, it is possible to write the sequence

                        .\" -*- nroff -*-

                 as the first line of a file to have it started in nroff
                 mode when loaded.  Unfortunately, some applications such
                 as the man program are confused by this; so this is
                 deprecated.

      Editing with Vim
          Besides Emacs, some other editors provide nroff style files too,
          e.g., vim(1), an extension of the vi(1) program.  Vim's
          highlighting can be made to recognize roff files by setting the
          filetype option in a Vim modeline.  For this feature to work,
          your copy of vim must be built with support for, and configured
          to enable, several features; consult the editor's online help
          topics “auto-setting”, “filetype”, and “syntax”.  Then put the
          following at the end of your roff files, after any Emacs
          configuration:

                        .\" vim: set filetype=groff:

          Replace “groff” in the above with “nroff” if you want highlighing
          that does not recognize many of the GNU extensions to roff, such
          as request, register, and string names longer than two
          characters.


-------------------------------------------------------

::

          This document was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩, with the section “History” revised by G. Branden
          Robinson ⟨g.branden.robinson@gmail.com⟩.


---------------------------------------------------------

::

          There is a lot of documentation about roff.  The original papers
          describing AT&T troff are still available, and all aspects of
          groff are documented in great detail.

      Internet sites
          Unix Text Processing 
          ⟨https://github.com/larrykollar/Unix-Text-Processing⟩, by Dale
          Dougherty and Tim O'Reilly, 1987, Hayden Books.  This well-
          regarded text from 1987 brings the reader from a state of no
          knowledge of Unix or text editing (if necessary) to sophisticated
          computer-aided typesetting.  It has been placed under a free
          software license by its authors and updated by a team of groff
          contributors and enthusiasts.

          “History of Unix Manpages” ⟨http://manpages.bsd.lv/history.html⟩,
          an online article maintained by the mdocml project, provides an
          overview of roff development from Salzer's RUNOFF to 2008, with
          links to original documentation and recollections of the authors
          and their contemporaries.

          troff.org ⟨http://www.troff.org/⟩, Ralph Corderoy's troff site,
          provides an overview and pointers to much historical roff
          information.

          Multicians ⟨http://www.multicians.org/⟩, a site by Multics
          enthusiasts, contains a lot of information on the MIT projects
          CTSS and Multics, including RUNOFF; it is especially useful for
          its glossary and the many links to historical documents.

          The Unix Archive ⟨http://www.tuhs.org/Archive/⟩, curated by the
          Unix Heritage Society, provides the source code and some binaries
          of historical Unices (including the source code of some versions
          of troff and its documentation) contributed by their copyright
          holders.

          Jerry Saltzer's home page 
          ⟨http://web.mit.edu/Saltzer/www/publications/pubs.html⟩ stores
          some documents using the original RUNOFF formatting language.

          groff ⟨http://www.gnu.org/software/groff⟩, GNU roff's web site,
          provides convenient access to groff's source code repository, bug
          tracker, and mailing lists (including archives and the
          subscription interface).

      Historical roff documentation
          Many AT&T troff documents are available online, and can be found
          at Ralph Corderoy's site (see above) or via Internet search.

          Of foremost significance are two mentioned in section “History”
          above, describing the language and its device-independent
          implementation, respectively.

          “Troff User's Manual”; Computing Science Technical Report #54;
          Joseph F. Ossanna; AT&T Bell Laboratories; 1976.  Revised by
          Brian Kernighan, November 1992.

          “A Typesetter-independent TROFF”; Computing Science Technical
          Report #97; Brian W. Kernighan; AT&T Bell Laboratories; 1981.
          Revised March 1982.

          You can obtain many relevant Bell Labs papers in PDF from Bernd
          Warken's “roff classical” GitHub repository 
          ⟨https://github.com/bwarken/roff_classical.git⟩.

      Manual pages
          As a system of multiple components, a roff system potentially has
          many man pages, each describing an aspect of it.  Unfortunately,
          there is no general naming scheme for the documentation among the
          different roff implementations.

          For GNU roff, the groff(1) man page offers a survey of all the
          documentation distributed with the system.

          With other roffs, you are on your own, but troff(1) might be a
          good starting point.

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                      roff(7)

--------------

Pages that refer to this page: `eqn(1) <../man1/eqn.1.html>`__, 
`gdiffmk(1) <../man1/gdiffmk.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`grog(1) <../man1/grog.1.html>`__, 
`grohtml(1) <../man1/grohtml.1.html>`__, 
`nroff(1) <../man1/nroff.1.html>`__, 
`refer(1) <../man1/refer.1.html>`__, 
`soelim(1) <../man1/soelim.1.html>`__, 
`tbl(1) <../man1/tbl.1.html>`__,  `troff(1) <../man1/troff.1.html>`__, 
`groff_filenames(5) <../man5/groff_filenames.5.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`ditroff(7) <../man7/ditroff.7.html>`__, 
`groff(7) <../man7/groff.7.html>`__, 
`groff_diff(7) <../man7/groff_diff.7.html>`__

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
