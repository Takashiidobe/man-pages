.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcre_fullinfo(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRE_FULLINFO(3)        Library Functions Manual        PCRE_FULLINFO(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------

::


          #include <pcre.h>

          int pcre_fullinfo(const pcre *code, const pcre_extra *extra,
               int what, void *where);

          int pcre16_fullinfo(const pcre16 *code, const pcre16_extra *extra,
               int what, void *where);

          int pcre32_fullinfo(const pcre32 *code, const pcre32_extra *extra,
               int what, void *where);


---------------------------------------------------------------

::


          This function returns information about a compiled pattern. Its
          arguments are:

            code                      Compiled regular expression
            extra                     Result of pcre[16|32]_study() or NULL
            what                      What information is required
            where                     Where to put the information

          The following information is available:

            PCRE_INFO_BACKREFMAX      Number of highest back reference
            PCRE_INFO_CAPTURECOUNT    Number of capturing subpatterns
            PCRE_INFO_DEFAULT_TABLES  Pointer to default tables
            PCRE_INFO_FIRSTBYTE       Fixed first data unit for a match, or
                                        -1 for start of string
                                           or after newline, or
                                        -2 otherwise
            PCRE_INFO_FIRSTTABLE      Table of first data units (after
          studying)
            PCRE_INFO_HASCRORLF       Return 1 if explicit CR or LF matches
          exist
            PCRE_INFO_JCHANGED        Return 1 if (?J) or (?-J) was used
            PCRE_INFO_JIT             Return 1 after successful JIT
          compilation
            PCRE_INFO_JITSIZE         Size of JIT compiled code
            PCRE_INFO_LASTLITERAL     Literal last data unit required
            PCRE_INFO_MINLENGTH       Lower bound length of matching
          strings
            PCRE_INFO_MATCHEMPTY      Return 1 if the pattern can match an
          empty string,
                                         0 otherwise
            PCRE_INFO_MATCHLIMIT      Match limit if set, otherwise
          PCRE_RROR_UNSET
            PCRE_INFO_MAXLOOKBEHIND   Length (in characters) of the longest
          lookbehind assertion
            PCRE_INFO_NAMECOUNT       Number of named subpatterns
            PCRE_INFO_NAMEENTRYSIZE   Size of name table entry
            PCRE_INFO_NAMETABLE       Pointer to name table
            PCRE_INFO_OKPARTIAL       Return 1 if partial matching can be
          tried
                                        (always returns 1 after release
          8.00)
            PCRE_INFO_OPTIONS         Option bits used for compilation
            PCRE_INFO_SIZE            Size of compiled pattern
            PCRE_INFO_STUDYSIZE       Size of study data
            PCRE_INFO_FIRSTCHARACTER      Fixed first data unit for a match
            PCRE_INFO_FIRSTCHARACTERFLAGS Returns
                                            1 if there is a first data
          character set, which can
                                              then be retrieved using
          PCRE_INFO_FIRSTCHARACTER,
                                            2 if the first character is at
          the start of the data
                                              string or after a newline,
          and
                                            0 otherwise
            PCRE_INFO_RECURSIONLIMIT    Recursion limit if set, otherwise
          PCRE_ERROR_UNSET
            PCRE_INFO_REQUIREDCHAR      Literal last data unit required
            PCRE_INFO_REQUIREDCHARFLAGS Returns 1 if the last data
          character is set (which can then
                                        be retrieved using
          PCRE_INFO_REQUIREDCHAR); 0 otherwise

          The where argument must point to an integer variable, except for
          the following what values:

            PCRE_INFO_DEFAULT_TABLES  const uint8_t *
            PCRE_INFO_FIRSTCHARACTER  uint32_t
            PCRE_INFO_FIRSTTABLE      const uint8_t *
            PCRE_INFO_JITSIZE         size_t
            PCRE_INFO_MATCHLIMIT      uint32_t
            PCRE_INFO_NAMETABLE       PCRE_SPTR16           (16-bit
          library)
            PCRE_INFO_NAMETABLE       PCRE_SPTR32           (32-bit
          library)
            PCRE_INFO_NAMETABLE       const unsigned char * (8-bit library)
            PCRE_INFO_OPTIONS         unsigned long int
            PCRE_INFO_SIZE            size_t
            PCRE_INFO_STUDYSIZE       size_t
            PCRE_INFO_RECURSIONLIMIT  uint32_t
            PCRE_INFO_REQUIREDCHAR    uint32_t

          The yield of the function is zero on success or:

            PCRE_ERROR_NULL           the argument code was NULL
                                      the argument where was NULL
            PCRE_ERROR_BADMAGIC       the "magic number" was not found
            PCRE_ERROR_BADOPTION      the value of what was invalid
            PCRE_ERROR_UNSET          the option was not set

          There is a complete description of the PCRE native API in the
          pcreapi page and a description of the POSIX API in the pcreposix
          page.

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

   PCRE 8.36                     21 April 2014             PCRE_FULLINFO(3)

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
