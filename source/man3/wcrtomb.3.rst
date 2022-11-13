.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcrtomb(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WCRTOMB(3)              Linux Programmer's Manual             WCRTOMB(3)

NAME
-------------------------------------------------

::

          wcrtomb - convert a wide character to a multibyte sequence


---------------------------------------------------------

::

          #include <wchar.h>

          size_t wcrtomb(char *restrict s, wchar_t wc, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          The main case for this function is when s is not NULL and wc is
          not a null wide character (L'\0').  In this case, the wcrtomb()
          function converts the wide character wc to its multibyte
          representation and stores it at the beginning of the character
          array pointed to by s.  It updates the shift state *ps, and
          returns the length of said multibyte representation, that is, the
          number of bytes written at s.

          A different case is when s is not NULL, but wc is a null wide
          character (L'\0').  In this case, the wcrtomb() function stores
          at the character array pointed to by s the shift sequence needed
          to bring *ps back to the initial state, followed by a '\0' byte.
          It updates the shift state *ps (i.e., brings it into the initial
          state), and returns the length of the shift sequence plus one,
          that is, the number of bytes written at s.

          A third case is when s is NULL.  In this case, wc is ignored, and
          the function effectively returns

              wcrtomb(buf, L'\0', ps)

          where buf is an internal anonymous buffer.

          In all of the above cases, if ps is NULL, a static anonymous
          state known only to the wcrtomb() function is used instead.


-----------------------------------------------------------------

::

          The wcrtomb() function returns the number of bytes that have been
          or would have been written to the byte array at s.  If wc can not
          be represented as a multibyte sequence (according to the current
          locale), (size_t) -1 is returned, and errno set to EILSEQ.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────┬───────────────┬────────────────────────────┐
          │Interface          │ Attribute     │ Value                      │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │wcrtomb()          │ Thread safety │ MT-Unsafe race:wcrtomb/!ps │
          └───────────────────┴───────────────┴────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of wcrtomb() depends on the LC_CTYPE category of the
          current locale.

          Passing NULL as ps is not multithread safe.


---------------------------------------------------------

::

          mbsinit(3), wcsrtombs(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     WCRTOMB(3)

--------------

Pages that refer to this page: `mbsinit(3) <../man3/mbsinit.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__, 
`wctob(3) <../man3/wctob.3.html>`__, 
`wctomb(3) <../man3/wctomb.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/wcrtomb.3.license.html>`__

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
