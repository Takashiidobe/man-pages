.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

addftinfo(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   addftinfo(1)             General Commands Manual            addftinfo(1)


-------------------------------------------------

::

          addftinfo - add font metrics to troff fonts for use with groff


---------------------------------------------------------

::

          addftinfo [-asc-height n] [-body-depth n] [-body-height n]
                    [-cap-height n] [-comma-depth n] [-desc-depth n]
                    [-fig-height n] [-x-height n] resolution unit-width
                    font

          addftinfo --help

          addftinfo -v
          addftinfo --version


---------------------------------------------------------------

::

          addftinfo reads an AT&T troff font description file font, adds
          additional font metric information required by GNU troff(1), and
          writes the combined result to the standard output.  The
          information added is derived from the font's existing parameters
          and assumptions about traditional troff names for characters.
          Among the font metrics added are the heights and depths of
          characters (how far each extends vertically above and below the
          baseline).  The resolution and unit-width arguments should be the
          same as the corresponding parameters in the DESC file.  font is
          the name of the file describing the font; if font ends with “I”,
          the font is assumed to be oblique (or italic).


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          All other options change parameters that are used to derive the
          heights and depths.  Like the existing quantities in the font
          description file, each value n is in inches/resolution for a font
          whose point size is unit-width.

          -asc-height n
                 height of characters with ascenders, such as “b”, “d”, or
                 “l”

          -body-depth n
                 depth of characters such as parentheses

          -body-height n
                 height of characters such as parentheses

          -cap-height n
                 height of uppercase letters such as “A”

          -comma-depth n
                 depth of a comma

          -desc-depth n
                 depth of characters with descenders, such as “p”, “q”, or
                 “y”

          -fig-height
                 height of figures (numerals)

          -x-height n
                 height of lowercase letters without ascenders such as “x”

          addftinfo makes no attempt to use the specified parameters to
          infer unspecified parameters.  If a parameter is not specified,
          the default will be used.  The defaults are chosen to produce
          reasonable values for a Times font.


---------------------------------------------------------

::

          groff_font(5), groff(1), groff_char(7)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                 addftinfo(1)

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
