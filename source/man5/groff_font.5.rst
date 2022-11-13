.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_font(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `DESC <#%3Ci%3EDE                 |                                   |
| SC%3C/i%3E%3Ch2%3Efile_format>`__ |                                   |
|                                   |                                   |
| file format \|                    |                                   |
| `Font description file format <   |                                   |
| #Font_description_file_format>`__ |                                   |
| \| `Files <#Files>`__ \|          |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_font(5)              File Formats Manual             groff_font(5)


-------------------------------------------------

::

          groff_font - GNU roff device and font description files


---------------------------------------------------------------

::

          The groff font and output device description formats are slight
          extensions of those used by AT&T device-independent troff.  In
          distinction to the AT&T implementation, groff lacks a binary
          format; all files are text files.  (Plan 9 troff has also
          abandoned the binary format.)  The device and font description
          files for a device name are stored in a directory called devname.
          The device description file is called DESC, and, for each font f
          supported by the device, a font file called “f”, where f is
          usually an abbreviation of a font's name and/or style.  For
          example, the ps (PostScript) device has groff font description
          files for Times roman (TR) and Zapf Chancery Medium italic
          (ZCMI), among many others, while the utf8 device (for terminal
          emulators) has only font descriptions for the roman, italic,
          bold, and bold-italic styles (R, I, B, and BI, respectively).

*DESC*

file format
-----------

::

          The DESC file can contain the following types of line as shown
          below.  Except for the charset directive, which must come last
          (if at all), the order of the lines is not important.  Later
          entries in the file, however, override previous values.  Empty
          lines are ignored.

          charset
                 This line and everything following it in the file are
                 ignored.  It is recognized for compatibility with other
                 troff implementations.  In GNU troff, character set
                 repertoire is described on a per-font basis.

          family fam
                 The default font family is fam.

          fonts n F1 ... Fn
                 Fonts F1, ..., Fn are mounted in the font positions m+1,
                 ..., m+n where m is the number of styles (see below).
                 This directive may extend over more than one line.  A font
                 name of of 0 causes no font to be mounted at the
                 corresponding position.

          hor n  The horizontal resolution is n basic units.  All
                 horizontal quantities are rounded to multiples of this
                 value.

          image_generator program
                 Use program to generate PNG images from PostScript input.
                 Under GNU/Linux, this is usually gs(1), but under other
                 systems (notably Cygwin) it might be set to another name.
                 The grohtml(1) driver uses this directive.

          paperlength n
                 The vertical dimension of the physical output medium is
                 n basic units.  Deprecated: use papersize instead.

          papersize format-or-dimension-pair-or-file-name
                 Set the dimensions of the physical output medium according
                 to the argument, which is either a standard paper format,
                 a pair of dimensions, or the name of a plain text file
                 containing either of the foregoing.  Recognized paper
                 formats are the ISO and DIN formats A0–A7, B0–B7, C0–C7,
                 and D0–D7; the U.S. formats letter, legal, tabloid,
                 ledger, statement, and executive; and the envelope formats
                 com10, monarch, and DL.  Case is not significant for the
                 argument if it holds predefined paper types.

                 Alternatively, the argument can be a custom paper size in
                 the format length,width (with no spaces before or after
                 the comma).  Both length and width must have a unit
                 appended; valid units are “i” for inches, “c” for
                 centimeters, “p” for points, and “P” for picas.  Example:
                 “12c,235p”.  An argument that starts with a digit is
                 always treated as a custom paper format.

                 Finally, the argument can be a file name (e.g.,
                 /etc/papersize); if the file can be opened, troff reads
                 the first line and attempts to match the above forms.  No
                 comment syntax is supported.

                 More than one argument can be specified; troff scans from
                 left to right and uses the first valid paper
                 specification.

          paperwidth n
                 The horizontal dimension of the physical output medium is
                 n basic units.  Deprecated: use papersize instead.

          pass_filenames
                 Direct troff to emit the name of the source file being
                 processed.  This is achieved with the intermediate output
                 command “x F”.  The grohtml driver uses this directive.

          postpro program
                 Use program as the postprocessor.

          prepro program
                 Use program as a preprocessor.  Currently, this keyword is
                 used only when troff is directed to use the html or xhtml
                 output devices.

          print program
                 Use program as the spooler program for printing.  If
                 omitted, the -l and -L options of groff are ignored.

          res n  The device has n basic units per inch.

          sizes s1 ... sn 0
                 The device has fonts at s1, ..., sn scaled points (see
                 below).  The list of sizes must be terminated by a 0.
                 Each si can also be a range of sizes m–n.  The list can
                 extend over more than one line.

          sizescale n
                 Set the scale factor for point sizes to one divided by n.
                 The default is 1.

          styles S1 ... Sm
                 The first m font positions are associated with styles S1,
                 ..., Sm.

          tcommand
                 The postprocessor can handle the t and u intermediate
                 output commands.

          unicode
                 The output device supports the complete Unicode
                 repertoire.  This directive is useful only for devices
                 which produce character entities instead of glyphs.

                 If unicode is present, no charset section is required in
                 the font description files since the Unicode handling
                 built into groff is used.  However, if there are entries
                 in a charset section, they either override the default
                 mappings for those particular characters or add new
                 mappings (normally for composite characters).

                 The utf8, html, and xhtml output devices use this
                 directive.

          unitwidth n
                 Quantities in the font files are given in basic units for
                 fonts whose point size is n scaled points.

          unscaled_charwidths
                 Make the font handling module always return unscaled glyph
                 widths.  The grohtml driver uses this directive.

          use_charnames_in_special
                 This directive indicates that troff should encode named
                 glyphs inside special commands.  The grohtml driver uses
                 this directive.

          vert n The vertical resolution is n basic units.

          troff recognizes but ignores the directives spare1, spare2, and
          biggestfont.

          The res, unitwidth, fonts, and sizes lines are mandatory.
          Directives not listed above are ignored by troff but may be used
          by postprocessors to store arbitrary information about a device
          in the DESC file.


-------------------------------------------------------------------------------------------------

::

          On typesetting output devices, each font is typically available
          at multiple sizes.  While paper size measurements in the device
          description file are in absolute units, measurements applicable
          to fonts must be proportional to the type size.  groff achieves
          this using the precedent set by AT&T device-independent troff:
          one size of a font is chosen as a norm, and all other sizes are
          scaled linearly relative to that basis.  The “unit width” is the
          number of basic units per point.

          For instance, groff's lbp device uses a unitwidth of 800.  In its
          Times roman font (“TR”), its spacewidth is 833; this is also the
          width of its comma, period, centered period, and mathematical
          asterisk, while its “M” is 2963 basic units.  Thus, an “M” on the
          lbp device is 2,963 basic units wide at a notional type size of
          800 points.  (800-point type is not practical for most purposes,
          but using it enables the quantities in the font description files
          to be expressed as integers.)

          A font description file has two sections; empty lines are ignored
          in both.  The first section is a sequence of lines each
          containing a sequence of space-delimited words; the first word in
          the line is a key, and subsequent words associate a value with
          that key.

          name F The name of the font is F.

          spacewidth n
                 The width of a normal, unadjusted space is n basic units
                 at a type size of unit-width points.

          The above directives are mandatory; the remaining ones in the
          first section are optional.

          slant n
                 The glyphs of the font have a slant of n degrees, where a
                 positive n slants in the direction of text flow.

          ligatures lig1 ... lign [0]
                 Glyphs lig1, ..., lign are ligatures; possible ligatures
                 are ff, fi, fl, ffi, and ffl.  For compatibility with
                 other troff implementations, the list of ligatures may be
                 terminated with a 0.  The list of ligatures must not
                 extend over more than one line.

          special
                 The font is special; this means that when a glyph is
                 requested that is not present in the current font, it is
                 searched for in any special fonts that are mounted.

          Other directives are ignored by troff but may be used by
          postprocessors to store arbitrary information about the font in
          the file.

          The first section can contain comments, which start with the #
          character and extend to the end of a line.

          The second section contains one or two subsections.  It must
          contain a charset subsection and it may also contain a kernpairs
          subsection.  These subsections can appear in either order.  Each
          subsection starts with a directive on a line by itself.

          The directive charset starts the charset subsection.  (This
          keyword is a misnomer since it starts an ordered list of glyphs,
          not characters.)  The charset line is followed by a sequence of
          lines, each with information about one glyph.  A line comprises a
          number of fields separated by spaces or tabs.  The format is as
          follows.

                 name metrics type code [entity_name] [-- comment]

          name identifies the glyph: if name is a single character c, it
          corresponds to the troff input character c.  Otherwise, it must
          be of the form \name where name is at least one character; it
          then corresponds to the groff special character escape sequence
          \[name], or the one-sixth and one-twelfth unbreakable space
          escape sequences, \| and \^ (“thin” and “hair” spaces,
          respectively).  A name consisting of three minus signs, “---”,
          indicates that the glyph is unnamed: such glyphs can only be
          accessed by means of the \N escape sequence in troff.  A special
          character named “---” can still be defined using .char and
          similar requests.

          The form of the metrics field is as follows (on one line; it may
          be broken here for the sake of readability).

                 width[,height[,depth[,italic-correction[,
                 left-italic-correction[,subscript-correction]]]]]

          There must not be any spaces between these subfields.  Missing
          subfields are assumed to be 0.  The subfields are all decimal
          integers.  Since there is no associated binary format, these
          values are not required to fit into the C language data type char
          as they are in AT&T device-independent troff.  The width subfield
          gives the width of the glyph.  The height subfield gives the
          height of the glyph (upwards is positive); if a glyph does not
          extend above the baseline, it should be given a zero height,
          rather than a negative height.  The depth subfield gives the
          depth of the glyph, that is, the distance below the baseline to
          which the glyph extends (downwards is positive); if a glyph does
          not extend below the baseline, it should be given a zero depth,
          rather than a negative depth.  Italic corrections are relevant to
          glyphs in italic or oblique styles.  The italic-correction
          subfield gives the amount of space that should be added after the
          glyph when it is to be followed immediately by a glyph from an
          upright style.  The left-italic-correction subfield gives the
          amount of space that should be added before the glyph when it is
          to be preceded immediately by a glyph from an upright style.  The
          subscript-correction gives the amount of space that should be
          added after a glyph before adding a subscript.  This should be
          less than the italic correction.

          The type field gives a featural description of the glyph.

          1      means the glyph has a descender (for example, “p”);

          2      means the glyph has an ascender (for example, “b”); and

          3      means the glyph has both an ascender and a descender (for
                 example, this is true of parentheses in some fonts).

          The code field gives a numeric identifier that the postprocessor
          uses to render the glyph.  The glyph can be specified to troff
          using this code by means of the \N escape sequence.  The code can
          be any integer (that is, any integer parsable by the C standard
          library's strtol(3) function).

          The entity_name field defines an identifier for the glyph that
          the postprocessor uses to print the troff glyph name.  This field
          is optional; it was introduced so that the grohtml output driver
          could encode its character set.  For example, the glyph \[Po] is
          represented by “&pound;” in HTML 4.0.  For efficiency, these data
          are now compiled directly into grohtml.  grops uses the field to
          build sub-encoding arrays for PostScript fonts containing more
          than 256 glyphs.

          Anything on the line after the encoding field or “--” is ignored.

          A line in the charset section can also have the following format.

                 name "

          This notation indicates that name is another name for the glyph
          mentioned in the preceding line.  Such aliases can be chained.

          The word kernpairs starts the kernpairs section.  It contains a
          sequence of lines formatted as follows.

                 c1 c2 n

          The foregoing means that when glyph c1 is typeset immediately
          before c2, the space between them should be increased by n.  Most
          kerning pairs should have a negative value for n.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devname/DESC
                 describes the output device name.

          /usr/local/share/groff/1.23.0/font/devname/F
                 describes the font known to troff as F on device name.


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

          Section “See also” of groff(1) lists utilities available for
          preparing font files in a variety of formats for use with groff
          output drivers.

          groff_out(5), troff(1), addftinfo(1)

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

   groff 1.23.0.rc1.1101-d1263-di2r0tyAugust 2021                groff_font(5)

--------------

Pages that refer to this page:
`addftinfo(1) <../man1/addftinfo.1.html>`__, 
`afmtodit(1) <../man1/afmtodit.1.html>`__, 
`eqn(1) <../man1/eqn.1.html>`__, 
`grodvi(1) <../man1/grodvi.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`grohtml(1) <../man1/grohtml.1.html>`__, 
`grolbp(1) <../man1/grolbp.1.html>`__, 
`grolj4(1) <../man1/grolj4.1.html>`__, 
`gropdf(1) <../man1/gropdf.1.html>`__, 
`grops(1) <../man1/grops.1.html>`__, 
`grotty(1) <../man1/grotty.1.html>`__, 
`hpftodit(1) <../man1/hpftodit.1.html>`__, 
`tfmtodit(1) <../man1/tfmtodit.1.html>`__, 
`troff(1) <../man1/troff.1.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`lj4_font(5) <../man5/lj4_font.5.html>`__, 
`groff(7) <../man7/groff.7.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__, 
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
