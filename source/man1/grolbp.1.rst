.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grolbp(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Typefaces <#Typefaces>`__ \|     |                                   |
| `Paper sizes <#Paper_sizes>`__ \| |                                   |
| `Page o                           |                                   |
| rientation <#Page_orientation>`__ |                                   |
| \|                                |                                   |
| `Font f                           |                                   |
| ile format <#Font_file_format>`__ |                                   |
| \| `Environment <#Environment>`__ |                                   |
| \| `Files <#Files>`__ \|          |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grolbp(1)                General Commands Manual               grolbp(1)


-------------------------------------------------

::

          grolbp - groff output driver for Canon CAPSL printers


---------------------------------------------------------

::

          grolbp [-l] [-c num-copies] [-F font-directory] [-o orientation]
                 [-p paper-size] [-w width] [file ...]
          grolbp [--copies=num-copies] [--fontdir=font-directory]
                 [--landscape] [--linewidth=width]
                 [--orientation=orientation] [--papersize=paper-size]
                 [file ...]

          grolbp -h
          grolbp --help

          grolbp -v
          grolbp --version


---------------------------------------------------------------

::

          grolbp is a driver for groff that produces output in CAPSL and
          VDM format suitable for Canon LBP-4 and LBP-8 printers.

          For compatibility with grolj4(1) there is an additional drawing
          command available:

          \D'R dh dv'
                 Draw a rule (i.e., a solid black rectangle), with one
                 corner at the current position, and the diagonally
                 opposite corner at the current position +(dh,dv).


-------------------------------------------------------

::

          Note that there can be whitespace between a one-letter option and
          its argument; on the other hand, there must be whitespace and/or
          an equal sign (‘=’) between a long-name option and its argument.

          -c num-copies
          --copies=num-copies
                 Print num-copies copies of each page.

          -F font-directory
          --fontdir=font-directory
                 Prepend directory font-directory/devname to the search
                 path for font and device description files; name is the
                 name of the device, usually lbp.

          -h
          --help Print a short help text.

          -l
          --landscape
                 Print the document with a landscape orientation.

          -o orientation
          --orientation=orientation
                 Print the document with orientation orientation, which
                 must be ‘portrait’ or ‘landscape’.

          -p paper-size
          --papersize=paper-size
                 Set the paper size to paper-size, which must be a valid
                 paper size description as indicated in section “Paper
                 Sizes”, below.

          -v
          --version
                 Print the version number.

          -w width
          --linewidth=width
                 Set the default line thickness to width thousandths of an
                 em.  If this option isn't specified, the line thickness
                 defaults to 0.04 em.


-----------------------------------------------------------

::

          The driver supports the Dutch, Swiss and Swiss-Narrow scalable
          typefaces, each one in the Regular, Bold, Italic and Bold-Italic
          styles.  Additionally, the Courier and Elite monospaced typefaces
          at the sizes 8 and 12 points (for Courier) resp. 8 and 10 points
          (for Elite) are supported, each one in the Regular, Bold and
          Italic styles.

          The following chart summarizes the font names you can use to
          access these fonts:

          ┌────────────────┬───────────┬────────┬──────────┬──────────────┐
          │   Typeface     │  Regular  │  Bold  │  Italic  │  Bold-Italic │
          ├────────────────┼───────────┼────────┼──────────┼──────────────┤
          │ Dutch          │    TR     │   TB   │    TI    │      TBI     │
          ├────────────────┼───────────┼────────┼──────────┼──────────────┤
          │ Swiss          │    HR     │   HB   │    HI    │      HBI     │
          ├────────────────┼───────────┼────────┼──────────┼──────────────┤
          │ Swiss Narrow   │    HNR    │  HNB   │   HNI    │     HNBI     │
          ├────────────────┼───────────┼────────┼──────────┼──────────────┤
          │ Courier        │    CR     │   CB   │    CI    │              │
          ├────────────────┼───────────┼────────┼──────────┼──────────────┤
          │ Elite          │    ER     │   EB   │    EI    │              │
          └────────────────┴───────────┴────────┴──────────┴──────────────┘


---------------------------------------------------------------

::

          The paper size can be set in the DESC file or with command-line
          options to grolbp.  If the paper size is specified both ways, the
          command-line options take precedence over the contents of the
          DESC file (this applies to the page orientation too).

          See groff_font(5) how to set the paper dimensions in the DESC
          file.

          To set the paper size in the command line, add

            -p paper-size

          or

            --papersize=paper-size

          to the other grolbp options, where paper-size is in the same
          format as in the DESC file.

          If no paper size is specified in the DESC file or the command
          line, a default size of A4 is used.


-------------------------------------------------------------------------

::

          As with the page size, the orientation of the printed page
          (portrait or landscape) can be set in the DESC file or with
          command-line options.  It is also case insensitive.

          To set the orientation in the DESC file, insert a line with the
          following content:

            orientation [portrait|landscape]

          Only the first valid orientation command in the DESC file is
          used.

          To set the page orientation with command-line options you can use
          the -o or --orientation option with the same parameters (portrait
          or landscape) as in the DESC file.  Or you can use the -l option
          to force the pages to be printed in landscape.


-------------------------------------------------------------------------

::

          In addition to the usual commands described in groff_font(5),
          grolbp provides the command lbpname which sets the font name sent
          to the printer when requesting this font.  The syntax of this
          command is:

            lbpname printer_font_name

          •      For bitmapped fonts, printer_font_name has the form

                   N⟨base_fontname⟩⟨font_style⟩

                 base_fontname is the font name as it appears in the
                 printers font listings without the first letter, up to
                 (but not including) the font size.  font_style can be one
                 of the letters R, I, or B, indicating the font styles
                 Roman, Italic and Bold respectively.

                 For instance, if the printer's font listing A shows font
                 ‘Nelite12I.ISO_USA’, the corresponding entry in the font
                 description file is

                   lbpname NeliteI

                 Note that you may need to modify grolbp to add support for
                 new bitmapped fonts, since the available font names and
                 font sizes of bitmapped fonts (as documented above) are
                 hard-coded into the program.

          •      For scalable fonts, printer_font_name is identical to the
                 font name as it appears in the printer's font listing A.

                 For instance, to select the ‘Swiss’ font in bold style,
                 which appears in the printer's font listing A as ‘Swiss-
                 Bold’, the required lbpname command line is

                   lbpname Swiss-Bold

          The argument of lbpname is case sensitive.


---------------------------------------------------------------

::

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 See troff(1) and groff_font(5).


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devlbp/DESC
                 Device description file.

          /usr/local/share/groff/1.23.0/font/devlbp/F
                 Font description file for font F.

          /usr/local/share/groff/1.23.0/tmac/lbp.tmac
                 Macros for use with grolbp.


---------------------------------------------------------

::

          groff(1), troff(1), groff_out(5), groff_font(5), groff_char(7)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                    grolbp(1)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__

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
