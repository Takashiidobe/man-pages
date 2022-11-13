.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iconv_open(3) — Linux manual page
=================================

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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ICONV_OPEN(3)           Linux Programmer's Manual          ICONV_OPEN(3)

NAME
-------------------------------------------------

::

          iconv_open - allocate descriptor for character set conversion


---------------------------------------------------------

::

          #include <iconv.h>

          iconv_t iconv_open(const char *tocode, const char *fromcode);


---------------------------------------------------------------

::

          The iconv_open() function allocates a conversion descriptor
          suitable for converting byte sequences from character encoding
          fromcode to character encoding tocode.

          The values permitted for fromcode and tocode and the supported
          combinations are system-dependent.  For the GNU C library, the
          permitted values are listed by the iconv --list command, and all
          combinations of the listed values are supported.  Furthermore the
          GNU C library and the GNU libiconv library support the following
          two suffixes:

          //TRANSLIT
                 When the string "//TRANSLIT" is appended to tocode,
                 transliteration is activated.  This means that when a
                 character cannot be represented in the target character
                 set, it can be approximated through one or several
                 similarly looking characters.

          //IGNORE
                 When the string "//IGNORE" is appended to tocode,
                 characters that cannot be represented in the target
                 character set will be silently discarded.

          The resulting conversion descriptor can be used with iconv(3) any
          number of times.  It remains valid until deallocated using
          iconv_close(3).

          A conversion descriptor contains a conversion state.  After
          creation using iconv_open(), the state is in the initial state.
          Using iconv(3) modifies the descriptor's conversion state.  To
          bring the state back to the initial state, use iconv(3) with NULL
          as inbuf argument.


-----------------------------------------------------------------

::

          On success, iconv_open() returns a freshly allocated conversion
          descriptor.  On failure, it returns (iconv_t) -1 and sets errno
          to indicate the error.


-----------------------------------------------------

::

          The following error can occur, among others:

          EINVAL The conversion from fromcode to tocode is not supported by
                 the implementation.


---------------------------------------------------------

::

          This function is available in glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │iconv_open()                   │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SUSv2.


---------------------------------------------------------

::

          iconv(1), iconv(3), iconv_close(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                  ICONV_OPEN(3)

--------------

Pages that refer to this page: `iconv(1) <../man1/iconv.1.html>`__, 
`bind_textdomain_codeset(3) <../man3/bind_textdomain_codeset.3.html>`__, 
`iconv(3) <../man3/iconv.3.html>`__, 
`iconv_close(3) <../man3/iconv_close.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/iconv_open.3.license.html>`__

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
