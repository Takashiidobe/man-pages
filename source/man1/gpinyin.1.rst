.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gpinyin(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   gpinyin(1)               General Commands Manual              gpinyin(1)


-------------------------------------------------

::

          gpinyin - use Hanyu Pinyin Chinese in groff documents


---------------------------------------------------------

::

          gpinyin [file ...]

          gpinyin -h
          gpinyin --help

          gpinyin -v
          gpinyin --version


---------------------------------------------------------------

::

          gpinyin is a preprocessor for groff(1) that facilitates use of
          Hanyu Pinyin in groff(7) files.  Pinyin is a method for writing
          the Mandarin Chinese language with the Latin alphabet.  Mandarin
          consists of more than four hundred base syllables, each spoken
          with one of five different tones.  Changing the tone applied to
          the syllable generally alters the meaning of the word it forms.
          In Pinyin, a syllable is written in the Latin alphabet and a
          numeric tone indicator can be appended to each syllable.

          Each input-file is a file name or the character “-” to indicate
          that the standard input stream should be read.  As usual, the
          argument “--” can be used in order to force interpretation of all
          remaining arguments as file names, even if an input-file argument
          begins with a “-”.  -h and --help display a usage message, while
          -v and --version show version information; all exit afterward.

      Pinyin sections
          Pinyin sections in groff files are enclosed by two .pinyin
          requests with different arguments.  The starting request is
                 .pinyin start
          or
                 .pinyin begin
          and the ending request is
                 .pinyin stop
          or
                 .pinyin end
          .

      Syllables
          In Pinyin, each syllable is represented by one to six letters
          drawn from the fifty-two upper- and lowercase letters of the
          Unicode basic Latin character set, plus the letter “U” with
          dieresis (umlaut) in both cases—in other words, the members of
          the set “[a–zA–ZüÜ]”.

          In groff input, all basic Latin letters are written as
          themselves.  The “u with dieresis” can be written as “\[:u]” in
          lowercase or “\[:U]” in uppercase.  Within .pinyin sections,
          gpinyin supports the form “ue” for lowercase and the forms “Ue”
          and “UE” for uppercase.

      Tones
          Each syllable has exactly one of five tones.  The fifth tone is
          not explicitly written at all, but each of the first through
          fourth tones is indicated with a diacritic above a specific vowel
          within the syllable.

          In a gpinyin source file, these tones are written by adding a
          numeral in the range 0 to 5 after the syllable.  The tone numbers
          1 to 4 are transformed into accents above vowels in the output.
          The tone numbers 0 and 5 are synonymous.

          The tones are written as follows.

          Tone     Description      Diacritic   Example Input   Example Output
          ─────────────────────────────────────────────────────────────────────
          first    flat             ¯           ma1             mā
          second   rising           ´           ma2             má
          third    falling-rising   ˇ           ma3             mǎ
          fourth   falling          `           ma4             mà
          fifth    neutral          (none)      ma0             ma
                                                ma5

          The neutral tone number can be omitted from a word-final
          syllable, but not otherwise.


-------------------------------------------------------

::

          gpinyin was written by Bernd Warken ⟨groff-bernd.warken-72@web
          .de⟩.


---------------------------------------------------------

::

          Useful documents on the World Wide Web related to Pinyin include
              Pinyin to Unicode 
              ⟨http://www.foolsworkshop.com/ptou/index.html⟩,
              On-line Chinese Tools ⟨http://www.mandarintools.com/⟩,
              Pinyin.info: a guide to the writing of Mandarin Chinese in
              romanization ⟨http://www.pinyin.info/index.html⟩,
              “Where do the tone marks go?”  
              ⟨http://www.pinyin.info/rules/where.html⟩,
              pinyin.txt from the CJK macro package for TeX 
              ⟨http://git.savannah.gnu.org/gitweb/?p=cjk.git;a=blob_plain
              ;f=doc/pinyin.txt;hb=HEAD⟩,
          and
              pinyin.sty from the CJK macro package for TeX 
              ⟨http://git.savannah.gnu.org/gitweb/?p=cjk.git;a=blob_plain
              ;f=texinput/pinyin.sty;hb=HEAD⟩.

          groff(1) and grog(1) explain how to view roff documents.

          groff(7) and groff_char(7) are comprehensive references covering
          the language elements of GNU troff and the available glyph
          repertoire, respectively.

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                   gpinyin(1)

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
