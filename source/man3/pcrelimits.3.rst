.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcrelimits(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SIZE AND OTHER LIMITATIONS       |                                   |
|  <#SIZE_AND_OTHER_LIMITATIONS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `REVISION <#REVISION>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRELIMITS(3)           Library Functions Manual           PCRELIMITS(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------------------------------------------

::


          There are some size limitations in PCRE but it is hoped that they
          will never in practice be relevant.

          The maximum length of a compiled pattern is approximately 64K
          data units (bytes for the 8-bit library, 16-bit units for the
          16-bit library, and 32-bit units for the 32-bit library) if PCRE
          is compiled with the default internal linkage size, which is 2
          bytes for the 8-bit and 16-bit libraries, and 4 bytes for the
          32-bit library. If you want to process regular expressions that
          are truly enormous, you can compile PCRE with an internal linkage
          size of 3 or 4 (when building the 16-bit or 32-bit library, 3 is
          rounded up to 4). See the README file in the source distribution
          and the pcrebuild documentation for details. In these cases the
          limit is substantially larger.  However, the speed of execution
          is slower.

          All values in repeating quantifiers must be less than 65536.

          There is no limit to the number of parenthesized subpatterns, but
          there can be no more than 65535 capturing subpatterns. There is,
          however, a limit to the depth of nesting of parenthesized
          subpatterns of all kinds. This is imposed in order to limit the
          amount of system stack used at compile time. The limit can be
          specified when PCRE is built; the default is 250.

          There is a limit to the number of forward references to
          subsequent subpatterns of around 200,000. Repeated forward
          references with fixed upper limits, for example, (?2){0,100} when
          subpattern number 2 is to the right, are included in the count.
          There is no limit to the number of backward references.

          The maximum length of name for a named subpattern is 32
          characters, and the maximum number of named subpatterns is 10000.

          The maximum length of a name in a (*MARK), (*PRUNE), (*SKIP), or
          (*THEN) verb is 255 for the 8-bit library and 65535 for the
          16-bit and 32-bit libraries.

          The maximum length of a subject string is the largest positive
          number that an integer variable can hold. However, when using the
          traditional matching function, PCRE uses recursion to handle
          subpatterns and indefinite repetition.  This means that the
          available stack space may limit the size of a subject string that
          can be processed by certain patterns. For a discussion of stack
          issues, see the pcrestack documentation.


-----------------------------------------------------

::


          Philip Hazel
          University Computing Service
          Cambridge CB2 3QH, England.


---------------------------------------------------------

::


          Last updated: 05 November 2013
          Copyright (c) 1997-2013 University of Cambridge.

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

   PCRE 8.34                   05 November 2013               PCRELIMITS(3)

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
