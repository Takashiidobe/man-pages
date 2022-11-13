.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iconv(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ICONV(3)                Linux Programmer's Manual               ICONV(3)

NAME
-------------------------------------------------

::

          iconv - perform character set conversion


---------------------------------------------------------

::

          #include <iconv.h>

          size_t iconv(iconv_t cd,
                       char **restrict inbuf, size_t *restrict inbytesleft,
                       char **restrict outbuf, size_t *restrict outbytesleft);


---------------------------------------------------------------

::

          The iconv() function converts a sequence of characters in one
          character encoding to a sequence of characters in another
          character encoding.  The cd argument is a conversion descriptor,
          previously created by a call to iconv_open(3); the conversion
          descriptor defines the character encodings that iconv() uses for
          the conversion.  The inbuf argument is the address of a variable
          that points to the first character of the input sequence;
          inbytesleft indicates the number of bytes in that buffer.  The
          outbuf argument is the address of a variable that points to the
          first byte available in the output buffer; outbytesleft indicates
          the number of bytes available in the output buffer.

          The main case is when inbuf is not NULL and *inbuf is not NULL.
          In this case, the iconv() function converts the multibyte
          sequence starting at *inbuf to a multibyte sequence starting at
          *outbuf.  At most *inbytesleft bytes, starting at *inbuf, will be
          read.  At most *outbytesleft bytes, starting at *outbuf, will be
          written.

          The iconv() function converts one multibyte character at a time,
          and for each character conversion it increments *inbuf and
          decrements *inbytesleft by the number of converted input bytes,
          it increments *outbuf and decrements *outbytesleft by the number
          of converted output bytes, and it updates the conversion state
          contained in cd.  If the character encoding of the input is
          stateful, the iconv() function can also convert a sequence of
          input bytes to an update to the conversion state without
          producing any output bytes; such input is called a shift
          sequence.  The conversion can stop for four reasons:

          1. An invalid multibyte sequence is encountered in the input.  In
             this case, it sets errno to EILSEQ and returns (size_t) -1.
             *inbuf is left pointing to the beginning of the invalid
             multibyte sequence.

          2. The input byte sequence has been entirely converted, that is,
             *inbytesleft has gone down to 0.  In this case, iconv()
             returns the number of nonreversible conversions performed
             during this call.

          3. An incomplete multibyte sequence is encountered in the input,
             and the input byte sequence terminates after it.  In this
             case, it sets errno to EINVAL and returns (size_t) -1.  *inbuf
             is left pointing to the beginning of the incomplete multibyte
             sequence.

          4. The output buffer has no more room for the next converted
             character.  In this case, it sets errno to E2BIG and returns
             (size_t) -1.

          A different case is when inbuf is NULL or *inbuf is NULL, but
          outbuf is not NULL and *outbuf is not NULL.  In this case, the
          iconv() function attempts to set cd's conversion state to the
          initial state and store a corresponding shift sequence at
          *outbuf.  At most *outbytesleft bytes, starting at *outbuf, will
          be written.  If the output buffer has no more room for this reset
          sequence, it sets errno to E2BIG and returns (size_t) -1.
          Otherwise, it increments *outbuf and decrements *outbytesleft by
          the number of bytes written.

          A third case is when inbuf is NULL or *inbuf is NULL, and outbuf
          is NULL or *outbuf is NULL.  In this case, the iconv() function
          sets cd's conversion state to the initial state.


-----------------------------------------------------------------

::

          The iconv() function returns the number of characters converted
          in a nonreversible way during this call; reversible conversions
          are not counted.  In case of error, iconv() returns (size_t) -1
          and sets errno to indicate the error.


-----------------------------------------------------

::

          The following errors can occur, among others:

          E2BIG  There is not sufficient room at *outbuf.

          EILSEQ An invalid multibyte sequence has been encountered in the
                 input.

          EINVAL An incomplete multibyte sequence has been encountered in
                 the input.


---------------------------------------------------------

::

          This function is available in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────┬───────────────┬─────────────────┐
          │Interface                     │ Attribute     │ Value           │
          ├──────────────────────────────┼───────────────┼─────────────────┤
          │iconv()                       │ Thread safety │ MT-Safe race:cd │
          └──────────────────────────────┴───────────────┴─────────────────┘

          The iconv() function is MT-Safe, as long as callers arrange for
          mutual exclusion on the cd argument.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          In each series of calls to iconv(), the last should be one with
          inbuf or *inbuf equal to NULL, in order to flush out any
          partially converted input.

          Although inbuf and outbuf are typed as char **, this does not
          mean that the objects they point can be interpreted as C strings
          or as arrays of characters: the interpretation of character byte
          sequences is handled internally by the conversion functions.  In
          some encodings, a zero byte may be a valid part of a multibyte
          character.

          The caller of iconv() must ensure that the pointers passed to the
          function are suitable for accessing characters in the appropriate
          character set.  This includes ensuring correct alignment on
          platforms that have tight restrictions on alignment.


---------------------------------------------------------

::

          iconv_close(3), iconv_open(3), iconvconfig(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       ICONV(3)

--------------

Pages that refer to this page: `iconv(1) <../man1/iconv.1.html>`__, 
`preconv(1) <../man1/preconv.1.html>`__, 
`iconv_close(3) <../man3/iconv_close.3.html>`__, 
`iconv_open(3) <../man3/iconv_open.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbsrtowcs(3) <../man3/mbsrtowcs.3.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__, 
`iconvconfig(8) <../man8/iconvconfig.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/iconv.3.license.html>`__

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
