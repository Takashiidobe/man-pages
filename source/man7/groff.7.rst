.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff(7) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `groff <#%3Ci%3E                  |                                   |
| groff%3C/i%3E%3Ch2%3Eelements>`__ |                                   |
|                                   |                                   |
| elements \|                       |                                   |
| `Control ch                       |                                   |
| aracters <#Control_characters>`__ |                                   |
| \|                                |                                   |
| `Line con                         |                                   |
| tinuation <#Line_continuation>`__ |                                   |
| \|                                |                                   |
| `Numerical expres                 |                                   |
| sions <#Numerical_expressions>`__ |                                   |
| \|                                |                                   |
| `Control st                       |                                   |
| ructures <#Control_structures>`__ |                                   |
| \|                                |                                   |
| `Syntax reference conventions <   |                                   |
| #Syntax_reference_conventions>`__ |                                   |
| \| `Requests <#Requests>`__ \|    |                                   |
| `Escape                           |                                   |
|  sequences <#Escape_sequences>`__ |                                   |
| \| `Identifiers <#Identifiers>`__ |                                   |
| \| `Strings <#Strings>`__ \|      |                                   |
| `Registers <#Registers>`__ \|     |                                   |
| `Hyphenation <#Hyphenation>`__ \| |                                   |
| `Localization <#Localization>`__  |                                   |
| \|                                |                                   |
| `Wr                               |                                   |
| iting macros <#Writing_macros>`__ |                                   |
| \| `Traps <#Traps>`__ \|          |                                   |
| `Underlining <#Underlining>`__ \| |                                   |
| `                                 |                                   |
| Compatibility <#Compatibility>`__ |                                   |
| \| `Debugging <#Debugging>`__ \|  |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff(7)            Miscellaneous Information Manual            groff(7)


-------------------------------------------------

::

          groff - GNU roff language reference


---------------------------------------------------------------

::

          The name groff stands for GNU roff and is the free implementation
          of the roff type-setting system.  See roff(7) for a survey and
          the background of the groff system.

          This document provides only short descriptions of roff language
          elements.  Groff: The GNU Implementation of troff, by Trent A.
          Fisher and Werner Lemberg, is the primary groff manual, and is
          written in Texinfo.  You can browse it interactively with “info
          groff”.

          Historically, the roff language was called troff.  groff is
          compatible with the classical system and provides proper
          extensions.  So in GNU, the terms roff, troff, and groff language
          could be used as synonyms.  However troff slightly tends to refer
          more to the classical aspects, whereas groff emphasizes the GNU
          extensions, and roff is the general term for the language.

          The general syntax for writing groff documents is relatively
          easy, but writing extensions to the roff language can be a bit
          harder.

          The roff language is line-oriented.  There are only two kinds of
          lines, control lines and text lines.  The control lines start
          with a control character, by default a period “.”  or a single
          quote “'”; all other lines are text lines.

          Control lines represent commands, optionally with arguments.
          They have the following syntax.  The leading control character
          can be followed by a command name; arguments, if any, are
          separated by spaces (but not tab characters) from the command
          name and among themselves, for example,

                 .command_name arg1 arg2

          For indentation, any number of space or tab characters can be
          inserted between the leading control character and the command
          name, but the control character must be on the first position of
          the line.

          Text lines represent the parts that is printed.  They can be
          modified by escape sequences, which are recognized by a leading
          backslash ‘\’.  These are in-line or even in-word formatting
          elements or functions.  Some of these take arguments separated by
          single quotes “'”, others are regulated by a length encoding
          introduced by an open parenthesis ‘(’ or enclosed in brackets ‘[’
          and ‘]’.

*groff*

elements
--------

::

          The roff language elements add formatting information to a text
          file.  The fundamental elements are predefined commands and
          variables that make roff a full-blown programming language.

          There are two kinds of roff commands, possibly with arguments.
          Requests are written on a line of their own starting with a dot
          ‘.’ or a “'”, whereas Escape sequences are in-line functions and
          in-word formatting elements starting with a backslash ‘\’.

          The user can define her own formatting commands using the .de
          request.  These commands are called macros, but they are used
          exactly like requests.  Macro packages are pre-defined sets of
          macros written in the groff language.  A user's possibilities to
          create escape sequences herself is very limited, only special
          characters can be mapped.

          The groff language provides several kinds of variables with
          different interfaces.  There are pre-defined variables, but the
          user can define her own variables as well.

          String variables store character sequences.  They are set with
          the .ds request and retrieved by the \* escape sequences.
          Strings can have variables.

          Register variables can store numerical values, numbers with a
          scale unit, and occasionally string-like objects.  They are set
          with the .nr request and retrieved by the \n escape sequences.

          Environments allow the user to temporarily store global
          formatting parameters like line length, font size, etc. for later
          reuse.  This is done by the .ev request.

          Fonts are identified either by a name or by an internal number.
          The current font is chosen by the .ft request or by the \f escape
          sequences.  Each device has special fonts, but the following
          fonts are available for all devices.  R is the standard font
          Roman.  B is its bold counterpart.  The italic font is called I
          and is available everywhere, but on text devices it is displayed
          as an underlined Roman font.  For the graphical output devices,
          there exist constant-width pendants of these fonts, CR, CI, and
          CB.  On text devices, all glyphs have a constant width anyway.

          Glyphs are visual representation forms of characters.  In groff,
          the distinction between those two elements is not always obvious
          (and a full discussion is beyond the scope of this man page).  A
          first approximation is that glyphs have a specific size and
          colour and are taken from a specific font; they can't be modified
          any more – characters are the input, and glyphs are the output.
          As soon as an output line has been generated, it no longer
          contains characters but glyphs.  In this man page, we use either
          ‘glyph’ or ‘character’, whatever is more appropriate.  A few
          characters commonly seen on keyboards are treated specially by
          roff languages and may not look correct in output; they are the
          (double) quotation mark ("), the apostrophe ('), the minus sign
          (-), the backslash (\), the caret or circumflex accent (^), the
          grave accent (`), and the tilde (~).  All are available if
          required; see groff_char(7).

          Moreover, there are some advanced roff elements.  A diversion
          stores (formatted) information into a macro for later usage.  See
          groff_tmac(5) for more details.  A trap is a positional condition
          like a certain number of lines from page top or in a diversion or
          in the input.  Some action can be prescribed to be run
          automatically when the condition is met.

          More detailed information and examples can be found in the groff
          Texinfo manual.


-----------------------------------------------------------------------------

::

          There is a small set of characters that have a special
          controlling task in certain conditions.

          .      A dot is only special at the beginning of a line or after
                 the condition in the requests .if, .ie, .el, and .while.
                 There it is the control character that introduces a
                 request (or macro).  By using the .cc request, the control
                 character can be set to a different character, making the
                 dot ‘.’ a non-special character.

                 In all other positions, it just means a dot character.  In
                 text paragraphs, it is advantageous to start each sentence
                 at a line of its own.

          '      The apostrophe has two controlling tasks.  At the
                 beginning of a line and in the conditional requests it is
                 the no-break control character.  That means that it
                 introduces a request like the dot, but with the additional
                 property that this request doesn't cause a linebreak.  The
                 no-break control character can be changed with the .c2
                 request.

                 As a second task, it is the most commonly used argument
                 separator in some functional escape sequences (but any
                 pair of characters not part of the argument do work).  In
                 all other positions, it denotes a single quote or
                 apostrophe character, depending on the output device's
                 glyph repertoire.  groff provides a printable
                 representation with the \(aq escape sequence.

          "      The double quote can be used to enclose arguments to
                 macros and strings, but not requests.  In the .ds, .ds1,
                 .as, and .as1 requests, a leading double quote in the
                 second argument is stripped off, enabling the inclusion of
                 leading space characters in the string definition or
                 appendment.  The escaped double quote \" introduces a
                 comment.  Otherwise, it is not special.  groff provides a
                 printable representation with the \[dq] escape sequence.

          \      The backslash usually introduces an escape sequence (this
                 can be changed with the .ec request).  A printed version
                 of the escape character is the \e escape; a backslash
                 glyph can be obtained by \(rs.

          (      The open parenthesis is only special in escape sequences
                 when introducing an escape name or argument consisting of
                 exactly two characters.  In groff, this behaviour can be
                 replaced by the [] construct.

          [      The opening bracket is only special in groff escape
                 sequences; there it is used to introduce a long escape
                 name or long escape argument.  Otherwise, it is non-
                 special, e.g., in macro calls.

          ]      The closing bracket is only special in groff escape
                 sequences; there it terminates a long escape name or long
                 escape argument.  Otherwise, it is non-special.

          space  Space characters separate arguments in request
                 invocations, macro calls, and string interpolations.  In
                 text, they separate words.  Multiple adjacent space
                 characters in text cause groff to attempt end-of-sentence
                 detection on the preceding word (and trailing
                 punctuation).  The amount of space between words and
                 sentences is controlled by the .ss request.  When filling
                 is enabled (the default), a line may be broken at a space.
                 When adjustment is enabled and set to both margins (the
                 default), inter-word spaces may be expanded to justify the
                 line.  To get a space of definite width, use the escape
                 sequences ‘\ ’ (this is the escape character followed by a
                 space), \0, \|, \^, or \h; see section “Escape sequences”
                 below.  An adjustable but non-breaking space is available
                 with \~.

          newline
                 In text, a newline puts an inter-word space onto the
                 output and triggers end-of-sentence recognition on the
                 preceding text.  See section “Line continuation” below.

          tab    If a tab character occurs during text the interpreter
                 makes a horizontal jump to the next pre-defined tab
                 position.  There is a sophisticated interface for handling
                 tab positions.


---------------------------------------------------------------------------

::

          A backslash \ at the end of a line immediately followed by a
          newline suppresses the effects of that newline on the input.  The
          next input line thus retains the classification of its
          predecessor as a control or text line.  The \c escape sequence
          continues an output line.  Anything on the input line after \c is
          ignored except \R, which works as usual.  In contrast to
          \newline, a line after \c is treated as a new input line, so a
          control character is recognized at its beginning.  The visual
          results depend on whether filling is enabled.  An intervening
          control line that causes a break overrides \c, flushing out the
          pending output line in the usual way.  The register .int contains
          a positive value if the last output line was continued with \c;
          this datum is associated with the environment.


-----------------------------------------------------------------------------------

::

          A numerical value is a signed or unsigned integer or float with
          or without an appended scaling indicator.  A scaling indicator is
          a one-character abbreviation for a unit of measurement.  A number
          followed by a scaling indicator signifies a size value.  By
          default, numerical values do not have a scaling indicator, i.e.,
          they are normal numbers.

          The roff language defines the following scaling indicators.

                 c         centimeter
                 i         inch
                 P         pica = 1/6 inch
                 p         point = 1/72 inch
                 m         em = the font size in points (approx. width of
                           letter ‘m’)
                 M         100th of an em
                 n         en = em/2
                 u         Basic unit for output device
                 v         vee (vertical line space)
                 s         scaled point = 1/sizescale of a point (defined
                           in font DESC file)
                 f         Scale by 65536.

          Numerical expressions are combinations of the numerical values
          defined above with the following arithmetical operators already
          defined in classical troff.

                 +         Addition
                 -         Subtraction
                 *         Multiplication
                 /         Division
                 %         Modulo
                 =         Equals
                 ==        Equals
                 <         Less than
                 >         Greater than
                 <=        Less or equal
                 >=        Greater or equal
                 &         Logical and
                 :         Logical or
                 !         Logical not
                 (         Grouping of expressions
                 )         Close current grouping

          Moreover, groff provides the following additional operators for
          numerical expressions.

                 e1>?e2    The maximum of e1 and e2.
                 e1<?e2    The minimum of e1 and e2.
                 (c;e)     Evaluate e using c as the default scaling
                           indicator.

          For details see the groff Texinfo manual.


-----------------------------------------------------------------------------

::

          groff has “if” and “while” control structures like other
          languages.  However, the syntax for grouping multiple input lines
          in the branches or bodies of these structures is unusual.

          They have a common form: the request name is (except for .el
          “else”) followed by a conditional expression cond-expr, and then
          the remainder of the line anything is interpreted as if it were
          an input line.  Any number of spaces between arguments to
          requests serves only to separate them; leading spaces in anything
          are therefore not seen.  anything effectively cannot be omitted;
          if cond-expr is true and anything is empty, the newline at the
          end of the control line is interpreted as a blank line (and
          therefore a blank text line).

          It is frequently desirable for a control structure to govern more
          than one request, call more than one macro, span more than one
          input line of text, or mix the foregoing.  The opening and
          closing brace escapes \{ and \} perform such grouping.  Brace
          escapes can be used outside of control structures, but when they
          are they have no meaning and produce no output.

          \{ should appear (after optional spaces and tabs) immediately
          subsequent to the request's conditional expression.  \} should
          appear on a line with other occurrences of itself as necessary to
          match \{ escapes.  It can be preceded by a control character,
          spaces, and tabs.  Input after a \} escape on the same line is
          only processed if all the preceding conditions to which the
          escapes correspond are true.  Furthermore, a \} closing the body
          of a .while request must be the last such escape on an input
          line.

      Conditional expressions
          In .if, .ie, and .while requests, in addition to the numeric
          expressions described above, several Boolean operators are
          available; the members of this expanded class are termed
          conditional expressions.

          A numerical expression expr is true if its value is positive.  In
          roff languages, negative values are false.  The truth values of
          other conditional expression operators are as shown below.

          cond-expr...   ...is true if...
          ──────────────────────────────────────────────────────────────────
               's1's2'   s1 produces the same formatted output as s2.
                   c g   a glyph g is available.
                   d m   a string, macro, diversion, or request m is
                         defined.
                     e   the current page number is even.
                   F f   a font named f is available.
                   m c   a color named c is defined.
                     n   the formatter is in nroff mode.
                     o   the current page number is odd.
                   r n   a register named n is defined.
                   S s   a font style named s is available.
                     t   the formatter is in troff mode.
                     v   n/a (historical artifact; always false).

          These operators can't be combined with others like “:” or “&”;
          only a leading “!” can be used to complement the result.  Spaces
          and tabs are optional immediately after the “c”, “d”, “F”, “m”,
          “r”, and “S” operators, but immediately after “!”, they cause the
          condition to evaluate false (this bizarre behavior maintains
          compatibility with AT&T troff).


-------------------------------------------------------------------------------------------------

::

          In the following request and escape sequence specifications, most
          argument names were chosen to be descriptive.  A few denotations
          may require introduction.

                 c         denotes a single input character.
                 font      a font either specified as a font name or a
                           numeric mounting position.
                 anything  all characters up to the end of the line, to the
                           ending delimiter for the escape sequence, or
                           within \{ and \}.  Escape sequences may
                           generally be used freely in anything, except
                           when it is read in copy mode.
                 n         is a numerical expression that evaluates to an
                           integer value.
                 N         is an optionally-signed numerical expression.
                 ±N        has three meanings, depending on its sign.

          If a numeric expression presented as ±N starts with a ‘+’ sign,
          an increment in the amount of of N is applied to the value
          applicable to the request or escape sequence.  If it starts with
          a ‘-’ sign, a decrement of magnitude N is applied instead.
          Without a sign, N replaces any existing value.  To assign a
          negative number, either prefix the expression with a zero or
          enclose it with parentheses.  If a prior value does not exist, an
          increment or decrement is applied as if to 0.


---------------------------------------------------------

::

          In groff, identifier names, including those of requests, can be
          arbitrarily long.  No bracketing or marking of long names is
          needed in request invocation syntax.

          Most requests take one or more arguments.  Tabs are permitted
          after a request name, before its first argument (if any), but
          arguments themselves must be separated only by space characters.
          There is no inherent limit on argument length or quantity.

          Not all details of request behavior are outlined here.  Refer to
          the groff Texinfo manual or groff_diff(7).

      Request short reference
          .ab string
                    Write string to the standard error stream and exit with
                    failure status.
          .ad       Enable output line adjustment using mode stored in
                    \n[.j].
          .ad c     Enable output line adjustment in mode c (c=b,c,l,n,r).
                    Sets \n[.j].
          .af register c
                    Assign format c to register, where c is “i”, “I”, “a”,
                    “A”, or a sequence of decimal digits whose quantity
                    denotes the minimum width in digits to be used when the
                    register is interpolated.  “i” and “a” indicate Roman
                    numerals and base-26 Latin alphabetics, respectively,
                    in the lettercase specified.  The default is “0”.
          .aln new old
                    Create alias (additional name) new for existing number
                    register named old.
          .als new old
                    Create alias (additional name) new for existing
                    request, string, macro, or diversion old.
          .am macro Append to macro until .. is encountered.
          .am macro end
                    Append to macro until .end is called.
          .am1 macro
                    Same as .am but with compatibility mode switched off
                    during macro expansion.
          .am1 macro end
                    Same as .am but with compatibility mode switched off
                    during macro expansion.
          .ami macro
                    Append to a macro whose name is contained in the string
                    register macro until .. is encountered.
          .ami macro end
                    Append to a macro indirectly.  macro and end are string
                    registers whose contents are interpolated for the macro
                    name and the end macro, respectively.
          .ami1 macro
                    Same as .ami but with compatibility mode switched off
                    during macro expansion.
          .ami1 macro end
                    Same as .ami but with compatibility mode switched off
                    during macro expansion.
          .as name [string]
                    Append string to the string name; no operation if
                    string is omitted.
          .as1 name [string]
                    Same as .as but with compatibility mode switched off
                    during string expansion.
          .asciify diversion
                    Unformat ASCII characters, spaces, and some escape
                    sequences in diversion.
          .backtrace
                    Write a backtrace of the input stack to the standard
                    error stream.  Also see the -b option of groff(1).
          .bd font N
                    Embolden font by N-1 units.
          .bd S font N
                    Embolden Special Font S when current font is font.
          .blm      Unset blank line macro (trap).  Restore default
                    handling of blank lines.
          .blm name Set blank line macro (trap) to name.
          .box      Stop directing output to current box diversion.
          .box name Divert output to name, omitting a partially collected
                    line.
          .boxa     Stop appending output to current box diversion.
          .boxa name
                    Divert output, appending it to name, omitting a
                    partially collected line.
          .bp       Eject current page and begin new page.
          .bp ±N    Eject current page; next page number ±N.
          .br       Line break.
          .brp      Break output line; adjust if applicable.
          .break    Break out of a while loop.
          .c2       Reset no-break control character to “'”.
          .c2 c     Set no-break control character to c.
          .cc       Reset control character to ‘.’.
          .cc c     Set control character to c.
          .ce       Center the next input line.
          .ce N     Center following N input lines.
          .cf filename
                    Copy contents of file filename unprocessed to stdout or
                    to the diversion.
          .cflags n c1 c2 ...
                    Assign properties encoded by the number n to characters
                    c1, c2, and so on.
          .ch name N
                    Change location of page location trap by moving macro
                    name to new location N, or by unplanting it altogether
                    if N absent.
          .char c anything
                    Define entity c as string anything.
          .chop object
                    Remove the last character from the macro, string, or
                    diversion named object.
          .class name c1 c2 ...
                    Define a (character) class name comprising the
                    characters or range expressions c1, c2, and so on.
          .close stream
                    Close the stream.
          .color    Enable colors.
          .color N  If N is zero disable colors, otherwise enable them.
          .composite from to
                    Map glyph name from to glyph name to while constructing
                    a composite glyph name.
          .continue Finish the current iteration of a while loop.
          .cp       Enable compatibility mode.
          .cp N     If N is zero disable compatibility mode, otherwise
                    enable it.
          .cs font N M
                    Set constant character width mode for font to N/36 ems
                    with em M.
          .cu N     Continuous underline in nroff, like .ul in troff.
          .da       End current diversion.
          .da macro Divert and append to macro.
          .de macro Define or redefine macro until .. is encountered.
          .de macro end
                    Define or redefine macro until .end is called.
          .de1 macro
                    Same as .de but with compatibility mode switched off
                    during macro expansion.
          .de1 macro end
                    Same as .de but with compatibility mode switched off
                    during macro expansion.
          .defcolor color scheme component
                    Define or redefine a color with name color.  scheme can
                    be rgb, cym, cymk, gray, or grey.  component can be
                    single components specified as fractions in the range 0
                    to 1 (default scaling indicator f), as a string of two-
                    digit hexadecimal color components with a leading #, or
                    as a string of four-digit hexadecimal components with
                    two leading #.  The color default can't be redefined.
          .dei macro
                    Define or redefine a macro whose name is contained in
                    the string register macro until .. is encountered.
          .dei macro end
                    Define or redefine a macro indirectly.  macro and end
                    are string registers whose contents are interpolated
                    for the macro name and the end macro, respectively.
          .dei1 macro
                    Same as .dei but with compatibility mode switched off
                    during macro expansion.
          .dei1 macro end
                    Same as .dei but with compatibility mode switched off
                    during macro expansion.
          .device anything
                    Write anything to the intermediate output as a device
                    control function.
          .devicem name
                    Write contents of macro or string name uninterpreted to
                    the intermediate output as a device control function.
          .di       End current diversion.
          .di macro Divert to macro.  See groff_tmac(5) for more details.
          .do name ...
                    Interpret the string, request, diversion, or macro name
                    (along with any arguments) with compatibility mode
                    disabled.  Note that compatibility mode is restored (if
                    and only if it was active) when the expansion of name
                    is interpreted.
          .ds name [string]
                    Define a string variable name with contents string, or
                    as empty if string is omitted.
          .ds1 name [string]
                    Same as .ds but with compatibility mode switched off
                    during string expansion.
          .dt       Clear diversion trap.
          .dt N name
                    Set diversion trap to macro name at position N (default
                    scaling indicator v).
          .ec       Set escape character to ‘\’.
          .ec c     Set escape character to c.
          .ecr      Restore escape character saved with .ecs.
          .ecs      Save current escape character.
          .el anything
                    Interpret anything as if it were an input line if the
                    conditional expression of the corresponding .ie request
                    was false.
          .em name  Invoke macro name after the end of input.
          .eo       Unset escape character, turning off escape
                    interpretation.
          .ev       Pop environment stack, returning to previous one.
          .ev env   Push current environment onto stack and switch to env.
          .evc env  Copy environment env to the current one.
          .ex       Exit with successful status.
          .fam      Return to previous font family.
          .fam name Set the current font family to name.
          .fc       Disable field mechanism.
          .fc a     Set field delimiter to a and pad glyph to space.
          .fc a b   Set field delimiter to a and pad glyph to b.
          .fchar c anything
                    Define fallback character (or glyph) c as string
                    anything.
          .fcolor   Set fill color to previous fill color.
          .fcolor c Set fill color to c.
          .fi       Enable filling of output lines; a pending output line
                    is broken.  Sets \n[.u].
          .fl       Flush output buffer.
          .fp n font
                    Mount font on position n.
          .fp n internal external
                    Mount font with long external name to short internal
                    name on position n.
          .fschar f c anything
                    Define fallback character (or glyph) c for font f as
                    string anything.
          .fspecial font
                    Reset list of special fonts for font to be empty.
          .fspecial font s1 s2 ...
                    When the current font is font, then the fonts s1, s2,
                    ... are special.
          .ft       Return to previous font.  Same as \f[] or \fP.
          .ft font  Change to font name or number font; same as \f[font]
                    escape sequence.
          .ftr font1 font2
                    Translate font1 to font2.
          .fzoom font
                    Don't magnify font.
          .fzoom font zoom
                    Set zoom factor for font (in multiples of 1/1000th).
          .gcolor   Set glyph color to previous glyph color.
          .gcolor c Set glyph color to c.
          .hc       Reset the hyphenation character to \% (the default).
          .hc char  Change the hyphenation character to char.
          .hcode c1 code1 [c2 code2] ...
                    Set the hyphenation code of character c1 to code1, that
                    of c2 to code2, and so on.
          .hla lang Set the hyphenation language to lang.
          .hlm n    Set the maximum number of consecutive hyphenated lines
                    to n.
          .hpf pattern-file
                    Read hyphenation patterns from pattern-file.
          .hpfa pattern-file
                    Append hyphenation patterns from pattern-file.
          .hpfcode a b [c d] ...
                    Define mapping values for character codes in pattern
                    files read with the .hpf and .hpfa requests.
          .hw word ...
                    Define how each word is to be hyphenated, with each
                    hyphen “-” indicating a hyphenation point.
          .hy       Set automatic hyphenation mode to 1.
          .hy 0     Disable automatic hyphenation; same as .nh.
          .hy mode  Set automatic hyphenation mode to mode; see section
                    “Hyphenation” below.
          .hym      Set the (right) hyphenation margin to 0 (the default).
          .hym length
                    Set the (right) hyphenation margin to length (default
                    scaling indicator m).
          .hys      Set the hyphenation space to 0 (the default).
          .hys hyphenation-space
                    Suppress hyphenation of the line in adjustment modes
                    “b” or “n” if it can be justified by adding no more
                    than hyphenation-space extra space to each inter-word
                    space (default scaling indicator m).
          .ie cond-expr anything
                    If cond-expr is true, interpret anything as if it were
                    an input line, otherwise skip to a corresponding .el
                    request.
          .if cond-expr anything
                    If cond-expr is true, then interpret anything as if it
                    were an input line.
          .ig       Ignore text until .. is encountered.
          .ig end   Ignore text until .end is called.
          .in       Change to previous indentation value.
          .in ±N    Change indentation according to ±N (default scaling
                    indicator m).
          .it n name
                    Set an input line trap, calling macro name, after the
                    next n lines lines of text input have been read.
          .itc n name
                    As .it, but don't count lines interrupted with \c.
          .kern     Enable pairwise kerning.
          .kern n   If n is zero, disable pairwise kerning, otherwise
                    enable it.
          .lc       Remove leader repetition glyph.
          .lc c     Set leader repetition glyph to c (default: “.”).
          .length reg anything
                    Compute the number of characters of anything and store
                    the count in the number register reg.
          .linetabs Enable line-tabs mode (calculate tab positions relative
                    to beginning of output line).
          .linetabs 0
                    Disable line-tabs mode.
          .lf N     Set input line number to N.
          .lf N file
                    Set input line number to N and filename to file.
          .lg N     Ligature mode on if N>0.
          .ll       Change to previous line length.
          .ll ±N    Set line length according to ±N (default length 6.5i,
                    default scaling indicator m).
          .lsm      Unset the leading space macro (trap).  Restore default
                    handling of lines with leading spaces.
          .lsm name Set the leading space macro (trap) to name.
          .ls       Change to the previous value of additional intra-line
                    skip.
          .ls N     Set additional intra-line skip value to N, i.e., N-1
                    blank lines are inserted after each text output line.
          .lt ±N    Length of title (default scaling indicator m).
          .mc       Margin glyph off.
          .mc c     Print glyph c after each text line at actual distance
                    from right margin.
          .mc c N   Set margin glyph to c and distance to N from right
                    margin (default scaling indicator m).
          .mk [register]
                    Mark current vertical position in register, or in an
                    internal register used by .rt if no argument.
          .mso file As .so, except that file is sought in the tmac
                    directories.
          .msoquiet file
                    As .mso, but no warning is emitted if file does not
                    exist.
          .na       Disable output line adjustment.
          .ne       Need a one-line vertical space.
          .ne N     Need N vertical space (default scaling indicator v).
          .nf       Disable filling of output lines; a pending output line
                    is broken.  Clears \n[.u].
          .nh       Disable automatic hyphenation; same as “.hy 0”.
          .nm       Number mode off.
          .nm ±N [M [S [I]]]
                    In line number mode, set number, multiple, spacing, and
                    indentation.
          .nn       Do not number next line.
          .nn N     Do not number next N lines.
          .nop anything
                    Interpret anything as if it were an input line.
          .nr register ±N [M]
                    Define or modify register using ±N with auto-increment
                    M.
          .nroff    Make the built-in conditions n true and t false.
          .ns       Turn on no-space mode.
          .nx       Immediately jump to end of current file.
          .nx filename
                    Immediately continue processing with file file.
          .open stream filename
                    Open filename for writing and associate the stream
                    named stream with it.
          .opena stream filename
                    Like .open but append to it.
          .os       Output vertical distance that was saved by the .sv
                    request.
          .output string
                    Emit string directly to intermediate output, allowing
                    leading whitespace if string starts with " (which is
                    stripped off).
          .pc       Reset page number character to ‘%’.
          .pc c     Page number character.
          .pev      Report the state of the current environment followed by
                    that of all other environments to the standard error
                    stream.
          .pi program
                    Pipe output to program (nroff only).
          .pl       Set page length to default 11i.  The current page
                    length is stored in register .p.
          .pl ±N    Change page length to ±N (default scaling indicator v).
          .pm       Report, to the standard error stream, the names and
                    sizes in bytes of defined macros, strings, and
                    diversions.
          .pn ±N    Next page number N.
          .pnr      Print the names and contents of all currently defined
                    number registers on stderr.
          .po       Change to previous page offset.  The current page
                    offset is available in register .o.
          .po ±N    Page offset N.
          .ps       Return to previous point size.
          .ps ±N    Set/increase/decrease the point size to/by N scaled
                    points (a non-positive resulting point size is set to
                    1 u); also see \s[±N].
          .psbb filename
                    Get the bounding box of a PostScript image filename.
          .pso command
                    This behaves like the .so request except that input
                    comes from the standard output of command.
          .ptr      Report names and positions of all page location traps
                    to the standard error stream.
          .pvs      Change to previous post-vertical line spacing.
          .pvs ±N   Change post-vertical line spacing according to ±N
                    (default scaling indicator p).
          .rchar c1 c2 ...
                    Remove the definitions of entities c1, c2, ...
          .rd prompt
                    Read insertion.
          .return   Return from a macro.
          .return anything
                    Return twice, namely from the macro at the current
                    level and from the macro one level higher.
          .rfschar f c1 c2 ...
                    Remove the font-specific definitions of glyphs c1, c2,
                    ... for font f.
          .rj n     Right justify the next n input lines.
          .rm name  Remove request, macro, diversion, or string name.
          .rn old new
                    Rename request, macro, diversion, or string old to new.
          .rnn reg1 reg2
                    Rename register reg1 to reg2.
          .rr ident Remove name of number register ident.
          .rs       Restore spacing; turn no-space mode off.
          .rt       Return (upward only) to vertical position marked by .mk
                    on the current page.
          .rt ±N    Return (upward only) to specified distance from the top
                    of the page (default scaling indicator v).
          .schar c anything
                    Define global fallback character (or glyph) c as string
                    anything.
          .shc      Reset the soft hyphen glyph to \[hy].
          .shc c    Set the soft hyphen glyph to c.
          .shift n  In a macro, shift the arguments by n positions.
          .sizes s1 s2 ... sn [0]
                    Set available font sizes similar to the sizes command
                    in a DESC file.
          .so file  Replace the request's control line with the contents of
                    file, “sourcing” it.
          .soquiet file
                    As .so, but no warning is emitted if file does not
                    exist.
          .sp       Skip one line vertically.
          .sp N     Space vertical distance N up or down according to sign
                    of N (default scaling indicator v).
          .special  Reset global list of special fonts to be empty.
          .special s1 s2 ...
                    Fonts s1, s2, etc. are special and are searched for
                    glyphs not in the current font.
          .spreadwarn
                    Toggle the spread warning on and off (the default)
                    without changing its value.
          .spreadwarn N
                    Emit a break warning if the additional space inserted
                    for each space between words in an output line adjusted
                    to both margins is larger than or equal to N.  A
                    negative N is treated as 0.  The default scaling
                    indicator is m.  At startup, .spreadwarn is inactive
                    and N is 3 m.
          .ss N     Set minimal inter-word spacing to N 12ths of the space
                    width of the current font.
          .ss N M   As .ss N, and set additional inter-sentence spacing to
                    M 12ths of the space width of the current font.
          .stringdown stringvar
                    Replace each byte in the string named stringvar with
                    its lowercase version.
          .stringup stringvar
                    Replace each byte in the string named stringvar with
                    its uppercase version.
          .sty n style
                    Associate style with font position n.
          .substring str start [end]
                    Replace the string named str with its substring bounded
                    by the indices start and end, inclusive.  Negative
                    indices count backwards from the end of the string.
          .sv       Save 1 v of vertical space.
          .sv N     Save the vertical distance N for later output with .os
                    request (default scaling indicator v).
          .sy command-line
                    Execute program command-line.
          .ta n1 n2 ... nn T r1 r2 ... rn
                    Set tabs at positions n1, n2, ..., nn, then set tabs at
                    nn+m×rn+r1 through nn+m×rn+rn, where m increments from
                    0, 1, 2, ... to the output line length.  Each
                    n argument can be prefixed with a “+” to place the tab
                    stop ni at a distance relative to the previous, n(i-1).
                    Each argument ni or ri can be suffixed with a letter to
                    align text within the tab column bounded by tab stops
                    i and i+1; “L” for left-aligned (the default), “C” for
                    centered, and “R” for right-aligned.
          .tc       Remove tab repetition glyph.
          .tc c     Set tab repetition glyph to c (default: none).
          .ti ±N    Temporary indent next line (default scaling
                    indicator m).
          .tkf font s1 n1 s2 n2
                    Enable track kerning for font.
          .tl 'left'center'right'
                    Three-part title.
          .tm anything
                    Print anything on stderr.
          .tm1 anything
                    Print anything on stderr, allowing leading whitespace
                    if anything starts with " (which is stripped off).
          .tmc anything
                    Similar to .tm1 without emitting a final newline.
          .tr abcd...
                    Translate a to b, c to d, etc. on output.
          .trf filename
                    Transparently output the contents of file filename.
          .trin abcd...
                    This is the same as the .tr request except that the
                    asciify request uses the character code (if any) before
                    the character translation.
          .trnt abcd...
                    This is the same as the .tr request except that the
                    translations do not apply to text that is transparently
                    throughput into a diversion with \!.
          .troff    Make the built-in conditions t true and n false.
          .uf font  Set underline font to font (to be switched to by .ul).
          .ul N     Underline (italicize in troff mode) N input lines.
          .unformat diversion
                    Unformat space characters and tabs in diversion,
                    preserving font information.
          .vpt      Enable vertical position traps.
          .vpt 0    Disable vertical position traps.
          .vs       Change to previous vertical base line spacing.
          .vs ±N    Set vertical base line spacing to ±N (default scaling
                    indicator p).
          .warn     Enable all warnings.
          .warn n   Set warnings code to n.
          .warnscale si
                    Set scaling indicator used in warnings to si.
          .wh N     Remove active trap at vertical position N; a negative
                    value is measured upward from page bottom.
          .wh N name
                    Plant trap, calling macro name when page location N is
                    reached or passed; a negative value is measured upward
                    from page bottom.  Any active trap already present at N
                    is replaced.
          .while cond-expr anything
                    Evaluate cond-expr, and repeatedly execute anything
                    unless and until cond-expr evaluates false.
          .write stream anything
                    Write anything to the stream named stream.
          .writec stream anything
                    Similar to .write without emitting a final newline.
          .writem stream xx
                    Write contents of macro or string xx to the stream
                    named stream.

          Besides these standard groff requests, there might be further
          macro calls.  They can originate from a macro package (see
          roff(7) for an overview) or from a preprocessor.

          Preprocessor macros are easy to recognize.  They enclose their
          code between a pair of characteristic macros.

                  ┌─────────────┬─────────────────┬────────────────┐
                  │preprocessor │   start macro   │    end macro   │
                  ├─────────────┼─────────────────┼────────────────┤
                  │    chem     │     .cstart     │     .cend      │
                  │    eqn      │       .EQ       │      .EN       │
                  │    grap     │       .G1       │      .G2       │
                  │    grn      │       .GS       │      .GE       │
                  │   ideal     │       .IS       │      .IE       │
                  │             │                 │      .IF       │
                  │    pic      │       .PS       │      .PE       │
                  │   refer     │       .R1       │      .R2       │
                  │   soelim    │      none       │      none      │
                  │    tbl      │       .TS       │      .TE       │
                  ├─────────────┼─────────────────┼────────────────┤
                  │ glilypond   │ .lilypond start │ .lilypond stop │
                  │   gperl     │   .Perl start   │   .Perl stop   │
                  │  gpinyin    │  .pinyin start  │  .pinyin stop  │
                  └─────────────┴─────────────────┴────────────────┘
          The ‘ideal’ preprocessor is not available in groff yet.


-------------------------------------------------------------------------

::

          Whereas requests must occur on control lines, escape sequences
          can occur intermixed with text and appear in arguments to
          requests and macros (and sometimes other escape sequences).  An
          escape sequence (or simply “escape”) is introduced by the escape
          character, a backslash “\” (but see the .ec request).  The next
          character identifies the escape's function.  Escapes vary in
          length.  Some take an argument, and of those, some have different
          syntactical forms for a one-character, two-character, or
          arbitrary-length argument.  Others accept only an arbitrary-
          length argument.  In the former convention, a one-character
          argument follows the function character immediately, an opening
          parenthesis “(” introduces a two-character argument (no closing
          parenthesis is used), and an argument of arbitrary length is
          enclosed in brackets “[]”.  In the latter convention, the user
          selects a delimiter character; the neutral apostrophe “'” is a
          popular choice and shown in this document.  Some characters
          cannot be used as delimiters; see section “Escapes” in the groff
          Texinfo manual for details.  A few escapes are idiosyncratic, and
          support both of the foregoing conventions (“\s”), designate their
          own terminating character (“\?”), consume input until the next
          newline (“\!”, “\"”, “\#”), or support an additional modifier
          character (“\s” again).

          Escape sequences serve a variety of purposes.  Widespread uses
          include commenting the source document; changing the font style;
          setting the point size; interpolating special characters, number
          registers, and strings into the text; and placing or suppressing
          break and hyphenation points.  As with requests, use of escapes
          in source documents may interact poorly with a macro package you
          use; consult its documentation to learn of “safe” escapes or
          alternative facilities it provides to achieve the desired result.

          If the escape character is followed by a character that does not
          identify a defined operation, the escape character is ignored
          (producing a diagnostic of the “escape” warning type, which is
          not enabled by default) and the following character is processed
          normally.

      Escape short reference
          The escape sequences \", \#, \$, \*, \a, \e, \n, \t, \g, \V, and
          \newline are interpreted even in copy mode.

          \"     Comment.  Everything up to the end of the line is ignored.
          \#     Comment.  Everything up to and including the next newline
                 is ignored.
          \*s    Interpolate string with one-character name s.
          \*(st  Interpolate string with two-character name st.
          \*[string]
                 Interpolate string with name string (of arbitrary length).
          \*[string arg1 arg2 ...]
                 Interpolate string with name string (of arbitrary length),
                 taking arg1, arg2, ... as arguments.
          \$0    Interpolate name by which currently-executing macro was
                 invoked.
          \$n    Interpolate macro or string parameter numbered n (1≤n≤9).
          \$(nn  Interpolate macro or string parameter numbered nn
                 (01≤nn≤99).
          \$[nnn]
                 Interpolate macro or string parameter numbered nnn
                 (nnn≥1).
          \$*    Interpolate concatenation of all macro or string
                 parameters, separated by spaces.
          \$@    Interpolate concatenation of all macro or string
                 parameters, with each surrounded by double quotes and
                 separated by spaces.
          \$^    Interpolate concatenation of all macro or string
                 parameters as if they were arguments to the .ds request.
          \'     Translates to \[aa], the acute accent special character.
          \`     Translates to \[ga], the grave accent special character.
          \-     Translates to \[-], the minus sign special character.
          \_     Translates to \[ul], the underline special character.
          \%     Control hyphenation.
          \!     Transparent line.  The remainder of the input line is
                 interpreted (1) when the current diversion is read; or (2)
                 if in the top-level diversion, by the output driver.
          \?anything\?
                 Transparently embed anything, read in copy mode, in a
                 diversion.
          \space Unbreakable, non-adjustable word space.
          \~     Unbreakable, adjustable space.
          \0     Unbreakable digit-width space.
          \|     Unbreakable 1/6 em (“thin”) space glyph; zero-width in
                 nroff.
          \^     Unbreakable 1/12 em (“hair”) space glyph; zero-width in
                 nroff.
          \&     Non-printing input break.
          \)     Non-printing input break, transparent to end-of-sentence
                 recognition.
          \/     Apply italic correction.  Use between an immediately
                 adjacent oblique glyph on the left and an upright glyph on
                 the right.
          \,     Apply left italic correction.  Use between an immediately
                 adjacent upright glyph on the left and an oblique glyph on
                 the right.
          \:     Non-printing break point (similar to \%, but never
                 produces a hyphen glyph).
          \newline
                 Continue current input line on the next.
          \{     Begin conditional input.
          \}     End conditional input.
          \(gl   Interpolate glyph with two-character name gl.
          \[glyph]
                 Interpolate glyph with name glyph (of arbitrary length).
          \[base-glyph comp1 comp2 ...]
                 Interpolate composite glyph constructed from base-glyph
                 and components comp1, comp2, and so on.
          \[charnnn]
                 Interpolate glyph of eight-bit encoded character nnn,
                 where 0≤nnn≤255.
          \[unnnn[n[n]]]
                 Interpolate glyph of Unicode character with code point
                 nnnn[n[n]] in uppercase hexadecimal.
          \[ubase-glyph[_combining-component]...]
                 Interpolate composite glyph from Unicode character base-
                 glyph and combining-components.
          \a     In copy mode, interpolate leader character.
          \A'anything'
                 Interpolate 1 if anything is an acceptable identifier for
                 a string, macro, diversion, register, environment, or
                 font, and 0 otherwise.
          \b'abc...'
                 Build bracket: stack glyphs a, b, c... vertically.
          \B'anything'
                 Interpolate 1 if anything is a valid numeric expression,
                 and 0 otherwise.
          \c     Continue output line at next input line.
          \C'glyph'
                 As \[glyph], but compatible with other troff
                 implementations.
          \d     Move downward ½ vee (½ line in nroff).
          \D'anything'
                 Send anything to the output device as a drawing command;
                 see groff_out(5).
          \e     Interpolate escape character.
          \E     As \e, but not interpreted in copy mode.
          \fF    Change to font or style with one-character name or one-
                 digit position F.
          \fP    Switch to previous font or style.
          \f(ft  Change to font with two-character name or two-digit
                 position ft.
          \f[font]
                 Change to font with arbitrarily long name or position
                 font.
          \f[]   Switch to previous font or style.
          \Ff    Change to font family with one-character name f.
          \F(fm  Change to font family with two-character name fm.
          \F[fam]
                 Change to font family with arbitrarily long name fam.
          \F[]   Switch to previous font family.
          \gr    Interpolate format of register with one-character name r.
          \g(rg  Interpolate format of register with two-character name rg.
                 rg.
          \g[reg]
                 Interpolate format of register with arbitrarily long name
                 reg.
          \h'N'  Horizontally move N ens (or specified units) right (left
                 if negative).
          \H'N'  Set height of current font to N scaledpoints (or specified
                 units).
          \kr    Mark horizontal position in one-character register name r.
          \k(rg  Mark horizontal position in two-character register
                 name rg.
          \k[reg]
                 Mark horizontal position in register with arbitrarily long
                 name reg.
          \l'N[g]'
                 Draw horizontal line of length N ems (or specified units),
                 optionally using glyph g.
          \L'N[g]'
                 Draw vertical line of length N vees (or specified units),
                 optionally using glyph g.
          \mc    Change drawing color to that with one-character name c.
          \m(cl  Change drawing color to that with two-character name cl.
          \m[color]
                 Change drawing color to that with arbitrarily long
                 name color.
          \m[]   Switch to previous drawing color.
          \Mc    Change fill color to that with one-character name c.
          \M(cl  Change fill color to that with two-character name cl.
          \M[color]
                 Change fill color to that with arbitrarily long
                 name color.
          \M[]   Switch to previous fill color.
          \nr    Interpolate value stored in register with one-character
                 name r.
          \n(rg  Interpolate value stored in register with two-character
                 name rg.
          \n[reg]
                 Interpolate value stored in register with arbitrarily long
                 name reg.
          \N'n'  Interpolate glyph with index n in the current font.
          \o'abc...'
                 Overstrike glyphs a, b, c, and so on.
          \O0    At the outermost suppression level, disable glyph emission
                 to the output driver.
          \O1    At the outermost suppression level, enable glyph emission
                 to the output driver.
          \O2    At the outermost suppression level, enable glyph emission
                 to the output driver and write to the standard error
                 stream the page number and four bounding box registers
                 enclosing glyphs written since the previous \O escape
                 sequence.
          \O3    Begin a nested suppression level.
          \O4    End a nested suppression level.
          \O[5Pfilename]
                 At the outermost suppression level, write filename to the
                 standard error stream; P indicates the position of an
                 image and must be one of l, r, c, or i (left, right,
                 centered, inline).
          \p     Break output line at next word boundary; adjust if
                 applicable.
          \r     Move “in reverse” (upward) 1 vee (reverse linefeed in
                 nroff).
          \R'name ±N'
                 Set, increment, or decrement register name by N.
          \s±N   Set/increase/decrease the point size to/by N scaled
                 points.  N must be a single digit; 0 restores the previous
                 point size.  (In compatibility mode only, a non-zero N
                 must be in the range 4–39.)  Otherwise, as .ps request.
          \s(±N
          \s±(N  Set/increase/decrease the point size to/by N scaled
                 points; N is a two-digit number ≥1.  As .ps request.
          \s[±N]
          \s±[N]
          \s'±N'
          \s±'N' Set/increase/decrease the point size to/by N scaled
                 points.  As .ps request.
          \S'N'  Slant output glyphs by N degrees; the direction of text
                 flow is positive.
          \t     In copy mode, interpolate tab character.
          \u     Move upward ½ vee (½ line in nroff).
          \v'N'  Vertically move N vees (or specified units) down (up if
                 negative).
          \Ve    Interpolate contents of environment variable with one-
                 character name e.
          \V(ev  Interpolate contents of environment variable with two-
                 character name ev.
          \V[env]
                 Interpolate contents of environment variable with
                 arbitrarily long name env.
          \w'anything'
                 Interpolate width of anything, formatted in a dummy
                 environment.
          \x'N'  Increase required line space by N vees (or specified
                 units; negative before, positive after).
          \X'anything'
                 Send anything to the output device as a control command;
                 see groff_out(5).
          \Yn    Send interpolation of string or macro with one-character
                 name n to the output device as a control command.
          \Y(nm  Send interpolation of string or macro with two-character
                 name nm to the output device as a control command.
          \Y[name]
                 Send interpolation of string or macro with arbitrarily
                 long name name to the output device as a control command.
          \zc    Output glyph c without advancing the print position, as if
                 it were zero-width.
          \Z'anything'
                 Print anything and then restore the horizontal and
                 vertical position; anything must not contain tabs or
                 leaders.


---------------------------------------------------------------

::

          An identifier is a label for an object of syntactical importance
          like a register, a name (macro, string, or diversion), an
          environment, a font, a style, or a glyph, comprising a sequence
          of one or more characters with the following exceptions.

          •      Spaces, tabs, or newlines.

          •      Invalid input characters; these are certain control
                 characters (from the sets “C0 Controls” and “C1 Controls”
                 as Unicode describes them).  When troff encounters one in
                 an identifier, it produces a warning diagnostic of type
                 “input” (see section “Warnings” in troff(1)).

                 On a machine using the ISO 646, 8859, or 10646 character
                 encodings, invalid input characters are 0x00, 0x08, 0x0B,
                 0x0D–0x1F, and 0x80–0x9F.

                 On an EBCDIC host, they are 0x00–0x01, 0x08, 0x09, 0x0B,
                 0x0D–0x14, 0x17–0x1F, and 0x30–0x3F.

                 Some of these code points are used by troff internally,
                 making it non-trivial to extend the program to cover
                 Unicode or other character encodings that use characters
                 from these ranges.  (Consider what happens when a C1
                 control 0x80–0x9F is necessary as a continuation byte in a
                 UTF-8 sequence.}

                 Invalid characters are removed during parsing; an
                 identifier “foo”, followed by an invalid character,
                 followed by “bar” is treated as “foobar”.


-------------------------------------------------------

::

          groff has string variables primarily for user convenience.  Only
          one string is predefined by the language.

          \*[.T]    Contains the name of the output driver (for example,
                    “utf8” or “pdf”).

          The .ds request creates a string with a specified name and
          contents and the \* escape dereferences its name, retrieving the
          contents.  Dereferencing an undefined string name defines it as
          empty.

          The .as request is similar to .ds but appends to a string instead
          of redefining it.  If .as is called with only one argument, no
          operation is performed (beyond dereferencing it).

          The .ds1 request defines a string such that compatibility mode is
          off when the string is later interpolated.  To be more precise, a
          compatibility save input token is inserted at the beginning of
          the string, and a compatibility restore input token at the end.
          Likewise, the .as1 request is similar to .as, but compatibility
          mode is switched off when the appended portion of the string is
          later interpolated.

          Caution: Unlike other requests, the second argument to these
          requests consumes the remainder of the input line, including
          trailing spaces.  It is good style to end string definitions (and
          appendments) with a comment, even an empty one, to prevent
          unwanted space from creeping into them during source document
          maintenance.

          To store leading space in a string, start it with a double quote.
          A double quote is special only in that position; double quotes in
          any other location are included in the string (the effects of
          escape sequences notwithstanding).

          Strings, macros, and diversions share a name space.  Internally,
          the same mechanism is used to store them.

          Several requests exist to perform rudimentary string operations.
          Strings can be queried (.length) and modified (.chop, .substring,
          .stringup, .stringdown), and their names can be manipulated
          through renaming, removal, and aliasing (.rn, .rm, .als).


-----------------------------------------------------------

::

          Registers are variables that store a value.  In groff, most
          registers store numerical values (see section “Numerical
          Expressions” above), but some can also hold a string value.

          Each register is given a name.  Arbitrary registers can be
          defined and set with the .nr request.

          The value stored in a register can be retrieved by the escape
          sequences introduced by \n.

          Most useful are predefined registers.  In the following the
          notation name is used to refer to register name to make clear
          that we speak about registers.  Please keep in mind that the \n[]
          decoration is not part of the register name.

      Read-only registers
          The following registers have predefined values that should not be
          modified by the user (usually, registers starting with a dot are
          read-only).  Mostly, they provide information on the current
          settings or store results from request calls.

          \n[$$]    The process ID of troff.
          \n[.$]    Number of arguments in the current macro or string.
          \n[.a]    Post-line extra line-space most recently utilized using
                    \x.
          \n[.A]    Set to 1 in troff if option -A is used; always 1 in
                    nroff.
          \n[.b]    The emboldening offset while .bd is active.
          \n[.br]   Within a macro, set to 1 if macro called with the
                    ‘normal’ control character, and to 0 otherwise.
          \n[.c]    Current input line number.
          \n[.C]    1 if compatibility mode is in effect, 0 otherwise.
                    Always 0 in a .do request; see register .cp below.
          \n[.cdp]  The depth of the last glyph added to the current
                    environment.  It is positive if the glyph extends below
                    the baseline.
          \n[.ce]   The number of lines remaining to be centered, as set by
                    the .ce request.
          \n[.cht]  The height of the last glyph added to the current
                    environment.  It is positive if the glyph extends above
                    the baseline.
          \n[.color]
                    1 if colors are enabled, 0 otherwise.
          \n[.cp]   Within a .do request, the saved value of compatibility
                    mode (see register .C above).
          \n[.csk]  The skew of the last glyph added to the current
                    environment.  The skew of a glyph is how far to the
                    right of the center of a glyph the center of an accent
                    over that glyph should be placed.
          \n[.d]    Current vertical place in current diversion; equal to
                    register nl.
          \n[.ev]   The name or number of the current environment (string-
                    valued).
          \n[.f]    Current font number.
          \n[.F]    The name of the current input file (string-valued).
          \n[.fam]  The current font family (string-valued).
          \n[.fn]   The current (internal) real font name (string-valued).
          \n[.fp]   The number of the next free font position.
          \n[.g]    Always 1 in GNU troff.  Use to test if running under
                    groff.
          \n[.h]    Text baseline high-water mark on page or in diversion.
          \n[.H]    Number of basic units per horizontal unit of output
                    device resolution.
          \n[.height]
                    The current font height as set with \H.
          \n[.hla]  The hyphenation language in the current environment.
          \n[.hlc]  The count of immediately preceding consecutive
                    hyphenated lines in the current environment.
          \n[.hlm]  The maximum number of consecutive hyphenated lines
                    allowed in the current environment.
          \n[.hy]   The automatic hyphenation mode in the current
                    environment.
          \n[.hym]  The hyphenation margin in the current environment.
          \n[.hys]  The hyphenation space adjustment threshold in the
                    current environment.
          \n[.i]    Current indentation.
          \n[.in]   The indentation that applies to the current output
                    line.
          \n[.int]  Positive if last output line contains \c.
          \n[.j]    Adjustment mode encoded as an integer.  Do not
                    interpret or perform arithmetic on its value.
          \n[.k]    The current horizontal output position (relative to the
                    current indentation).
          \n[.kern] 1 if pairwise kerning is enabled, 0 otherwise.
          \n[.l]    Current line length.
          \n[.L]    The current line spacing setting as set by .ls.
          \n[.lg]   The current ligature mode (as set by the .lg request).
          \n[.linetabs]
                    The current line-tabs mode (as set by the .linetabs
                    request).
          \n[.ll]   The line length that applies to the current output
                    line.
          \n[.lt]   The title length (as set by the .lt request).
          \n[.m]    The current drawing color (string-valued).
          \n[.M]    The current background color (string-valued).
          \n[.n]    Length of text portion on previous output line.
          \n[.ne]   The amount of space that was needed in the last .ne
                    request that caused a trap to be sprung.  Useful in
                    conjunction with register .trunc.
          \n[.nm]   1 if output line numbering is enabled (even if
                    temporarily suppressed), 0 otherwise.
          \n[.ns]   1 if in no-space mode, 0 otherwise.
          \n[.o]    Current page offset.
          \n[.O]    The suppression nesting level (see \O).
          \n[.p]    Current page length.
          \n[.P]    1 if the current page is being printed, 0 otherwise (as
                    determined by the -o command-line option).
          \n[.pe]   1 during page ejection, 0 otherwise.
          \n[.pn]   The number of the next page: either the value set by a
                    .pn request, or the number of the current page plus 1.
          \n[.ps]   The current point size in scaled points.
          \n[.psr]  The last-requested point size in scaled points.
          \n[.pvs]  The current post-vertical line spacing.
          \n[.R]    The number of unused number registers.  Always 10000 in
                    GNU troff.
          \n[.rj]   The number of lines to be right-justified as set by the
                    .rj request.
          \n[.s]    Current point size as a decimal fraction.
          \n[.slant]
                    The slant of the current font as set with \S.
          \n[.sr]   The last requested point size in points as a decimal
                    fraction (string-valued).
          \n[.ss]   Size of minimal inter-word spacing in twelfths of the
                    space width of the current font.
          \n[.sss]  Size of additional inter-sentence spacing in twelfths
                    of the space width of the current font.
          \n[.sty]  The current font style (string-valued).
          \n[.t]    Distance to the next vertical position trap.
          \n[.T]    Set to 1 if option -T is used.
          \n[.tabs] A string representation of the current tab settings
                    suitable for use as an argument to the .ta request.
          \n[.trunc]
                    The amount of vertical space truncated by the most
                    recently sprung vertical position trap, or, if the trap
                    was sprung by an .ne request, minus the amount of
                    vertical motion produced by .ne.  Useful in conjunction
                    with the register .ne.
          \n[.u]    Equal to 1 if filling is enabled, 0 otherwise.
          \n[.U]    1 in unsafe mode and 0 otherwise.
          \n[.v]    Current vertical line spacing.
          \n[.V]    Number of basic units per vertical unit of output
                    device resolution.
          \n[.vpt]  1 if vertical position traps are enabled, 0 otherwise.
          \n[.w]    Width of previous glyph.
          \n[.warn] The sum of the number codes of the currently enabled
                    warnings.
          \n[.x]    The major version number of the running troff
                    formatter.
          \n[.y]    The minor version number of the running troff
                    formatter.
          \n[.Y]    The revision number of the running troff formatter.
          \n[.z]    Name of current diversion.
          \n[.zoom] Zoom factor for current font (in multiples of 1/1000th;
                    zero if no magnification).

      Writable registers
          The following registers can be read and written by the user.
          They have predefined default values, but these can be modified
          for customizing a document.

          \n[%]     Current page number.
          \n[c.]    Current input line number.
          \n[ct]    Character type (set by width function \w).
          \n[dl]    Maximal width of last completed diversion.
          \n[dn]    Height of last completed diversion.
          \n[dw]    Current day of week (1–7).
          \n[dy]    Current day of month (1–31).
          \n[hours] The number of hours past midnight.  Initialized at
                    start-up.
          \n[hp]    Current horizontal position at input line.
          \n[llx]   Lower left x-coordinate (in PostScript units) of a
                    given PostScript image (set by .psbb).
          \n[lly]   Lower left y-coordinate (in PostScript units) of a
                    given PostScript image (set by .psbb).
          \n[ln]    Output line number.
          \n[lsn]   The count of leading spaces on an input line.
          \n[lss]   The amount of horizontal space corresponding to the
                    leading spaces on an input line.
          \n[minutes]
                    The number of minutes after the hour.  Initialized at
                    start-up.
          \n[mo]    Current month (1–12).
          \n[nl]    Current vertical position.
          \n[opmaxx]
          \n[opmaxy]
          \n[opminx]
          \n[opminy]
                    These four registers mark the top left and bottom right
                    hand corners of a box which encompasses all written
                    glyphs.  They are reset to -1 by \O0 or \O1.
          \n[rsb]   Like register sb, but takes account of the heights and
                    depths of glyphs.
          \n[rst]   Like register st, but takes account of the heights and
                    depths of glyphs.
          \n[sb]    Depth of string below base line (generated by width
                    function \w).
          \n[seconds]
                    The number of seconds after the minute.  Initialized at
                    start-up.
          \n[skw]   Right skip width from the center of the last glyph in
                    the \w argument.
          \n[slimit]
                    If greater than 0, the maximum number of objects on the
                    input stack.  If ≤0 there is no limit, i.e., recursion
                    can continue until virtual memory is exhausted.
          \n[ssc]   The amount of horizontal space (possibly negative) that
                    should be added to the last glyph before a subscript
                    (generated by width function \w).
          \n[st]    Height of string above base line (generated by width
                    function \w).
          \n[systat]
                    The return value of the system() function executed by
                    the last .sy request.
          \n[urx]   Upper right x-coordinate (in PostScript units) of a
                    given PostScript image (set by .psbb).
          \n[ury]   Upper right y-coordinate (in PostScript units) of a
                    given PostScript image (set by .psbb).
          \n[year]  The current year.
          \n[yr]    The current year minus 1900.


---------------------------------------------------------------

::

          When filling, groff hyphenates words as needed at user-specified
          and automatically determined hyphenation points.  Explicitly
          hyphenated words such as “mother-in-law” are eligible for
          breaking after each of their hyphens.  The hyphenation
          character \% and non-printing break point \: escapes may be used
          to control the hyphenation and breaking of individual words.  The
          .hw request sets user-defined hyphenation points for specified
          words at any subsequent occurrence.  Otherwise, groff determines
          hyphenation points automatically by default.

          Several requests influence automatic hyphenation.  Because
          conventions vary, a variety of hyphenation modes is available to
          the .hy request; these determine whether hyphenation will apply
          to a word prior to breaking a line at the end of a page (more or
          less; see below for details), and at which positions within that
          word automatically determined hyphenation points are permissible.
          The default is “1” for historical reasons, but this is not an
          appropriate value for the English hyphenation patterns used by
          groff; localization macro files loaded by troffrc and macro
          packages often override it.

          0      disables hyphenation.

          1      enables hyphenation except after the first and before the
                 last character of a word.

          The remaining values “imply” 1; that is, they enable hyphenation
          under the same conditions as “.hy 1”, and then apply or lift
          restrictions relative to that basis.

          2      disables hyphenation of the last word on a page.
                 (Technically, hyphenation is prevented if the next page
                 location trap is closer than the next line of text would
                 be.  groff automatically inserts an implicit page location
                 trap at the end of each page to cause a page transition.
                 Users or macro packages can set such traps explicitly to
                 prevent hyphenation of the last word in a column in multi-
                 column page layouts or before floating figures or tables.
                 See section “Traps” below.)

          4      disables hyphenation before the last two characters of a
                 word.

          8      disables hyphenation after the first two characters of a
                 word.

          16     enables hyphenation before the last character of a word.

          32     enables hyphenation after the first character of a word.

          Apart from value 2, restrictions imposed by the hyphenation mode
          are not respected for words whose hyphenations have been
          explicitly specified with the hyphenation character (“\%” by
          default) or the .hw request.

          The nonzero values above are additive.  For example, value 12
          causes groff to hyphenate neither the last two nor the first two
          characters of a word.  Some values cannot be used together
          because they contradict; for instance, values 4 and 16, and
          values 8 and 32.  As noted, it is superfluous to add 1 to any
          nonzero even mode.

          The places within a word that are eligible for hyphenation are
          determined by language-specific data (.hla, .hpf, and .hpfa) and
          lettercase relationships (.hcode and .hpfcode).  Furthermore,
          hyphenation of a word might be suppressed because too many
          previous lines have been hyphenated (.hlm), the line has not
          reached a certain minimum length (.hym), or the line can instead
          be adjusted with up to a certain amount of additional inter-word
          space (.hys).


-----------------------------------------------------------------

::

          The set of hyphenation patterns is associated with the
          hyphenation language set by the .hla request.  The .hpf request
          is usually invoked by a localization file loaded by the troffrc
          file.  By default, troffrc loads the localization file for
          English.  (As of groff 1.23.0, localization files for Czech (cs),
          German (de), English (en), French (fr), Japanese (ja), Swedish
          (sv), and Chinese (zh) exist.)  For Western languages, the
          localization file sets the hyphenation mode and loads hyphenation
          patterns and exceptions.  It also (re-)defines translatable
          strings and macros that packages use to handle localization
          tasks, such as formatting the calendar date.


---------------------------------------------------------------------

::

          The .de request defines a macro replacing the definition of any
          existing request, macro, string, or diversion of the same name.
          troff stores subsequent lines to an internal buffer in “copy
          mode” (see below).  If the optional second argument is not
          specified, the macro definition ends with the control line “..”
          (two dots).  Alternatively, a second argument names a macro whose
          call syntax ends the definition; this “end macro” is then called
          normally.  Spaces or tabs are permitted after the first control
          character in the line containing this ending token.  A tab
          immediately after the token prevents is recognition as the end of
          a macro definition.  Macro definitions can be nested; this
          requires use of unique end macros for each nested definition or
          escaping of the line with the ending token.  An end macro need
          not be defined until it is called.  This fact enables a nested
          macro definition to begin inside one macro and end inside
          another.

          Variants of .de that disable compatibility mode and/or indirect
          the names of the macros being defined or ending the definition
          through a string are available as .de1, .dei, and .dei1.
          Existing macro definitions can be appended to with .am, .am1,
          .ami, and .ami1.  The .als, .rm, and .rn requests create an alias
          of, remove, and rename a macro, respectively.  .return stops the
          execution of a macro immediately, returning to the enclosing
          context.

      Parameters
          Macro calls and string parameters can be accessed using the \$
          escapes.  The \n[.$] read-only register stores the count of
          parameters available to a macro or string; its value can be
          changed by the .shift request, which dequeues parameters from the
          current list.  The \$0 escape sequence interpolates the name by
          which a macro was called.  Applying string interpolation to a
          macro does not change this name.

      Copy mode
          When troff processes certain requests, most importantly those
          which define or append to a macro or string, it does so in copy
          mode: it copies the characters of the definition into a dedicated
          storage region, interpolating the escape sequences \n, \g, \$,
          \*, and \V normally; interpreting \newline immediately;
          discarding comments \" and \#; interpolating the current leader,
          escape, or tab character with \a, \e, and \t, respectively; and
          storing all other escape sequences in an encoded form.  The
          complement of copy mode—a roff formatter's behavior when not
          defining or appending to a macro, string, or diversion—where all
          macros are interpolated, requests invoked, and valid escape
          sequences processed immediately upon recognition, can be termed
          interpretation mode.

          The escape character, \ by default, escapes itself.  Thus you can
          control whether a given \n, \g, \$, \*, or \V escape sequence is
          interpreted at the time the macro containing it is defined, or
          later when the macro is called.

          You can think of \\ as a “delayed” backslash; it is the escape
          character followed by a backslash from which the escape character
          has removed its special meaning.  Consequently, \\ is not an
          escape sequence in the usual sense.  In any escape sequence \X
          that troff does not recognize, the escape character is ignored
          and X is output, with two exceptions, \\ being one.  The other is
          \., which escapes the control character.  It is used to permit
          nested macro definitions to end without a named macro call to
          conclude them.  Without a syntax for escaping the control
          character, this would not be possible.  roff documents should not
          use the \\ or \. tokens outside of copy mode; they serve only to
          obfuscate the input.  Use \e to obtain the escape character,
          \[rs] to obtain a backslash glyph, and \& before “.” and “'”
          where troff expects them as control characters if you mean to use
          them literally.

          Macro definitions can be nested to arbitrary depth.  Each escape
          character is interpreted twice—once in copy mode, when the macro
          is defined, and once in interpretation mode, when it is executed.
          This fact leads to exponential growth in the number of escape
          characters required to delay interpolation of \n, \g, \$, \*, and
          \V at each nesting level.  An alternative is to use \E, which
          represents an escape character that is not interpreted in copy
          mode.  Because \. is not a true escape sequence, we can't use \E
          to keep “..” from ending a macro definition prematurely.  If the
          multiplicity of backslashes complicates maintenance, use end
          macros.


---------------------------------------------------

::

          Traps are locations in the output, or conditions on the input
          that, when reached or fulfilled, cause a specified macro to be
          called.  These traps can occur at a given location on the page
          (.wh, .ch); at a given location in the current diversion
          (.dt)—together, these are known as vertical position traps, which
          can be disabled and re-enabled (.vpt); at a blank line (.blm); at
          a line with leading space characters (.lsm); after a certain
          number of input lines (.it, .itc); or at the end of input (.em).
          Macros called by traps have no arguments.  Setting a trap is also
          called planting.  It is also said that a trap is sprung if the
          associated macro is executed.

          Registers associated with trap management include vertical
          position trap enablement status (\n[.vpt]), distance to the next
          trap (\n[.t]), amount of needed (.ne-requested) space that caused
          the most recent vertical position trap to be sprung (\n[.ne]),
          amount of needed space truncated from the amount requested
          (\n[.trunc]), page ejection status (\n[.pe]), and leading space
          count (\n[.lsn]) with its corresponding amount of motion
          (\n[.lss]).


---------------------------------------------------------------

::

          In the RUNOFF language, the underlining was quite easy.  But in
          roff this is much more difficult.

      Underlining with .ul
          There exists a groff request .ul (see above) that can underline
          the next or further source lines in nroff, but in troff it
          produces only a font change into italic.  So this request is not
          really useful.

      Underlining with .UL from ms
          In the ‘ms’ macro package in tmac/s.tmac groff_ms(7), there is
          the macro .UL.  But this works only in troff, not in nroff.

      Underlining macro definitions
          So one can use the italic nroff idea from .ul and the troff
          definition in ms for writing a useful new macro, something like
                 .de UNDERLINE
                 . ie n \\$1\f[I]\\$2\f[P]\\$3
                 . el \\$1\Z'\\$2'\v'.25m'\D'l \w'\\$2'u 0'\v'-.25m'\\$3
                 ..
          If doclifter(1) makes trouble, change the macro name UNDERLINE
          into some 2-letter word, like Ul.  Moreover, change the form of
          the font escape from \f[P] to \fP.

      Underlining without macro definitions
          If one does not want to use macro definitions, e.g., when
          doclifter gets lost, use the following:
                 .ds u1 before
                 .ds u2 in
                 .ds u3 after
                 .ie n \*[u1]\f[I]\*[u2]\f[P]\*[u3]
                 .el \*[u1]\Z'\*[u2]'\v'.25m'\D'l \w'\*[u2]'u 0'\v'-.25m'\*[u3]
          When using doclifter, it might be necessary to change syntax
          forms such as \[xy] and \*[xy] to those supported by AT&T troff:
          \*(xy and \(xy, and so on.

          Then these lines could look like
                 .ds u1 before
                 .ds u2 in
                 .ds u3 after
                 .ie n \*[u1]\fI\*(u2\fP\*(u3
                 .el \*(u1\Z'\*(u2'\v'.25m'\D'l \w'\*(u2'u 0'\v'-.25m'\*(u3

          The result looks like
                 before _i_n after

      Underlining with overstriking \z and \(ul
          There is another possibility for underlining by using
          overstriking with \zc (print c with zero width without spacing)
          and \(ul (underline character).  This produces the underlining of
          1 character, both in nroff and in troff.

          For example the underlining of a character say t looks like
          \z\[ul]t or \z\(ult

          Longer words look then a bit strange, but a useful mode is to
          write each character into a whole own line.  To underlines the 3
          character part "tar" of the word "start":
                 before s\
                 \z\[ul]t\
                 \z\[ul]a\
                 \z\[ul]r\
                 t after
          or
                 before s\
                 \z\(ult\
                 \z\(ula\
                 \z\(ulr\
                 t after

          The result looks like
                 before s_t_a_rt after


-------------------------------------------------------------------

::

          The differences between the roff language recognized by GNU troff
          and that of AT&T troff, as well as the device, font, and device-
          independent intermediate output formats described by CSTR #54 are
          documented in groff_diff(7).

          groff provides an AT&T compatibility mode; see groff(1).


-----------------------------------------------------------

::

          groff is not the easiest language to debug, in part thanks to its
          design features of recursive interpolation and multi-stage
          pipeline processing.  Nevertheless there exist several features
          useful for troubleshooting.

          Preprocessors use the .lf request to preserve the identities of
          line numbers and names of input files.  groff emits a variety of
          error diagnostics and supports several categories of warning; the
          output of these can be selectively suppressed with .warn (and see
          the -E, -w, and -W options of troff(1)).  Backtraces can be
          automatically produced when errors or warnings occur (the -b
          option of troff(1)) or generated on demand (.backtrace).  .tm,
          .tmc, and .tm1 can be used to emit customized diagnostic messages
          or for instrumentation while troubleshooting.  .ex and .ab cause
          early termination with successful and error exit codes
          respectively, to halt further processing when continuing would be
          fruitless.  The state of the formatter can be examined with
          requests that write lists of defined macros, strings, and
          diversions (.pm); environments (.pev), registers (.pnr), and page
          location traps (.ptr) to the standard error stream.


-------------------------------------------------------

::

          This document was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩.


---------------------------------------------------------

::

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          “Troff User's Manual” by Joseph F. Ossanna, 1976 (revised by
          Brian W. Kernighan, 1992), AT&T Bell Laboratories Computing
          Science Techical Report No. 54, widely called simply “CSTR #54”,
          documents the language, device and font description file formats,
          and device-independent output format referred to collectively in
          groff documentation as “AT&T troff”.

          “A Typesetter-independent TROFF” by Brian W. Kernighan, 1982,
          AT&T Bell Laboratories Computing Science Techical Report No. 97
          (CSTR #97), provides additional insights into the device and font
          description file formats and device-independent output format.

          groff(1)
                 is the preferred interface to the groff system; it manages
                 the pipeline that carries a source document through
                 preprocessors, the troff formatter, and an output driver
                 to viewable or printable form.  It also exhaustively lists
                 all of the man pages provided with the GNU roff system.

          groff_char(7)
                 discusses character encoding issues, escape sequences that
                 produce glyphs, and enumerates groff's predefined special
                 character escapes.

          groff_diff(7)
                 covers the differences between the GNU troff formatter,
                 its device and font description file formats, its device-
                 independent output format, and those of AT&T troff, whose
                 design it re-implements.

          groff_font(5)
                 describes the formats of the files that describe devices
                 (DESC) and fonts.

          groff_tmac(5)
                 surveys macro packages provided with groff, describes how
                 documents can take advantage of them, offers guidance on
                 writing macro packages and using diversions, and includes
                 historical information on macro package naming
                 conventions.

          roff(7)
                 presents a detailed history of roff systems and summarizes
                 concepts common to them.

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

   groff 1.23.0.rc1.1101-d1263-di2r6tyAugust 2021                     groff(7)

--------------

Pages that refer to this page: `eqn(1) <../man1/eqn.1.html>`__, 
`glilypond(1) <../man1/glilypond.1.html>`__, 
`gperl(1) <../man1/gperl.1.html>`__, 
`gpinyin(1) <../man1/gpinyin.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`pdfroff(1) <../man1/pdfroff.1.html>`__, 
`refer(1) <../man1/refer.1.html>`__, 
`soelim(1) <../man1/soelim.1.html>`__, 
`troff(1) <../man1/troff.1.html>`__, 
`groff_filenames(5) <../man5/groff_filenames.5.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__, 
`groff_diff(7) <../man7/groff_diff.7.html>`__, 
`groff_hdtbl(7) <../man7/groff_hdtbl.7.html>`__, 
`groff_man(7) <../man7/groff_man.7.html>`__, 
`groff_man_style(7) <../man7/groff_man_style.7.html>`__, 
`groff_rfc1345(7) <../man7/groff_rfc1345.7.html>`__, 
`groff_trace(7) <../man7/groff_trace.7.html>`__, 
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
