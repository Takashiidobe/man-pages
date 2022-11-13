.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_me(7) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Notes <#Notes>`__ \|             |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_me(7)         Miscellaneous Information Manual         groff_me(7)


-------------------------------------------------

::

          groff_me - “me” macro package for formatting documents with GNU
          roff


---------------------------------------------------------

::

          groff -me [option ...] [file ...]
          groff -m me [option ...] [file ...]


---------------------------------------------------------------

::

          The GNU implementation of the me macro package is part of the
          groff document formatting system.  The me package of macro
          definitions for the roff language provides a convenient facility
          for preparing technical papers in various formats.  This version
          is based on the me distributed with 4.4BSD and can be used with
          the GNU troff formatter as well as those descended from AT&T
          troff.

          Many roff requests are unsafe in conjunction with this package;
          however, the following requests may be used with impunity after
          the first pp macro call.

          .bp     begin new page
          .br     break output line here
          .sp n   insert n spacing lines
          .ls n   (line spacing) n=1 single, n=2 double
          .na     no alignment of right margin
          .ce n   center next n lines
          .ul n   underline next n lines

          Note: In contrast to its behavior with other macro packages and
          “raw” roff, when using the me package, the .sp request (redefined
          by me as a macro) will not put space at the top of a page.

          Output of the grn, pic, eqn, refer, and tbl preprocessors is
          acceptable as input.

      Macro reference
          Numeric arguments to macros are denoted with lowercase letters
          and string arguments with uppercase.  An optional macro argument
          such as x appears in brackets, [x].  Arguments to macros
          generally must be quoted if they contain spaces or tabs.  An
          exception is the argument to header and footer macros, which
          require some explanation.  They take the form “c left c middle c
          right c”, with spaces added here for clarity.  The strings left,
          middle, and right correspond to their page placement and can
          contain unprotected spaces and/or tabs, but must not contain the
          (non-space) character c, which delimits them.  For brevity, the
          table presents header and footer arguments as clcmcrc.  Popular
          choices for c are the neutral apostrophe “'” and the neutral
          double quote “"”.

          This list is incomplete; some requests are too complex to
          summarize in a table, and some that are listed below accept
          additional arguments not shown.  See the “-me Reference Manual”
          for further details.

          Macro             Initial   Causes   Explanation
                            Value     Break
          ──────────────────────────────────────────────────────────────────
          .(c               -         yes      Begin centered block.
          .(d               -         no       Begin delayed text.

          .(f               -         no       Begin footnote.
          .(l               -         yes      Begin list.
          .(q               -         yes      Begin major quote.
          .(x [X]           -         no       Begin item in index (named
                                               X).
          .(z               -         no       Begin floating keep.
          .)c               -         yes      End centered block.
          .)d               -         yes      End delayed text.
          .)f               -         yes      End footnote.
          .)l               -         yes      End list.
          .)q               -         yes      End major quote.
          .)x               -         yes      End index item.
          .)z               -         yes      End floating keep.
          .++ M [clcmcrc]   -         no       Define paper section as M,
                                               which must be one of C
                                               (chapter), A (appendix), P
                                               (preliminary, i.e., front
                                               matter or table of
                                               contents), AB (abstract), B
                                               (bibliography), RC (chapters
                                               renumbered from page one
                                               each chapter), or RA
                                               (appendix renumbered from
                                               page one) (and set page
                                               header to clcmcrc).
          .+c [T]           -         yes      Begin chapter (or appendix,
                                               etc., as set by .++) (with
                                               title T).
          .1c               1         yes      One-column format on a new
                                               page.
          .2c               1         yes      Two-column format.
          .EN               -         yes      Space after equation
                                               produced by eqn or neqn.
          .EQ [M [T]]       -         yes      Begin displayed equation
                                               (with indentation M, which
                                               must be one of C (centered,
                                               default), I (indented), or L
                                               (justified left) (and title
                                               T in right margin)).
          .GE               -         yes      End grn picture, leaving the
                                               current position at the
                                               bottom of the picture.
          .GF               -         yes      End grn picture, leaving the
                                               current position at the top
                                               of the picture.
          .GS               -         yes      Begin grn picture.
          .IE               -         yes      End ideal picture, leaving
                                               the current position at the
                                               bottom of the picture.
          .IF               -         yes      End ideal picture, leaving
                                               the current position at the
                                               top of the picture.
          .IS               -         yes      Begin ideal picture.
          .PE               -         yes      End pic picture, leaving the
                                               current position at the
                                               bottom of the picture.
          .PF               -         yes      End pic picture, leaving the
                                               current position at the top
                                               of the picture.
          .PS               -         yes      Begin pic picture.
          .TE               -         yes      End tbl table.
          .TH               -         yes      End heading of tbl table.
          .TS [H]           -         yes      Begin tbl table; if H, table
                                               repeats heading on each
                                               page.

          .b [X [Y]]        -         no       Print X in bold (appending Y
                                               in the previous font); if no
                                               arguments, switch to bold.
          .ba n             0         yes      Augment the base indent (for
                                               regular text, like
                                               paragraphs) by n.
          .bc               -         yes      Begin new column.
          .bi [X [Y]]       -         no       Print X in bold italics
                                               (appending Y in the previous
                                               font); if no arguments,
                                               switch to bold italics.
          .bu               -         yes      Begin bulleted paragraph.
          .bx [X [Y]]       -         no       Print X in a box (with Y
                                               appended).  Renders reliably
                                               only if filling disabled.
          .ef clcmcrc       """"      no       Set even-numbered page
                                               footer.
          .eh clcmcrc       """"      no       Set even-numbered page
                                               header.
          .fo clcmcrc       """"      no       Set page footer.
          .hx               -         no       Suppress headers and footers
                                               on next page.
          .he clcmcrc       """"      no       Set page header.
          .hl               -         yes      Draw a horizontal line.
          .i [X [Y]]        -         no       Print X in italics
                                               (appending Y in the previous
                                               font); if no arguments,
                                               switch to italics.
          .ip [X [n]]       n=5n      yes      Start indented paragraph
                                               (with hanging tag X (and
                                               indentation n)).
          .lp               -         yes      Begin paragraph with first
                                               line flush left.
          .n1               -         no       Number lines from one, in
                                               margin, on each page.
          .n2 [N]           -         no       Number lines from N, in
                                               margin.  Stop numbering if N
                                               missing; resume where
                                               stopped with number N if
                                               unsigned, or resume with
                                               number incremented by ±N.
          .np               1         yes      Start numbered paragraph.
          .of clcmcrc       """"      no       Set odd-numbered page
                                               footer.
          .oh clcmcrc       """"      no       Set odd-numbered page
                                               header.
          .pd               -         yes      Print delayed text.
          .pp               -         yes      Begin paragraph with
                                               indented first line.
          .r [X [Y]]        -         no       Print X in roman (appending
                                               Y in the previous font); if
                                               no arguments, switch to
                                               roman.
          .re               0.5i      no       Reset tabs to default
                                               values.
          .sh [n [T]]       n=1       yes      Start numbered section;
                                               print section number (set to
                                               n (and title T)) in bold.
          .sk               -         no       Leave the next page blank.
                                               Only one page is remembered
                                               ahead.
          .sm X [Y]         -         no       Print X in a smaller point
                                               size (appending Y at the
                                               previous size).

          .sz n             10p       no       Augment the point size by n
                                               points.
          .tp               -         yes      Begin title page.
          .u X [Y]          -         no       Underline X (appending Y
                                               without underlining).
                                               Renders reliably only if
                                               filling disabled.
          .uh [T]           -         yes      Start unnumbered section
                                               (and print title T in bold).
          .xp [X]           -         no       Print index (named X).


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/me.tmac (a wrapper file for
          e.tmac)
          /usr/local/share/groff/1.23.0/tmac/e.tmac


---------------------------------------------------

::

          Early roff macro packages limited themselves to a single-letter
          namespace (mm, ms, mv, mn, and so on).  The “e” in “me” stands
          for “Eric P. Allman”, who wrote the macro package and the
          original technical papers documenting it while an undergraduate
          at the University of California.


---------------------------------------------------------

::

          Two manuals are available in source and rendered form.  On your
          system, they may be compressed and/or available in additional
          formats.

          /usr/local/share/doc/groff-1.23.0/meintro.me
          /usr/local/share/doc/groff-1.23.0/meintro.ps
                 is “Writing Papers with Groff Using -me”, by Eric P.
                 Allman and James Clark.

          /usr/local/share/doc/groff-1.23.0/meref.me
          /usr/local/share/doc/groff-1.23.0/meref.ps
                 is the “-me Reference Manual”, by Eric P. Allman and James
                 Clark.

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          For preprocessors supported by me, see eqn(1), grn(1), pic(1),
          refer(1), and tbl(1).

          groff(1), troff(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                  groff_me(7)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__

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
