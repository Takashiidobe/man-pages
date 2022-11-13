.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

psfaddtable(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `TABLE FI                         |                                   |
| LE FORMAT <#TABLE_FILE_FORMAT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PSFADDTABLE(1)           General Commands Manual          PSFADDTABLE(1)

NAME
-------------------------------------------------

::

          psfaddtable - add a Unicode character table to a console font


---------------------------------------------------------

::

          psfaddtable fontfile tablefile outfile


---------------------------------------------------------------

::

          psfaddtable takes a console font in .psf format given by fontfile
          and merges it with the Unicode character table given by tablefile
          to produce a font file with an embedded character table, which is
          written to outfile.  An input file name of "-" denotes standard
          input, and an output file name of "-" denotes standard output.
          If the fontfile already contains an embedded character table, it
          is ignored.


---------------------------------------------------------------------------

::

          Each line in the tablefile should be either blank, contain a
          comment (preceded by #), or contain a sequence of numbers in
          either decimal (default), octal (preceded by 0), or hexadecimal
          (preceded by 0x) format, separated by spaces or tabs.  The first
          number on each line indicates the glyph slot in the font that is
          being referred to, this is between 0 and 0xff for a 256-character
          font and 0 and 0x1ff for a 512-character font.  Any subsequent
          numbers on the same line are Unicodes matched by this specific
          glyph slot.  Instead of a single Unicode one may have a sequence
          of Unicodes separates by commas, to denote that the glyph depicts
          the corresponding composed symbol.  It is permissible to have
          multiple lines for the same glyph.


---------------------------------------------------------

::

          setfont(8), psfgettable(1), psfstriptable(1), psfxtable(1)

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

   kbd                            25 Oct 1994                PSFADDTABLE(1)

--------------

Pages that refer to this page:
`psfgettable(1) <../man1/psfgettable.1.html>`__, 
`psfstriptable(1) <../man1/psfstriptable.1.html>`__, 
`psfxtable(1) <../man1/psfxtable.1.html>`__, 
`setfont(8) <../man8/setfont.8.html>`__

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
