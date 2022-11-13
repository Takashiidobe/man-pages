.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

afmtodit(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Files <#Files>`__ \|             |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   afmtodit(1)              General Commands Manual             afmtodit(1)


-------------------------------------------------

::

          afmtodit - adapt Adobe Font Metrics files for groff -Tps and
          -Tpdf


---------------------------------------------------------

::

          afmtodit [-ckmnsx] [-a n] [-d desc-file] [-e enc-file]
                   [-f internal-name] [-i n] [-o output-file] afm-file map-
                   file font

          afmtodit -v


---------------------------------------------------------------

::

          afmtodit converts an Adobe Font Metric file, afm-file, for use
          with the ps and pdf output drivers of groff(1).  map-file
          associates a groff character name with a PostScript character
          name.  Output is written to font, a file named for the intended
          groff font name (but see the -o option).

          afm-file should contain a sequence of lines of the form
                 ps-char groff-char
          where ps-char is the PostScript name of the character and groff-
          char is the groff name of the character (as used in the groff
          font file).  The same ps-char can occur multiple times in the
          file; each groff-char must occur at most once.  Lines starting
          with “#” and blank lines are ignored.  If the file isn't found in
          the current directory, it is sought in the devps/generate
          subdirectory of the default font directory.

          If a PostScript character is not mentioned in map-file, and a
          generic groff glyph name can't be deduced using the Adobe Glyph
          List (AGL, built into afmtodit), then afmtodit puts the
          PostScript character into the groff font file as an unnamed
          character which can only be accessed by the “\N” escape sequence
          in a roff document.  In particular, this is true for glyph
          variants named in the form “foo.bar“; all glyph names containing
          one or more periods are mapped to unnamed entities.  Unless -e is
          specified, the encoding defined in the AFM file (i.e., entries
          with non-negative character codes) is used.  Refer to section
          “Using Symbols” in Groff: The GNU Implementation of troff, the
          groff Texinfo manual, which describes how groff glyph names are
          constructed.

          Characters not encoded in the AFM file (i.e., entries which have
          “-1” as the character code) are still available in groff; they
          get glyph index values greater than 255 (or greater than the
          biggest character code used in the AFM file in the unlikely case
          that it is greater than 255) in the groff font file.  Glyph
          indices of unencoded characters don't have a specific order; it
          is best to access them with glyph names only.

          If there is a downloadable font file for the font, it may be
          listed in the file /usr/local/share/groff/1.23.0/font/devps/
          download; see grops(1).

          If the -i option is used, afmtodit automatically generates an
          italic correction, a left italic correction, and a subscript
          correction for each character (the significance of these is
          explained in groff_font(5)); they can be specified for individual
          characters by adding to the afm-file lines of the form:
                 italicCorrection ps-char n
                 leftItalicCorrection ps-char n
                 subscriptCorrection ps-char n
          where ps-char is the PostScript name of the character, and n is
          the desired value of the corresponding parameter in thousandths
          of an em.  Such parameters are normally needed only for italic
          (or oblique) fonts.


-------------------------------------------------------

::

          -a n   Use n as the slant parameter in the font file; this is
                 used by groff in the positioning of accents.  By default
                 afmtodit uses the negative of the ItalicAngle specified in
                 the AFM file; with true italic fonts it is sometimes
                 desirable to use a slant that is less than this.  If you
                 find that characters from an italic font have accents
                 placed too far to the right over them, then use the -a
                 option to give the font a smaller slant.

          -c     Include comments in the font file in order to identify the
                 PostScript font.

          -d desc-file
                 The device description file is desc-file rather than the
                 default DESC.  If not found in the current directory, the
                 devps subdirectory of the default font directory is
                 searched (this is true for both the default device
                 description file and a file given with option -d).

          -e enc-file
                 The PostScript font should be reencoded to use the
                 encoding described in enc-file.  The format of enc-file is
                 described in grops(1).  If not found in the current
                 directory, the devps subdirectory of the default font
                 directory is searched.

          -f name
                 The internal name of the groff font is set to name.

          -i n   Generate an italic correction for each character so that
                 the character's width plus the character's italic
                 correction is equal to n thousandths of an em plus the
                 amount by which the right edge of the character's bounding
                 box is to the right of the character's origin.  If this
                 would result in a negative italic correction, use a zero
                 italic correction instead.

                 Also generate a subscript correction equal to the product
                 of the tangent of the slant of the font and four fifths of
                 the x-height of the font.  If this would result in a
                 subscript correction greater than the italic correction,
                 use a subscript correction equal to the italic correction
                 instead.

                 Also generate a left italic correction for each character
                 equal to n thousandths of an em plus the amount by which
                 the left edge of the character's bounding box is to the
                 left of the character's origin.  The left italic
                 correction may be negative unless option -m is given.

                 This option is normally needed only with italic (or
                 oblique) fonts.  The font files distributed with groff
                 were created using an option of -i50 for italic fonts.

          -o output-file
                 The output file is output-file instead of font.

          -k     Omit any kerning data from the groff font; use only for
                 monospaced (constant-width) fonts.

          -m     Prevent negative left italic correction values.  Roman
                 font files distributed with groff were created with -i0 -m
                 to improve spacing with eqn(1).

          -n     Don't output a ligatures command for this font; use with
                 monospaced (constant-width) fonts.

          -s     The font is special; add the special command to the font
                 file.

          -v     Write version information to the standard output stream
                 and exit.

          -x     Don't use the built-in Adobe Glyph List.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devps/DESC
                 Device description file.

          /usr/local/share/groff/1.23.0/font/devps/F
                 Font description file for font F.

          /usr/local/share/groff/1.23.0/font/devps/download
                 List of downloadable fonts.

          /usr/local/share/groff/1.23.0/font/devps/text.enc
                 Encoding used for text fonts.

          /usr/local/share/groff/1.23.0/font/devps/generate/textmap
                 Standard mapping.


---------------------------------------------------------

::

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  Section “Using
          Symbols” may be of particular note.  You can browse it
          interactively with “info '(groff)Using Symbols'”.

          groff(1), gropdf(1), grops(1), groff_font(5)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                  afmtodit(1)

--------------

Pages that refer to this page: `gropdf(1) <../man1/gropdf.1.html>`__, 
`grops(1) <../man1/grops.1.html>`__

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
