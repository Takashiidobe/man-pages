.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iswlower(3) — Linux manual page
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

   ISWLOWER(3)             Linux Programmer's Manual            ISWLOWER(3)

NAME
-------------------------------------------------

::

          iswlower - test for lowercase wide character


---------------------------------------------------------

::

          #include <wctype.h>

          int iswlower(wint_t wc);


---------------------------------------------------------------

::

          The iswlower() function is the wide-character equivalent of the
          islower(3) function.  It tests whether wc is a wide character
          belonging to the wide-character class "lower".

          The wide-character class "lower" is a subclass of the wide-
          character class "alpha", and therefore also a subclass of the
          wide-character class "alnum", of the wide-character class "graph"
          and of the wide-character class "print".

          Being a subclass of the wide-character class "print", the wide-
          character class "lower" is disjoint from the wide-character class
          "cntrl".

          Being a subclass of the wide-character class "graph", the wide-
          character class "lower" is disjoint from the wide-character class
          "space" and its subclass "blank".

          Being a subclass of the wide-character class "alnum", the wide-
          character class "lower" is disjoint from the wide-character class
          "punct".

          Being a subclass of the wide-character class "alpha", the wide-
          character class "lower" is disjoint from the wide-character class
          "digit".

          The wide-character class "lower" contains at least those
          characters wc which are equal to towlower(wc) and different from
          towupper(wc).

          The wide-character class "lower" always contains at least the
          letters 'a' to 'z'.


-----------------------------------------------------------------

::

          The iswlower() function returns nonzero if wc is a wide character
          belonging to the wide-character class "lower".  Otherwise, it
          returns zero.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │iswlower()                     │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of iswlower() depends on the LC_CTYPE category of
          the current locale.

          This function is not very appropriate for dealing with Unicode
          characters, because Unicode knows about three cases: upper,
          lower, and title case.


---------------------------------------------------------

::

          islower(3), iswctype(3), towlower(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    ISWLOWER(3)

--------------

Pages that refer to this page: `isalpha(3) <../man3/isalpha.3.html>`__, 
`iswctype(3) <../man3/iswctype.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/iswlower.3.license.html>`__

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
