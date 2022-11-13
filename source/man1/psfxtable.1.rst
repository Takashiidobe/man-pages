.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

psfxtable(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PSFXTABLE(1)             General Commands Manual            PSFXTABLE(1)

NAME
-------------------------------------------------

::

          psfxtable - handle Unicode character tables for console fonts


---------------------------------------------------------

::

          psfxtable [-i infont] [-o outfont] [-it intable] [-ot outtable]
          [-nt]


---------------------------------------------------------------

::

          psfxtable handles the embedded Unicode character table for .psf
          format console fonts. It reads a font and possibly a table and
          writes a font and/or a table.  psfaddtable(1), psfgettable(1) and
          psfstriptable(1) are links to it.

          Each of the filenames infont, outfont, intable, and outtable may
          be replaced by a single dash (-), in which case standard input or
          standard output is used.  If no -i option is given, the font is
          read from standard input.  If no -it or -o or -ot option is
          given, no input table is read or no output font or output table
          is written.

          By default the output font (if any) will have a Unicode table
          when either the input font has one, or an explicit table (which
          overrides an input font table) has been provided.  The option -nt
          causes output of a font without table.  When outfont is requested
          it will get a psf1 header when infont has a psf1 header and
          intable does not have sequences and a psf2 header otherwise.


---------------------------------------------------------

::

          setfont(8), psfaddtable(1), psfgettable(1), psfstriptable(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the kbd (Linux keyboard tools) project.
          Information about the project can be found at 
          ⟨http://www.kbd-project.org/⟩.  If you have a bug report for this
          manual page, send it to kbd@lists.altlinux.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/legionus/kbd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-04.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   kbd                            9 Dec 1999                   PSFXTABLE(1)

--------------

Pages that refer to this page:
`psfaddtable(1) <../man1/psfaddtable.1.html>`__, 
`psfgettable(1) <../man1/psfgettable.1.html>`__, 
`psfstriptable(1) <../man1/psfstriptable.1.html>`__

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
