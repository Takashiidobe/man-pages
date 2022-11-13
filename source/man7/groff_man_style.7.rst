.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_man_style(7) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Notes <#Notes>`__ \|             |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_man_style(7)  Miscellaneous Information Manual  groff_man_style(7)


-------------------------------------------------

::

          groff_man_style - GNU roff man page tutorial and style guide


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

          Man pages should be encoded using Unicode basic Latin code points
          exclusively, and employ the Unix line-ending convention (U+000A
          only).

      Macro reference preliminaries
          Each macro is described in a tagged paragraph.  Closely related
          macros, such as .EX and .EE, are grouped together.

          A macro call appears on a line starting with a dot (“.”),
          followed by zero or more spaces and then the macro name.  Some
          macros accept arguments; each such argument is separated from the
          macro name and any subsequent arguments by one or more spaces.  A
          newline, unless escaped (see subsection “Portability” below),
          terminates the macro call.

          Optional macro arguments are indicated by surrounding them with
          square brackets.  If a macro accepts multiple arguments, those
          containing space characters must be double-quoted to be
          interpreted correctly.  An empty macro argument can be specified
          with a pair of double-quotes (“""”), but the man package is
          designed such that this should seldom be necessary.  See section
          “Notes” below for examples of cases where better alternatives to
          empty arguments in macro calls are available.  Most macro
          arguments are strings that will be output as text; exceptions are
          noted.

          Bear in mind that groff is fundamentally a programming system for
          typesetting.  Consequently, the verb “to set” is frequently used
          below in the sense “to typeset”.

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
                 of the manual volume as section.  This use of “section”
                 has nothing to do with the section headings otherwise
                 discussed in this page; it arises from the organizational
                 scheme of printed and bound Unix manuals.  See man(1) for
                 details on the section numbers and suffixes applicable to
                 your system.  title and section are positioned together at
                 the left and right in the header line (with section in
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

                 By convention, footer-middle is the most recent
                 modification date of the man page source document, and
                 footer-inside is the name and version or release of the
                 project providing it.

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
                 for a man page to be properly indexed.  See man(7) for the
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

                 Example regions are useful for formatting code, shell
                 sessions, and text file contents.

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
          An ordinary paragraph (.P) like this one is set without a first-
          line indentation at the current left margin, which by default is
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

                 The line containing the tag can include a macro call, for
                 instance to set the tag in bold with .B.  .TP was used to
                 write the first paragraph of this description of .TP, and
                 .IP the subsequent ones.

          .TQ    Set an additional tag for a paragraph tagged with .TP.
                 The pending output line is broken.  The tag on the input
                 line following this macro and subsequent lines are handled
                 as with .TP.

                 This macro is a GNU extension not defined on systems
                 running AT&T, Plan 9, or Solaris troff; see an-ext.tmac in
                 section “Files” below.

                 The descriptions of .P, .LP, and .PP above were written
                 using .TP and .TQ.

          .IP [tag] [indent]
                 Set an indented paragraph with an optional tag.  The tag
                 and indent arguments, if present, are handled as with .TP,
                 with the exception that the tag argument to .IP cannot
                 include a macro call.

                 Two convenient uses for .IP are

                        (1) to start a new paragraph with the same
                            indentation as an immediately preceding .IP or
                            .TP paragraph, if no indent argument is given;
                            and

                        (2) to set a paragraph with a short tag that is not
                            semantically important, such as a bullet
                            (•)—obtained with the \(bu special character
                            escape sequence—or list enumerator, as seen in
                            this very paragraph.

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
                 margin (like .P and its aliases) unless .SY has already
                 been called without a corresponding .YS, in which case
                 only a break is performed.  Hyphenation is turned off.
                 The command argument is set in bold.  The output line is
                 filled as normal, but if a break is required, subsequent
                 output lines are indented by the width of command plus a
                 space.

          .OP option-name [option-argument]
                 Indicate an optional command parameter called option-name,
                 which is set in bold.  If the option takes an argument,
                 specify option-argument using a noun, abbreviation, or
                 hyphenated noun phrase.  If present, option-argument is
                 preceded by a space and set in italics.  Square brackets
                 in roman surround both arguments.

          .YS    End synopsis.  Restore previous indentation and initial
                 hyphenation mode.

          Multiple .SY/.YS blocks can be specified, for instance to
          distinguish differing modes of operation of a complex command
          like tar(1); each will be vertically separated as paragraphs are.

          .SY can also be repeated multiple times before a closing .YS,
          which is useful to indicate synonymous ways of invoking a
          particular mode of operation.

          groff's own command-line interface serves to illustrate most of
          the specimens of synopsis syntax one is likely to encounter.

                 .SY groff
                 .RB [ \-abcCeEgGijklNpRsStUVXzZ ]
                 .RB [ \-d\~\c
                 .IR cs ]
                 .RB [ \-d\~\c
                 .IB name =\c
                 .IR string ]
                 .RB [ \-D\~\c
                 .IR enc ]
                 (and so on similarly)
                 .RI [ file\~ .\|.\|.]
                 .YS
                 .
                 .
                 .SY groff
                 .B \-h
                 .
                 .SY groff
                 .B \-\-help
                 .YS
                 .
                 .
                 .SY groff
                 .B \-v
                 .RI [ option\~ .\|.\|.\&]
                 .RI [ file\~ .\|.\|.]
                 .
                 .SY groff
                 .B \-\-version
                 .RI [ option\~ .\|.\|.\&]
                 .RI [ file\~ .\|.\|.]
                 .YS

          produces the following output.

                 groff [-abcCeEgGijklNpRsStUVXzZ] [-d cs] [-d name=string]
                       [-D enc] [-f fam] [-F dir] [-I dir] [-K enc]
                       [-L arg] [-m name] [-M dir] [-n num] [-o list]
                       [-P arg] [-r cn] [-r reg=expr] [-T dev] [-w name]
                       [-W name] [file ...]

                 groff -h
                 groff --help

                 groff -v [option ...] [file ...]
                 groff --version [option ...] [file ...]

          Several features of the above example are of note.

          •      The empty request (.), which does nothing, is used for
                 vertical spacing in the input file for readability by the
                 document maintainer.  Do not put blank (empty) lines in a
                 man page source document.

          •      The command and option names are presented in bold to cue
                 the user that they should be input literally.

          •      Option dashes are specified with the \- escape sequence;
                 this is an important practice to make them clearly visible
                 and to facilitate copy-and-paste from the rendered man
                 page to a shell prompt or text file.

          •      Option arguments and command operands are presented in
                 italics (but see subsection “Font style macros” below
                 regarding terminals) to cue the user that they must be
                 replaced with appropriate text.

          •      Symbols that are neither to be typed literally nor
                 replaced at the user's discretion appear in the roman
                 style; brackets surround optional arguments, and an
                 ellipsis indicates that the previous syntactical element
                 may be repeated arbitrarily.

          •      The non-breaking adjustable space escape sequence \~ is
                 used to prevent the output line from being broken within
                 the option brackets.

          •      The output line continuation escape sequence \c is used
                 with font style alternation macros to allow all three font
                 styles to be set without (breakable) space among them; see
                 subsection “Portability” below.

          •      The non-printing input break escape sequence \& follows
                 the ellipsis when further text will follow after space on
                 the output line.  This keeps the ellipsis's last period
                 from being interpreted as the end of a sentence,
                 preventing its last period from marking the end of a
                 sentence, which would cause additional inter-sentence
                 space to be placed after it.  See subsection “Portability”
                 below.

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

                 When rendered by groff to a terminal or PostScript device,

                        Contact
                        .MT fred\:.foonly@\:fubar\:.net
                        Fred Foonly
                        .ME
                        for more information.

                 displays as “Contact Fred Foonly ⟨fred.foonly@fubar.net⟩
                 for more information.”.

                 The use of \: to insert non-printing break points is a GNU
                 extension and can be omitted.  We place them before each
                 period so that the reader does not mistake them for
                 sentence endings.

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

                 When rendered by groff to a terminal or PostScript device,

                        The GNU Project of the Free Software Foundation
                        hosts the
                        .UR https://\:www\:.gnu\:.org/\:software/\:groff/
                        .I groff
                        home page
                        .UE .

                 displays as “The GNU Project of the Free Software
                 Foundation hosts the groff home page
                 ⟨https://www.gnu.org/software/groff/⟩.”.

                 The use of \: to insert non-printing break points is a GNU
                 extension and can be omitted.  We place a break point
                 before each period so that the reader does not interpret
                 the period as ending a sentence.

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

          Because font styles are presentational rather than semantic,
          conflicting traditions have arisen regarding which font styles
          should be used to mark file or path names, environment variables,
          in-line literals, and man page cross-references.

          The default point size and family for typesetter devices is
          10-point Times, except on the X75-12 and X100-12 devices where
          the point size is 12.  The default style is roman.

          .B [text]
                 Set text in bold.  If the macro is given no arguments, the
                 text of the next input line is set in bold.

                 Use bold for literal portions of syntax synopses, for
                 command-line options in running text, and for literals
                 that are major topics of the subject under discussion; for
                 example, this page uses bold for macro, string, and
                 register names.  In an .EX/.EE example of interactive I/O
                 (such as a shell session), set only user input in bold.

          .I [text]
                 Set text in italics.  If the macro is given no arguments,
                 the text of the next input line is set in italics.

                 Use italics for file and path names, for environment
                 variables, for enumeration or preprocessor constants in C,
                 for variable (user-determined) portions of syntax
                 synopses, for the first occurrence (only) of a technical
                 concept being introduced, for names of works of software
                 (including commands and functions, but excluding names of
                 operating systems or their kernels), and anywhere a
                 parameter requiring replacement by the user is
                 encountered.  An exception involves variable text in a
                 context that is already marked up in italics, such as file
                 or path names with variable components; in such cases,
                 follow the convention of mathematical typography: set the
                 file or path name in italics as usual but use roman for
                 the variable part (see .IR and .RI below), and italics
                 again in running roman text when referring to the variable
                 material.

          .SM [text]
                 Set text one point smaller than the default point size on
                 typesetter devices.  If the macro is given no arguments,
                 the text of the next input line is set smaller.

                 Note: terminals will render text at normal size instead.
                 Do not rely upon .SM to communicate semantic information
                 distinct from using roman style at normal size; it will be
                 hidden from readers using such devices.

          .SB [text]
                 Set text in bold and (on typesetter devices) one point
                 smaller than the default point size.  If the macro is
                 given no arguments, the text of the next input line is set
                 smaller and in bold.

                 Note: terminals will render text in bold at the normal
                 size instead.  Do not rely upon .SB to communicate
                 semantic information distinct from using bold style at
                 normal size; it will be hidden from readers using such
                 devices.

          Note what is not prescribed for setting in bold or italics above:
          elements of “synopsis language” such as ellipses and brackets
          around options; proper names and adjectives; titles of anything
          other than works of literature or software; identifiers for
          standards documents or technical reports such as CSTR #54,
          RFC 1918, Unicode 13.0, or POSIX.1-2017; acronyms; and
          occurrences after the first of a technical term or piece of
          jargon.  Again, the names of operating systems and their kernels
          are, by practically universal convention, set in roman.

          Be frugal with italics for emphasis, and particularly with bold.
          Brief runs of literal text, such as references to individual
          characters or short strings, including section and subsection
          headings of man pages, are suitable objects for quotation; see
          the \(lq, \(rq, \(oq, and \(cq escapes in subsection
          “Portability” below.

          Unlike the above font style macros, the font style alternation
          macros below accept only arguments on the same line as the macro
          call.  Italic corrections are applied as appropriate.  If space
          is required within one of the arguments, first consider whether
          the same result could be achieved with as much clarity by using
          the single-style macros on separate input lines.  When it cannot,
          double-quote an argument containing embedded space characters.
          Setting all three different styles within a word presents
          challenges; it is possible with the \c and/or \f escape
          sequences, but see subsection “Portability” below for caveats.

          .BI bold-text italic-text ...
                 Set each argument in bold and italics, alternately.

                        .BI \-r\~ reg = n

          .BR bold-text roman-text ...
                 Set each argument in bold and roman, alternately.

                        After invocation of
                        .BR .NH ,
                        the assigned number is made available in the strings

          .IB italic-text bold-text ...
                 Set each argument in italics and bold, alternately.

                        .I groff
                        copes with this situation by searching for both
                        .IB anything .tmac
                        and
                        .BI tmac. anything

          .IR italic-text roman-text ...
                 Set each argument in italics and roman, alternately.

                        The
                        .I groff
                        font file is written to
                        .IR font .

          .RB roman-text bold-text ...
                 Set each argument in roman and bold, alternately.

                        and do not handle the
                        .RB \(lq "delim on" \(rq
                        statement specially.

          .RI roman-text italic-text ...
                 Set each argument in roman and italics, alternately.

                        .RI [ file\~ .\|.\|.]

      Horizontal and vertical spacing
          The indent argument accepted by .RS, .IP, .TP, and the deprecated
          .HP is a number plus an optional scaling indicator.  If no
          scaling indicator is given, the man package assumes “n”; that is,
          the width of a letter “n” in the font current when the macro is
          called (see section “Numerical Expressions” in groff(7)).  An
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

          It may be helpful to think of the left margin and indentation as
          related but distinct concepts; groff's implementation of the man
          macro package tracks them separately.  The left margin is
          manipulated by .RS and .RE (and by .SH and .SS, which reset it to
          the default).  The other kind of indentation is controlled by the
          paragraphing macros (though, again, .SH and .SS reset it).
          Indentation is imposed by the .TP, .IP, and deprecated .HP
          macros, and cancelled by .P and its synonyms.  An extensive
          example follows.

          This ordinary (.P) paragraph is not in a relative inset nor does
          it possess an indentation.

                 Now we have created a relative inset (in other words,
                 moved the left margin) with .RS and started another
                 ordinary paragraph with .P.

                 tag    This tagged paragraph, set with .TP, is still
                        within the .RS region, but lines after the first
                        have a supplementary indentation that the tag
                        lacks.

                        A paragraph like this one, set with .IP, will
                        appear to the reader as also associated with the
                        tag above, because .IP re-uses the previous
                        paragraph's indentation unless given an argument to
                        change it.  This paragraph is affected both by the
                        moved left margin (.RS) and indentation (.IP).

                        ┌─────────────────────────────────┐
                        │This table is affected both by   │
                        │the left margin and indentation. │
                        └─────────────────────────────────┘
                 •      This indented paragraph has a bullet for a tag,
                        making it more obvious that the left margin and the
                        paragraph indentation are distinct; only the former
                        affects the tag, but both affect the text of the
                        paragraph.

                 This ordinary (.P) paragraph resets the indentation, but
                 the left margin is still inset.

                 ┌────────────────────────────┐
                 │This table is affected only │
                 │by the left margin.         │
                 └────────────────────────────┘
          Finally, we have ended the relative inset by using .RE, which
          (because we only used one .RS/.RE pair) has reset the left margin
          to the default.  This is an ordinary .P paragraph.

          Resist the temptation to mock up tabular or multi-column output
          with horizontal tab characters or the indentation arguments to
          .IP, .TP, .RS, or the deprecated .HP; the result may not render
          comprehensibly on an output device you fail to check, or which is
          developed in the future.  The table preprocessor tbl(1) can
          likely meet your needs.

          The following macros break the output line and insert vertical
          space: .SH, .SS, .TP, .P (and its synonyms), .IP, and the
          deprecated .HP.  The default inter-section and inter-paragraph
          spacing is is 1v for terminal devices and 0.4v for typesetter
          devices (“v” is a unit of vertical distance, where 1v is the
          distance between adjacent text baselines in a single-spaced
          document).  In .EX/.EE sections, the inter-paragraph spacing is
          1v regardless of output device.  (The deprecated macro .PD can
          change this vertical spacing, but its use is discouraged.)  The
          macros .RS, .RE, .EX, .EE, and .TQ also cause a break but no
          insertion of vertical space.

      Registers
          Registers are described in section “Options” below.  They can be
          set not only on the command line but in the site man.local file
          as well; see section “Files” below.

      Strings
          The following strings are defined for use in man pages.  Others
          are supported for configuration of rendering parameters; see
          section “Options” below.

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

          None of the above is necessary in a contemporary man page.  \*S
          is superfluous, since point size changes are invisible on
          terminal devices and macros that change it restore its original
          value afterward.  Better alternatives exist for the rest; simply
          use the \(rg, \(lq, \(rq, and \(tm special character escape
          sequences directly.  Unless a man page author is aiming for a
          pathological level of portability, such as the composition of
          pages for consumption on simulators of 1980s Unix systems (or
          Solaris troff, though even it supports \rg), the above strings
          should be avoided.

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

      Portability
          The two major syntactical categories of roff languages are
          requests and escapes.  Since the man macros are implemented in
          terms of groff requests and escapes, one can, in principle,
          supplement the functionality of man with these lower-level
          elements where necessary.

          However, using raw groff requests (apart from the empty request
          “.”) is likely to make your page render poorly when processed by
          other tools; many of these attempt to interpret page sources
          directly for conversion to HTML.  Some requests make implicit
          assumptions about things like character and page sizes that may
          not hold in an HTML environment; also, many of these viewers
          don't interpret the full groff vocabulary, a problem that can
          lead to portions of your text being omitted or presented
          incomprehensibly.

          For portability to modern viewers, it is best to write your page
          entirely with the macros described in this page (except for the
          ones identified as deprecated, which should be avoided).  The
          macros we have described as extensions (.EX/.EE, .SY/.OP/.YS,
          .TQ, .UR/.UE, and .MT/.ME) should be used with caution, as they
          may not yet be built in to some viewer that is important to your
          audience.  See an-ext.tmac in section “Files” below.

          Similar caveats apply to escapes.  Some escape sequences are
          however required for correct typesetting even in man pages and
          usually do not cause portability problems.  Several of these
          render glyphs corresponding to punctuation code points in the
          Unicode basic Latin range (U+0000–U+007F) that are handled
          specially in roff input; the escapes below must be used to render
          them correctly and portably when documenting material that uses
          them syntactically—namely, any of the set ' - \ ^ ` ~
          (apostrophe, dash or minus, backslash, caret, grave accent,
          tilde).

          \"     Comment.  Everything after the double-quote to the end of
                 the input line is ignored.  Whole-line comments should be
                 placed immediately after the empty request “.”).

          \newline
                 Join the next input line to the current one.  Except for
                 the update of the input line counter (used for diagnostic
                 messages and related purposes), a series of lines ending
                 in backslash-newline appears to groff as a single input
                 line.  Use this escape sequence to break excessively long
                 input lines for document maintenance.

          \%     Control hyphenation.  The location of this escape sequence
                 within a word marks a hyphenation point, supplementing
                 groff's automatic hyphenation patterns.  At the beginning
                 of a word, it suppresses any automatic hyphenation points
                 within; any specified with \% are still honored.

          \~     Adjustable non-breaking space.  Use this escape sequence
                 to prevent a break inside a short phrase or between a
                 numerical quantity and its corresponding unit(s).

                        Before starting the motor,
                        set the output speed to\~1.
                        There are 1,024\~bytes in 1\~KiB.
                        CSTR\~#8 documents the B\~language.

          \&     Non-printing input break.  Insert at the beginning of an
                 input line to prevent a dot or apostrophe from being
                 interpreted as the beginning of a roff request.  Append to
                 an end-of-sentence punctuation sequence to keep it from
                 being recognized as such.

          \|     Narrow (one-sixth em on typesetters, zero-width on
                 terminals) non-breaking space.  Used primarily in ellipses
                 (“.\|.\|.”)  to space the dots more pleasantly on
                 typesetter devices like PostScript and PDF.

          \-     Minus sign or basic Latin hyphen-minus.  This escape
                 sequence produces the Unix command-line option dash in the
                 output.  “-” is a hyphen to roff; some output devices
                 replace it with U+2010 (hyphen) or similar.

          \(aq   Basic Latin apostrophe.  Some output devices replace “'”
                 with a right single quotation mark.

          \(oq
          \(cq   Opening and closing single quotation marks.  Use these for
                 paired directional single quotes, ‘like this’.

          \(dq   Basic Latin quotation mark (double quote).  Use in macro
                 calls to prevent ‘"” from being interpreted as beginning a
                 quoted argument, or simply for readability.

                        .TP
                        .BI "split \(dq" text \(dq

          \(lq
          \(rq   Left and right double quotation marks.  Use these for
                 paired directional double quotes, “like this”.

          \(em   Em-dash.  Use for an interruption—such as this one—in a
                 sentence.

          \(en   En-dash.  Use to separate the ends of a range,
                 particularly between numbers; for example, “the digits
                 1–9”.

          \(ga   Basic Latin grave accent.  Some output devices replace “`”
                 with a left single quotation mark.

          \(ha   Basic Latin circumflex accent (“hat”).  Some output
                 devices replace “^” with U+02C6 (modifier letter
                 circumflex accent) or similar.

          \(rs   Reverse solidus (backslash).  The backslash is the default
                 groff escape character, so it does not represent itself in
                 output.  Also see \e below.

          \(ti   Basic Latin tilde.  Some output devices replace “~” with
                 U+02DC (small tilde) or similar.

          \c     End an input line without inserting space or attempting a
                 break.  Normally, the end of an input line is treated like
                 a space; an output line may be broken there if filling is
                 enabled (if not, an adjustable space is inserted), and
                 will be broken there when filling is disabled, as in
                 .EX/.EE examples.  Anything after \c on the input line is
                 ignored.  The next line is interpreted as usual and can
                 include a macro call (contrast with \newline).  This
                 escape sequence is useful when three different font styles
                 are needed in a single word, as in a command synopsis,

                        .RB [ \-\-stylesheet=\c
                        .IR name ]

                 or on a single line, as in .EX/.EE examples.

                        .EX
                        $ \c
                        .B groff \-T utf8 \-Z \c
                        .I file \c
                        .B | grotty \-i
                        .EE

                 Alternatively, and perhaps with better portability, the \f
                 font style escape sequence can be used; see below.  Using
                 \c to include the output from more than one input line
                 into the next-line argument of a .TP macro will render
                 incorrectly with groff 1.22.3, mandoc 1.14.1, older
                 versions of these programs, and perhaps with some other
                 formatters.

          \e     Widely used in man pages to represent a backslash output
                 glyph.  It works reliably as long as the “.ec” request is
                 not used, which should never happen in man pages, and it
                 is slightly more portable than the more explicit \(rs
                 (“reverse solidus”) special character escape sequence.

          \fB, \fI, \fR, \fP
                 Switch to bold, italic, roman, or back to the previous
                 style, respectively.  Either \f or \c is needed when three
                 different font styles are required in a word.

                        .RB [ \-\-reference\-dictionary=\fI\,name\/\fP ]

                        .RB [ \-\-reference\-dictionary=\c
                        .IR name ]

                 Style escapes may be more portable than \c.  As shown
                 above, it is up to you to account for italic corrections
                 with “\/” and “\,”, which are themselves GNU extensions,
                 if desired and if supported by your implementation.

                 \fP reliably returns to the style in use immediately
                 preceding the previous \f escape sequence only if no
                 sectioning, paragraph, or style macro calls have
                 intervened.

                 As long as at most two styles are needed in a word, style
                 macros like .B and .BI usually result in more readable
                 roff source than \f escapes do.

          For maximum portability, escape sequences and special characters
          not listed above are better avoided in man pages.

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
                 Set the line length for titles.  (“Titles” is the roff
                 term for headers and footers.)  By default, the line
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
                 “a” (see the “.af” request in groff(7)).  For example, the
                 option -rX2 produces the following page numbers: 1, 2, 2a,
                 2b, ..., 2aa, 2ab, and so on.


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

                        .\" Use narrower indentation on terminals and similar.
                        .if n .nr IN 4n
                        .\" Put only one space after the end of a sentence.
                        .ss 12 0 \" See groff(7).
                        .\" Keep pages narrow even on wide terminals.
                        .if n .if \n[LL]>78 .nr LL 78n

                 On multi-user systems, it is more considerate to users
                 whose preferences may differ from the administrator's to
                 be less aggressive with such settings, or to permit their
                 override with a user-specific man.local file.  This can be
                 done by placing one or both of following at the end of
                 /usr/local/share/groff/site-tmac/man.local.
                        .soquiet \V[XDG_CONFIG_HOME]/man.local
                        .soquiet \V[HOME]/.man.local
                 However, a security-sandboxed man(1) program may lack
                 permission to open such files.


---------------------------------------------------

::

          Some tips on troubleshooting your man pages follow.

          • Some ASCII characters look funny or copy and paste wrong.
                 On devices with large glyph repertoires, like
                 UTF-8-capable terminals and PDF, several keyboard glyphs
                 are mapped to code points outside the Unicode basic Latin
                 range because that usually results in better typography in
                 the general case.  When documenting GNU/Linux command or C
                 language syntax, however, this translation is sometimes
                 not desirable.

                 To get a “literal”...   ...should be input.
                 ────────────────────────────────────────────
                                     '   \(aq
                                     -   \-
                                     \   \(rs
                                     ^   \(ha
                                     `   \(ga
                                     ~   \(ti
                 ────────────────────────────────────────────

                 Additionally, if a neutral double quote (") is needed in a
                 macro argument, you can use \(dq to get it.  You should
                 not use \(aq for an ordinary apostrophe (as in “can't”) or
                 \- for an ordinary hyphen (as in “word-aligned”).  Review
                 subsection “Portability” above.

          • Do I ever need to use an empty macro argument ("")?
                 Probably not.  When this seems necessary, often a shorter
                 or clearer alternative is available.

                        Instead of...               ...should be considered.
                 ────────────────────────────────────────────────────────────────
                 .TP ""                         .TP
                 ────────────────────────────────────────────────────────────────
                 .BI "" italic-text bold-text   .IB italic-text bold-text
                 ────────────────────────────────────────────────────────────────
                 .TH foo 1 "" "foo 1.2.3"       .TH foo 1 yyyy-mm-dd "foo 1.2.3"
                 ────────────────────────────────────────────────────────────────
                 .IP "" 4n                      .IP
                 ────────────────────────────────────────────────────────────────
                 .IP "" 4n                      .RS 4n
                 paragraph                      .P
                 ...                            paragraph
                 ...                            .RE
                 ────────────────────────────────────────────────────────────────
                 .B one two "" three            .B one two three

                 In the title heading (.TH), the date of the page's last
                 revision is more important than packaging information; it
                 should not be omitted.  Ideally, a page maintainer will
                 keep both up to date.

                 .IP is sometimes ill-understood and misused, especially
                 when no marker argument is supplied—an indentation
                 argument is not required.  By setting an explicit
                 indentation, you may be overriding the reader's preference
                 as set with the -rIN option.  If your page renders
                 adequately without one, use the simpler form.  If you need
                 to indent multiple (unmarked) paragraphs, consider an
                 setting an indented region with .RS and .RE instead.

                 In the last example, the empty argument does have a subtly
                 different effect than its suggested replacement; the empty
                 argument causes an additional space character to be
                 interpolated between the arguments “two” and “three”—but
                 it is a regular breaking space, so it can be discarded at
                 the end of an output line.  It is better not to be subtle,
                 particularly with space, which can be overlooked in source
                 and rendered forms.

          • .RS doesn't indent relative to my indented paragraph.
                 The .RS macro sets the left margin; that is, the position
                 at which an ordinary paragraph (.P and its synonyms) will
                 be set.  .RS, .IP, .TP, and the deprecated .HP all use the
                 same default indentation.  To create an inset relative to
                 an indented paragraph, call .RS repeatedly until an
                 acceptable indentation is achieved, or give .RS an
                 indentation argument that is at least as much as the
                 paragraph's indentation amount relative to an adjacent .P
                 paragraph.  See subsection “Horizontal and vertical
                 spacing” above for the values.

          • .RE doesn't move the inset back to the expected level.
          • warning: scaling indicator invalid in context
          • warning: number register 'an-saved-marginn' not defined
          • warning: number register 'an-saved-prevailing-indentn' not
          defined
                 The .RS macro takes an indentation amount as an argument;
                 the .RE macro's argument is a specific inset level.  .RE 1
                 goes to the level before any .RS macros were called, .RE 2
                 goes to the level of the first .RS call you made, and so
                 forth.  If you desire symmetry in your macro calls, simply
                 issue one .RE without an argument for each .RS that
                 precedes it.

                 After calls to the .SH and .SS sectioning macros, all
                 relative insets are cleared and calls to .RE have no
                 effect until .RS is used again.

          • Do I need to keep typing the indent in a series of .IP calls?
                 You don't need to if you don't want to change the
                 indentation.  Review subsection “Horizontal and vertical
                 spacing” above.

                   Instead of...     ...should be considered.
                 ─────────────────────────────────────────────
                 .IP \(bu 4n         .IP \(bu 4n
                 paragraph           paragraph
                 .IP \(bu 4n         .IP \(bu
                 another-paragraph   another-paragraph
                 ─────────────────────────────────────────────


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
          Eric S. Raymond.  He also originated the portability section, to
          which Ingo Schwarze contributed most of the material on escape
          sequences.


---------------------------------------------------------

::

          tbl(1), eqn(1), and refer(1) are preprocessors used with man
          pages.

          man(1) describes the man page librarian on your system.

          groff_mdoc(7) describes the groff version of the BSD-originated
          alternative macro package for man pages.

          groff_man(7), groff(7), groff_char(7), man(7)

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

   groff 1.23.0.rc1.1101-d1263-di1r9tyAugust 2021           groff_man_style(7)

--------------

Pages that refer to this page: `grotty(1) <../man1/grotty.1.html>`__, 
`groff_man(7) <../man7/groff_man.7.html>`__

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
