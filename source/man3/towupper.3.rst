.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

towupper(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
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

   TOWUPPER(3)             Linux Programmer's Manual            TOWUPPER(3)

NAME
-------------------------------------------------

::

          towupper, towupper_l - convert a wide character to uppercase


---------------------------------------------------------

::

          #include <wctype.h>

          wint_t towupper(wint_t wc);
          wint_t towupper_l(wint_t wc, locale_t locale);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          towupper_l():
              Since glibc 2.10:
                  _XOPEN_SOURCE >= 700
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The towupper() function is the wide-character equivalent of the
          toupper(3) function.  If wc is a lowercase wide character, and
          there exists an uppercase equivalent in the current locale, it
          returns the uppercase equivalent of wc.  In all other cases, wc
          is returned unchanged.

          The towupper_l() function performs the same task, but performs
          the conversion based on the character type information in the
          locale specified by locale.  The behavior of towupper_l() is
          undefined if locale is the special locale object LC_GLOBAL_LOCALE
          (see duplocale(3)) or is not a valid locale object handle.

          The argument wc must be representable as a wchar_t and be a valid
          character in the locale or be the value WEOF.


-----------------------------------------------------------------

::

          If wc was convertible to uppercase, towupper() returns its
          uppercase equivalent; otherwise it returns wc.


---------------------------------------------------------

::

          The towupper_l() function first appeared in glibc 2.3.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │towupper()                     │ Thread safety │ MT-Safe locale │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │towupper_l()                   │ Thread safety │ MT-Safe        │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          towupper(): C99, POSIX.1-2001 (XSI); present as an XSI extension
          in POSIX.1-2008, but marked obsolete.

          towupper_l(): POSIX.1-2008.


---------------------------------------------------

::

          The behavior of these functions depends on the LC_CTYPE category
          of the locale.

          These functions are not very appropriate for dealing with Unicode
          characters, because Unicode knows about three cases: upper,
          lower, and title case.


---------------------------------------------------------

::

          iswupper(3), towctrans(3), towlower(3), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    TOWUPPER(3)

--------------

Pages that refer to this page:
`iswupper(3) <../man3/iswupper.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`towctrans(3) <../man3/towctrans.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__, 
`wcscasecmp(3) <../man3/wcscasecmp.3.html>`__, 
`wcsncasecmp(3) <../man3/wcsncasecmp.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/towupper.3.license.html>`__

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
