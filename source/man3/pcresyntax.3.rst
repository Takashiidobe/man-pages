.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcresyntax(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `PCRE REGULAR EXPR                |                                   |
| ESSION SYNTAX SUMMARY <#PCRE_REGU |                                   |
| LAR_EXPRESSION_SYNTAX_SUMMARY>`__ |                                   |
| \| `QUOTING <#QUOTING>`__ \|      |                                   |
| `CHARACTERS <#CHARACTERS>`__ \|   |                                   |
| `CHAR                             |                                   |
| ACTER TYPES <#CHARACTER_TYPES>`__ |                                   |
| \|                                |                                   |
| `GENERAL CATEGORY PROPER          |                                   |
| TIES FOR \p and \P <#GENERAL_CATE |                                   |
| GORY_PROPERTIES_FOR_\p_and_\P>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| PCRE SPECIAL CATEGORY PROPERTIES  |                                   |
| FOR \p and \P <#PCRE_SPECIAL_CATE |                                   |
| GORY_PROPERTIES_FOR_\p_and_\P>`__ |                                   |
| \|                                |                                   |
| `SCRIPT NAMES FOR \p AND \P       |                                   |
|  <#SCRIPT_NAMES_FOR_\p_AND_\P>`__ |                                   |
| \|                                |                                   |
| `CHARACTE                         |                                   |
| R CLASSES <#CHARACTER_CLASSES>`__ |                                   |
| \| `QUANTIFIERS <#QUANTIFIERS>`__ |                                   |
| \|                                |                                   |
| `ANCHORS AND SIMPLE ASSERTIONS <# |                                   |
| ANCHORS_AND_SIMPLE_ASSERTIONS>`__ |                                   |
| \|                                |                                   |
| `MATCH PO                         |                                   |
| INT RESET <#MATCH_POINT_RESET>`__ |                                   |
| \| `ALTERNATION <#ALTERNATION>`__ |                                   |
| \| `CAPTURING <#CAPTURING>`__ \|  |                                   |
| `                                 |                                   |
| ATOMIC GROUPS <#ATOMIC_GROUPS>`__ |                                   |
| \| `COMMENT <#COMMENT>`__ \|      |                                   |
| `OP                               |                                   |
| TION SETTING <#OPTION_SETTING>`__ |                                   |
| \|                                |                                   |
| `NEWLINE CO                       |                                   |
| NVENTION <#NEWLINE_CONVENTION>`__ |                                   |
| \|                                |                                   |
| `WHAT                             |                                   |
|  \R MATCHES <#WHAT_\R_MATCHES>`__ |                                   |
| \|                                |                                   |
| `LOOKAHEAD A                      |                                   |
| ND LOOKBEHIND ASSERTIONS <#LOOKAH |                                   |
| EAD_AND_LOOKBEHIND_ASSERTIONS>`__ |                                   |
| \|                                |                                   |
| `BA                               |                                   |
| CKREFERENCES <#BACKREFERENCES>`__ |                                   |
| \|                                |                                   |
| `SUBROUTINE REFERENCES (PO        |                                   |
| SSIBLY RECURSIVE) <#SUBROUTINE_RE |                                   |
| FERENCES_(POSSIBLY_RECURSIVE)>`__ |                                   |
| \|                                |                                   |
| `CONDITIONAL PA                   |                                   |
| TTERNS <#CONDITIONAL_PATTERNS>`__ |                                   |
| \|                                |                                   |
| `BACKTRACKING C                   |                                   |
| ONTROL <#BACKTRACKING_CONTROL>`__ |                                   |
| \| `CALLOUTS <#CALLOUTS>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `REVISION <#REVISION>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRESYNTAX(3)           Library Functions Manual           PCRESYNTAX(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------------------------------------------------------------------

::


          The full syntax and semantics of the regular expressions that are
          supported by PCRE are described in the pcrepattern documentation.
          This document contains a quick-reference summary of the syntax.


-------------------------------------------------------

::


            \x         where x is non-alphanumeric is a literal x
            \Q...\E    treat enclosed characters as literal


-------------------------------------------------------------

::


            \a         alarm, that is, the BEL character (hex 07)
            \cx        "control-x", where x is any ASCII character
            \e         escape (hex 1B)
            \f         form feed (hex 0C)
            \n         newline (hex 0A)
            \r         carriage return (hex 0D)
            \t         tab (hex 09)
            \0dd       character with octal code 0dd
            \ddd       character with octal code ddd, or backreference
            \o{ddd..}  character with octal code ddd..
            \xhh       character with hex code hh
            \x{hhh..}  character with hex code hhh..

          Note that \0dd is always an octal code, and that \8 and \9 are
          the literal characters "8" and "9".


-----------------------------------------------------------------------

::


            .          any character except newline;
                         in dotall mode, any character whatsoever
            \C         one data unit, even in UTF mode (best avoided)
            \d         a decimal digit
            \D         a character that is not a decimal digit
            \h         a horizontal white space character
            \H         a character that is not a horizontal white space
          character
            \N         a character that is not a newline
            \p{xx}     a character with the xx property
            \P{xx}     a character without the xx property
            \R         a newline sequence
            \s         a white space character
            \S         a character that is not a white space character
            \v         a vertical white space character
            \V         a character that is not a vertical white space
          character
            \w         a "word" character
            \W         a "non-word" character
            \X         a Unicode extended grapheme cluster

          By default, \d, \s, and \w match only ASCII characters, even in
          UTF-8 mode or in the 16- bit and 32-bit libraries. However, if
          locale-specific matching is happening, \s and \w may also match
          characters with code points in the range 128-255. If the PCRE_UCP
          option is set, the behaviour of these escape sequences is changed
          to use Unicode properties and they match many more characters.


-----------------------------------------------------------------------------------------------------------------------------

::


            C          Other
            Cc         Control
            Cf         Format
            Cn         Unassigned
            Co         Private use
            Cs         Surrogate

            L          Letter
            Ll         Lower case letter
            Lm         Modifier letter
            Lo         Other letter
            Lt         Title case letter
            Lu         Upper case letter
            L&         Ll, Lu, or Lt

            M          Mark
            Mc         Spacing mark
            Me         Enclosing mark
            Mn         Non-spacing mark

            N          Number
            Nd         Decimal number
            Nl         Letter number
            No         Other number

            P          Punctuation
            Pc         Connector punctuation
            Pd         Dash punctuation
            Pe         Close punctuation
            Pf         Final punctuation
            Pi         Initial punctuation
            Po         Other punctuation
            Ps         Open punctuation

            S          Symbol
            Sc         Currency symbol
            Sk         Modifier symbol
            Sm         Mathematical symbol
            So         Other symbol

            Z          Separator
            Zl         Line separator
            Zp         Paragraph separator
            Zs         Space separator


---------------------------------------------------------------------------------------------------------------------------------------

::


            Xan        Alphanumeric: union of properties L and N
            Xps        POSIX space: property Z or tab, NL, VT, FF, CR
            Xsp        Perl space: property Z or tab, NL, VT, FF, CR
            Xuc        Universally-named character: one that can be
                         represented by a Universal Character Name
            Xwd        Perl word: property Xan or underscore

          Perl and POSIX space are now the same. Perl added VT to its space
          character set at release 5.18 and PCRE changed at release 8.34.


-----------------------------------------------------------------------------------------------

::


          Arabic, Armenian, Avestan, Balinese, Bamum, Bassa_Vah, Batak,
          Bengali, Bopomofo, Brahmi, Braille, Buginese, Buhid,
          Canadian_Aboriginal, Carian, Caucasian_Albanian, Chakma, Cham,
          Cherokee, Common, Coptic, Cuneiform, Cypriot, Cyrillic, Deseret,
          Devanagari, Duployan, Egyptian_Hieroglyphs, Elbasan, Ethiopic,
          Georgian, Glagolitic, Gothic, Grantha, Greek, Gujarati, Gurmukhi,
          Han, Hangul, Hanunoo, Hebrew, Hiragana, Imperial_Aramaic,
          Inherited, Inscriptional_Pahlavi, Inscriptional_Parthian,
          Javanese, Kaithi, Kannada, Katakana, Kayah_Li, Kharoshthi, Khmer,
          Khojki, Khudawadi, Lao, Latin, Lepcha, Limbu, Linear_A, Linear_B,
          Lisu, Lycian, Lydian, Mahajani, Malayalam, Mandaic, Manichaean,
          Meetei_Mayek, Mende_Kikakui, Meroitic_Cursive,
          Meroitic_Hieroglyphs, Miao, Modi, Mongolian, Mro, Myanmar,
          Nabataean, New_Tai_Lue, Nko, Ogham, Ol_Chiki, Old_Italic,
          Old_North_Arabian, Old_Permic, Old_Persian, Old_South_Arabian,
          Old_Turkic, Oriya, Osmanya, Pahawh_Hmong, Palmyrene, Pau_Cin_Hau,
          Phags_Pa, Phoenician, Psalter_Pahlavi, Rejang, Runic, Samaritan,
          Saurashtra, Sharada, Shavian, Siddham, Sinhala, Sora_Sompeng,
          Sundanese, Syloti_Nagri, Syriac, Tagalog, Tagbanwa, Tai_Le,
          Tai_Tham, Tai_Viet, Takri, Tamil, Telugu, Thaana, Thai, Tibetan,
          Tifinagh, Tirhuta, Ugaritic, Vai, Warang_Citi, Yi.


---------------------------------------------------------------------------

::


            [...]       positive character class
            [^...]      negative character class
            [x-y]       range (can be used for hex characters)
            [[:xxx:]]   positive POSIX named set
            [[:^xxx:]]  negative POSIX named set

            alnum       alphanumeric
            alpha       alphabetic
            ascii       0-127
            blank       space or tab
            cntrl       control character
            digit       decimal digit
            graph       printing, excluding space
            lower       lower case letter
            print       printing, including space
            punct       printing, excluding alphanumeric
            space       white space
            upper       upper case letter
            word        same as \w
            xdigit      hexadecimal digit

          In PCRE, POSIX character set names recognize only ASCII
          characters by default, but some of them use Unicode properties if
          PCRE_UCP is set. You can use \Q...\E inside a character class.


---------------------------------------------------------------

::


            ?           0 or 1, greedy
            ?+          0 or 1, possessive
            ??          0 or 1, lazy
            *           0 or more, greedy
            *+          0 or more, possessive
            *?          0 or more, lazy
            +           1 or more, greedy
            ++          1 or more, possessive
            +?          1 or more, lazy
            {n}         exactly n
            {n,m}       at least n, no more than m, greedy
            {n,m}+      at least n, no more than m, possessive
            {n,m}?      at least n, no more than m, lazy
            {n,}        n or more, greedy
            {n,}+       n or more, possessive
            {n,}?       n or more, lazy


---------------------------------------------------------------------------------------------------

::


            \b          word boundary
            \B          not a word boundary
            ^           start of subject
                         also after internal newline in multiline mode
            \A          start of subject
            $           end of subject
                         also before newline at end of subject
                         also before internal newline in multiline mode
            \Z          end of subject
                         also before newline at end of subject
            \z          end of subject
            \G          first matching position in subject


---------------------------------------------------------------------------

::


            \K          reset start of match

          \K is honoured in positive assertions, but ignored in negative
          ones.


---------------------------------------------------------------

::


            expr|expr|expr...


-----------------------------------------------------------

::


            (...)           capturing group
            (?<name>...)    named capturing group (Perl)
            (?'name'...)    named capturing group (Perl)
            (?P<name>...)   named capturing group (Python)
            (?:...)         non-capturing group
            (?|...)         non-capturing group; reset group numbers for
                             capturing groups in each alternative


-------------------------------------------------------------------

::


            (?>...)         atomic, non-capturing group


-------------------------------------------------------

::


            (?#....)        comment (not nestable)


---------------------------------------------------------------------

::


            (?i)            caseless
            (?J)            allow duplicate names
            (?m)            multiline
            (?s)            single line (dotall)
            (?U)            default ungreedy (lazy)
            (?x)            extended (ignore white space)
            (?-...)         unset option(s)

          The following are recognized only at the very start of a pattern
          or after one of the newline or \R options with similar syntax.
          More than one of them may appear.

            (*LIMIT_MATCH=d) set the match limit to d (decimal number)
            (*LIMIT_RECURSION=d) set the recursion limit to d (decimal
          number)
            (*NO_AUTO_POSSESS) no auto-possessification
          (PCRE_NO_AUTO_POSSESS)
            (*NO_START_OPT) no start-match optimization
          (PCRE_NO_START_OPTIMIZE)
            (*UTF8)         set UTF-8 mode: 8-bit library (PCRE_UTF8)
            (*UTF16)        set UTF-16 mode: 16-bit library (PCRE_UTF16)
            (*UTF32)        set UTF-32 mode: 32-bit library (PCRE_UTF32)
            (*UTF)          set appropriate UTF mode for the library in use
            (*UCP)          set PCRE_UCP (use Unicode properties for \d
          etc)

          Note that LIMIT_MATCH and LIMIT_RECURSION can only reduce the
          value of the limits set by the caller of pcre_exec(), not
          increase them.


-----------------------------------------------------------------------------

::


          These are recognized only at the very start of the pattern or
          after option settings with a similar syntax.

            (*CR)           carriage return only
            (*LF)           linefeed only
            (*CRLF)         carriage return followed by linefeed
            (*ANYCRLF)      all three of the above
            (*ANY)          any Unicode newline sequence


------------------------------------------------------------------------

::


          These are recognized only at the very start of the pattern or
          after option setting with a similar syntax.

            (*BSR_ANYCRLF)  CR, LF, or CRLF
            (*BSR_UNICODE)  any Unicode newline sequence


---------------------------------------------------------------------------------------------------------------

::


            (?=...)         positive look ahead
            (?!...)         negative look ahead
            (?<=...)        positive look behind
            (?<!...)        negative look behind

          Each top-level branch of a look behind must be of a fixed length.


---------------------------------------------------------------------

::


            \n              reference by number (can be ambiguous)
            \gn             reference by number
            \g{n}           reference by number
            \g{-n}          relative reference by number
            \k<name>        reference by name (Perl)
            \k'name'        reference by name (Perl)
            \g{name}        reference by name (Perl)
            \k{name}        reference by name (.NET)
            (?P=name)       reference by name (Python)


-----------------------------------------------------------------------------------------------------------------------------

::


            (?R)            recurse whole pattern
            (?n)            call subpattern by absolute number
            (?+n)           call subpattern by relative number
            (?-n)           call subpattern by relative number
            (?&name)        call subpattern by name (Perl)
            (?P>name)       call subpattern by name (Python)
            \g<name>        call subpattern by name (Oniguruma)
            \g'name'        call subpattern by name (Oniguruma)
            \g<n>           call subpattern by absolute number (Oniguruma)
            \g'n'           call subpattern by absolute number (Oniguruma)
            \g<+n>          call subpattern by relative number (PCRE
          extension)
            \g'+n'          call subpattern by relative number (PCRE
          extension)
            \g<-n>          call subpattern by relative number (PCRE
          extension)
            \g'-n'          call subpattern by relative number (PCRE
          extension)


---------------------------------------------------------------------------------

::


            (?(condition)yes-pattern)
            (?(condition)yes-pattern|no-pattern)

            (?(n)...        absolute reference condition
            (?(+n)...       relative reference condition
            (?(-n)...       relative reference condition
            (?(<name>)...   named reference condition (Perl)
            (?('name')...   named reference condition (Perl)
            (?(name)...     named reference condition (PCRE)
            (?(R)...        overall recursion condition
            (?(Rn)...       specific group recursion condition
            (?(R&name)...   specific recursion condition
            (?(DEFINE)...   define subpattern for reference
            (?(assert)...   assertion condition


---------------------------------------------------------------------------------

::


          The following act immediately they are reached:

            (*ACCEPT)       force successful match
            (*FAIL)         force backtrack; synonym (*F)
            (*MARK:NAME)    set name to be passed back; synonym (*:NAME)

          The following act only when a subsequent match failure causes a
          backtrack to reach them. They all force a match failure, but they
          differ in what happens afterwards. Those that advance the start-
          of-match point do so only if the pattern is not anchored.

            (*COMMIT)       overall failure, no advance of starting point
            (*PRUNE)        advance to next starting character
            (*PRUNE:NAME)   equivalent to (*MARK:NAME)(*PRUNE)
            (*SKIP)         advance to current matching position
            (*SKIP:NAME)    advance to position corresponding to an earlier
                            (*MARK:NAME); if not found, the (*SKIP) is
          ignored
            (*THEN)         local failure, backtrack to next alternation
            (*THEN:NAME)    equivalent to (*MARK:NAME)(*THEN)


---------------------------------------------------------

::


            (?C)      callout
            (?Cn)     callout with data n


---------------------------------------------------------

::


          pcrepattern(3), pcreapi(3), pcrecallout(3), pcrematching(3),
          pcre(3).


-----------------------------------------------------

::


          Philip Hazel
          University Computing Service
          Cambridge CB2 3QH, England.


---------------------------------------------------------

::


          Last updated: 08 January 2014
          Copyright (c) 1997-2014 University of Cambridge.

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCRE (Perl Compatible Regular
          Expressions) project.  Information about the project can be found
          at ⟨http://www.pcre.org/⟩.  If you have a bug report for this
          manual page, see
          ⟨http://bugs.exim.org/enter_bug.cgi?product=PCRE⟩.  This page was
          obtained from the tarball pcre-8.45.tar.gz fetched from
          ⟨ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   PCRE 8.35                    08 January 2014               PCRESYNTAX(3)

--------------

Pages that refer to this page: `grep(1) <../man1/grep.1.html>`__, 
`pcregrep(1) <../man1/pcregrep.1.html>`__, 
`pcrepattern(3) <../man3/pcrepattern.3.html>`__

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
