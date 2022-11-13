.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_rfc1345(7) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_rfc1345(7)    Miscellaneous Information Manual    groff_rfc1345(7)


-------------------------------------------------

::

          groff_rfc1345 - special character names from RFC 1345 and Vim
          digraphs


---------------------------------------------------------------

::

          The file rfc1345.tmac defines special character escape sequences
          for groff(7) based on the glyph mnemonics specified in RFC 1345
          and the digraph table of the text editor Vim.  Each escape
          translates to a Unicode code point, and will render correctly if
          the underlying font is a Unicode font that covers the code point.

          For example, “\[Rx]” is the “recipe” or “prescription take”
          symbol, and maps to the code point U+211E.  groff lets you write
          it as “\[u211E]”, but “\[Rx]” is more mnemonic.

          For a list of the glyph names provided, please see the file
          rfc1345.tmac, which contains definitions of the form
                 .char \[Rx] \[u211E]    \" PRESCRIPTION TAKE
          where .char's first argument defines a groff special character
          escape sequence with a mnemonic glyph name, its second argument
          is a special character escape sequence based on the code point,
          and the comment describes the glyph defined.

          The RFC 1345 glyph names cover a wide range of Unicode code
          points, including supplemental Latin, Greek, Cyrillic, Hebrew,
          Arabic, Hiragana, Katakana, and Bopomofo letters, punctuation,
          math notation, currency symbols, industrial and entertainment
          icons, and box-drawing symbols.

          The Vim digraph table is practically a subset of RFC 1345 (being
          limited to two-character mnemonics), but, as a newer system, adds
          four new mnemonics not specified in the RFC (the horizontal
          ellipsis, the Euro sign, and two mappings for the rouble sign).
          These have also been added to rfc1345.tmac.

          rfc1345.tmac contains a total of 1,696 glyph names.  It is not an
          error to load rfc1345.tmac if your font does not have all the
          glyphs, as long as it contains the glyphs that you actually use
          in your document.

          The RFC 1345 mnemonics are not identical in every case to the
          mappings for special character glyph names that are built in to
          groff; for example, “\[<<]” means the “much less than” sign
          (U+226A) when rfc1345.tmac is not loaded and this special
          character is not otherwise defined by a document or macro
          package.  rfc1345.tmac redefines “\[<<]” to the “left-pointing
          double angle quotation mark” (U+00AB).  See groff_char(7) for the
          full list of predefined special character escapes.

      Usage
          Load the rfc1345.tmac file.  This can be done by either adding
          “.mso rfc1345.tmac” to your document before the first use of any
          of the glyph names the macro file defines, or by using the
          troff(1) option “-m rfc1345” from the shell.

      Bugs
          As the groff Texinfo manual notes, “[o]nly the current font is
          checked for ligatures and kerns; neither special fonts nor
          entities defined with the char request (and its siblings) are
          taken into account.”  Many of the characters defined in
          rfc1345.tmac are accented Latin letters, and will be affected by
          this deficiency, producing subpar typography 
          ⟨https://savannah.gnu.org/bugs/?59932⟩.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/rfc1345.tmac
                 implements the character mappings.


-------------------------------------------------------

::

          rfc1345.tmac was contributed by Dorai Sitaram
          ⟨ds26gte@yahoo.com⟩.


---------------------------------------------------------

::

          RFC 1345 ⟨https://tools.ietf.org/html/rfc1345⟩, by Keld Simonsen,
          June 1992.

          The Vim digraph table can be listed using the vim(1) command
          “:help digraph-table”.

          groff_char(7)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021             groff_rfc1345(7)

--------------

Pages that refer to this page:
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__

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
