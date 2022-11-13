.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iswdigit(3) — Linux manual page
===============================

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

   ISWDIGIT(3)             Linux Programmer's Manual            ISWDIGIT(3)

NAME
-------------------------------------------------

::

          iswdigit - test for decimal digit wide character


---------------------------------------------------------

::

          #include <wctype.h>

          int iswdigit(wint_t wc);


---------------------------------------------------------------

::

          The iswdigit() function is the wide-character equivalent of the
          isdigit(3) function.  It tests whether wc is a wide character
          belonging to the wide-character class "digit".

          The wide-character class "digit" is a subclass of the wide-
          character class "xdigit", and therefore also a subclass of the
          wide-character class "alnum", of the wide-character class "graph"
          and of the wide-character class "print".

          Being a subclass of the wide character class "print", the wide-
          character class "digit" is disjoint from the wide-character class
          "cntrl".

          Being a subclass of the wide-character class "graph", the wide-
          character class "digit" is disjoint from the wide-character class
          "space" and its subclass "blank".

          Being a subclass of the wide-character class "alnum", the wide-
          character class "digit" is disjoint from the wide-character class
          "punct".

          The wide-character class "digit" is disjoint from the wide-
          character class "alpha" and therefore also disjoint from its
          subclasses "lower", "upper".

          The wide-character class "digit" always contains exactly the
          digits '0' to '9'.


-----------------------------------------------------------------

::

          The iswdigit() function returns nonzero if wc is a wide character
          belonging to the wide-character class "digit".  Otherwise, it
          returns zero.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │iswdigit()                     │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of iswdigit() depends on the LC_CTYPE category of
          the current locale.


---------------------------------------------------------

::

          isdigit(3), iswctype(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    ISWDIGIT(3)

--------------

Pages that refer to this page: `isalpha(3) <../man3/isalpha.3.html>`__, 
`iswctype(3) <../man3/iswctype.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/iswdigit.3.license.html>`__

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
