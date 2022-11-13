.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tfmtodit(1) — Linux manual page
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

   tfmtodit(1)              General Commands Manual             tfmtodit(1)


-------------------------------------------------

::

          tfmtodit - adapt TeX Font Metrics files for groff -Tdvi


---------------------------------------------------------

::

          tfmtodit [-s] [-g gf-file] [-k skew-char] tfm-file map-file font

          tfmtodit --help

          tfmtodit -v
          tfmtodit --version


---------------------------------------------------------------

::

          tfmtodit creates a font file for use with the dvi output driver
          of groff(1).  tfm-file is the name of the TeX font metric file
          for the font.  map-file is a file giving the groff names for
          characters in the font; this file should consist of a sequence of
          lines of the form
                 i c1 ... cn
          where i is a decimal integer giving the position of the character
          in the font, and c1 through cn are are the groff names of the
          character.  If a character has no groff names but exists in tfm-
          file, then it will be put in the groff font file as an unnamed
          character.  The groff font file is written to font.

          The -s option should be given if the font is “special”, meaning
          that groff should search it whenever a character is not found in
          the current font.  In that case, font should be listed as an
          argument to the fonts directive in the DESC file; if it is not
          special, there is no need to list it, since groff can
          automatically mount it when it is first used.

          To do a good job of math typesetting, groff requires font metric
          information not present in tfm-file.  This is because TeX has
          separate math italic fonts, whereas groff uses normal italic
          fonts for math.  The additional information required by groff is
          given by the two arguments to the math_fit macro in the Metafont
          programs for the Computer Modern fonts.  In a text font (a font
          for which math_fit is false), Metafont normally ignores these two
          arguments.  Metafont can be made to put this information into the
          GF (“generic font”) files it produces by loading the following
          definition after cmbase when creating cm.base.
                 def ignore_math_fit(expr left_adjustment,right_adjustment) =
                     special "adjustment";
                     numspecial left_adjustment*16/designsize;
                     numspecial right_adjustment*16/designsize;
                     enddef;

          For the EC font family, load the following definition after
          exbase—it is probably easiest to patch exbase.mf locally.
                 def ignore_math_fit(expr left_adjustment,right_adjustment) =
                     ori_special "adjustment";
                     ori_numspecial left_adjustment*16/designsize;
                     ori_numspecial right_adjustment*16/designsize;
                     enddef;
          The only difference from the previous example is the “ori_”
          prefix to “special” and “numspecial”.

          The GF file created using this modified cm.base or exbase.mf
          should be specified with the -g option, which should not be given
          for a font for which math_fit is true.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -g gf-file
                 Use the gf-file produced by Metafont containing “special”
                 and numspecial commands to obtain additional font metric
                 information.

          -k skew-char
                 The skew charcter of this font is at position skew-char.
                 skew-char should be an integer; it may be given in
                 decimal, with a leading 0 in octal, or with a leading 0x
                 in hexadecimal.  Any kerns whose second component is skew-
                 char are ignored.

          -s     Add the special directive to the generated file font.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devdvi/DESC
                 Device description file.

          /usr/local/share/groff/1.23.0/font/devdvi/F
                 Font description file for font F.


---------------------------------------------------------

::

          groff(1), grodvi(1), groff_font(5)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                  tfmtodit(1)

--------------

Pages that refer to this page: `grodvi(1) <../man1/grodvi.1.html>`__

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
