.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grap2graph(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grap2graph(1)            General Commands Manual           grap2graph(1)


-------------------------------------------------

::

          grap2graph - convert a GRAP diagram into a cropped image


---------------------------------------------------------

::

          grap2graph [-unsafe] [-format output-format] [convert-arguments]

          grap2graph --help

          grap2graph -v
          grap2graph --version


---------------------------------------------------------------

::

          grap2graph reads a grap(1) program from the standard input and
          writes an image file, by default in Portable Network Graphics
          (PNG) format, to the standard output.

          The input GRAP code should not be wrapped with the .G1 and .G2
          macros that normally guard it within groff(1) documents.

          Arguments not recognized by grap2graph are passed to the
          ImageMagick or GraphicsMagick program convert(1).  By specifying
          these, you can give your image a border, set the image's pixel
          density, or perform other useful transformations.

          The output image is clipped using convert's -trim option to the
          smallest possible bounding box that contains all the black
          pixels.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -format output-format
                 Write the image in output-format, which must be understood
                 by convert; the default is PNG.

          -unsafe
                 Run groff in unsafe mode, enabling the PIC command sh to
                 execute arbitrary Unix shell commands.  The groff default
                 is to forbid this.


---------------------------------------------------------------

::

          GROFF_TMPDIR
          TMPDIR
          TMP
          TEMP   These environment variables are searched in the given
                 order to determine the directory where temporary files
                 will be created.  If none are set, /tmp is used.


-------------------------------------------------------

::

          grap2graph was written by Eric S. Raymond ⟨esr@thyrsus.com⟩,
          based on a recipe for pic2graph(1), by W. Richard Stevens.


---------------------------------------------------------

::

          pic2graph(1), eqn2graph(1), grap(1), pic(1), groff(1), convert(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                grap2graph(1)

--------------

Pages that refer to this page:
`eqn2graph(1) <../man1/eqn2graph.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`pic2graph(1) <../man1/pic2graph.1.html>`__

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
