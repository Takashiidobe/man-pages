.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcresample(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `PCRE SAMPLE                      |                                   |
| PROGRAM <#PCRE_SAMPLE_PROGRAM>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `REVISION <#REVISION>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRESAMPLE(3)           Library Functions Manual           PCRESAMPLE(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


-------------------------------------------------------------------------------

::


          A simple, complete demonstration program, to get you started with
          using PCRE, is supplied in the file pcredemo.c in the PCRE
          distribution. A listing of this program is given in the pcredemo
          documentation. If you do not have a copy of the PCRE
          distribution, you can save this listing to re-create pcredemo.c.

          The demonstration program, which uses the original PCRE 8-bit
          library, compiles the regular expression that is its first
          argument, and matches it against the subject string in its second
          argument. No PCRE options are set, and default character tables
          are used. If matching succeeds, the program outputs the portion
          of the subject that matched, together with the contents of any
          captured substrings.

          If the -g option is given on the command line, the program then
          goes on to check for further matches of the same regular
          expression in the same subject string. The logic is a little bit
          tricky because of the possibility of matching an empty string.
          Comments in the code explain what is going on.

          If PCRE is installed in the standard include and library
          directories for your operating system, you should be able to
          compile the demonstration program using this command:

            gcc -o pcredemo pcredemo.c -lpcre

          If PCRE is installed elsewhere, you may need to add additional
          options to the command line. For example, on a Unix-like system
          that has PCRE installed in /usr/local, you can compile the
          demonstration program using a command like this:

            gcc -o pcredemo -I/usr/local/include pcredemo.c \
                -L/usr/local/lib -lpcre

          In a Windows environment, if you want to statically link the
          program against a non-dll pcre.a file, you must uncomment the
          line that defines PCRE_STATIC before including pcre.h, because
          otherwise the pcre_malloc() and pcre_free() exported functions
          will be declared __declspec(dllimport), with unwanted results.

          Once you have compiled and linked the demonstration program, you
          can run simple tests like this:

            ./pcredemo 'cat|dog' 'the cat sat on the mat'
            ./pcredemo -g 'cat|dog' 'the dog sat on the cat'

          Note that there is a much more comprehensive test program, called
          pcretest, which supports many more facilities for testing regular
          expressions and both PCRE libraries. The pcredemo program is
          provided as a simple coding example.

          If you try to run pcredemo when PCRE is not installed in the
          standard library directory, you may get an error like this on
          some operating systems (e.g. Solaris):

            ld.so.1: a.out: fatal: libpcre.so.0: open failed: No such file
          or directory

          This is caused by the way shared library support works on those
          systems. You need to add

            -R/usr/local/lib

          (for example) to the compile command to get round this problem.


-----------------------------------------------------

::


          Philip Hazel
          University Computing Service
          Cambridge CB2 3QH, England.


---------------------------------------------------------

::


          Last updated: 10 January 2012
          Copyright (c) 1997-2012 University of Cambridge.

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

   PCRE 8.30                    10 January 2012               PCRESAMPLE(3)

--------------

Pages that refer to this page: `pcreapi(3) <../man3/pcreapi.3.html>`__

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
