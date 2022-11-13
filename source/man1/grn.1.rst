.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grn(1) — Linux manual page
==========================

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

   grn(1)                   General Commands Manual                  grn(1)


-------------------------------------------------

::

          grn - embed gremlin images in groff documents


---------------------------------------------------------

::

          grn [-C] [-T dev] [-M dir] [-F dir] [file ...]

          grn -?
          grn --help

          grn -v
          grn --version


---------------------------------------------------------------

::

          grn is a preprocessor for including gremlin pictures in troff(1)
          input.  grn writes to standard output, processing only input
          lines between two that start with .GS and .GE.  Those lines must
          contain grn commands (see below).  These macros request a gremlin
          file; the picture in that file is converted and placed in the
          troff input stream.  .GS may be called with a C, L, or R argument
          to center, left-, or right-justify the whole gremlin picture (the
          default is to center).  If no file is mentioned, the standard
          input is read.  At the end of the picture, the position on the
          page is the bottom of the gremlin picture.  If the grn entry is
          ended with .GF instead of .GE, the position is left at the top of
          the picture.

          Currently only the me macro package has support for .GS, .GE, and
          .GF.

          grn produces drawing escape sequences that use groff's color
          scheme extension (\D'F ...'), and thus may not work with other
          troffs.

      grn commands
          Each input line between .GS and .GE may have one grn command.
          Commands consist of one or two strings separated by white space,
          the first string being the command and the second its operand.
          Commands may be upper- or lowercase and abbreviated down to one
          character.

          Commands that affect a picture's environment (those listed before
          “default”, see below) are only in effect for the current picture:
          the environment is reinitialized to the defaults at the start of
          the next picture.  The commands are as follows.

          1 N
          2 N
          3 N
          4 N    Set gremlin's text size number 1 (2, 3, or 4) to N points.
                 The default is 12 (16, 24, and 36, respectively).

          roman f
          italics f
          bold f
          special f
                 Set the roman (italics, bold, or special) font to troff's
                 font f (either a name or number).  The default is R (I, B,
                 and S, respectively).

          l f
          stipple f
                 Set the stipple font to troff's stipple font f (name or
                 number).  The command stipple may be abbreviated down as
                 far as “st” (to avoid confusion with “special”).  There is
                 no default for stipples (unless one is set by the
                 “default” command), and it is invalid to include a gremlin
                 picture with polygons without specifying a stipple font.

          x N
          scale N
                 Magnify the picture (in addition to any default
                 magnification) by N, a floating-point number larger than
                 zero.  The command scale may be abbreviated down to “sc”.

          narrow N
          medium N
          thick N
                 Set the thickness of gremlin's narrow (medium and thick,
                 respectively) lines to N times 0.15pt (this value can be
                 changed at compile time).  The default is 1.0 (3.0 and
                 5.0, respectively), which corresponds to 0.15pt (0.45pt
                 and 0.75pt, respectively).  A thickness value of zero
                 selects the smallest available line thickness.  Negative
                 values cause the line thickness to be proportional to the
                 current point size.

          pointscale [off|on]
                 Scale text to match the picture.  Gremlin text is usually
                 printed in the point size specified with the commands 1,
                 2, 3, or 4, regardless of any scaling factors in the
                 picture.  Setting pointscale will cause the point sizes to
                 scale with the picture (within troff's limitations, of
                 course).  An operand of anything but off will turn text
                 scaling on.

          default
                 Reset the picture environment defaults to the settings in
                 the current picture.  This is meant to be used as a global
                 parameter setting mechanism at the beginning of the troff
                 input file, but can be used at any time to reset the
                 default settings.

          width N
                 Force the picture to be N inches wide.  This overrides any
                 scaling factors present in the same picture.  “width 0” is
                 ignored.

          height N
                 Force the picture to be N inches high, overriding other
                 scaling factors.  If both width and height are specified,
                 the tighter constraint will determine the scale of the
                 picture.  height and width commands are not saved with a
                 “default” command.  They will, however, affect point size
                 scaling if that option is set.

          file name
                 Get picture from gremlin file name located the current
                 directory (or in the library directory; see the -M option
                 above).  If multiple file commands are given, the last one
                 controls.  If name doesn't exist, an error message is
                 reported and processing continues from the .GE line.

      Usage with groff
          Since grn is a preprocessor, it doesn't know about current
          indentation, point sizes, margins, registers, and so on.
          Consequently, no troff input can be placed between the .GS and
          .GE macros.  However, gremlin text is now processed by troff, so
          anything valid in a single line of troff input is valid in a line
          of gremlin text (barring the dot control character “.” at the
          beginning of a line).  Thus, it is possible to have equations
          within a gremlin figure by including in the gremlin file eqn
          expressions enclosed by previously defined delimiters (e.g.,
          “$$”).

          When using grn along with other preprocessors, it is best to run
          tbl(1) before grn, pic(1), and/or ideal to avoid overworking tbl.
          eqn(1) should always be run last.

          A picture is considered an entity, but that doesn't stop troff
          from trying to break it up if it falls off the end of a page.
          Placing the picture between “keeps” in the me macros will ensure
          proper placement.

          grn uses troff's number registers g1 through g9 and sets
          registers g1 and g2 to the width and height of the gremlin figure
          (in device units) before entering the .GS macro (this is for
          those who want to rewrite these macros).

      Gremlin file format
          There exist two distinct gremlin file formats: the original
          format for AED graphic terminals, and the Sun or X11 version.  An
          extension used by the Sun/X11 version allowing reference points
          with negative coordinates is not compatible with the AED version.
          As long as a gremlin file does not contain negative coordinates,
          either format will be read correctly by either version of gremlin
          or grn.  The other difference in Sun/X11 format is the use of
          names for picture objects (e.g., POLYGON, CURVE) instead of
          numbers.  Files representing the same picture are shown in Table
          1 in each format.

                        sungremlinfile        gremlinfile
                        0 240.00 128.00       0 240.00 128.00
                        CENTCENT              2
                        240.00 128.00         240.00 128.00
                        185.00 120.00         185.00 120.00
                        240.00 120.00         240.00 120.00
                        296.00 120.00         296.00 120.00
                        *                     -1.00 -1.00
                        2 3                   2 3
                        10 A Triangle         10 A Triangle
                        POLYGON               6
                        224.00 416.00         224.00 416.00
                        96.00 160.00          96.00 160.00
                        384.00 160.00         384.00 160.00
                        *                     -1.00 -1.00
                        5 1                   5 1
                        0                     0
                        -1                    -1

                               Table 1.  File examples

          •      The first line of each gremlin file contains either the
                 string “gremlinfile” (AED) or “sungremlinfile” (Sun/X11).

          •      The second line of the file contains an orientation and x
                 and y values for a positioning point, separated by spaces.
                 The orientation, either 0 or 1, is ignored by the Sun/X11
                 version.  0 means that gremlin will display things in
                 horizontal format (a drawing area wider than it is tall,
                 with a menu across the top).  1 means that gremlin will
                 display things in vertical format (a drawing area taller
                 than it is wide, with a menu on the left side).  x and y
                 are floating-point values giving a positioning point to be
                 used when this file is read into another file.  The stuff
                 on this line really isn't all that important; a value of
                 “1 0.00 0.00” is suggested.

          •      The rest of the file consists of zero or more element
                 specifications.  After the last element specification is a
                 line containing the string “-1”.

          •      Lines longer than 127 characters are truncated to that
                 length.

      Element specifications
          •      The first line of each element contains a single decimal
                 number giving the type of the element (AED) or its name
                 (Sun/X11).

                       gremlin File Format: Object Type Specification
                  ─────────────────────────────────────────────────────────
                  AED Number   Sun/X11 Name           Description
                       0       BOTLEFT        bottom-left-justified text
                       1       BOTRIGHT       bottom-right-justified text
                       2       CENTCENT       center-justified text
                       3       VECTOR         vector
                       4       ARC            arc
                       5       CURVE          curve
                       6       POLYGON        polygon
                       7       BSPLINE        b-spline
                       8       BEZIER         Bézier
                      10       TOPLEFT        top-left-justified text
                      11       TOPCENT        top-center-justified text
                      12       TOPRIGHT       top-right-justified text
                      13       CENTLEFT       left-center-justified text
                      14       CENTRIGHT      right-center-justified text
                      15       BOTCENT        bottom-center-justified text

                       Table 2.  Type Specifications in gremlin Files

          •      After the object type comes a variable number of lines,
                 each specifying a point used to display the element.  Each
                 line contains an x-coordinate and a y-coordinate in
                 floating-point format, separated by spaces.  The list of
                 points is terminated by a line containing the string “-1.0
                 -1.0” (AED) or a single asterisk, “*” (Sun/X11).

          •      After the points comes a line containing two decimal
                 values, giving the brush and size for the element.  The
                 brush determines the style in which things are drawn.  For
                 vectors, arcs, and curves there are six valid brush
                 values.

                                 1   thin dotted lines
                                 2   thin dot-dashed lines
                                 3   thick solid lines
                                 4   thin dashed lines
                                 5   thin solid lines
                                 6   medium solid lines

                 For polygons, one more value, 0, is valid.  It specifies a
                 polygon with an invisible border.  For text, the brush
                 selects a font as follows.

                               1   roman (R font in troff)
                               2   italics (I font in troff)
                               3   bold (B font in troff)
                               4   special (S font in troff)

                 If you're using grn to run your pictures through groff,
                 the font is really just a starting font.  The text string
                 can contain formatting sequences like “\fI” or “\d” which
                 may change the font (as well as do many other things).
                 For text, the size field is a decimal value between 1 and
                 4.  It selects the size of the font in which the text will
                 be drawn.  For polygons, this size field is interpreted as
                 a stipple number to fill the polygon with.  The number is
                 used to index into a stipple font at print time.

          •      The last line of each element contains a decimal number
                 and a string of characters, separated by a single space.
                 The number is a count of the number of characters in the
                 string.  This information is used only for text elements,
                 and contains the text string.  There can be spaces inside
                 the text.  For arcs, curves, and vectors, the character
                 count is zero (0), followed by exactly one space before
                 the newline.

      Coordinates
          gremlin was designed for AED terminals, and its coordinates
          reflect the AED coordinate space.  For vertical pictures, x-
          values range 116 to 511, and y-values from 0 to 483.  For
          horizontal pictures, x-values range from 0 to 511, and y-values
          from 0 to 367.  Although you needn't absolutely stick to this
          range, you'll get better results if you at least stay in this
          vicinity.  Also, point lists are terminated by a point of (-1,
          -1), so you shouldn't ever use negative coordinates.  gremlin
          writes out coordinates using the printf(3) format “%f1.2”; it's
          probably a good idea to use the same format if you want to modify
          the grn code.

      Sun/X11 coordinates
          There is no restriction on the range of coordinates used to
          create objects in the Sun/X11 version of gremlin.  However, files
          with negative coordinates will cause problems if displayed on the
          AED.


-------------------------------------------------------

::

          -? and --help display a usage message, while -v and --version
          show version information; all exit afterward.

          -T dev Prepare device output using output driver dev.  The
                 default is ps.  See groff(1) for a list of valid devices.

          -M dir Prepend dir to the search path for gremlin files.  The
                 default search path is the current directory, the home
                 directory, /usr/local/lib/groff/site-tmac, /usr/local/
                 share/groff/site-tmac, and /usr/local/share/groff/1.23.0/
                 tmac, in that order.

          -F dir Search dir for subdirectories devname (name is the name of
                 the output driver) for the DESC file before the default
                 font directories /usr/local/share/groff/site-font, /usr/
                 local/share/groff/1.23.0/font, and /usr/lib/font.

          -C     Recognize .GS and .GE (and .GF) even when followed by a
                 character other than space or newline.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devname/DESC
                 device description file for output driver name


-------------------------------------------------------

::

          David Slattengren and Barry Roitblat wrote the original Berkeley
          grn.  Daniel Senderowicz and Werner Lemberg modified it for
          groff.


---------------------------------------------------------

::

          gremlin(1), groff(1), pic(1), ideal(1)

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

   groff 1.23.0.rc1.1101-d1263-di2r0tyAugust 2021                       grn(1)

--------------

Pages that refer to this page:
`groff_filenames(5) <../man5/groff_filenames.5.html>`__

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
