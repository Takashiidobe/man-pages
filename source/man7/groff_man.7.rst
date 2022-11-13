.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_man(7) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_man(7)        Miscellaneous Information Manual        groff_man(7)


-------------------------------------------------

::

          groff_man - compose manual pages with GNU roff


---------------------------------------------------------

::

          groff -man [option ...] [file ...]
          groff -m man [option ...] [file ...]


---------------------------------------------------------------

::

          The GNU implementation of the man macro package is part of the
          groff document formatting system.  It is used to produce manual
          pages (“man pages”) like the one you are reading.

          This document presents the macros thematically; for those needing
          only a quick reference, the following table lists them
          alphabetically, with cross-references to appropriate subsections
          below.

          Man page authors and maintainers who are not already experienced
          groff users should consult groff_man_style(7), an expanded
          version of this document, for additional explanations and advice.
          It covers only those concepts required for man page document
          maintenance, and not the full breadth of the groff typesetting
          system.

          Macro   Meaning                      Subsection
          ────────────────────────────────────────────────────────────────
          .B      Bold                         Font style macros
          .BI     Bold, italic alternating     Font style macros
          .BR     Bold, roman alternating      Font style macros
          .EE     Example end                  Document structure macros
          .EX     Example begin                Document structure macros
          .I      Italic                       Font style macros
          .IB     Italic, bold alternating     Font style macros
          .IP     Indented paragraph           Paragraph macros
          .IR     Italic, roman alternating    Font style macros
          .LP     (Left) paragraph             Paragraph macros
          .ME     Mail-to end                  Hyperlink and email macros
          .MT     Mail-to start                Hyperlink and email macros
          .OP     (Command-line) option        Command synopsis macros
          .P      Paragraph                    Paragraph macros
          .PP     Paragraph                    Paragraph macros
          .RB     Roman, bold alternating      Font style macros
          .RE     Relative inset end           Document structure macros
          .RI     Roman, italic alternating    Font style macros
          .RS     Relative inset start         Document structure macros
          .SB     Small bold                   Font style macros
          .SH     Section heading              Document structure macros
          .SM     Small                        Font style macros
          .SS     Subsection heading           Document structure macros
          .SY     Synopsis start               Command synopsis macros
          .TH     Title heading                Document structure macros
          .TP     Tagged paragraph             Paragraph macros
          .TQ     Supplemental paragraph tag   Paragraph macros
          .UE     URL end                      Hyperlink and email macros
          .UR     URL start                    Hyperlink and email macros
          .YS     Synopsis end                 Command synopsis macros

          Macros whose use we discourage (.AT, .DT, .HP, .PD, and .UC) are
          described in subsection “Deprecated features” below.

      Macro reference preliminaries
          Each macro is described in a tagged paragraph.  Closely related
          macros, such as .EX and .EE, are grouped together.

          An empty macro argument can be specified with a pair of double-
          quotes (“""”), but the man package is designed such that this
          should seldom be necessary.  Most macro arguments are strings
          that will be output as text; exceptions are noted.

      Document structure macros
          The highest level of organization of a man page is determined by
          this group of macros.  .TH (title heading) identifies the
          document as a man page and defines information enabling its
          indexing by mandb(8) or a similar tool.  Section headings (.SH),
          one of which is mandatory and many of which are standardized,
          facilitate quick location of relevant material by the reader and
          aid the man page writer to discuss all essential aspects of the
          topic.  Subsection headings (.SS) are optional and permit
          sections that grow long to develop in a controlled way.  Many
          technical discussions benefit from examples; lengthy ones,
          especially those reflecting multiple lines of input to or output
          from the system, are usefully bracketed by .EX and .EE.  When
          none of the foregoing meets a structural demand, a region within
          a (sub)section can be manually inset within .RS and .RE macros.

          .TH title section [footer-middle] [footer-inside] [header-middle]
                 Define the title of the man page as title and the section
                 of the manual volume as section.  See man(1) for details
                 on the section numbers and suffixes applicable to your
                 system.  title and section are positioned together at the
                 left and right in the header line (with section in
                 parentheses immediately appended to title).  footer-middle
                 is centered in the footer line.  The arrangement of the
                 rest of the footer depends on whether double-sided layout
                 is enabled with the option -rD1.  When disabled (the
                 default), footer-inside is positioned at the bottom left.
                 Otherwise, footer-inside appears at the bottom left on
                 odd-numbered (recto) pages, and at the bottom right on
                 even-numbered (verso) pages.  The outside footer is the
                 page number, except in the continuous-rendering mode
                 enabled by the option -rcR=1, in which case it is the
                 title and section, as in the header.  header-middle is
                 centered in the header line.  If section is a simple
                 integer between 1 and 9 (inclusive), or is exactly “3p”,
                 there is no need to specify header-middle; the macro
                 package will supply text for it.  For HTML output, headers
                 and footers are completely suppressed.

                 Additionally, this macro starts a new page; the page
                 number is reset to 1 (unless the -rC1 option is given).
                 This feature is intended only for formatting multiple man
                 pages.

                 A man page should contain exactly one .TH call at or near
                 the beginning of the file, prior to any other macro calls.

          .SH [heading-text]
                 Set heading-text as a section heading.  The text following
                 .SH up to the end of the line, or the text on the next
                 input line if .SH is given no arguments, is set with no
                 indentation, in bold (or the font specified by the string
                 HF) and, on typesetter devices, slightly larger than the
                 base point size.  If the heading font \*[HF] is bold, use
                 of an italic style in heading-text is mapped to the bold-
                 italic style if available in the font family.
                 Additionally, the left margin and indentation affecting
                 subsequent text are reset to their default values.  Text
                 on input lines after heading-text is set as an ordinary
                 paragraph (.P).

                 The content of heading-text and ordering of sections has
                 been standardized by common practice, as has much of the
                 layout of material within sections.  For example, a
                 section called “Name” or “NAME” must exist, must be the
                 first section after the .TH call, and must contain only a
                 line of the form
                        topic[, another-topic]... \- summary-description
                 for a man page to be properly indexed.  See
                 groff_man_style(7) for suggestions and man(7) for the
                 conventions prevailing on your system.

          .SS [subheading-text]
                 Set subheading-text as a subsection heading indented
                 between a section heading and an ordinary paragraph (.P).
                 See subsection “Horizontal and vertical spacing” below for
                 the indentation amount.  The text following .SS up to the
                 end of the line, or the text on the next input line if .SS
                 is given no arguments, is set in bold (or the font
                 specified by the string HF).  If the heading font \*[HF]
                 is bold, use of an italic style in heading-text is mapped
                 to the bold-italic style if available in the font family.
                 Additionally, the left margin and indentation affecting
                 subsequent text are reset to their default values.  Text
                 on input lines after subheading-text is set as an ordinary
                 paragraph (.P).

          .EX
          .EE    Begin and end example.  After .EX, filling is disabled and
                 a constant-width (monospaced) font is selected.  Calling
                 .EE enables filling and restores the previous font.

                 These macros are extensions, introduced in Version 9
                 Research Unix, to the original man package.  Many systems
                 running AT&T, Heirloom Doctools, or Plan 9 troff support
                 them.  To be certain your page will be portable to systems
                 that do not, copy their definitions from the an-ext.tmac
                 file of a groff installation.

          .RS [indent]
                 Start a new relative inset level, moving the left margin
                 right by indent, if specified, and by a default amount
                 otherwise; see subsection “Horizontal and vertical
                 spacing” below.  Calls to .RS can be nested; each call
                 increments by 1 the inset level used by .RE.  The inset
                 level prior to any .RS calls is 1.

          .RE [level]
                 End a relative inset; move the left margin back to that
                 corresponding to inset level level.  If no argument is
                 given, move the left margin one level back.

      Paragraph macros
          An ordinary paragraph (.P) is set without a first-line
          indentation at the current left margin, which by default is
          indented from the leftmost position of the output device.  In man
          pages and other technical literature, definition lists are
          frequently encountered; these can be set as “tagged paragraphs”,
          which have one (.TP) or more (.TQ) leading tags followed by a
          paragraph that has an additional indentation.  The indented
          paragraph (.IP) macro is useful to continue the indented content
          of a narrative started with .TP, or to present an itemized or
          ordered list.  All paragraph macros break the output line at the
          current position.  If another paragraph macro has occurred since
          the previous .SH or .SS, they (except for .TQ) follow the break
          with a default amount of vertical space, which can be changed by
          the deprecated .PD macro; see subsection “Horizontal and vertical
          spacing” below.  They also reset the point size and font style to
          defaults (.TQ again excepted); see subsection “Font style macros”
          below.

          .P
          .LP
          .PP    Begin a new paragraph; these macros are synonymous.  The
                 indentation is reset to the default value; the left
                 margin, as affected by .RS and .RE, is not.

          .TP [indent]
                 Set a paragraph with a leading tag, and the remainder of
                 the paragraph indented.  The input line following this
                 macro, known as the tag, is printed at the current left
                 margin.  Subsequent text is indented by indent, if
                 specified, and by a default amount otherwise; see
                 subsection “Horizontal and vertical spacing” below.

                 If the tag is not as wide as the indentation, the
                 paragraph starts on the same line as the tag, at the
                 applicable indentation, and continues on the following
                 lines.  Otherwise, the descriptive part of the paragraph
                 begins on the line following the tag.

          .TQ    Set an additional tag for a paragraph tagged with .TP.
                 The pending output line is broken.  The tag on the input
                 line following this macro and subsequent lines are handled
                 as with .TP.

                 This macro is a GNU extension not defined on systems
                 running AT&T, Plan 9, or Solaris troff; see an-ext.tmac in
                 section “Files” below.

          .IP [tag] [indent]
                 Set an indented paragraph with an optional tag.  The tag
                 and indent arguments, if present, are handled as with .TP,
                 with the exception that the tag argument to .IP cannot
                 include a macro call.

      Command synopsis macros
          Command synopses are a staple of section 1 and 8 man pages.
          These macros aid you to construct one that has the classical Unix
          appearance.  A command synopsis is wrapped in .SY/.YS calls, with
          command-line options of some formats indicated by .OP.

          These macros are extensions (.OP from Documenter's Workbench
          troff, .SY and .YS from GNU) not defined on systems running AT&T,
          Plan 9, or Solaris troff; see an-ext.tmac in section “Files”
          below.

          .SY command
                 Begin synopsis.  A new paragraph is begun at the left
                 margin unless .SY has already been called without a
                 corresponding .YS, in which case only a break is
                 performed.  Hyphenation is turned off.  The command
                 argument is set in bold.  The output line is filled as
                 normal, but if a break is required, subsequent output
                 lines are indented by the width of command plus a space.

          .OP option-name [option-argument]
                 Indicate an optional command parameter called option-name,
                 which is set in bold.  If the option takes an argument,
                 specify option-argument using a noun, abbreviation, or
                 hyphenated noun phrase.  If present, option-argument is
                 preceded by a space and set in italics.  Square brackets
                 in roman surround both arguments.

          .YS    End synopsis.  Restore previous indentation and initial
                 hyphenation mode.

      Hyperlink and email macros
          Email addresses are bracketed with .MT/.ME and URL hyperlinks
          with .UR/.UE.

          These macros are GNU extensions not defined on systems running
          AT&T, Plan 9, or Solaris troff; see an-ext.tmac in section
          “Files” below.

          .MT address
          .ME [punctuation]
                 Identify address as an RFC 6068 addr-spec for a “mailto:”
                 URI with the text between the two macro calls as the link
                 text.  A punctuation argument to .ME is placed at the end
                 of the link text without intervening space.  address may
                 not be visible in the output text, particularly if the man
                 page is being viewed as HTML.  On a device that is not a
                 browser, address is set in angle brackets after the link
                 text and before punctuation.

          .UR URL
          .UE [punctuation]
                 Identify URL as an RFC 3986 URI hyperlink with the text
                 between the two macro calls as the link text.  A
                 punctuation argument to .UE is placed at the end of the
                 link text without intervening space.  URL may not be
                 visible in the output text, particularly if the man page
                 is being viewed as HTML.  On a device that is not a
                 browser, URL is set in angle brackets after the link text
                 and before punctuation.

      Font style macros
          The man macro package is limited in its font styling options,
          offering only bold (.B), italic (.I), and roman.  Italic text is
          usually set underscored instead on terminal devices.  The .SM and
          .SB macros set text in roman or bold, respectively, at a smaller
          point size; these differ visually from regular-sized roman or
          bold text only on typesetter devices.  It is often necessary to
          set text in different styles without intervening space.  The
          macros .BI, .BR, .IB, .IR, .RB, and .RI, where “B”, “I”, and “R”
          indicate bold, italic, and roman, respectively, set their odd-
          and even-numbered arguments in alternating styles, with no space
          separating them.

          The default point size and family for typesetter devices is
          10-point Times, except on the X75-12 and X100-12 devices where
          the point size is 12.  The default style is roman.

          .B [text]
                 Set text in bold.  If the macro is given no arguments, the
                 text of the next input line is set in bold.

          .I [text]
                 Set text in italics.  If the macro is given no arguments,
                 the text of the next input line is set in italics.

          .SM [text]
                 Set text one point smaller than the default point size on
                 typesetter devices.  If the macro is given no arguments,
                 the text of the next input line is set smaller.

          .SB [text]
                 Set text in bold and (on typesetter devices) one point
                 smaller than the default point size.  If the macro is
                 given no arguments, the text of the next input line is set
                 smaller and in bold.

          Unlike the above font style macros, the font style alternation
          macros below accept only arguments on the same line as the macro
          call.  Italic corrections are applied as appropriate.  If space
          is required within one of the arguments, first consider whether
          the same result could be achieved with as much clarity by using
          the single-style macros on separate input lines.  When it cannot,
          double-quote an argument containing embedded space characters.
          Setting all three different styles within a word presents
          challenges; see subsection “Portability” in groff_man_style(7)
          for approaches.

          .BI bold-text italic-text ...
                 Set each argument in bold and italics, alternately.

          .BR bold-text roman-text ...
                 Set each argument in bold and roman, alternately.

          .IB italic-text bold-text ...
                 Set each argument in italics and bold, alternately.

          .IR italic-text roman-text ...
                 Set each argument in italics and roman, alternately.

          .RB roman-text bold-text ...
                 Set each argument in roman and bold, alternately.

          .RI roman-text italic-text ...
                 Set each argument in roman and italics, alternately.

      Horizontal and vertical spacing
          The indent argument accepted by .RS, .IP, .TP, and the deprecated
          .HP is a number plus an optional scaling indicator.  If no
          scaling indicator is given, the man package assumes “n”.  An
          indentation specified in a call to .IP, .TP, or the deprecated
          .HP persists until (1) another of these macros is called with an
          explicit indent argument, or (2) .SH, .SS, or .P or its synonyms
          is called; these clear the indentation entirely.  Relative insets
          created by .RS move the left margin and persist until .RS, .RE,
          .SH, or .SS is called.

          The indentation amount exhibited by ordinary paragraphs set with
          .P (and its synonyms) not within an .RS/.RE relative inset, and
          the default used when .IP, .RS, .TP, and the deprecated .HP are
          not given an indentation argument, is 7.2n for typesetter devices
          and 7n for terminal devices (but see the -rIN option).  Headers,
          footers (both set with .TH), and section headings (.SH) are set
          with no indentation and subsection headings (.SS) are indented 3n
          (but see the -rSN option).  However, the HTML output device
          ignores indentation completely.

          The following macros break the output line and insert vertical
          space: .SH, .SS, .TP, .P (and its synonyms), .IP, and the
          deprecated .HP.  The default inter-section and inter-paragraph
          spacing is is 1v for terminal devices and 0.4v for typesetter
          devices.  In .EX/.EE sections, the inter-paragraph spacing is 1v
          regardless of output device.  (The deprecated macro .PD can
          change this vertical spacing, but its use is discouraged.)  The
          macros .RS, .RE, .EX, .EE, and .TQ also cause a break but no
          insertion of vertical space.

      Registers
          Registers are described in section “Options” below.  They can be
          set not only on the command line but in the site man.local file
          as well; see section “Files” below.

      Strings
          The following strings are defined for use in man pages.  None of
          these is necessary in a contemporary man page; see
          groff_man_style(7).  Others are supported for configuration of
          rendering parameters; see section “Options” below.

          \*R    interpolates a special character escape sequence for the
                 “registered sign” glyph, \(rg, if available, and “(Reg.)”
                 otherwise.

          \*S    interpolates an escape sequence setting the point size to
                 the document default.

          \*(lq
          \*(rq  interpolate special character escape sequences for left
                 and right double-quotation marks, \(lq and \(rq,
                 respectively.

          \*(Tm  interpolate special character escape sequences for the
                 “trade mark sign” glyph, \(tm, if available, and “(TM)”
                 otherwise.

      Interaction with preprocessors
          When a preprocessor like tbl or eqn is needed, a hint can be
          given to the man page librarian by making the first line of a man
          page look like this:

                 '\" word

          The line starts with an apostrophe ('), not a dot, and a single
          space character follows the double quote.  The word consists of
          one letter for each needed preprocessor: “e” for eqn, “r” for
          refer, and “t” for tbl.  Modern implementations of the man
          program can use this information to automatically call the
          required preprocessor(s) in the right order.

          The usual tbl and eqn macros for table and equation inclusion,
          .TS, .T&, .TE, .EQ, and .EN, may be used freely.  Terminal
          devices are extremely limited in presentation of mathematical
          equations.

      Hooks
          Two macros, both GNU extensions, are called internally by the
          groff man package to format page headers and footers and can be
          redefined by the administrator in a site's man.local file (see
          section “Files” below).  The default headers and footers are
          documented in the description of .TH above.  Because these macros
          are hooks for groff man internals, man pages have no reason to
          call them.  A macro definition for these hooks typically consists
          of a “.tl” request.

          .BT    Set the page footer text (“bottom trap”).

          .PT    Set the page header text (“page trap”).

      Deprecated features
          Use of the following in man pages for public distribution is
          discouraged.

          .AT [system [release]]
                 Alter the footer for use with legacy AT&T man pages,
                 overriding any definition of the footer-inside argument to
                 .TH.  This macro exists only for compatibility, to render
                 man pages from historical systems.

                 The first argument system can be:

                        3      7th edition (default)

                        4      System III

                        5      System V

                 The optional second argument release specifies the release
                 number, such as in “System V Release 3”.

          .DT    Set tab stops every 0.5i (inches).  Since this macro is
                 called by .TH, it would make sense to call it only if a
                 man page changes the tab stops.

                 Use of this presentation-level macro is deprecated.  It
                 translates poorly to HTML, under which exact space control
                 and tabulation are not readily available.  Thus,
                 information or distinctions that you use .DT to express
                 are likely to be lost.  If you feel tempted to use it, you
                 should probably be composing a table using tbl(1) markup
                 instead.

          .HP [indent]
                 Set up a paragraph with a hanging left indentation.  The
                 indent argument, if present, is handled as with .TP.

                 Use of this presentation-level macro is deprecated.  A
                 hanging indentation cannot be expressed naturally under
                 HTML, and HTML-based man page processors may interpret it
                 as starting an ordinary paragraph.  Thus, any information
                 or distinction you mean to express with the indentation
                 may be lost.

          .PD [vertical-space]
                 Define the vertical space between paragraphs or
                 (sub)sections.  The optional argument vertical-space
                 specifies the amount; the default scaling indicator is
                 “v”.  Without an argument, the spacing is reset to its
                 default value; see subsection “Horizontal and vertical
                 spacing” above.

                 Use of this presentation-level macro is deprecated.  It
                 translates poorly to HTML, under which exact control of
                 inter-paragraph spacing is not readily available.  Thus,
                 information or distinctions that you use .PD to express
                 are likely to be lost.

          .UC [version]
                 Alter the footer for use with legacy BSD man pages,
                 overriding any definition of the footer-inside argument to
                 .TH.  This macro exists only for compatibility, to render
                 man pages from historical systems.

                 The argument version can be:

                        3      3rd Berkeley Distribution (default)

                        4      4th Berkeley Distribution

                        5      4.2 Berkeley Distribution

                        6      4.3 Berkeley Distribution

                        7      4.4 Berkeley Distribution

      History
          Version 7 Unix (1979) introduced the man macro package and
          supported all of the macros described in this page not listed as
          extensions, except .P, .SB, and the deprecated .AT and .UC.  The
          only strings defined were R and S; no registers were documented.
          .UC appeared in 3BSD (1980) and .P in Unix System III (1980).
          PWB/UNIX 2.0 (1980) added the Tm string.  4BSD (1980) added lq
          and rq strings.  4.3BSD (1986) added .AT and .P.  Version 9 Unix
          (1986) introduced .EX and .EE.  SunOS 4.0 (1988) may have been
          the first to support .SB.


-------------------------------------------------------

::

          The following groff options set registers (with -r) and strings
          (with -d) recognized and used by the man macro package.

          -dAD=adjustment-mode
                 Set line adjustment to adjustment-mode, which is typically
                 “b” for adjustment to both margins (the default), or “l”
                 for left alignment (ragged right margin).  Any valid
                 argument to groff's “.ad” request may be used.  See
                 groff(7) for less-common choices.

          -rcR=1 Continuous rendering.  Do not paginate the output; produce
                 one (potentially very long) output page.  This is the
                 default for terminal and HTML devices.  Use -rcR=0 to
                 disable it.

          -rC1   Number output pages continuously.  If multiple man pages
                 are processed, number the output pages in strictly
                 increasing sequence, rather than resetting the page number
                 to 1 at each new man document.

          -rCS=1 Capitalize section headings.  Set section headings (the
                 argument(s) to .SH) in full capitals.  This transformation
                 is off by default because it discards case distinction
                 information.

          -rCT=1 Capitalize titles.  Set the man page title (the first
                 argument to .TH) in full capitals in headers and footers.
                 This transformation is off by default because it discards
                 case distinction information.

          -rD1   Enable double-sided layout.  Format footers for even and
                 odd pages differently; see the description of .TH in
                 subsection “Document structure macros” above.

          -rFT=footer-distance
                 Set distance of the footer, relative to the bottom of the
                 page if negative or top if positive, to footer-distance.
                 At twice this distance, the page text is broken before
                 writing the footer.  Ignored if continuous rendering is
                 enabled.  The default is -0.5i.

          -dHF=heading-font
                 See the font used for section and subsection headings; the
                 default is “B” (bold).  Any valid argument to groff's
                 “.ft” request may be used.  See groff(7).

          -rHY=hyphenation-mode
                 Set hyphenation mode, as documented in section
                 “Hyphenation” of groff(7).  Use -rHY=0 to disable
                 hyphenation.  The default is 4 if continuous rendering is
                 enabled (-rcR=1 above), and 6 otherwise.  Any valid
                 argument to groff's “.hy” request may be used.

          -rIN=standard-indent
                 Set the amount of indentation used for ordinary paragraphs
                 (.P and its synonyms) and the default indentation amount
                 used by .IP, .RS, .TP, and the deprecated .HP.  See
                 subsection “Horizontal and vertical spacing” above for the
                 default.  For terminal devices, standard-indent should
                 always be an integer multiple of unit “n” to get
                 consistent indentation.

          -rLL=line-length
                 Set line length; the default is 78n for terminal devices
                 and 6.5i for typesetter devices.

          -rLT=title-length
                 Set the line length for titles.  By default, the line
                 length (see -rLL above) is used for the title length.

          -rPn   Start enumeration of pages at n rather than 1.

          -rSpoint-size
                 Use point-size as the base point size; acceptable values
                 are 10, 11, or 12.  See subsection “Font style macros”
                 above for the default.

          -rSN=subsection-indent
                 Set indentation of subsection headings to subsection-
                 indent.  See subsection “Horizontal and vertical spacing”
                 above for the default.

          -rXp   After page p, number pages as pa, pb, pc, and so forth.
                 The register tracking the suffixed page letter uses format
                 “a” (see the “.af” request in groff(7)).


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/an.tmac
                 Most man macros are contained in this file.  It also loads
                 the extensions from an-ext.tmac (see below).

          /usr/local/share/groff/1.23.0/tmac/andoc.tmac
                 This brief groff program detects whether the man or mdoc
                 macro package is being used by a document and loads the
                 correct macro definitions, taking advantage of the fact
                 that pages using them must call .TH or .Dd, respectively,
                 as their first macro.  A man program or user typing, for
                 example, “groff -mandoc page.1”, need not know which
                 package the file page.1 uses.  Multiple man pages, in
                 either format, can be handled; andoc reloads each macro
                 package as necessary.

          /usr/local/share/groff/1.23.0/tmac/an-ext.tmac
                 The extension macro definitions for .SY, .OP, .YS, .TQ,
                 .EX/.EE, .UR/.UE, and .MT/.ME are contained in this file,
                 which is written to be compatible with AT&T troff and
                 permissively licensed—not copylefted.  Man page authors
                 concerned about portability to legacy Unix systems are
                 encouraged to copy these definitions into their pages, and
                 maintainers of troff implementations or work-alike systems
                 that format man pages are encouraged to re-use them.

                 The definitions for these macros are read after a page
                 calls .TH, so they will replace any macros of the same
                 names preceding it in your file.  If you use your own
                 implementations of these macros, they must be defined
                 after calling .TH to have any effect.  Furthermore, it is
                 wise to define such page-local macros (if at all) after
                 the “Name” section to accommodate timid mandb
                 implementations that may give up their scan for indexing
                 material early.

          /usr/local/share/groff/1.23.0/tmac/man.tmac
                 This is a wrapper that loads an.tmac.

          /usr/local/share/groff/1.23.0/tmac/mandoc.tmac
                 This is a wrapper that loads andoc.tmac.

          /usr/local/share/groff/site-tmac/man.local
                 Put local changes and customizations into this file.


-------------------------------------------------------

::

          M. Douglas McIlroy ⟨m.douglas.mcilroy@dartmouth.edu⟩ designed,
          implemented, and documented the AT&T man macros, using them when
          he edited the first volume of the Version 7 Unix manual, a
          compilation of all man pages supplied by the system.

          The GNU version of the man macro package was written by James
          Clark and contributors.  The extension macros were written by
          Werner Lemberg ⟨wl@gnu.org⟩ and Eric S. Raymond ⟨esr@thyrsus
          .com⟩.

          This document was originally written for the Debian GNU/Linux
          system by Susan G. Kleinmann ⟨sgk@debian.org⟩.  It was corrected
          and updated by Werner Lemberg and G. Branden Robinson ⟨g.branden
          .robinson@gmail.com⟩.  The extension macros were documented by
          Eric S. Raymond.


---------------------------------------------------------

::

          tbl(1), eqn(1), and refer(1) are preprocessors used with man
          pages.

          man(1) describes the man page librarian on your system.

          groff_mdoc(7) describes the groff version of the BSD-originated
          alternative macro package for man pages.

          groff_man_style(7), groff(7), groff_char(7), man(7)

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

   groff 1.23.0.rc1.1101-d1263-di1r9tyAugust 2021                 groff_man(7)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`groff_man_style(7) <../man7/groff_man_style.7.html>`__, 
`man(7) <../man7/man.7.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__, 
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
