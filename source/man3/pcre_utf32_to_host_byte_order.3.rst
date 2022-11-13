.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcre_utf32_to_host_byte_order(3) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRE_UTF32_TO_HOST_BYTE_ORDER(3)FunctionsCManual32_TO_HOST_BYTE_ORDER(3)

NAME
-------------------------------------------------

::

          PCRE - Perl-compatible regular expressions


---------------------------------------------------------

::


          #include <pcre.h>

          int pcre32_utf32_to_host_byte_order(PCRE_UCHAR32 *output,
               PCRE_SPTR32 input, int length, int *host_byte_order,
               int keep_boms);


---------------------------------------------------------------

::


          This function, which exists only in the 32-bit library, converts
          a UTF-32 string to the correct order for the current host, taking
          account of any byte order marks (BOMs) within the string. Its
          arguments are:

            output           pointer to output buffer, may be the same as
          input
            input            pointer to input buffer
            length           number of 32-bit units in the input, or
          negative for
                               a zero-terminated string
            host_byte_order  a NULL value or a non-zero value pointed to
          means
                               start in host byte order
            keep_boms        if non-zero, BOMs are copied to the output
          string

          The result of the function is the number of 32-bit units placed
          into the output buffer, including the zero terminator if the
          string was zero-terminated.

          If host_byte_order is not NULL, it is set to indicate the byte
          order that is current at the end of the string.

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

   PCRE 8.30                     24 June 201P2CRE_UTF32_TO_HOST_BYTE_ORDER(3)

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
