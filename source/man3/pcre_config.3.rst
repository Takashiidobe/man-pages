.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcre_config(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRE_CONFIG(3)          Library Functions Manual          PCRE_CONFIG(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------

::


          #include <pcre.h>

          int pcre_config(int what, void *where);

          int pcre16_config(int what, void *where);

          int pcre32_config(int what, void *where);


---------------------------------------------------------------

::


          This function makes it possible for a client program to find out
          which optional features are available in the version of the PCRE
          library it is using. The arguments are as follows:

            what     A code specifying what information is required
            where    Points to where to put the data

          The where argument must point to an integer variable, except for
          PCRE_CONFIG_MATCH_LIMIT, PCRE_CONFIG_MATCH_LIMIT_RECURSION, and
          PCRE_CONFIG_PARENS_LIMIT, when it must point to an unsigned long
          integer, and for PCRE_CONFIG_JITTARGET, when it must point to a
          const char*.  The available codes are:

            PCRE_CONFIG_JIT           Availability of just-in-time compiler
                                        support (1=yes 0=no)
            PCRE_CONFIG_JITTARGET     String containing information about
          the
                                        target architecture for the JIT
          compiler,
                                        or NULL if there is no JIT support
            PCRE_CONFIG_LINK_SIZE     Internal link size: 2, 3, or 4
            PCRE_CONFIG_PARENS_LIMIT  Parentheses nesting limit
            PCRE_CONFIG_MATCH_LIMIT   Internal resource limit
            PCRE_CONFIG_MATCH_LIMIT_RECURSION
                                      Internal recursion depth limit
            PCRE_CONFIG_NEWLINE       Value of the default newline
          sequence:
                                          13 (0x000d)    for CR
                                          10 (0x000a)    for LF
                                        3338 (0x0d0a)    for CRLF
                                          -2             for ANYCRLF
                                          -1             for ANY
            PCRE_CONFIG_BSR           Indicates what \R matches by default:
                                           0             all Unicode line
          endings
                                           1             CR, LF, or CRLF
          only
            PCRE_CONFIG_POSIX_MALLOC_THRESHOLD
                                      Threshold of return slots, above
          which
                                        malloc() is used by the POSIX API
            PCRE_CONFIG_STACKRECURSE  Recursion implementation (1=stack
          0=heap)
            PCRE_CONFIG_UTF16         Availability of UTF-16 support (1=yes
                                         0=no); option for pcre16_config()
            PCRE_CONFIG_UTF32         Availability of UTF-32 support (1=yes
                                         0=no); option for pcre32_config()
            PCRE_CONFIG_UTF8          Availability of UTF-8 support (1=yes
          0=no);
                                        option for pcre_config()
            PCRE_CONFIG_UNICODE_PROPERTIES
                                      Availability of Unicode property
          support
                                        (1=yes 0=no)

          The function yields 0 on success or PCRE_ERROR_BADOPTION
          otherwise. That error is also given if PCRE_CONFIG_UTF16 or
          PCRE_CONFIG_UTF32 is passed to pcre_config(), if PCRE_CONFIG_UTF8
          or PCRE_CONFIG_UTF32 is passed to pcre16_config(), or if
          PCRE_CONFIG_UTF8 or PCRE_CONFIG_UTF16 is passed to
          pcre32_config().

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

   PCRE 8.36                     20 April 2014               PCRE_CONFIG(3)

--------------

Pages that refer to this page:
`pcrebuild(3) <../man3/pcrebuild.3.html>`__

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
