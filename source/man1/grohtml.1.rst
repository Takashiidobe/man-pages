.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grohtml(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Usage <#Usage>`__ \|             |                                   |
| `Dependencies <#Dependencies>`__  |                                   |
| \| `Files <#Files>`__ \|          |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grohtml(1)               General Commands Manual              grohtml(1)


-------------------------------------------------

::

          grohtml, post-grohtml, pre-grohtml - groff output driver for HTML


---------------------------------------------------------

::

          pre-grohtml [-epV] [-a anti-aliasing-text-bits] [-D image-
                      directory] [-F font-directory] [-g anti-aliasing-
                      graphic-bits] [-i resolution] [-I image-stem] [-o
                      image-vertical-offset] [-x html-dialect] [file ...]

          pre-grohtml --help

          pre-grohtml -v
          pre-grohtml --version

          post-grohtml [-bCGhlnrVy] [-F font-directory] [-j output-stem]
                       [-s base-point-size] [-S heading-level] [-x html-
                       dialect] [file ...]

          post-grohtml --help

          post-grohtml -v
          post-grohtml --version


---------------------------------------------------------------

::

          The GNU roff system's HTML support consists of a preprocessor,
          pre-grohtml, and a device driver, post-grohtml; together, they
          translate roff(7) documents to HTML.  Users should always invoke
          grohtml via the groff(1) command with the -Thtml option.  If no
          operands are given, or if file is “-”, grohtml reads the standard
          input stream.  Output is written to the standard output stream.
          When grohtml is run by groff, options can be passed to grohtml
          using groff's -P option.

          grohtml invokes groff twice.  In the first pass, the preprocessor
          pre-grohtml renders pictures, equations, and tables as images in
          PostScript format using the ps output driver.  In the second
          pass, the output driver post-grohtml translates the output of
          troff(1) to HTML.

          grohtml always writes output encoded in UTF-8 and has built-in
          entities for all non-composite Unicode characters.  In spite of
          this, groff may issue warnings about unknown special characters
          if they can't be found during the first pass.  Such warnings can
          be safely ignored unless the special characters appear inside a
          table or equation.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -a anti-aliasing-text-bits
                 Number of bits of antialiasing information to be used by
                 text when generating PNG images.  The default is 4 but
                 valid values are 0, 1, 2, and 4.  Note that your version
                 of gs needs to support the -dTextAlphaBits and
                 -dGraphicAlphaBits options in order to exploit
                 antialiasing.  A value of 0 stops grohtml from issuing
                 antialiasing commands to gs.

          -b     Initialize the background color to white.

          -C     Suppress output of “CreationDate:” HTML comment.

          -D image-directory
                 Instruct grohtml to place all image files into directory
                 image-directory.

          -e     This option should not be directly specified; it is an
                 internal option used by groff when -Thtml or -Txhtml is
                 specified.  grohtml's preprocessor uses it to determine
                 whether eqn should be directed to produce MathML (if
                 -Txhtml is specified).

          -F font-directory
                 Prepend directory font-directory/devname to the search
                 path for font and device description files; name is the
                 name of the device, usually html.

          -G     Suppress output of “Creator:” HTML comment.

          -g anti-aliasing-graphic-bits
                 Number of bits of antialiasing information to be used by
                 graphics when generating PNG images.  The default is 4 but
                 valid values are 0, 1, 2, and 4.  Note your version of gs
                 needs to support the -dTextAlphaBits and
                 -dGraphicAlphaBits options in order to exploit
                 antialiasing.  A value of 0 stops grohtml from issuing
                 antialiasing commands to gs.

          -h     Generate section and number headings by using <B>...</B>
                 and increasing the font size, rather than using the
                 <Hn>...</Hn> tags.

          -i resolution
                 Select the resolution for all images.  By default this is
                 100 pixels per inch.  Example: -i200 indicates 200 pixels
                 per inch.

          -I image-stem
                 Determine the image file name stem.  If omitted, grohtml
                 uses grohtml-XXXXX (where XXXXX is the process ID).  A
                 dash is appended to the stem to separate it from the
                 following image number.

          -j output-stem
                 Instruct grohtml to split the HTML output into multiple
                 files.  Output is written to a new file at each section
                 heading (but see option -S below) named output-
                 stem-n.html.

          -l     Turn off the production of automatic section links at the
                 top of the document.

          -n     Generate simple heading anchors whenever a section/number
                 heading is found.  Without the option the anchor value is
                 the textual heading.  This can cause problems when a
                 heading contains a “?” on older versions of some browsers.
                 This flag is automatically turned on if a heading contains
                 an image.

          -o image-vertical-offset
                 Specify the vertical offset of images in points.

          -p     Display page rendering progress to the standard error
                 stream.  grohtml only displays a page number when an image
                 is required.

          -r     Turn off the automatic header and footer line (HTML rule).

          -s base-point-size
                 Set the base point size of the source file.  Thereafter
                 when this point size is used in the source it will
                 correspond to the HTML base size.  Every increase of two
                 points in the source will yield a <big> tag, and
                 conversely when a decrease of two points is seen a <small>
                 tag is emitted.

          -S heading-level
                 When splitting HTML output (see option -j above), split at
                 each nested heading level defined by heading-level, or
                 higher).  The default is 1.

          -V     Create an XHTML or HTML validator button at the bottom of
                 each page of the document.

          -x html-dialect
                 Select HTML dialect.  Currently, html-dialect should be
                 either the digit 4 or the letter x, which indicates
                 whether grohtml should generate HTML 4 or XHTML,
                 respectively.  This option should not be directly invoked
                 by the user as it is an internal option utilized by groff
                 when -Thtml or -Txhtml is specified.

          -y     Produce a right-justified groff signature at the end of
                 the document.  This is only generated if the -V flag is
                 also specified.


---------------------------------------------------

::

          Font styles called R, I, B, and BI are mounted at font
          positions 1 to 4, respectively.


-----------------------------------------------------------------

::

          grohtml is dependent upon the PNG utilities (pnmcut, pnmcrop,
          pnmtopng) and GhostScript (gs).  pnmtopng (version 2.37.6 or
          greater) and pnmcut from the netpbm package (version 9.16 or
          greater) will work also.  It is also dependent upon psselect from
          the PSUtils package.  Images are generated whenever a table,
          picture, equation or line (such as a baseline rule or box rule)
          is encountered.


---------------------------------------------------

::

          grohtml uses temporary files.  See groff(1) for details about
          where such files are created.


---------------------------------------------------------------

::

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 See troff(1) and groff_font(5).

          SOURCE_DATE_EPOCH
                 A timestamp (expressed as seconds since the Unix epoch) to
                 use as the creation timestamp in place of the current
                 time.  The time is converted to human-readable form using
                 ctime(3) and recorded in an HTML comment.

          TZ     The time zone to use when converting the current time (or
                 value of SOURCE_DATE_EPOCH) to human-readable form; see
                 tzset(3).


-------------------------------------------------

::

          grohtml is still beta code.

          grohtml does not truly support hyphenation, but you can fool it
          into hyphenating long input lines, which can appear in HTML
          output with a hyphenated word followed by a space but no line
          break.


---------------------------------------------------------

::

          groff(1), troff(1), groff_font(5)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                   grohtml(1)

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
