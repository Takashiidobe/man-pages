.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hpftodit(1) — Linux manual page
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

   hpftodit(1)              General Commands Manual             hpftodit(1)


-------------------------------------------------

::

          hpftodit - create font description files for use with groff -Tlj4


---------------------------------------------------------

::

          hpftodit [-aqs] [-i n] tfm-file map-file output-font

          hpftodit -d tfm-file [map-file]

          hpftodit --help

          hpftodit -v
          hpftodit --version


---------------------------------------------------------------

::

          hpftodit creates a font file for use with a Hewlett-Packard
          LaserJet 4-series (or newer) printer with the grolj4(1), output
          driver of groff(1), using data from an HP tagged font metric
          (TFM) file.  tfm-file is the name of the TFM file for the font;
          Intellifont and TrueType TFM files are supported, but symbol set
          TFM files are not.  map-file is a file giving the groff names for
          characters in the font; this file should consist of a sequence of
          lines of the form
                 m u c1 c2 ... [# comment]
          where m is a decimal integer giving the MSL (Master Symbol List)
          number of the character, u is a hexadecimal integer giving the
          Unicode value of the character, and c1, c2, ...  are the groff
          names of the character (see groff_char(7) for a list).  The
          values can be separated by any whitespace; the Unicode value must
          use uppercase digits A–F, and must be without a leading “0x”,
          “u”, or “U+”.  Unicode values corresponding to composite glyphs
          are decomposed; e.g., “u00C0” becomes “u0041_0300”.  The name for
          a glyph without a groff name may be given as uXXXX if the glyph
          corresponds to a Unicode value, or as an unnamed glyph “---”.  If
          the given Unicode value is in the Private Use Area
          (0xE000–0xF8FF), the glyph is included as an unnamed glyph.
          Refer to groff_diff(1) for additional information about unnamed
          glyphs and how to access them.

          Blank lines and lines beginning with “#” are ignored.  A “#”
          following one or more groff names begins a comment.  Because “#”
          is a valid groff name, it must appear first in a list of groff
          names if a comment is included, e.g.,
                 3   0023   #   # number sign
          or
                 3   0023   # sh   # number sign
          rather than
                 3   0023   sh #   # number sign
          which will treat the first “#” as the beginning of the comment.

          The groff font file is written to the specified output-font; if
          this operand is “-”, the font file is written to the standard
          output stream.

          The -s option should be given if the font is special (a font is
          “special” if groff should search it whenever a character is not
          found in the current font).  If the font is special, it should be
          listed in the fonts command in the DESC file; if it is not
          special, there is no need to list it, since groff can
          automatically mount it when it's first used.

          If the -i option is used, hpftodit automatically will generate an
          italic correction, a left italic correction and a subscript
          correction for each character (the significance of these
          parameters is explained in groff_font(5)).


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -a     Include characters in the TFM file that are not included
                 in map-file.  A glyph with corresponding Unicode value is
                 given the name uXXXX; a glyph without a Unicode value is
                 included as an unnamed glyph “---”.  A glyph with a
                 Unicode value in the Private Use Area (0xE000–0xF8FF) is
                 also included as an unnamed glyph.

                 This option provides a simple means of adding Unicode-
                 named and unnamed glyphs to a font without including them
                 in the map file, but it affords little control over which
                 glyphs are placed in a regular font and which are placed
                 in a special font.  The presence or absence of the -s
                 option has some effect on which glyphs are included:
                 without the -s option, only the “text” symbol sets are
                 searched for matching glyphs; with the -s option, only the
                 “mathematical” symbol sets are searched.  Nonetheless,
                 restricting the symbol sets searched isn't very selective—
                 many glyphs are placed in both regular and special fonts.
                 Normally, the -a option should be used only as a last
                 resort.

          -d     Dump information about the TFM file to the standard output
                 stream; this option can be useful for ensuring that a TFM
                 file is a proper match for a font, and that the contents
                 of the TFM file are suitable.  The information includes
                 the values of important TFM tags, and a listing (by MSL
                 number for Intellifont TFM files or by Unicode value for
                 TrueType TFM files) of the glyphs included in the TFM
                 file.  The unit of measure “DU” for some tags indicates
                 design units; there are 8782 design units per em for
                 Intellifont fonts, and 2048 design units per em for
                 TrueType fonts.  Note that the accessibility of a glyph
                 depends on its inclusion in a symbol set; some TFM files
                 list many glyphs but only a few symbol sets.

                 The glyph listing includes the glyph index within the TFM
                 file, the MSL or Unicode value, and the symbol set and
                 character code that will be used to print the glyph.  If
                 map-file is given, groff names are given for matching
                 glyphs.  If only the glyph index and MSL or Unicode value
                 are given, the glyph does not appear in any supported
                 symbol set and cannot be printed.

                 With the -d option, map-file is optional, and output-font
                 is ignored if given.

          -i n   Generate an italic correction for each character so that
                 the character's width plus the character's italic
                 correction is equal to n thousandths of an em plus the
                 amount by which the right edge of the character's bounding
                 is to the right of the character's origin.  If this would
                 result in a negative italic correction, use a zero italic
                 correction instead.

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
                 correction may be negative.

                 This option normally is needed only with italic or oblique
                 fonts; a value of 50 (0.05 em) usually is a reasonable
                 choice.

          -q     Suppress warnings about characters in the map file that
                 were not found in the TFM file.  Warnings never are given
                 for unnamed glyphs or by glyphs named by their Unicode
                 values.  This option is useful when sending the output of
                 hpftodit to the standard output stream.

          -s     The font is special.  This option adds the special command
                 to the font file, and affects the order in which HP symbol
                 sets are searched for each glyph.  Without the -s option,
                 the “text” sets are searched before the “mathematical”
                 symbol sets.  With the -s option, the search order is
                 reversed.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devlj4/DESC
                 device description file

          /usr/local/share/groff/1.23.0/font/devlj4/F
                 font description file for font F

          /usr/local/share/groff/1.23.0/font/devlj4/generate/*.map
                 symbol mapping files


---------------------------------------------------------

::

          groff(1), groff_diff(1), grolj4(1), groff_font(5), lj4_font(5)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                  hpftodit(1)

--------------

Pages that refer to this page: `lj4_font(5) <../man5/lj4_font.5.html>`__

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
