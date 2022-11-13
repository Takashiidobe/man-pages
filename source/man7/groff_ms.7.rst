.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_ms(7) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Usage <#Usage>`__ \|             |                                   |
| `Differences from AT&T [2        |                                   |
| 2mms[24m [1m <#Differences_from |                                   |
| _AT&T_%5B22mms%5B24m_%5B1m>`__ |                                   |
| \|                                |                                   |
| `Naming con                       |                                   |
| ventions <#Naming_conventions>`__ |                                   |
| \| `Files <#Files>`__ \|          |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_ms(7)         Miscellaneous Information Manual         groff_ms(7)


-------------------------------------------------

::

          groff_ms - GNU roff manuscript macro package for formatting
          documents


---------------------------------------------------------

::

          groff -ms [option ...] [file ...]
          groff -m ms [option ...] [file ...]


---------------------------------------------------------------

::

          The GNU implementation of the ms macro package is part of the
          groff document formatting system.  The ms package is suitable for
          the composition of letters, memoranda, reports, and books.

          These groff macros support cover page and table of contents
          generation, automatic section numbering, several different
          paragraph styles, a variety of text styling options, footnotes,
          multi-column page layouts, and indexing.  ms supports the tbl(1),
          eqn(1), pic(1), and refer(1) preprocessors for inclusion of
          tables, mathematical equations, diagrams, and standardized
          bibliographic citations.

          This implementation is mostly compatible with the documented
          interface and behavior of AT&T Version 7 Unix ms.  Several
          extensions from 4.2BSD (Berkeley) and Version 10 Research Unix
          have been recreated.


---------------------------------------------------

::

          The ms macro package expects files to have a certain amount of
          structure.  The simplest documents can begin with a paragraph
          macro and consist of text separated by paragraph macros or even
          blank lines.  Longer documents have a structure as follows.

          Document type
                 If you call the RP macro at the beginning of the document,
                 groff prints the document description on its own page;
                 otherwise it prints the information (if any) on the first
                 page with your document text immediately following.  Some
                 document types found in other ms implementations are
                 specific to AT&T or Berkeley, and are not supported in
                 groff ms.

          Format and layout
                 By setting registers and strings, you can change your
                 document's margins, spacing, headers and footers,
                 footnotes, and the base point size for the text.  See
                 subsection “Document control settings” below.

          Document description
                 A document description consists of any of: a title, one or
                 more authors' names and affiliated institutions, an
                 abstract, and a date or other identifier.  See subsection
                 “Document description macros” below.

          Body   The main matter of your document follows its description
                 (if any).  It consists of paragraphs, headings, and lists.

          Table of contents
                 Longer documents usually include a table of contents,
                 which you can add by placing the TC macro at the end of
                 your document.

      Document control settings
          The following tables list the document control registers and
          strings.  For any parameter whose default is unsatisfactory,
          define its register or string before calling any ms macro other
          than RP.

                                   Margin settings
          Parameter           Definition             Effective      Default
          ──────────────────────────────────────────────────────────────────
          \n[PO]      Page offset (left margin)    next page        1i
          \n[LL]      Line length                  next paragraph   6i
          \n[LT]      Title line length            next paragraph   6i
          \n[HM]      Top (header) margin          next page        1i
          \n[FM]      Bottom (footer) margin       next page        1i
          ──────────────────────────────────────────────────────────────────

                              Titles (headers, footers)
          Parameter            Definition              Effective    Default
          ──────────────────────────────────────────────────────────────────
          \*[LH]      Left header text                next header   empty
          \*[CH]      Center header text              next header   -\n[%]-
          \*[RH]      Right header text               next header   empty
          \*[LF]      Left footer text                next footer   empty
          \*[CF]      Center footer text              next footer   empty
          \*[RF]      Right footer text               next footer   empty
          ──────────────────────────────────────────────────────────────────

                                    Text settings
          Parameter           Definition             Effective      Default
          ──────────────────────────────────────────────────────────────────
          \n[PS]      Point size                   next paragraph   10p
          \n[VS]      Vertical spacing (leading)   next paragraph   12p
          \n[HY]      Hyphenation mode             next paragraph   6
          \*[FAM]     Font family                  next paragraph   T
          ──────────────────────────────────────────────────────────────────

                                    Paragraph settings
           Parameter             Definition              Effective       Default
          ────────────────────────────────────────────────────────────────────────
          \n[PI]        Indentation                    next paragraph   5n
          \n[PD]        Paragraph distance (spacing)   next paragraph   0.3v (1v)
          \n[QI]        Quotation indentation          next paragraph   5n
          \n[PORPHANS]  # of initial lines kept        next paragraph   1
          ────────────────────────────────────────────────────────────────────────

                                    Heading settings
           Parameter            Definition            Effective      Default
          ─────────────────────────────────────────────────────────────────────
          \n[PSINCR]     Point size increment        next heading   1p
          \n[GROWPS]     Size increase level limit   next heading   0
          \n[HORPHANS]   # of following lines kept   next heading   1
          \*[SN-STYLE]   Numbering style (alias)     next heading   \*[SN-DOT]
          ─────────────────────────────────────────────────────────────────────

          \*[SN-STYLE] can alternatively be made an alias of \*[SN-NO-DOT]
          with the als request.

                                    Footnote settings
          Parameter            Definition              Effective      Default
          ──────────────────────────────────────────────────────────────────────
          \n[FI]      Indentation                    next footnote   2n
          \n[FF]      Format                         next footnote   0
          \n[FPS]     Point size                     next footnote   \n[PS]-2p
          \n[FVS]     Vertical spacing (leading)     next footnote   \n[FPS]+2p
          \n[FPD]     Paragraph distance (spacing)   next footnote   \n[PD]/2
          \*[FR]      Line length ratio              special         11/12
          ──────────────────────────────────────────────────────────────────────

                                  Display settings
          Parameter            Definition             Effective    Default
          ──────────────────────────────────────────────────────────────────
          \n[DD]      Display distance (spacing)      special     0.5v (1v)

          \n[DI]      Display indentation             special     0.5i
          ──────────────────────────────────────────────────────────────────

                                   Other settings
          Parameter             Definition              Effective   Default
          ──────────────────────────────────────────────────────────────────
          \n[MINGW]   Minimum gutter width              next page   2n
          ──────────────────────────────────────────────────────────────────

          For entries marked “special” in the “Effective” column, see the
          discussion in the applicable section below.  The PD and DD
          registers use the larger value if the vertical resolution of the
          output device is too coarse for the smaller one; usually, this is
          the case only for output to terminals and emulators thereof.  The
          “gutter” affected by \n[MINGW] is the gap between columns in
          multiple-column page arrangements.

      Fractional point sizes
          AT&T ms supported only integer values for the type size and
          vertical spacing.  To overcome this restriction, for the
          registers PS, VS, FPS, and FVS, groff ms interprets values equal
          to or larger than 1000 as decimal fractions multiplied by 1000.
          In ms documents that don't need to be portable to other
          implementations, using a scaling indicator, as in “.nr PS 10.5p”,
          is preferable.

      Document description macros
          Define information describing the document by using the macros
          below in the order shown; .DA or .ND can be called to set the
          document date (or other identifier) at any time before (a) the
          abstract, if present, or (b) its information is required in a
          header or footer.  Use of these macros is optional, except that
          .TL is mandatory if any of .RP, .AU, .AI, or .AB is called, and
          .AE is mandatory if .AB is called.

          .RP [no]
                 Use the “report” (AT&T: “released paper”) format for your
                 document, creating a separate cover page.  The default
                 arrangement is to print most of the document description
                 (title, author names and institutions, and abstract, but
                 not the date) at the top of page 1.  If the optional “no”
                 argument is given, ms prints a cover page but does not
                 repeat any of its information on page 1 (but see the DA
                 macro below regarding the date).

          .TL    Specify the document title.  ms collects text on input
                 lines following a call to this macro into the title until
                 reaching an .AU, .AB, or heading or paragraph macro call.

          .AU    Specify an author's name.  ms collects text on input lines
                 following a call to this macro into the author's name
                 until reaching an .AI, .AB, another .AU, or heading or
                 paragraph macro call.  Call it repeatedly to specify
                 multiple authors.

          .AI    Specify the preceding author's institution.  An .AU call
                 is usefully followed by at most one .AI call; if there are
                 more, the last .AI call controls.  ms collects text on
                 input lines following a call to this macro into the
                 author's institution until reaching an .AU, .AB, or
                 heading or paragraph macro call.

          .DA [x ...]
                 Print the current date, or any arguments x, in the center
                 footer, and, if .RP is also called, left-aligned after
                 other document description information on the cover page.

          .ND [x ...]
                 Print the current date, or any arguments x, if .RP is also
                 called, left-aligned after other document description
                 information on the cover page.  This is the groff ms
                 default.

          .AB [no]
                 Begin the abstract.  ms collects text on input lines
                 following a call to this macro into the abstract until
                 reaching an .AE call.  By default, ms places the word
                 “ABSTRACT” centered and in italics above the text of the
                 abstract.  The optional argument “no” suppresses this
                 heading.

          .AE    End the abstract.

      Text settings
          The FAM string sets the font family for body text.  If this
          string is undefined at initialization, it is set to “T” (Times).
          Setting \*[FAM] before the first call of a sectioning,
          paragraphing, or (non-date) document description macro also
          applies it to headers, footers, and footnotes (as well as the
          body text).

          The hyphenation flags (as used by the hy request) are set using
          the HY register.

      Paragraphs
          Several paragraph types are available, differing in how
          indentation applies to them: to left, right, or both margins; to
          the first output line of the paragraph, all output lines, or all
          but the first.  All paragraphing macro calls cause the insertion
          of vertical space in the amount stored in the PD register, except
          at page or column breaks.

          The PORPHANS register defines the minimum number of initial lines
          of any paragraph that must be kept together to avoid orphaned
          lines at the bottom of a page.  If a new paragraph is started
          close to the bottom of a page, and there is insufficient space to
          accommodate \n[PORPHANS] lines before an automatic page break,
          then a page break is forced before the start of the paragraph.
          This is a GNU extension.

          .LP    Set a paragraph without any (additional) indentation.

          .PP    Set a paragraph with a first-line left indentation in the
                 amount stored in the PI register.

          .IP [marker [width]]
                 Set a paragraph with a left indentation.  The optional
                 marker is not indented and is empty by default.  width
                 overrides the default indentation amount of \n[PI]; its
                 default unit is “n”.  Once specified, width applies to
                 further .IP calls until specified again or a heading or
                 different paragraphing macro is called.

          .QP    Set a paragraph indented from both left and right margins
                 by \n[QI].  This macro and register are Berkeley
                 extensions.

          .QS
          .QE    Begin (QS) and end (QE) a region where each paragraph is
                 indented from both margins by \n[QI].  The text between
                 .QS and .QE can be structured further by use of other
                 paragraphing macros.  These macros are GNU extensions.

          .XP    Set an “exdented” paragraph—one with a left indentation of
                 \n[PI] on every line except the first (also known as a
                 hanging indent).  This is a Berkeley extension.

      Headings
          Use headings to create a hierarchical structure for your
          document.  The ms macros print headings in bold using the same
          font family and, by default, point size as the body text.
          Headings are available with and without automatic numbering.
          Text lines after heading macros are treated as part of the
          heading, rendered on the same output line in the same style.

          .NH level
                 Automatically numbered heading.  The level argument
                 instructs ms to number heading in the form a.b.c..., to
                 any depth desired, with the numbering of each level
                 increasing automatically and being reset to zero when a
                 more significant level is increased.  “1” is the most
                 significant or coarsest division of the document.  Only
                 nonzero values are output.  If you specify heading levels
                 with a gap in an ascending sequence, such as by “.NH 1”
                 and then “.NH 3” as the next such call, groff ms emits a
                 warning on the standard error stream.

          .NH S heading-level-index ...
                 Alternatively, a first argument of “S” can be given,
                 followed by integral arguments to number the levels of the
                 heading explicitly.  Further automatic numbering, if used,
                 resumes using the specified heading level indices as their
                 predecessors.  This feature is a GNU extension.

          After invocation of .NH, the assigned number is made available in
          the strings SN-DOT (as it appears in a printed heading with
          default formatting, followed by a terminating period) and
          SN-NO-DOT (with the terminating period omitted).  These are GNU
          extensions.

          You can control the style used to print numbered headings by
          defining an appropriate alias for the string SN-STYLE.  By
          default, \*[SN-STYLE] is aliased to \*[SN-DOT].  If you prefer to
          omit the terminating period from numbers appearing in numbered
          headings, you may alias it to \*[SN-NO-DOT].  Any such change in
          numbering style becomes effective from the next use of .NH
          following redefinition of the alias for \*[SN-STYLE].

          .SH [level]
                 Unnumbered heading.  The optional level argument is a GNU
                 extension indicating the heading level corresponding to
                 the level argument of .NH.  It matches the point size at
                 which the heading is printed to that of a numbered heading
                 at the same level when the \n[GROWPS] and \n[PSINCR]
                 heading size adjustment mechanism is in effect.

          The PSINCR register defines an increment in point size to be
          applied to a heading at a level more significant (numerically
          less) than the value specified in \n[GROWPS].  The value of
          \n[PSINCR] should be specified in points with the “p” scaling
          indicator and may include a fractional component.

          The GROWPS register defines the heading level at which the point
          size increment set by \n[PSINCR] becomes effective.  For each
          heading level below the value of \n[GROWPS], the point size is
          increased by \n[PSINCR].  Setting \n[GROWPS] to a value less
          than 2 disables the incremental heading size feature.

          In other words, if the GROWPS register is greater than the level
          argument to a .NH or .SH call, the point size of a heading
          produced by these macros increases by \n[PSINCR] units over
          \n[PS] multiplied by the difference of \n[GROWPS] and level.

          The \n[HORPHANS] register operates in conjunction with the NH and
          SH macros to inhibit the printing of orphaned headings at the
          bottom of a page; it specifies the minimum number of lines of the
          subsequent paragraph that must be kept on the same page as the
          heading.  If insufficient space remains on the current page to
          accommodate the heading and this number of lines of paragraph
          text, a page break is forced before the heading is printed.  Any
          display macro or tbl, pic, or eqn region between the heading and
          the subsequent paragraph suppresses this grouping.

      Highlighting
          The ms macros provide a variety of methods to highlight or
          emphasize text:

          .B [txt [post [pre]]]
                 Sets its first argument in bold type.  If you specify a
                 second argument, groff prints it in the previous font
                 after the bold text, with no intervening space (this
                 allows you to set punctuation after the highlighted text
                 without highlighting the punctuation).  Similarly, it
                 prints the third argument (if any) in the previous font
                 before the first argument.  If you give this macro no
                 arguments, groff prints all text following in bold until
                 the next highlighting, paragraph, or heading macro.

          .R [txt [post [pre]]]
                 Sets its first argument in roman (or regular) type.  It
                 operates similarly to the B macro otherwise.

          .I [txt [post [pre]]]
                 Sets its first argument in italic type.  It operates
                 similarly to the B macro otherwise.

          .BI [txt [post [pre]]]
                 Sets its first argument in bold italic type.  It operates
                 similarly to the B macro otherwise.  This is a Version 10
                 Research Unix extension.

          .CW [txt [post [pre]]]
                 Sets its first argument in a “constant-width” (monospaced)
                 roman typeface.  It operates similarly to the B macro
                 otherwise.  This is a Version 10 Research Unix extension.

          .BX [txt]
                 Prints txt and draws a box around it.  On terminal
                 devices, reverse video is used instead.  If you want the
                 argument to contain space, use non-breaking space escapes
                 of appropriate width (\~, \^, \|, \0), or \h.

          .UL [txt [post]]
                 Prints its first argument with an underline.  If you
                 specify a second argument, groff prints it in the previous
                 font after the underlined text, with no intervening space.

          .LG    Prints all text following in larger type (2 points larger
                 than the current point size) until the next font size,
                 highlighting, paragraph, or heading macro.  You can
                 specify this macro multiple times to enlarge the point
                 size as needed.

          .SM    Prints all text following in smaller type (2 points
                 smaller than the current point size) until the next type
                 size, highlighting, paragraph, or heading macro.  You can
                 specify this macro multiple times to reduce the point size
                 as needed.

          .NL    Prints all text following in the normal point size (that
                 is, the value of the PS register).

          groff ms also supports strings to begin and end super- and
          subscripting.  These are all GNU extensions.

          \*{
          \*}    Begin and end superscripting, respectively.

          \*<
          \*>    Begin and end subscripting, respectively.

      Indented regions
          You may need to indent a region of text while still letting groff
          automatically break lines and fill the text.

          .RS    Begin a region where headings, paragraphs, and displays
                 are indented by \n[PI].

          .RE    End the most recent indented region.

      Keeps, boxed keeps, and displays
          On occasion, you may want to keep several lines of text, or a
          region of a document, together on a single page, preventing an
          automatic page break within certain boundaries.  This can cause a
          page break to occur earlier than it normally would.

          You can alternatively specify a floating keep; if a keep cannot
          fit on the current page, ms holds its contents and allows text
          following the keep (in the source document) to fill in the
          remainder of the current page.  When the page breaks, whether by
          an explicit bp request or by reaching the end of the page, ms
          puts the floating keep at the beginning of the next page.

          .KS    Begin a keep.

          .KF    Begin a floating keep.

          .KE    End (floating) keep.

          As an alternative to the keep mechanism, the ne request forces a
          page break if there is not at least the amount of vertical space
          specified in its argument remaining on the page.

          A keep can also be boxed.  Text in a box is automatically placed
          in a diversion (keep).

          .B1    Begin a keep with a box drawn around it.

          .B2    End boxed keep.

          Box macros cause line breaks; if you need to box a word or phrase
          within a line, see the BX macro in section “Highlighting” above.
          Box lines are drawn as close as possible to the text they enclose
          so that they are usable within paragraphs.  If you wish to box
          one or more paragraphs, you may improve the appearance by calling
          .B1 after the first paragraphing macro, and by adding a small
          amount of vertical space before calling .B2 .

          If you want a box to float, you will need to enclose the .B1 and
          .B2 calls within a pair of .KF and .KE calls.

          Displays turn off filling; lines of verse or program code are
          shown with their lines broken as in the source document without
          requiring br requests between lines.  Displays can be kept on a
          single page or allowed to break across pages.  The DS macro
          begins a kept display of the layout specified in its first
          argument; non-kept displays are begun with dedicated macros
          corresponding to their layout.

          .DS L
          .LD    Begin (DS: kept) left-aligned display.

          .DS I [indent]
          .ID [indent]
                 Begin (DS: kept) display indented by indent if specified,
                 \n[DI] otherwise.

          .DS B
          .BD    Begin (DS: kept) block display: the entire display is
                 left-aligned, but indented such that the longest line in
                 the display is centered on the page.

          .DS C
          .CD    Begin (DS: kept) centered display: each line in the
                 display is centered.

          .DS R
          .RD    Begin (DS: kept) right-aligned display.  This is a GNU
                 extension.

          .ED    End any display.

          The distance stored in \n[DD] is inserted before and after each
          pair of display macros; this is a Berkeley extension.  The \n[DI]
          indentation is applied only to displays created with “.DS I” and
          .ID; this is a GNU extension.  Changes to either register take
          effect at the next display boundary.

      Tables, figures, equations, and references
          The ms macros support the standard groff preprocessors: tbl, pic,
          eqn, and refer.  The \n[DD] distance is also applied to regions
          of the document preprocessed with eqn, pic, and tbl.  Mark text
          meant for preprocessors by enclosing it in pairs of tags as
          follows, with no space between the dot and the macro name.

          .TS [H]
          .TE    Denote a table to be processed by the tbl preprocessor.
                 The optional H argument instructs groff to repeat table
                 rows (often column headings) at the top of each new page
                 the table spans, if applicable; calling the TH macro marks
                 the end of such rows.

          .PS
          .PE    Denote a graphic to be processed by the pic preprocessor.

          .EQ [align]
          .EN    Denote an equation to be processed by the eqn
                 preprocessor.  The equation is center-aligned by default;
                 the optional align argument can be C, L, or I to center,
                 left-align, or indent it by \n[DI], respectively.

          .[
          .]     Denote a reference to be processed by the refer
                 preprocessor.  The GNU refer(1) manual page provides a
                 comprehensive reference to the preprocessor and the format
                 of the bibliographic database.

          Attempting to place a multi-page table inside a keep can lead to
          unpleasant results, particularly if the tbl “allbox” option is
          used.

      Footnotes
          A footnote is typically anchored to a place in the text with a
          marker, which is a small integer, a symbol, or arbitrary user-
          specified text.

          \**    Place an automatically numbered footnote marker in the
                 text.  Each time this string is interpolated, the number
                 it produces increments by one.  Automatic footnote numbers
                 start at 1.  This is a Berkeley extension.

          Enclose the footnote text in FS and FE macro calls to set it at
          the nearest available “foot”, or bottom, of a text column or
          page.

          .FS [marker]
                 Begin a footnote.  A marker argument is placed at the
                 beginning of the footnote text.  If marker is omitted, the
                 next pending automatic footnote number enqueued by
                 interpolation of the * string is used, and if none exists,
                 nothing is prefixed.

          .FE    End footnote text.

          Footnote text is formatted as paragraphs are, using analogous
          parameters.  The registers FI, FPD, FPS, and FVS correspond to
          PI, PD, PS, and VS, respectively.

          The FF register controls the formatting of automatically numbered
          footnotes, and those for which .FS is given a marker argument, at
          the bottom of a column or page as follows.

                 0      Set an automatic number as a superscript (on
                        typesetter devices) or surrounded by square
                        brackets (on terminals).  The footnote paragraph is
                        indented if there is an .FS argument or an
                        automatic number.  This is the default.

                 1      Like 0, but set the marker as regular text, and
                        follow an automatic number with a period.

                 2      Like 1, but without indentation.

                 3      Like 1, but set the footnote paragraph with the
                        marker hanging.

      Headers and footers
          There are multiple ways to produce headers and footers.  One is
          to define the strings LH, CH, and RH to set the left, center, and
          right headers, respectively; and LF, CF, and RF to set the left,
          center, and right footers similarly.  The approach works best for
          documents that do not distinguish odd and even pages.

          Another method is to call macros with arguments that set headers
          or footers for odd or even pages; these variables produce four
          combinations, so four macros are available.  They each take a
          delimiter separating the left, center, and right header or footer
          texts from each other.  You can replace the neutral apostrophes
          (') with any character not appearing in the header or footer
          text.

          .OH 'left'center'right'
          .OF 'left'center'right'
          .EH 'left'center'right'
          .EF 'left'center'right'
                 The OH and EH macros define headers for the odd and even
                 pages; the OF and EF macros define footers for the odd and
                 even pages.

          By default, ms prints no header on any page numbered “1”
          (regardless of its assigned format).

          .P1    Print the header on page 1.  To be effective, this macro
                 must be called before the header trap is sprung on any
                 page numbered “1”.  This is a Berkeley extension.

          For even greater flexibility, ms is designed to permit the
          redefinition of the macros that are called when the groff traps
          that ordinarily cause the headers and footers to be output are
          sprung.  PT (“page trap”) is called by ms when the header is to
          be written, and BT (“bottom trap”) when the footer is to be.  The
          roff trap that ms sets up to process the header also calls the
          (normally undefined) HD macro after .PT; you can define .HD if
          you need additional processing after printing the header.  The HD
          hook is a Berkeley extension.  Any such macros you (re)define
          must implement any desired specialization for odd-, even-, or
          first-numbered pages.

      Tab stops
          Use the ta request to set tab stops as needed.

          .TA    Reset the tab stops to the ms default (every 5 ens).
                 Redefine this macro to create a different set of default
                 tab stops.

      Margins
          Control margins using registers.  These are summarized in the
          “Margin settings” table in subsection “Document control settings”
          above.  There is no explicit right margin setting; the
          combination of page offset \n[PO] and line length \n[LL] provides
          the information necessary to derive the right margin.

      Multiple columns
          The ms macros can set text in as many columns as will reasonably
          fit on the page.  The following macros are available.  All of
          them force a page break if a multi-column mode is already set.
          However, if the current mode is single-column, starting a multi-
          column mode does not force a page break.

          .1C    Arrange page text in a single column (the default).

          .2C    Arrange page text in two columns.

          .MC [column-width [gutter-width]]
                 Arrange page text in multiple columns.  If you specify no
                 arguments, it is equivalent to the 2C macro.  Otherwise,
                 column-width is the width of each column and gutter-width
                 is the minimum distance between columns.  \n[MINGW] is the
                 default minimum gutter width; it is a GNU extension.

      Creating a table of contents
          Wrap text that you want to appear in the table of contents in XS
          and XE macros.  Use the TC macro to print the table of contents
          at the end of the document, resetting the page number to i (Roman
          numeral 1).

          You can manually create a table of contents by specifying a page
          number as the first argument to XS.  Add subsequent entries using
          the XA macro.  Use the PX macro to print a manually-generated
          table of contents without resetting the page number.

          If you give the argument “no” to either PX or TC, groff
          suppresses printing the title specified by the \*[TOC] string.


-----------------------------------------------------------------------------------------------------------------------------

::

          The groff ms macros are a complete re-implementation, using no
          original AT&T code.  Since they take advantage of the extended
          features in groff, they cannot be used with AT&T troff.  Other
          differences include:

          •  The internals of groff ms differ from the internals of AT&T
             ms.  Documents that depend upon implementation details of AT&T
             ms may not format properly with groff ms.  Such details
             include macros whose function was not documented in the AT&T
             ms manual (“Typing Documents on the UNIX System: Using the -ms
             Macros with Troff and Nroff”, M. E. Lesk, Bell Laboratories,
             1978).

          •  The error-handling policy of groff ms is to detect and report
             errors, rather than silently to ignore them.

          •  Berkeley localisms, in particular the TM and CT macros, are
             not implemented.

          •  Version 10 Research Unix supported a pair of P1 and P2 macros
             for setting code examples; groff ms does not.

          •  groff ms does not work in GNU troff's AT&T compatibility mode.
             If loaded when that mode is enabled, it aborts processing with
             a diagnostic message.

          •  Multiple line spacing is not supported (use a larger vertical
             spacing instead).

          •  groff ms uses the same header and footer defaults in both
             nroff and troff modes as AT&T ms does in troff mode; AT&T's
             default in nroff mode is to put the date, in U.S. traditional
             format (e.g., “January 1, 2021”), in the center footer (the CF
             string).

          •  Macros that cause groff ms to internally reset its paragraph
             rendering parameters (paragraphs, headings, and displays,
             among others) may change the indentation; they do so not by
             incrementing or decrementing it, but by setting it absolutely.
             This can cause problems for documents that define additional
             macros of their own that try to manipulate indentation.  The
             solution is to use, not the in request, but .RS and .RE.

          •  To make groff ms use the default page offset (which also
             specifies the left margin), the PO register must stay
             undefined until the first ms macro is called.  This implies
             that \n[PO] should not be used early in the document, unless
             it is changed also: accessing an undefined register
             automatically defines it.

          •  Displays are left-aligned by default, not indented.  In AT&T
             ms, .DS is synonymous with “.DS I”; in groff ms, it is
             synonymous with “.DS L”.

          •  Block displays were not documented in the AT&T ms manual
             (Berkeley corrected this oversight), but Version 7 Unix ms
             supported them nevertheless, as does groff ms (this is thus
             only an apparent difference).

          •  Right-aligned displays are available.  The AT&T ms manual
             observes that “it is tempting to assume that “.DS R” will
             right adjust lines, but it doesn't work”.  In groff ms, it
             does.

          •  groff ms handles “S” as the first argument to the NH macro
             specially, allowing alteration of the automatic heading
             numbering sequence.

          •  groff ms supports the PN register, but it is not necessary;
             you can access the page number via the usual % register and
             use the af request to assign a different format to it if
             desired.  (If you redefine the ms PT macro and desire special
             treatment of certain page numbers—like “1”—you may need to
             handle a non-Arabic page number format, as groff ms's .PT
             does; see the macro package source.  groff ms aliases the PN
             register to %.)

          •  The AT&T ms manual documents registers CW and GW as setting
             the default column width and “intercolumn gap”, respectively,
             and which applied when .MC was called with fewer than two
             arguments.  groff ms instead treats .MC without arguments as
             synonymous with .2C; there is thus no occasion for a default
             column width register.  Further, the MINGW register and the
             second argument to .MC specify a minimum space between
             columns, not the fixed gutter width of AT&T ms.

          •  The register GS is set to 1 by the groff ms macros, but is not
             used by the AT&T ms package.  Documents that need to determine
             whether they are being formatted with groff ms or another
             implementation should test this register.

      Localization strings
          You can redefine the following strings to adapt the groff ms
          macro package to languages other than English.

                     String            Default
                 ───────────────────────────────────
                 \*[REFERENCES]   References
                 \*[ABSTRACT]     \f[I]ABSTRACT\f[]
                 \*[TOC]          Table of Contents
                 \*[MONTH1]       January
                 \*[MONTH2]       February
                 \*[MONTH3]       March
                 \*[MONTH4]       April
                 \*[MONTH5]       May
                 \*[MONTH6]       June
                 \*[MONTH7]       July
                 \*[MONTH8]       August
                 \*[MONTH9]       September
                 \*[MONTH10]      October

                 \*[MONTH11]      November
                 \*[MONTH12]      December
                 ───────────────────────────────────
          The default for ABSTRACT includes font style escapes to set the
          word in italics.


-----------------------------------------------------------------------------

::

          The following conventions are used for names of macros, strings,
          and registers.  External names available to documents that use
          the groff ms macros contain only uppercase letters and digits.

          Internally the macros are divided into modules; naming
          conventions are as follows:

          •  Names used only within one module are of the form module*name.

          •  Names used outside the module in which they are defined are of
             the form module@name.

          •  Names associated with a particular environment are of the form
             environment:name; these are used only within the par module.

          •  name does not have a module prefix.

          •  Constructed names used to implement arrays are of the form
             array!index.

          Thus the groff ms macros reserve the following names:

          •  Names containing the characters *, @, and :.

          •  Names containing only uppercase letters and digits.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/s.tmac
                 groff implementation of manuscript macros.

          /usr/local/share/groff/1.23.0/tmac/ms.tmac
                 Wrapper to load s.tmac.


-------------------------------------------------------

::

          The GNU version of the ms macro package was written by James
          Clark and contributors.  This document was (re-)written by Larry
          Kollar ⟨lkollar@despammed.com⟩.


---------------------------------------------------------

::

          A manual is available in source and rendered form.  On your
          system, it may be compressed and/or available in additional
          formats.

          /usr/local/share/doc/groff-1.23.0/ms.ms
          /usr/local/share/doc/groff-1.23.0/ms.ps
                 “Using groff with the ms Macro Package”; Larry Kollar.

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          groff(1), troff(1), tbl(1), pic(1), eqn(1), refer(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                  groff_ms(7)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`refer(1) <../man1/refer.1.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`groff(7) <../man7/groff.7.html>`__

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
