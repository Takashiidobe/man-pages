.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_diff(7) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `Language <#Language>`__ \|       |                                   |
| `Intermediate output format       |                                   |
|  <#Intermediate_output_format>`__ |                                   |
| \| `Debugging <#Debugging>`__ \|  |                                   |
| `Implementation differences       |                                   |
|  <#Implementation_differences>`__ |                                   |
| \| `Authors <#Authors>`__ \|      |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_diff(7)       Miscellaneous Information Manual       groff_diff(7)


-------------------------------------------------

::

          groff_diff - differences between GNU roff and AT&T troff


---------------------------------------------------------------

::

          The GNU roff text processing system, groff, is largely compatible
          with AT&T troff, the typesetting system originating in Unix
          systems of the 1970s.  At the same time, groff removes many
          arbitrary limitations and adds features, both to the language and
          to the intermediate, device-independent output format.
          Differences arising from groff's implementation of AT&T troff
          features are also noted.


---------------------------------------------------------

::

          groff features identifiers of arbitrary length, supports non-
          integral point sizes, adds new escapes and requests, provides new
          conditional tests, recognizes additional scaling indicators and
          numerical operators, and extends the function of some escapes and
          requests already present in AT&T troff.

      Long names
          groff introduces many new requests; with three exceptions, they
          all have names longer than two characters.  The names of number
          registers, fonts, strings/macros/diversions, environments,
          special characters (glyphs), and colors can be of any length.
          More generally, anywhere AT&T troff supports an escape form that
          uses an opening parenthesis “(” to introduce a two-character
          argument, groff supports a square-bracketed form “[]” where the
          argument within can be of arbitrary length.

      Fractional point sizes and new scaling indicators
          A scaled point is equal to 1/sizescale points, where sizescale is
          a parameter specified in the device description file, DESC, and
          defaults to 1.  A new scale indicator “z” has the effect of
          multiplying by sizescale.  Requests and escapes in groff
          interpret arguments that represent a point size as being in units
          of scaled points; that is, they evaluate such arguments using an
          implied default scaling indicator of “z”.  Arguments treated in
          this way comprise those to the escapes \H and \s, to the request
          .ps, the third argument to the .cs request, and the second and
          fourth arguments to the .tkf request.

          For example, if sizescale is 1000, then a scaled point is one
          one-thousandth of a point.  The request “.ps 10.25” is synonymous
          with “.ps 10.25z” and sets the point size to 10250 scaled points,
          or 10.25 points.

          Consequently, in groff, the number register \n[.s] can contain a
          non-integral point size.  The new number register \n[.ps] returns
          the point size in scaled points.

          It makes no sense to use the “z” scale indicator in a numeric
          expression whose default scaling indicator is neither “u”
          nor “z”, so groff disallows this.  Similarly, it is nonsensical
          to use a scaling indicator other than “z” or “u” in a numeric
          expression whose default scaling indicator is “z”, so groff
          disallows this as well.

          Another new scaling indicator, “s”, multiplies by the number of
          basic units in a scaled point.  For instance, “\n[.ps]s” is equal
          to “1m” by definition.  Do not confuse the “s” and “z” scaling
          indicators.

          A further two new measurement units available in groff are “M”,
          which indicates hundredths of an em, and “f”, which is defined as
          65536 basic units.  The latter provides convenient fractions for
          color definitions with the .defcolor request.  For example, 0.5f
          equals 32768u.

      Numeric expressions
          Spaces are permitted in a numeric expression within parentheses.
          Three new operators are available as well.

          e1>?e2 Compute the maximum of e1 and e2.

          e1<?e2 Compute the minimum of e1 and e2.

          (c;e)  Evaluate e using c as the default scaling indicator.  If c
                 is missing, ignore scaling indicators in the evaluation
                 of e.

      Conditional expressions
          More conditions can be tested with the .if and .ie requests, as
          well as the new .while request.

          c g    True if a glyph g is available, where g is a Unicode basic
                 Latin character; a groff special character \(xx or \[xxx];
                 \N'xxx'; or has been defined by any of the .char, .fchar,
                 .fschar, or .schar requests.

          d name True if there is a string, macro, diversion, or request
                 called name.

          F font True if a font called font exists.  font is handled as if
                 it were opened with the .ft request (that is, font
                 translation and styles are applied), without actually
                 mounting it.  This test doesn't load the complete font,
                 but only its header, to verify its validity.

          m color
                 True if there is a color called color.

          r reg  True if there is a number register called reg.

          S style
                 True if a style called style has been registered.  Font
                 translation is applied.

          v      Always false.  This condition is for compatibility with
                 certain other troff implementations only.  (This refers to
                 vtroff, a translator that would convert the C/A/T output
                 from early-vintage AT&T troff to a form suitable for
                 Versatec and Benson-Varian plotters.)

      Escape sequences
          groff introduces several new escape sequences and extends the
          syntax of a few AT&T troff escapes (namely, \D, \f, \k, \n, \$,
          and \*).  In the following list, escapes are collated
          alphabetically at first, and then by symbol roughly in Unicode
          code point order.

          \A'anything'
                 This expands to 1 or 0, depending on whether anything is
                 or is not acceptable as the name of a string, macro,
                 diversion, number register, environment, font, or color.
                 It returns 0 if anything is empty.  This is useful if you
                 want to look up user input in some sort of associative
                 table.

          \B'anything'
                 This expands to 1 or 0, depending on whether anything is
                 or is not a valid numeric expression.  It returns 0 if
                 anything is empty.

          \D'...'
                 All drawing commands supported by the AT&T troff device-
                 independent intermediate output format are accepted.  See
                 subsection “Drawing Commands” below for GNU extensions.

          \E     This is equivalent to an escape character, but it is not
                 interpreted in copy mode.  Strings to start and end
                 superscripting could be defined as follows.

                        .ds { \v'-.3m'\s'\En[.s]*6u/10u'
                        .ds } \s0\v'.3m'

                 The use of \E ensures that these definitions work even if
                 \*{ gets interpreted in copy mode (for example, by being
                 used in a macro argument).

          \f[xxx]
                 Set font xxx.  Additionally, \f[] is a new syntax form
                 equal to \fP, i.e., to return to the previous font.

          \Ff
          \F(fm
          \F[fam]
                 Change font family.  See the .fam request below.  \F[]
                 switches to the previous font family, or to the default
                 family if there is none.  \FP won't do this; it selects
                 font family “P” instead.

          \k(rg
          \k[reg]
                 Mark horizontal position in register with two-character
                 name rg or arbitrarily long name reg.

          \mx
          \m(xx
          \m[xxx]
                 Set drawing color.  \m[] switches back to the previous
                 color.

          \Mx
          \M(xx
          \M[xxx]
                 Set background color for filled objects drawn with the
                 \D'...' commands.  \M[] switches back to the previous
                 color.

          \n[xxx]
                 Interpolate number register xxx.

          \On
          \O[n]  Suppress troff output.  The escapes \O2, \O3, \O4, and \O5
                 are intended for internal use by grohtml.

                 \O0    Disable glyphs from being emitted to the device
                        driver, provided that the escape occurs at the
                        outer level (see \O3 and \O4).

                 \O1    Enable output of glyphs, provided that the escape
                        occurs at the outer level.

                        \O0 and \O1 also reset the registers \n[opminx],
                        \n[opminy], \n[opmaxx], and \n[opmaxy] to -1.
                        These four registers mark the top left and bottom
                        right hand corners of a box which encompasses all
                        written glyphs.

                 \O2    Provided that the escape occurs at the outer level,
                        enable output of glyphs and also write out to
                        stderr the page number and four registers
                        encompassing the glyphs previously written since
                        the last call to \O.

                 \O3    Begin a nesting level.  At start-up, troff is at
                        outer level.  This is really an internal mechanism
                        for grohtml while producing images.  They are
                        generated by running the troff source through troff
                        to the PostScript device and ghostscript to produce
                        images in PNG format.  The \O3 escape starts a new
                        page if the device is not html (to reduce the
                        possibility of images crossing a page boundary).

                 \O4    End a nesting level.

                 \O5[Pfilename]
                        This escape is grohtml specific.  Provided that
                        this escape occurs at the outer nesting level,
                        write filename to stderr.  The position of the
                        image, P, must be specified and must be one of l,
                        r, c, or i (left, right, centered, inline).
                        filename is associated with the production of the
                        next inline image.

          \R'name ±n'
                 This has the same effect as

                        .nr name ±n

          \s[±n]
          \s±[n]
          \s'±n'
          \s±'n' Set the point size to n scaled points; n is a numeric
                 expression with a default scaling indicator of “z”.

          \Vx
          \V(xx
          \V[xxx]
                 Interpolate the contents of the environment variable xxx,
                 as returned by getenv(3).  \V is interpreted in copy mode.

          \Yx
          \Y(xx
          \Y[xxx]
                 This is approximately equivalent to \X'\*[xxx]'.  However
                 the contents of the string or macro xxx are not
                 interpreted; also it is permitted for xxx to have been
                 defined as a macro and thus contain newlines (it is not
                 permitted for the argument to \X to contain newlines).
                 The inclusion of newlines requires an extension to the
                 AT&T troff output format, and confuses drivers that do not
                 know about this extension.

          \Z'anything'
                 Print anything and then restore the horizontal and
                 vertical position; anything may not contain tabs or
                 leaders.

          \#     Everything up to and including the next newline is
                 ignored.  This escape is interpreted even in copy mode.
                 \# is like \", except that \" does not ignore a newline;
                 the latter therefore cannot be used by itself for a whole-
                 line comment—it leaves a blank line on the input stream.

          \$0    The name by which the current macro was invoked.  The als
                 request can make a macro have more than one name.

          \$(nn
          \$[nnn]
                 In a macro or string, this gives the nn-th or nnn-th
                 argument.  Macros and strings can have an unlimited number
                 of arguments.

          \$*    In a macro or string, the concatenation of all the
                 arguments separated by spaces.

          \$@    In a macro or string, the concatenation of all the
                 arguments with each surrounded by double quotes, and
                 separated by spaces.

          \$^    In a macro, the representation of all parameters as if
                 they were an argument to the ds request.

          \)     Like \& except that it behaves like a character declared
                 with the .cflags request to be transparent for the
                 purposes of end-of-sentence recognition.

          \*[xxx arg1 arg2 ...]
                 Interpolate string xxx, taking arg1, arg2, ... as
                 arguments.

          \/     Apply an italic correction: increase the width of the
                 preceding glyph so that the spacing between that glyph and
                 the following glyph is correct if the following glyph is a
                 roman glyph.  For example, if an italic “f” is immediately
                 followed by a roman right parenthesis, then in many fonts
                 the top right portion of the “f” overlaps the top left of
                 the right parenthesis, which is ugly.  Inserting \/
                 between them avoids this problem.  Use this escape
                 sequence whenever an italic glyph is immediately followed
                 by a roman glyph without any intervening space.

          \,     Apply a left italic correction: modify the spacing of the
                 following glyph so that the spacing between that glyph and
                 the preceding glyph is correct if the preceding glyph is a
                 roman glyph.  For example, if a roman left parenthesis is
                 immediately followed by an italic “f”, then in many fonts
                 the bottom left portion of the “f” overlaps the bottom of
                 the left parenthesis, which is ugly.  Inserting \, between
                 them avoids this problem.  Use this escape sequence
                 whenever a roman glyph is immediately followed by an
                 italic glyph without any intervening space.

          \:     Insert a non-printing break point.  That is, the word can
                 break there, but the soft hyphen glyph is not written to
                 the output if it does (in contrast to “\%”).  This escape
                 is an input word boundary, so the remainder of the word is
                 subject to hyphenation as normal.

          \?anything\?
                 When used in a diversion, this transparently embeds
                 anything in the diversion.  anything is read in copy mode.
                 When the diversion is reread, anything is interpreted.
                 anything may not contain newlines; use \! if you want to
                 embed newlines in a diversion.  The escape sequence \? is
                 also recognized in copy mode and turned into a single
                 internal code; it is this code that terminates anything.
                 Thus

                        .nr x 1
                        .nf
                        .di d
                        \?\\?\\\\?\\\\\\\\nx\\\\?\\?\?
                        .di
                        .nr x 2
                        .di e
                        .d
                        .di
                        .nr x 3
                        .di f
                        .e
                        .di
                        .nr x 4
                        .f

                 prints 4.

          \[xxx] Print the special character (glyph) called xxx.

          \[comp1 comp2 ...]
                 Print composite glyph consisting of multiple components.
                 Example: ‘\[A ho]’ is capital letter A with ogonek which
                 finally maps to glyph name ‘u0041_0328’.  See Groff: The
                 GNU Implementation of troff, the groff Texinfo manual, for
                 details of how a glyph name for a composite glyph is
                 constructed, and groff_char(7) for a list of glyph name
                 components used in composite glyph names.

          \~     This produces an unbreakable space that stretches like a
                 normal inter-word space when a line is adjusted.

      Restricted requests
          To mitigate risks from untrusted input documents, the pi and sy
          requests are disabled by default.  troff(1)'s -U option enables
          the formatter's “unsafe mode”, restoring their function (and
          enabling additional groff extension requests, open, opena, and
          pso).

      New requests
          .aln new old
                 Create an alias new for an existing number register named
                 old, causing the names to refer to the same stored object.
                 If old is undefined, a warning of type “reg” is generated
                 and the request is ignored.  To remove a number register
                 alias, call .rr on its name.  A number register's contents
                 do not become inaccessible until it has no more names.

          .als new old
                 Create an alias new for the existing request, string,
                 macro, or diversion named old, causing the names to refer
                 to the same stored object.  If old is undefined, a warning
                 of type “mac” is generated and the request is ignored.
                 The .am, .as, .da, .de, .di, and .ds requests (together
                 with their variants) only create a new object if the name
                 of the macro, diversion, or string is currently undefined
                 or if it is defined as a request; normally, they modify
                 the value of an existing object.  To remove an alias,
                 simply call .rm on its name.  The object itself is not
                 destroyed until it has no more names.

          .am1 xx yy
                 Similar to .am, but compatibility mode is switched off
                 during execution.  To be more precise, a “compatibility
                 save” token is inserted at the beginning, and a
                 “compatibility restore” token at the end.  As a
                 consequence, the requests .am, .am1, .de, and .de1 can be
                 intermixed freely since the compatibility save/restore
                 tokens only affect the macro parts defined by .am1 and
                 .ds1.

          .ami xx yy
                 Append to macro indirectly.  See the dei request below.

          .ami1 xx yy
                 Same as the ami request but compatibility mode is switched
                 off during execution.

          .as1 name string
                 Similar to .as, but compatibility mode is switched off
                 when the appended portion of the string is later
                 interpolated.  To be more precise, a “compatibility save”
                 token is inserted at the beginning of the appended string
                 string, and a “compatibility restore” token at the end.
                 As a consequence, the requests .as, .as1, .ds, and .ds1
                 can be intermixed freely since the compatibility save/
                 restore tokens only affect the (sub)strings defined by
                 .as1 and .ds1.

          .asciify div
                 Unformat the diversion div in a way such that Unicode
                 basic Latin (ASCII) characters, characters translated with
                 the .trin request, space characters, and some escape
                 sequences, that were formatted and diverted into div are
                 treated like ordinary input characters when div is reread.
                 Doing so can be useful in conjunction with the .writem
                 request.  .asciify can be also used for gross hacks; for
                 example, the following sets register n to 1.

                        .tr @.
                        .di x
                        @nr n 1
                        .br
                        .di
                        .tr @@
                        .asciify x
                        .x

                 .asciify cannot return all items in a diversion to their
                 source equivalent: nodes such as those produced by \N[...]
                 will remain nodes, so the result cannot be guaranteed to
                 be a pure string.  See section “Copy mode” in groff(7).
                 Glyph parameters such as the type face and size are not
                 preserved; use .unformat to achieve that.

          .backtrace
                 Write a backtrace of the input stack to the standard error
                 stream.  Also see the -b option of troff(1).

          .blm [name]
                 Set a blank line macro (trap).  If a blank line macro is
                 thus defined, groff executes macro when a blank line is
                 encountered in the input file, instead of the usual
                 behavior.  A line consisting only of spaces is also
                 treated as blank and subject to this trap.  If no argument
                 is supplied, the default blank line behavior is
                 (re-)established.

          .box name
          .boxa name
                 These requests are similar to the di and da requests,
                 respectively, with the exception that any pending output
                 line does not become part of the diversion (i.e., a box
                 diversion always starts on a new output line) but is
                 restored after ending the diversion, discarding any
                 partially collected line in the diversion.

          .break Break out of a while loop.  See also the while and
                 continue requests.  Be sure not to confuse this with the
                 br request.

          .brp   This is the same as \p.

          .cflags n c1 c2 ...
                 Assign properties encoded by the number n to characters
                 c1, c2, and so on.

                 Input characters, including special characters introduced
                 by an escape, have certain properties associated with
                 them.  (Note that output glyphs don't have such
                 properties.  In groff, a glyph is a numbered box with a
                 given height above and depth below the baseline, and a
                 width—nothing more.)  These properties can be modified
                 with this request.  The first argument is the sum of the
                 desired flags and the remaining arguments are the
                 characters to be assigned those properties.  Spaces
                 between the cn arguments are optional.  Any argument cn
                 can be a character class defined with the .class request
                 rather than an individual character.

                 The non-negative integer n is the sum of any of the
                 following.  Some combinations are nonsensical, such as
                 “33” (1 + 32).

                 1      Recognize the character as ending a sentence if
                        followed by a newline or two spaces.  Initially,
                        characters “.?!”  have this property.

                 2      Enable breaks before the character.  A line is not
                        broken at a character with this property unless the
                        characters on each side both have non-zero
                        hyphenation codes.  This exception can be
                        overridden by adding 64.  Initially, no characters
                        have this property.

                 4      Enable breaks after the character.  A line is not
                        broken at a character with this property unless the
                        characters on each side both have non-zero
                        hyphenation codes.  This exception can be
                        overridden by adding 64.  Initially, characters
                        “-\[hy]\[em]” have this property.

                 8      Mark the glyph associated with this character as
                        overlapping other instances of itself horizontally.
                        Initially, characters
                        “\[ul]\[rn]\[ru]\[radicalex]\[sqrtex]” have this
                        property.

                 16     Mark the glyph associated with this character as
                        overlapping other instances of itself vertically.
                        Initially, the character “\[br]” has this property.

                 32     Mark the character as transparent for the purpose
                        of end-of-sentence recognition.  In other words, an
                        end-of-sentence character followed by any number of
                        characters with this property is treated as the end
                        of a sentence if followed by a newline or two
                        spaces.  This is the same as having a zero space
                        factor in TeX.  Initially, characters
                        “'")]*\[dg]\[dd]\[rq]\[cq]” have this property.

                 64     Ignore hyphenation codes of the surrounding
                        characters.  Use this value in combination with
                        values 2 and 4.  Initially, no characters have this
                        property.

                        For example, if you need an automatic break point
                        after the en-dash in numerical ranges like
                        “3000–5000”, insert
                               .cflags 68 \[en]
                        into your document.  Note, however, that this can
                        lead to bad layout if done without thinking; in
                        most situations, a better solution than changing
                        the .cflags value is inserting “\:” right after the
                        hyphen at the places that really need a break
                        point.

                 The remaining values were implemented for East Asian
                 language support; those who use alphabetic scripts
                 exclusively can disregard them.

                 128    Prohibit a break before the character, but allow a
                        break after the character.  This works only in
                        combination with values 256 and 512 and has no
                        effect otherwise.  Initially, no characters have
                        this property.

                 256    Prohibit a break after the character, but allow a
                        break before the character.  This works only in
                        combination with values 128 and 512 and has no
                        effect otherwise.  Initially, no characters have
                        this property.

                 512    Allow a break before or after the character.  This
                        works only in combination with values 128 and 256
                        and has no effect otherwise.  Initially, no
                        characters have this property.

                 In contrast to values 2 and 4, the values 128, 256, and
                 512 work pairwise.  If, for example, the left character
                 has value 512, and the right character 128, no break will
                 be automatically inserted between them.  If we use value 6
                 instead for the left character, a break after the
                 character can't be suppressed since the neighboring
                 character on the right doesn't get examined.

          .char g string
                 Define a new character or glyph g to be string, which can
                 be empty.  More precisely, .char defines a groff object
                 (or redefines an existing one) that is accessed with the
                 name g on input, and produces string on output.  Every
                 time glyph g needs to be printed, string is processed in a
                 temporary environment and the result is wrapped up into a
                 single object.  Compatibility mode is turned off and the
                 escape character is set to \ while string is processed.
                 Any emboldening, constant spacing, or track kerning is
                 applied to this object rather than to individual glyphs in
                 string.

                 An object defined by this request can be used just like a
                 normal glyph provided by the output device.  In
                 particular, other characters can be translated to it with
                 the .tr request; it can be made the leader glyph with the
                 .lc request; repeated patterns can be drawn with it using
                 the \l and \L escape sequences; and words containing g can
                 be hyphenated correctly, if the .hcode request is used to
                 give the object a hyphenation code.

                 There is a special anti-recursion feature: use of the
                 object within its own definition is handled like a normal
                 character (one not defined with .char).

                 The .tr and .trin requests take precedence if .char
                 accesses the same symbol.

                 A glyph definition can be removed with the .rchar request.

          .chop object
                 Remove the last character from the macro, string, or
                 diversion named object.  This is useful for removing the
                 newline from the end of a diversion that is to be
                 interpolated as a string.  This request can be used
                 repeatedly on the same object; see section “Gtroff
                 Internals” in Groff: The GNU Implementation of troff, the
                 groff Texinfo manual, for details on nodes inserted
                 additionally by groff.

          .class name c1 c2 ...
                 Define a character class (or simply “class”) name
                 comprising the characters or range expressions c1, c2, and
                 so on.

                 A class thus defined can then be referred to in lieu of
                 listing all the characters within it.  Currently, only the
                 .cflags request can handle references to character
                 classes.

                 In the request's simplest form, each cn is a character (or
                 special character).
                        .class [quotes] ' \[aq] \[dq] \[oq] \[cq] \[lq] \[rq]

                 Since class and glyph names share the same name space, it
                 is recommended to start and end the class name with “[”
                 and “]”, respectively, to avoid collisions with existing
                 character names defined by groff or the user (with .char
                 and related requests).  This practice applies the presence
                 of “]” in the class name to prevent the usage of the
                 special character escape form “\[...]”, thus you must use
                 the \C escape to access a class with such a name.

                 You can also use a character range expression consisting
                 of a start character followed by “-” and then an end
                 character.  Internally, groff converts these two character
                 names to Unicode code points (according to the groff glyph
                 list [GGL]), which determine the start and end values of
                 the range.  If that fails, the class definition is
                 skipped.  Furthermore, classes can be nested.
                        .class [prepunct] , : ; > }
                        .class [prepunctx] \C'[prepunct]' \[u2013]-\[u2016]
                 The class “[prepunctx]” thus contains the contents of the
                 class “[prepunct]” and characters in the range
                 U+2013–U+2016.

                 If you want to include “-” in a class, it must be the
                 first character value in the argument list, otherwise it
                 gets misinterpreted as part of the range syntax.

                 Note that it is not possible to use class names as end
                 points of range definitions.

                 A typical use of the .class request is to control line-
                 breaking and hyphenation rules as defined by the .cflags
                 request.  For example, to inhibit line breaks before the
                 characters belonging to the “[prepunctx]” class defined in
                 the previous example, you can write the following.
                        .cflags 2 \C'[prepunctx]'

          .close stream
                 Close the stream named stream; stream will no longer be an
                 acceptable argument to the write request.  See the open
                 request.

          .composite glyph1 glyph2
                 Map glyph name glyph1 to glyph name glyph2 if it is used
                 in \[...] with more than one component.

          .continue
                 Finish the current iteration of a while loop.  See also
                 the while and break requests.

          .color n
                 If n is non-zero or missing, enable colors (this is the
                 default), otherwise disable them.

          .cp n  If n is non-zero or missing, enable compatibility mode,
                 otherwise disable it.  In compatibility mode, long names
                 are not recognized, and the incompatibilities caused by
                 long names do not arise.

          .defcolor xxx scheme color_components
                 Define color xxx.  scheme can be one of the following
                 values: rgb (three components), cmy (three components),
                 cmyk (four components), and gray or grey (one component).
                 Color components can be given either as a hexadecimal
                 string or as positive decimal integers in the range
                 0–65535.  A hexadecimal string contains all color
                 components concatenated; it must start with either # or
                 ##.  The former specifies hex values in the range 0–255
                 (which are internally multiplied by 257), the latter in
                 the range 0–65535.  Examples: #FFC0CB (pink),
                 ##ffff0000ffff (magenta).  A new scaling indicator,
                 “f” has has been introduced which multiplies its value
                 by 65536; this makes it convenient to specify color
                 components as fractions in the range 0 to 1.  Example:

                        .defcolor darkgreen rgb 0.1f 0.5f 0.2f

                 Note that f is the default scaling indicator for the
                 defcolor request, thus the above statement is equivalent
                 to

                        .defcolor darkgreen rgb 0.1 0.5 0.2

                 The color named default (which is device-specific) can't
                 be redefined.  It is possible that the default color for
                 \M and \m is not the same.

          .de1 xx yy
                 Similar to .de, but compatibility mode is switched off
                 during execution.  On entry, the current compatibility
                 mode is saved and restored at exit.

          .dei xx [yy]
                 Define macro indirectly, with the name of the macro to be
                 defined in string xx and the name of the end macro
                 terminating its definition in string yy.

          .dei1 xx [yy]
                 As .dei, but compatibility mode is switched off when the
                 definition of the macro named in the string xx is
                 executed.

          .device anything
                 This is (almost) the same as the \X escape.  anything is
                 read in copy mode; a leading " is stripped.

          .devicem xx
                 This is the same as the \Y escape (to embed the contents
                 of a macro into the intermediate output preceded with
                 ‘x X’).

          .do name ...
                 Interpret the string, request, diversion, or macro name
                 (along with any arguments) with compatibility mode
                 disabled.  Note that compatibility mode is restored (only
                 if it was active) when the expansion of name is
                 interpreted; that is, the restored compatibility state
                 applies to the contents of the macro, string, or diversion
                 name as well as data read from files or pipes if name is
                 any of the so, soquiet, mso, msoquiet, or pso requests.

                 For example,
                        .de mac1
                        FOO
                        ..
                        .de1 mac2
                        groff
                        .mac1
                        ..
                        .de mac3
                        compatibility
                        .mac1
                        ..
                        .de ma
                        \\$1
                        ..
                        .cp 1
                        .do mac1
                        .do mac2 \" mac2, defined with .de1, calls "mac1"
                        .do mac3 \" mac3 calls "ma" with argument "c1"
                        .do mac3 \[ti] \" groff syntax accepted in .do arguments
                 results in
                        FOO groff FOO compatibility c1 ~
                 as output.

          .ds1 name string
                 Similar to .ds, but compatibility mode is switched off
                 when the string is later interpolated.  To be more
                 precise, a “compatibility save” token is inserted at the
                 beginning of the string, and a “compatibility restore”
                 token at the end.

          .ecr   Restore the escape character saved with ecs, or set escape
                 character to “\” if none has been saved.

          .ecs   Save the current escape character.

          .evc environment
                 Copy the contents of environment to the current
                 environment.

                 The following environment data are not copied:

                 •      a partially collected line, if present;

                 •      the interruption status of the previous input line
                        (due to use of the \c escape sequence);

                 •      the count of remaining lines to center, to right-
                        justify, or to underline (with or without
                        underlined spaces; all set to zero);

                 •      the activation status of temporary indentation;

                 •      input traps and their associated data;

                 •      the activation status of line numbering (which can
                        be reactivated with “.nm +0”); and

                 •      the count of consecutive hyphenated lines (set to
                        zero).

          .fam [family]
                 Set the font family to family.  If no argument is given,
                 switch to the previous font family, or the default family
                 if there is none.  Use “\F[]” to do this with an escape
                 sequence; “\FP” selects font family “P” instead.  The
                 initial font family is “T” (Times), but can be overridden
                 by the output device—see groff_font(5)).  The current font
                 family is associated with the environment.

          .fchar c string
                 Define fallback character (or glyph) c to be string.  The
                 syntax of this request is the same as the char request;
                 the only difference is that a glyph defined with char
                 hides the glyph with the same name in the current font,
                 whereas a glyph defined with .fchar is checked only if the
                 particular glyph isn't found in the current font.  This
                 test happens before checking special fonts.

          .fcolor c
                 Set the fill color to c.  If c is missing, switch to the
                 previous fill color.

          .fschar f c string
                 Define fallback character (or glyph) c for font f to be
                 string.  The syntax of this request is the same as the
                 char request (with an additional argument to specify the
                 font); a glyph defined with fschar is searched after the
                 list of fonts declared with the fspecial request but
                 before the list of fonts declared with .special.

          .fspecial f s1 s2 ...
                 When the current font is f, fonts s1, s2, ... are special,
                 that is, they are searched for glyphs not in the current
                 font.  Any fonts specified in the .special request are
                 searched after fonts specified in the .fspecial request.
                 Without argument, reset the list of global special fonts
                 to be empty.

          .ftr f g
                 Translate font f to g.  Whenever a font named f is
                 referred to in an \f escape sequence, in the F and S
                 conditional operators, or in the ft, ul, bd, cs, tkf,
                 special, fspecial, fp, or sty requests, font g is used.
                 If g is missing, or equal to f then font f is not
                 translated.

          .fzoom f zoom
                 Set zoom factor zoom for font f.  zoom must a non-negative
                 integer multiple of 1/1000th.  If it is missing or is
                 equal to zero, it means the same as 1000, namely no
                 magnification.  f must be a real font name, not a style.

          .gcolor c
                 Set the glyph color to c.  If c is missing, switch to the
                 previous glyph color.

          .hcode c1 code1 [c2 code2] ...
                 Set the hyphenation code of character c1 to code1, that of
                 c2 to code2, and so on.  A hyphenation code must be a
                 single input character (not a special character) other
                 than a digit or a space.  The request is ignored if it has
                 no parameters.

                 For hyphenation to work, hyphenation codes must be set up.
                 At start-up, groff assigns hyphenation codes to the
                 letters “a–z” (mapped to themselves), to the letters “A–Z”
                 (mapped to “a–z”), and zero to all other characters.
                 Normally, hyphenation patterns contain only lowercase
                 letters which should be applied regardless of case.  In
                 other words, they assume that the words “FOO” and “Foo”
                 should be hyphenated exactly as “foo” is.  The .hcode
                 request extends this principle to letters outside the
                 Unicode basic Latin alphabet; without it, words containing
                 such letters won't be hyphenated properly even if the
                 corresponding hyphenation patterns contain them.

          .hla lang
                 Set the hyphenation language to lang.  Hyphenation
                 exceptions specified with the .hw request and hyphenation
                 patterns and exceptions specified with the .hpf and .hpfa
                 requests are associated with the hyphenation language.
                 The .hla request is usually invoked by a localization
                 file, which is in turn loaded by the troffrc or
                 troffrc-end file; see the .hpf request below.

                 The hyphenation language is associated with the
                 environment.

          .hlm [n]
                 Set the maximum number of consecutive hyphenated lines
                 to n.  If n is negative, there is no maximum.  If omitted,
                 n is -1.  This value is associated with the environment.
                 Only lines output from a given environment count towards
                 the maximum associated with that environment.  Hyphens
                 resulting from \% are counted; explicit hyphens are not.

          .hpf pattern-file
                 Read hyphenation patterns from pattern-file.  This file is
                 sought in the same way that macro files are with the .mso
                 request or the -mname command-line option to groff(1).

                 The pattern-file should have the same format as (simple)
                 TeX pattern files.  More specifically, the following
                 scanning rules are implemented.

                 •      A percent sign starts a comment (up to the end of
                        the line) even if preceded by a backslash.

                 •      “Digraphs” like \$ are not supported.

                 •      “^^xx” (where each x is 0–9 or a–f) and ^^c
                        (character c in the code point range 0–127 decimal)
                        are recognized; other uses of ^ cause an error.

                 •      No macro expansion is performed.

                 •      hpf checks for the expression \patterns{...}
                        (possibly with whitespace before or after the
                        braces).  Everything between the braces is taken as
                        hyphenation patterns.  Consequently, “{” and “}”
                        are not allowed in patterns.

                 •      Similarly, \hyphenation{...} gives a list of
                        hyphenation exceptions.

                 •      \endinput is recognized also.

                 •      For backwards compatibility, if \patterns is
                        missing, the whole file is treated as a list of
                        hyphenation patterns (except that the “%” character
                        is recognized as the start of a comment).

                 Use the .hpfcode request (see below) to map the encoding
                 used in hyphenation pattern files to groff's input
                 encoding.

                 The set of hyphenation patterns is associated with the
                 hyphenation language set by the .hla request.  The .hpf
                 request is usually invoked by a localization file loaded
                 by the troffrc file.  By default, troffrc loads the
                 localization file for English.  (As of groff 1.23.0,
                 localization files for Czech (cs), German (de), English
                 (en), French (fr), Japanese (ja), Swedish (sv), and
                 Chinese (zh) exist.)  For Western languages, the
                 localization file sets the hyphenation mode and loads
                 hyphenation patterns and exceptions.

                 A second call to .hpf (for the same language) replaces the
                 old patterns with the new ones.

                 Invoking .hpf causes an error if there is no hyphenation
                 language.

                 If no .hpf request is specified (either in the document,
                 in a file loaded at start-up, or in a macro package),
                 groff won't automatically hyphenate at all.

          .hpfa pattern-file
                 As .hpf, except that the hyphenation patterns and
                 exceptions from pattern-file are appended to the patterns
                 already applied to the hyphenation language of the
                 environment.

          .hpfcode a b [c d] ...
                 Define mapping values for character codes in pattern
                 files.  This is an older mechanism no longer used by
                 groff's own macro files; for its successor, see .hcode
                 above.  .hpf or .hpfa aplly the mapping after reading or
                 appending to the active list of patterns.  Its arguments
                 are pairs of character codes—integers from 0 to 255.  The
                 request maps character code a to code b, code c to code d,
                 and so on.  Character codes that would otherwise be
                 invalid in groff can be used.  By default, every code maps
                 to itself except those for letters “A” to “Z”, which map
                 to those for “a” to “z”.

          .hym [length]
                 Set the (right) hyphenation margin to length.  If the
                 adjustment mode is not “b” or “n”, the line is not
                 hyphenated if it is shorter than length.  Without an
                 argument, the default hyphenation margin is reset to its
                 default value, 0.  The default scaling indicator is “m”.
                 The hyphenation margin is associated with the environment.

                 A negative argument resets the hyphenation margin to zero,
                 emitting a warning of type “range”.

          .hys [hyphenation-space]
                 Suppress hyphenation of the line in adjustment modes “b”
                 or “n”, if it can be justified by adding no more than
                 hyphenation-space extra space to each inter-word space.
                 Without an argument, the hyphenation space adjustment
                 threshold is set to its default value, 0.  The default
                 scaling indicator is “m”.  The hyphenation space
                 adjustment threshold is associated with the current
                 environment.

                 A negative argument resets the hyphenation space
                 adjustment threshold to zero, emitting a warning of type
                 “range”.

          .itc n name
                 As .it, but text lines interrupted with the \c escape are
                 not applied to the line count.

          .kern n
                 If n is non-zero or missing, enable pairwise kerning,
                 otherwise disable it.

          .length reg anything
                 Compute the number of characters in anything and return
                 the count in the number register reg.  If reg doesn't
                 exist, it is created.  anything is read in copy mode.

                        .ds xxx abcd\h'3i'efgh
                        .length yyy \*[xxx]
                        \n[yyy]
                        14

          .linetabs n
                 If n is non-zero or missing, enable line-tabs mode,
                 otherwise disable it (which is the default).  In line-tabs
                 mode, tab distances are computed relative to the (current)
                 output line.  Otherwise they are taken relative to the
                 input line.  For example, the following

                        .ds x a\t\c
                        .ds y b\t\c
                        .ds z c
                        .ta 1i 3i
                        \*x
                        \*y
                        \*z

                 yields

                        a         b         c

                 In line-tabs mode, the same code gives

                        a         b                   c

                 Line-tabs mode is associated with the current environment;
                 the read-only number register \n[.linetabs] is set to 1 if
                 in line-tabs mode, and 0 otherwise.

          .lsm [name]
                 Set the leading space macro (trap) to name.  If there are
                 leading space characters on an input line, name is invoked
                 in lieu of the usual roff behavior; the leading spaces are
                 removed.  The count of leading spaces on an input line is
                 stored in \n[lsn], and the amount of corresponding
                 horizontal motion in \n[lss], irrespective of whether a
                 leading space trap is set.  When it is, the leading spaces
                 are removed from the input line, and no motion is produced
                 before calling name.  If no argument is supplied, the
                 default leading space behavior is (re-)established.

          .mso file
                 The same as the so request except that file is searched
                 for in the same directories as macro files for the -m
                 command-line option.  If the file name to be included has
                 the form name.tmac and it isn't found, .mso tries to
                 include tmac.name instead and vice versa.  If file does
                 not exist, a warning of type “file” is emitted and the
                 request has no other effect.

          .msoquiet file
                 As .mso, but no warning is emitted if file does not exist.

          .nop anything
                 Interpret anything as if it were an input line.  This is
                 similar to “.if 1”.  .nop is not really “no operation”;
                 its argument is processed—unconditionally.  It can be used
                 to cause text lines to share indentation with surrounding
                 control lines.

          .nroff Make the n built-in condition true and the t built-in
                 condition false.  This can be reversed using the troff
                 request.

          .open stream filename
                 Open filename for writing and associate the stream named
                 stream with it.  See also the close and write requests.

          .opena stream filename
                 Like open, but if filename exists, append to it instead of
                 truncating it.

          .output string
                 Emit string directly to the intermediate output (subject
                 to copy-mode interpretation); this is similar to \! used
                 at the top level.  An initial double quote in string is
                 stripped off to allow initial blanks.

          .pev   Report the state of the current environment followed by
                 that of all other environments to the standard error
                 stream.

          .pnr   Print the names and contents of all currently defined
                 number registers on stderr.

          .psbb filename
                 Get the bounding box of a PostScript image filename.  This
                 file must conform to Adobe's Document Structuring
                 Conventions; the command looks for a %%BoundingBox comment
                 to extract the bounding box values.  After a successful
                 call, the coordinates (in PostScript units) of the lower
                 left and upper right corner can be found in the registers
                 \n[llx], \n[lly], \n[urx], and \n[ury], respectively.  If
                 some error has occurred, the four registers are set to
                 zero.

          .pso command
                 This behaves like the so request except that input comes
                 from the standard output of command.

          .ptr   Print the names and positions of all traps (not including
                 input line traps and diversion traps) on stderr.  Empty
                 slots in the page trap list are printed as well, because
                 they can affect the priority of subsequently planted
                 traps.

          .pvs ±n
                 Set the post-vertical line space to n; default scaling
                 indicator is “p”.  This value is added to each line after
                 it has been output.  With no argument, the post-vertical
                 line space is set to its previous value.

                 The total vertical line spacing consists of four
                 components: .vs and \x with a negative value which are
                 applied before the line is output, and .pvs and \x with a
                 positive value which are applied after the line is output.

          .rchar c1 c2 ...
                 Remove the definitions of glyphs c1, c2, and so on.  This
                 undoes the effect of a .char request.

          .return
                 Within a macro, return immediately.  If called with an
                 argument, return twice, namely from the current macro and
                 from the macro one level higher.  No effect otherwise.

          .rfschar f c1 c2 ...
                 Remove the font-specific definitions of glyphs c1, c2, ...
                 for font f.  Whitespace is optional between cn arguments.
                 See .fschar.

          .rj
          .rj n  Right justify the next n input lines.  Without an argument
                 right justify the next input line.  The number of lines to
                 be right justified is available in the \n[.rj] register.
                 This implicitly does .ce 0.  The ce request implicitly
                 does .rj 0.

          .rnn xx yy
                 Rename number register xx to yy.  If xx doesn't exist, the
                 request is ignored.

          .schar c string
                 Define global fallback character (or glyph) c to be
                 string.  The syntax of this request is the same as the
                 char request; a glyph defined with schar is searched after
                 the list of fonts declared with the special request but
                 before the mounted special fonts.

          .shc glyph
                 Set the soft hyphen glyph, inserted when a word is
                 hyphenated automatically or at a hyphenation character,
                 to glyph.  If the argument is omitted, the soft hyphen
                 glyph is set to the default, \[hy].  If the selected glyph
                 does not exist in the font in use at a potential
                 hyphenation point, then the line is not broken at that
                 point.  Neither character definitions (specified with the
                 .char request) nor translations (specified with the .tr
                 request) are considered when assigning the soft hyphen
                 glyph.

          .shift n
                 In a macro, shift the arguments by n positions: argument i
                 becomes argument i-n; arguments 1 to n are no longer
                 available.  If n is missing, arguments are shifted by 1.
                 Shifting by negative amounts is currently undefined.

          .sizes s1 s2 ... sn [0]
                 This request is similar to the sizes command of a DESC
                 file.  It sets the available font sizes for the current
                 font to s1, s2, ... sn scaled points.  The list of sizes
                 can be terminated by an optional “0”.  Each si can also be
                 a range of sizes m–n.  Contrary to the font file command,
                 the list can't extend over more than a single line.

          .soquiet file
                 As .so, but no warning is emitted if file does not exist.

          .special s1 s2 ...
                 Fonts s1, s2, ... are special and are searched for glyphs
                 not in the current font.  Without arguments, reset the
                 list of special fonts to be empty.

          .spreadwarn [limit]
                 Emit a break warning if the additional space inserted for
                 each space between words in an output line adjusted to
                 both margins with “.ad b” is larger than or equal to
                 limit.  A negative value is treated as zero; an absent
                 argument toggles the warning on and off without changing
                 limit.  The default scaling indicator is m.  At startup,
                 .spreadwarn is inactive and limit is 3 m.

                 For example,

                        .spreadwarn 0.2m

                 causes a warning if break warnings are not suppressed and
                 troff must add 0.2 m or more for each interword space in a
                 line.  See troff(1) for warning types and control.

          .stringdown str
          .stringup str
                 Alter the string named str by replacing each of its bytes
                 with its lowercase (down) or uppercase (up) version (if
                 one exists).  groff special characters (see groff_char(7))
                 can be used and the output will usually transform in the
                 expected way due to the regular naming convention of the
                 special character escapes.

                        .ds resume R\['e]sum\['e]\"
                        \*[resume] \# Résumé
                        .stringdown resume
                        \*[resume] \# résumé
                        .stringup resume
                        \*[resume] \# RÉSUMÉ

          .sty n f
                 Associate style f with font position n.  A font position
                 can be associated either with a font or with a style.  The
                 current font is the index of a font position and so is
                 also either a font or a style.  When it is a style, the
                 font that is actually used is the font the name of which
                 is the concatenation of the name of the current family and
                 the name of the current style.  For example, if the
                 current font is 1 and font position 1 is associated with
                 style R and the current font family is T, then font TR is
                 used.  If the current font is not a style, then the
                 current family is ignored.  When the requests cs, bd, tkf,
                 uf, or fspecial are applied to a style, then they are
                 applied instead to the member of the current family
                 corresponding to that style.  The default family can be
                 set with the -f command-line option.  The styles command
                 in the DESC file controls which font positions (if any)
                 are initially associated with styles rather than fonts.

          .substring str start [end]
                 Replace the string named str with its substring bounded by
                 the indices start and end, inclusive.  The first character
                 in the string has index 0.  If end is omitted, it is
                 implicitly set to the largest valid value (the string
                 length minus one).  Negative indices count backwards from
                 the end of the string: the last character has index -1,
                 the character before the last has index -2, and so on.

                        .ds xxx abcdefgh
                        .substring xxx 1 -4
                        \*[xxx]
                        bcde
                        .substring xxx 2
                        \*[xxx]
                        de

          .tkf f s1 n1 s2 n2
                 Enable track kerning for font f.  When the current font
                 is f the width of every glyph is increased by an amount
                 between n1 and n2; when the current point size is less
                 than or equal to s1 the width is increased by n1; when it
                 is greater than or equal to s2 the width is increased by
                 n2; when the point size is greater than or equal to s1 and
                 less than or equal to s2 the increase in width is a linear
                 function of the point size.

          .tm1 string
                 Similar to the tm request, string is read in copy mode and
                 written on the standard error, but an initial double quote
                 in string is stripped off to allow initial blanks.

          .tmc string
                 Similar to tm1 but without writing a final newline.

          .trf filename
                 Transparently output the contents of file filename.  Each
                 line is output as if preceded by \!; however, the lines
                 are not subject to copy-mode interpretation.  If the file
                 does not end with a newline, then a newline is added.  For
                 example, you can define a macro x containing the contents
                 of file f, using

                        .di x
                        .trf f
                        .di

                 Unlike with the cf request, the file cannot contain
                 characters, such as NUL, that are not valid troff input
                 characters.

          .trin abcd
                 This is the same as the tr request except that the asciify
                 request uses the character code (if any) before the
                 character translation.  Example:

                        .trin ax
                        .di xxx
                        a
                        .br
                        .di
                        .xxx
                        .trin aa
                        .asciify xxx
                        .xxx

                 The result is x a.  Using tr, the result would be x x.

          .trnt abcd
                 This is the same as the tr request except that the
                 translations do not apply to text that is transparently
                 throughput into a diversion with \!.  For example,

                        .tr ab
                        .di x
                        \!.tm a
                        .di
                        .x

                 prints b; if trnt is used instead of tr it prints a.

          .troff Make the n built-in condition false, and the t built-in
                 condition true.  This undoes the effect of the nroff
                 request.

          .unformat div
                 Like .asciify, unformat the diversion div.  However,
                 .unformat handles only tabs and spaces between words, the
                 latter usually arising from spaces or newlines in the
                 input.  Tabs are treated as input tokens, and spaces
                 become adjustable again.  The vertical sizes of lines are
                 not preserved, but glyph information (font, type size,
                 space width, and so on) is retained.

          .vpt n Enable vertical position traps if n is non-zero, disable
                 them otherwise.  Vertical position traps are traps set by
                 the wh or dt requests.  Traps set by the it request are
                 not vertical position traps.  The parameter that controls
                 whether vertical position traps are enabled is global.
                 Initially, vertical position traps are enabled.

          .warn n
                 Control warnings.  n is the sum of the numbers associated
                 with each warning that is to be enabled; all other
                 warnings are disabled.  The number associated with each
                 warning is listed in troff(1).  For example, .warn 0
                 disables all warnings, and .warn 1 disables all warnings
                 except that about missing glyphs.  If n is not given, all
                 warnings are enabled.

          .warnscale si
                 Set the scaling indicator used in warnings to si.  Valid
                 values for si are u, i, c, p, and P.  At startup, it is
                 set to i.

          .while cond-expr anything
                 Evaluate the conditional expression cond-expr, and
                 repeatedly execute anything unless and until cond-expr
                 evaluates false.  See also the break and continue
                 requests.

                 The body of a while request is treated like the body of a
                 de request: troff temporarily stores it in a macro that is
                 deleted after the loop exits.  It can considerably slow
                 down a macro if the body of the while request (within the
                 macro) is large.  Each time the macro is executed, the
                 while body is parsed and stored again as a temporary
                 macro.

                 The traditional and often better solution (AT&T troff
                 lacked the while request) is to use a recursive macro
                 instead that is parsed only once during its definition.
                 The number of available recursion levels is set to 1000
                 (this is a compile-time constant value of troff).

                 The closing brace of a while body must end a line.

          .write stream anything
                 Write anything to the stream named stream.  stream must
                 previously have been the subject of an open request.
                 anything is read in copy mode; a leading " is stripped.

          .writec stream anything
                 Similar to write but without writing a final newline.

          .writem stream xx
                 Write the contents of the macro or string xx to the stream
                 named stream.  stream must previously have been the
                 subject of an open request.  xx is read in copy mode.

      Extended requests
          .cf filename
                 When used in a diversion, this embeds in the diversion an
                 object which, when reread, will cause the contents of
                 filename to be transparently copied through to the output.
                 In AT&T troff, the contents of filename are immediately
                 copied through to the output regardless of whether there
                 is a current diversion; this behavior is so anomalous that
                 it must be considered a bug.

          .de xx yy
          .am xx yy
          .ds xx yy
          .as xx yy
                 In compatibility mode, these requests behave similarly to
                 .de1, .am1, .ds1, and .as1, respectively: a “compatibility
                 save” token is inserted at the beginning, and a
                 “compatibility restore” token at the end, with
                 compatibility mode switched on during execution.

          .hy n  New values 16 and 32 are available; the former enables
                 hyphenation before the last character in a word, and the
                 latter enables hyphenation after the first character in a
                 word.

          .ss word-space-size additional-sentence-space-size
                 A second argument to the .ss request sets the amount of
                 additional space separating sentences on the same output
                 line.  If omitted, this amount is set to word-space-size.
                 The arguments' units are twelfths of the space width of
                 the current font (see groff_font(5)) and default to 12.

          .ta [[n1 n2 ... nn ]T r1 r2 ... rn]
                 groff supports an extended syntax to specify repeating tab
                 stops after the “T” mark.  These values are always taken
                 as relative distances from the previous tab stop.  This is
                 the idiomatic way to specify tab stops at equal intervals
                 in groff.

                 The syntax summary above instructs groff to set tabs at
                 positions n1, n2, ..., nn, then at nn+r1, nn+r2, ...,
                 nn+rn, then at nn+rn+r1, nn+rn+r2, ..., nn+rn+rn, and so
                 on.

      New number registers
          The following read-only registers are available:

          \n[.br]
                 Within a macro call, it is set to 1 if the macro is called
                 with the ‘normal’ control character (‘.’ by default), and
                 set to 0 otherwise.  This allows the reliable modification
                 of requests.

                        .als bp*orig bp
                        .de bp
                        .tm before bp
                        .ie \\n[.br] .bp*orig
                        .el 'bp*orig
                        .tm after bp
                        ..

                 Using this register outside of a macro makes no sense (it
                 always returns zero in such cases).

          \n[.C] 1 if compatibility mode is in effect, 0 otherwise.

          \n[.cdp]
                 The depth of the last glyph added to the current
                 environment.  It is positive if the glyph extends below
                 the baseline.

          \n[.ce]
                 The number of lines remaining to be centered, as set by
                 the ce request.

          \n[.cht]
                 The height of the last glyph added to the current
                 environment.  It is positive if the glyph extends above
                 the baseline.

          \n[.color]
                 1 if colors are enabled, 0 otherwise.

          \n[.cp]
                 Within a .do request, holds the saved value of
                 compatibility mode (see \n[.C] above).

          \n[.csk]
                 The skew of the last glyph added to the current
                 environment.  The skew of a glyph is how far to the right
                 of the center of a glyph the center of an accent over that
                 glyph should be placed.

          \n[.ev]
                 The name or number of the current environment.  This is a
                 string-valued register.

          \n[.fam]
                 The current font family.  This is a string-valued
                 register.

          \n[.fn]
                 The current (internal) real font name.  This is a string-
                 valued register.  If the current font is a style, the
                 value of \n[.fn] is the proper concatenation of family and
                 style name.

          \n[.fp]
                 The number of the next free font position.

          \n[.g] Always 1.  Macros should use this to determine whether
                 they are running under GNU troff.

          \n[.height]
                 The current height of the font as set with \H.

          \n[.hla]
                 The hyphenation language in the current environment.

          \n[.hlc]
                 The count of immediately preceding consecutive hyphenated
                 lines in the current environment.

          \n[.hlm]
                 The maximum number of consecutive hyphenated lines allowed
                 in the current environment.

          \n[.hy]
                 The hyphenation mode in the current environment.

          \n[.hym]
                 The hyphenation margin in the current environment.

          \n[.hys]
                 The hyphenation space adjustment threshold in the current
                 environment.

          \n[.in]
                 The indentation that applies to the current output line.

          \n[.int]
                 Set to a positive value if last output line is interrupted
                 (i.e., if it contains \c).

          \n[.kern]
                 1 if pairwise kerning is enabled, 0 otherwise.

          \n[.lg]
                 The current ligature mode (as set by the lg request).

          \n[.linetabs]
                 The current line-tabs mode (as set by the linetabs
                 request).

          \n[.ll]
                 The line length that applies to the current output line.

          \n[.lt]
                 The title length as set by the lt request.

          \n[.m] The name of the current drawing color.  This is a string-
                 valued register.

          \n[.M] The name of the current background color.  This is a
                 string-valued register.

          \n[.ne]
                 The amount of space that was needed in the last ne request
                 that caused a trap to be sprung.  Useful in conjunction
                 with the \n[.trunc] register.

          \n[.nm]
                 1 if output line numbering is enabled (even if temporarily
                 suppressed), 0 otherwise.

          \n[.ns]
                 1 if no-space mode is active, 0 otherwise.

          \n[.O] The current output level as set with \O.

          \n[.P] 1 if the current page is in the output list set with -o.

          \n[.pe]
                 1 during a page ejection caused by the bp request,
                 0 otherwise.

          \n[.pn]
                 The number of the next page, either the value set by a pn
                 request, or the number of the current page plus 1.

          \n[.ps]
                 The current point size in scaled points.

          \n[.psr]
                 The last-requested point size in scaled points.

          \n[.pvs]
                 The current post-vertical line space as set with the pvs
                 request.

          \n[.rj]
                 The number of lines to be right-justified as set by the rj
                 request.

          \n[.slant]
                 The slant of the current font as set with \S.

          \n[.sr]
                 The last requested point size in points as a decimal
                 fraction.  This is a string-valued register.

          \n[.ss]
          \n[.sss]
                 The values of minimal inter-word spacing and additional
                 inter-sentence spacing, respectively, in twelfths of the
                 space width of the current font.  Set by the .ss request.

          \n[.sty]
                 The current font style.  This is a string-valued register.

          \n[.tabs]
                 A string representation of the current tab settings
                 suitable for use as an argument to the ta request.

          \n[.trunc]
                 The amount of vertical space truncated by the most
                 recently sprung vertical position trap, or, if the trap
                 was sprung by an ne request, minus the amount of vertical
                 motion produced by the ne request.  In other words, at the
                 point a trap is sprung, it represents the difference of
                 what the vertical position would have been but for the
                 trap, and what the vertical position actually is.  Useful
                 in conjunction with the \n[.ne] register.

          \n[.U] Set to 1 if in unsafe mode (as determined by troff's -U
                 command-line option) and 0 otherwise.

          \n[.vpt]
                 1 if vertical position traps are enabled, 0 otherwise.

          \n[.warn]
                 The sum of the numbers associated with each of the
                 currently enabled warnings.  The number associated with
                 each warning is listed in troff(1).

          \n[.x] The major version number of the running troff formatter.
                 For example, if the version number is 1.23.0, then \n[.x]
                 contains 1.

          \n[.y] The minor version number of the running troff formatter.
                 For example, if the version number is 1.23.0, then \n[.y]
                 contains 23.

          \n[.Y] The revision number of the running troff formatter.  For
                 example, if the version number is 1.23.0, then \n[.Y]
                 contains 0.

          \n[.zoom]
                 The zoom value of the current font, in multiples of
                 1/1000th.  Zero if no magnification.

          \n[llx]
          \n[lly]
          \n[urx]
          \n[ury]
                 These four read/write registers are set by the psbb
                 request and contain the bounding box values (in PostScript
                 units) of a given PostScript image.

          The following read/write registers are set by the \w escape
          sequence:

          \n[rst]
          \n[rsb]
                 Like the st and sb registers, but take account of the
                 heights and depths of glyphs.

          \n[ssc]
                 The amount of horizontal space (possibly negative) that
                 should be added to the last glyph before a subscript.

          \n[skw]
                 How far to right of the center of the last glyph in the \w
                 argument, the center of an accent from a roman font should
                 be placed over that glyph.

          Other available read/write number registers are:

          \n[c.] The current input line number.  \n[.c] is a read-only
                 alias to this register.

          \n[hours]
                 The number of hours past midnight.  Initialized at start-
                 up.

          \n[hp] The current horizontal position at input line.

          \n[lsn]
          \n[lss]
                 If there are leading spaces on an input line, these
                 registers hold the count of leading spaces and the amount
                 of corresponding horizontal motion, respectively.

          \n[minutes]
                 The number of minutes after the hour.  Initialized at
                 start-up.

          \n[seconds]
                 The number of seconds after the minute.  Initialized at
                 start-up.

          \n[systat]
                 The return value of the system() function executed by the
                 last sy request.

          \n[slimit]
                 If greater than 0, the maximum number of objects on the
                 input stack.  If less than or equal to 0, there is no
                 limit on the number of objects on the input stack.  With
                 no limit, recursion can continue until virtual memory is
                 exhausted.

          \n[year]
                 The current year.  AT&T troff's \n[yr] register stores the
                 current year minus 1900.

      Miscellaneous
          GNU troff predefines a string, \*[.T] containing the argument
          given to the -T command-line option, namely the output device
          (for example, pdf or utf8).  The (read-only) register \n[.T]
          interpolates 1 if troff is called with the -T command-line
          option, and 0 otherwise.

          Fonts not listed in the DESC file are automatically mounted on
          the next available font position when they are referenced.  If a
          font is to be mounted explicitly with the .fp request on an
          unused font position, it should be mounted on the first unused
          font position, which can be found in the \n[.fp] register;
          although troff does not enforce that strictly.  Rather, it does
          not allow a font to be mounted at a position whose number is much
          greater than that of any currently used position.

          Interpolating a string does not hide existing macro arguments.
          Thus, in a macro, a more efficient way of doing

                 .xx \\$@

          is

                 \\*[xx]\\

          If the font description file contains pairwise kerning
          information, glyphs from that font are kerned.  Kerning between
          two glyphs can be inhibited by placing a non-printing input break
          \& between them.

          In a string comparison in a condition, characters that appear at
          different interpolation depths from the first delimiter character
          are not recognized as the second or third delimiters.  This also
          applies to the .tl request.  In a \w escape sequence, a character
          that appears at a different interpolation depth from the starting
          delimiter character is not recognized as the closing delimiter
          character.  The same is true for \A, \b, \B, \C, \l, \L, \o, \X,
          and \Z.  When decoding a macro or string argument that is
          delimited by double quotes, a character that appears at a
          different interpolation depth from the starting delimiter
          character is not recognized as the closing delimiter character.
          The implementation of \$@ ensures that the double quotes
          surrounding an argument appear at the same interpolation depth,
          which is differs from the depth of the argument itself.  In a
          long escape name ] is not recognized as a closing delimiter
          except when it occurs at the same interpolation depth as the
          opening [.  In compatibility mode, no attention is paid to the
          interpolation depth.

          In groff, the .tr request can map characters onto \~.

          A font can control the widths of spaces emitted by the \| and \^
          escape sequences, by defining glyphs of these names (including
          the leading backslash).

          In groff, tabs and spaces are allowed between the first and
          second dots (or between the dot and the name of the ending macro)
          that end a macro definition.  Example:

                 .if t \{\
                 .  de bar
                 .    nop Hello, I'm 'bar'.
                 .  .
                 .\}


---------------------------------------------------------------------------------------------

::

          The output format of groff is modeled after that used by AT&T
          troff once it adopted a device-independent approach in the early
          1980s.  Only the differences are documented here.

      Units
          The argument to the s command is in scaled points (in units of
          points/n, where n is the argument to the sizescale command in the
          DESC file).  The argument to the x Height command is also in
          scaled points.

      Text commands
          Nn     Print glyph with index n (a non-negative integer) of the
                 current font.

          If the tcommand line is present in the DESC file, GNU troff uses
          the following two commands.

          txxx   xxx is any sequence of characters terminated by a space or
                 a newline (to be more precise, it is a sequence of glyphs
                 which are accessed with the corresponding characters); the
                 first character should be printed at the current position,
                 the current horizontal position should be increased by the
                 width of the first character, and so on for each
                 character.  The width of the glyph is that given in the
                 font file, appropriately scaled for the current point
                 size, and rounded so that it is a multiple of the
                 horizontal resolution.  Special characters cannot be
                 printed using this command.

          un xxx This is same as the t command except that after printing
                 each character, the current horizontal position is
                 increased by the sum of the width of that character and n.

          Note that single characters can have the eighth bit set, as can
          the names of fonts and special characters.

          The names of glyphs and fonts can be of arbitrary length; drivers
          should not assume that they are only two characters long.

          When a glyph is to be printed, that glyph is always in the
          current font.  Unlike device-independent troff, it is not
          necessary for drivers to search special fonts to find a glyph.

          For color support, some new commands have been added:

          mc cyan magenta yellow
          md
          mg gray
          mk cyan magenta yellow black
          mr red green blue
                 Set the color components of the current drawing color,
                 using various color schemes.  md resets the drawing color
                 to the default value.  The arguments are integers in the
                 range 0 to 65536.

          The x device control command has been extended.

          x u n  If n is 1, start underlining of spaces.  If n is 0, stop
                 underlining of spaces.  This is needed for the cu request
                 in nroff mode and is ignored otherwise.

      Drawing commands
          The D drawing command has been extended.  These extensions are
          not used by GNU pic if the -n option is given.

          Df n\n Set the shade of gray to be used for filling solid objects
                 to n; n must be an integer between 0 and 1000, where 0
                 corresponds solid white and 1000 to solid black, and
                 values in between correspond to intermediate shades of
                 gray.  This applies only to solid circles, solid ellipses
                 and solid polygons.  By default, a level of 1000 is used.
                 Whatever color a solid object has, it should completely
                 obscure everything beneath it.  A value greater than 1000
                 or less than 0 can also be used: this means fill with the
                 shade of gray that is currently being used for lines and
                 text.  Normally this is black, but some drivers may
                 provide a way of changing this.

                 The corresponding \D'f...' command shouldn't be used since
                 its argument is always rounded to an integer multiple of
                 the horizontal resolution which can lead to surprising
                 results.

          DC d\n Draw a solid circle with a diameter of d with the leftmost
                 point at the current position.

          DE dx dy\n
                 Draw a solid ellipse with a horizontal diameter of dx and
                 a vertical diameter of dy with the leftmost point at the
                 current position.

          Dp dx1 dy1 dx2 dy2 ... dxn dyn\n
                 Draw a polygon with, for i=1,...,n+1, the i-th vertex at
                 the current position +ij−=Σ11(dxj,dyj).  At the moment, GNU
                 pic only uses this command to generate triangles and
                 rectangles.

          DP dx1 dy1 dx2 dy2 ... dxn dyn\n
                 Like Dp but draw a solid rather than outlined polygon.

          Dt n\n Set the current line thickness to n machine units.
                 Traditionally, AT&T troff drivers use a line thickness
                 proportional to the current point size; drivers should
                 continue to do this if no Dt command has been given, or if
                 a Dt command has been given with a negative value of n.  A
                 zero value of n selects the smallest available line
                 thickness.

          A difficulty arises in how the current position should be changed
          after the execution of these commands.  This is not of great
          importance since the code generated by GNU pic does not depend on
          this.  Given a drawing command of the form

                 \D'c x1 y1 x2 y2 ... xn yn'

          where c is not one of c, e, l, a, or ~, AT&T troff treats each of
          the xi as a horizontal quantity, and each of the yi as a vertical
          quantity and assumes that the width of the drawn object is in=Σ1xi,
          and that the height is in=Σ1yi.  (The assumption about the height
          can be seen by examining the st and sb registers after using such
          a D command in a \w escape sequence).  This rule also holds for
          all the original drawing commands with the exception of De.  For
          the sake of compatibility GNU troff also follows this rule, even
          though it produces an ugly result in the case of the Dt and Df,
          and, to a lesser extent, DE commands.  Thus after executing a
          D command of the form

                 Dc x1 y1 x2 y2 ... xn yn\n

          the current position should be increased by (in=Σ1xi,in=Σ1yi).

          Another set of extensions is

          DFc cyan magenta yellow\n
          DFd\n
          DFg gray\n
          DFk cyan magenta yellow black\n
          DFr red green blue\n
                 Set the color components of the filling color similar to
                 the m commands above.

          The current position isn't changed by those colour commands
          (contrary to Df).

      Device control commands
          There is a continuation convention which permits the argument to
          the x X command to contain newlines: when outputting the argument
          to the x X command, GNU troff follows each newline in the
          argument with a + character (as usual, it terminates the entire
          argument with a newline); thus if the line after the line
          containing the x X command starts with +, then the newline ending
          the line containing the x X command should be treated as part of
          the argument to the x X command, the + should be ignored, and the
          part of the line following the + should be treated like the part
          of the line following the x X command.

          The first three output commands are guaranteed to be:

                 x T device
                 x res n h v
                 x init


-----------------------------------------------------------

::

          In addition to AT&T troff debugging features, groff emits more
          error diagnostics when syntactical or semantic nonsense is
          encountered and supports several categories of warning; the
          output of these can be selectively suppressed with .warn (and see
          the -E, -w, and -W options of troff(1)).  Backtraces can be
          automatically produced when errors or warnings occur (the -b
          option of troff(1)) or generated on demand (.backtrace).

          groff also adds more flexible diagnostic output requests (.tmc
          and .tm1).  More aspects of formatter state can be examined with
          requests that write lists of defined registers (.pnr),
          environments (.pev), and page location traps (.ptr) to the
          standard error stream.


---------------------------------------------------------------------------------------------

::

          groff has a number of features that cause incompatibilities with
          documents written using old versions of roff.  Some GNU
          extensions to roff have become supported by other
          implementations.

          When adjusting to both margins, AT&T troff at first adjusts
          spaces starting from the right; troff begins from the left.  Both
          implementations adjust spaces from opposite ends on alternating
          output lines in this adjustment mode to prevent “rivers” in the
          text.

          groff does not always hyphenate words as AT&T troff does.  The
          AT&T implementation uses a set of hard-coded rules specific to
          U.S. English, while groff uses language-specific hyphenation
          pattern files derived from TeX.  Furthermore, in old versions of
          troff there was a limited amount of space to store hyphenation
          exceptions (arguments to the .hw request); groff has no such
          restriction.

          Long names may be groff's most obvious innovation.  AT&T troff
          interprets “.dsabcd” as defining a string “ab” with contents
          “cd”.  Normally, groff interprets this as a call of a macro named
          “dsabcd”.  AT&T troff also interprets \*[ and \n[ as an
          interpolation of a string or number register, respectively,
          called “[”.  In groff, however, the “[” is normally interpreted
          as delimiting a long name.  In compatibility mode, groff
          interprets names in the traditional way, which means that they
          are limited to one or two characters.  See the -C option in
          groff(1) and, above, the .C and .cp registers, and .cp and .do
          requests, for more on compatibility mode.

          The register \n[.cp] is specialized and may require a statement
          of rationale.  When writing macro packages or documents that use
          groff features and which may be mixed with other packages or
          documents that do not—common scenarios include serial processing
          of man pages or use of the .so or .mso requests—you may desire
          correct operation regardless of compatibility mode in the
          surrounding context.  It may occur to you to save the existing
          value of \n(.C into a register, say, _C, at the beginning of your
          file, turn compatibility mode off with “.cp 0”, then restore it
          from that register at the end with “.cp \n(_C”.  At the same
          time, a modular design of a document or macro package may lead
          you to multiple layers of inclusion.  You cannot use the same
          register name everywhere or you risk “clobbering” the value from
          a preceding or enclosing context.  The two-character register
          name space of AT&T troff is confining and mnemonically
          challenging; you may wish to use groff's more capacious name
          space.  However, attempting “.nr _my_saved_C \n(.C” will not work
          in compatibility mode; the register name is too long.  “This is
          exactly what .do is for,” you think, “.do nr _my_saved_C \n(.C”.
          The foregoing will always save zero to your register, because .do
          turns compatibility mode off while it interprets its argument
          list.  What you need is:
                 .do nr _my_saved_C \n[.cp]
                 .cp 0
          at the beginning of your file, followed by
                 .cp \n[_my_saved_C]
                 .do rr _my_saved_C
          at the end.  As in the C language, we all have to share one big
          name space, so choose a register name that is unlikely to collide
          with other uses.

          The existence of the .T string is a common feature of post-
          CSTR #54 troffs—DWB 3.3, Solaris, Heirloom Doctools, and Plan 9
          troff all support it—but valid values are specific to each
          implementation.  This behavior of the .T register differs from
          AT&T troff, which interpolated 1 only if nroff was the formatter
          and was called with -T.

          AT&T troff and other implementations handle .lf differently.  For
          them, its line argument changes the line number of the current
          line.

          AT&T troff had only environments named “0”, “1”, and “2”.  In GNU
          troff, any number of environments may exist, using any valid
          identifiers for their names.

          Normally, groff preserves the interpolation depth in delimited
          arguments, but not in compatibility mode.  For example, on
          terminal devices,
                 .ds xx '
                 \w'abc\*(xxdef'
          produces “168” ordinarily, but “72def'” in compatibility mode.

          Furthermore, the escapes \f, \H, \m, \M, \R, \s, and \S are
          transparent for the purpose of recognizing a control character at
          the beginning of a line only in compatibility mode.  For example,
          this code produces bold output in both cases, but the text
          differs,
                 .de xx '
                 Hello!
                 ..
                 \fB.xx\fP
          producing “.xx” in normal mode and “Hello!” in compatibility
          mode.

          groff does not allow the use of the escape sequences \|, \^, \&,
          \{, \}, “\ ”, \', \`, \-, \_, \!, \%, \c, in names of strings,
          macros, diversions, number registers, fonts, or environments;
          AT&T troff does.  The \A escape sequence (see subsection “Escape
          sequences” above) may be helpful in avoiding use of these escape
          sequences in names.

          Normally, the syntax form \sn accepts only a single character (a
          digit) for n, consistently with other forms that originated in
          AT&T troff, like \*, \$, \f, \g, \k, \n, and \z.  In
          compatibility mode only, a non-zero n must be in the range 4–39.
          Legacy documents relying upon this quirk of parsing should be
          migrated to another \s form.  [Background: The Graphic Systems
          C/A/T phototypesetter (the original device target for AT&T troff)
          supported only a few discrete point sizes in the range 6–36, so
          Ossanna contrived a special case in the parser to do what the
          user must have meant.  Kernighan warned of this in the 1992
          revision of CSTR #54 (§2.3), and more recently, McIlroy referred
          to it as a “living fossil”.]

          Fractional point sizes cause one noteworthy incompatibility.  In
          AT&T troff the .ps request ignores scaling indicators and thus
          “.ps 10u” sets the point size to 10 points, whereas in groff it
          sets the point size to 10 scaled points.  See subsection
          “Fractional point sizes and new scaling indicators” above.

          The .bp request differs from AT&T troff: GNU troff does not
          accept a scaling indicator on the argument, a page number; the
          former (somewhat uselessly) does.

          In AT&T troff the .pm request reports macro, string, and
          diversion sizes in units of 128-byte blocks, and an argument
          reduces the report to a sum of the above in the same units.
          groff ignores any arguments and reports the sizes in bytes.

          Unlike AT&T troff, groff does not ignore the .ss request if the
          output is a terminal device; instead, the values of minimal
          inter-word and additional inter-sentence spacing are rounded down
          to the nearest multiple of 12.

          In groff, there is a fundamental difference between unformatted
          input characters, and formatted output characters (glyphs).
          Everything that affects how a glyph is output is stored with the
          glyph; once a glyph has been constructed, it is unaffected by any
          subsequent requests that are executed, including the .bd, .cs,
          .tkf, .tr, or .fp requests.  Normally, glyphs are constructed
          from input characters immediately before the glyph is added to
          the current output line.  Macros, diversions, and strings are
          all, in fact, the same type of object; they contain lists of
          input characters and glyphs in any combination.  Special
          characters can be both: before being added to the output, they
          act as input entities; afterwards, they denote glyphs.  A glyph
          does not behave like an input character for the purposes of macro
          processing; it does not inherit any of the special properties
          that the input character from which it was constructed might have
          had.  Consider the following example.
                 .di x
                 \\\\
                 .br
                 .di
                 .x
          It prints “\\” in groff; each pair of input backslashes is turned
          into one output backslash and the resulting output backslashes
          are not interpreted as escape characters when they are reread.
          AT&T troff would interpret them as escape characters when they
          were reread and would end up printing one “\”.

          One correct way to obtain a printable backslash in most documents
          is to use the \e escape sequence; this always prints a single
          instance of the current escape character, regardless of whether
          or not it is used in a diversion; it also works in both groff and
          AT&T troff.  (Naturally, if you've changed the escape character,
          you need to prefix the “e” with whatever it is—and you'll likely
          get something other than a backslash in the output.)

          The other correct way, appropriate in contexts independent of the
          backslash's common use as a roff escape character—perhaps in
          discussion of character sets or other programming languages—is
          the character escape \(rs or \[rs], for “reverse solidus”, from
          its name in the ECMA-6 (ISO/IEC 646) standard.  [This character
          escape is not portable to AT&T troff, but is to its lineal
          descendant, Heirloom Doctools troff, as of its 060716 release
          (July 2006).]

          To store an escape sequence in a diversion that is interpreted
          when the diversion is reread, either use the traditional \!
          transparent output facility, or, if this is unsuitable, the new
          \? escape sequence.  See subsection “Escape sequences” above and
          sections “Diversions” and “Gtroff Internals” in Groff: The GNU
          Implementation of troff, the groff Texinfo manual.

          In the somewhat pathological case where a diversion exists
          containing a partially collected line and a partially collected
          line at the top-level diversion has never existed, AT&T troff
          will output the partially collected line at the end of input;
          groff will not.

      Intermediate output format
          Its extensions notwithstanding, the groff intermediate output
          format has some incompatibilities with that of AT&T troff, but
          full compatibility is sought; problem reports and patches are
          welcome.  The following incompatibilities are known.

          •      The positioning after drawing polygons conflicts with the
                 AT&T troff practice.

          •      The intermediate output cannot be rescaled to other
                 devices as AT&T troff's could.


-------------------------------------------------------

::

          This document was written by James Clark and modified by Werner
          Lemberg and Bernd Warken.


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
          AT&T Bell Laboratories Computing Science Techical Report No. 97,
          provides additional insights into the device and font description
          file formats and device-independent output format.

          groff(1), groff(7), roff(7)

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

   groff 1.23.0.rc1.1101-d1263-di2r0tyAugust 2021                groff_diff(7)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`troff(1) <../man1/troff.1.html>`__, 
`groff_filenames(5) <../man5/groff_filenames.5.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`groff(7) <../man7/groff.7.html>`__,  `roff(7) <../man7/roff.7.html>`__

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
