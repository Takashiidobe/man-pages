.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iswctype(3) — Linux manual page
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

   ISWCTYPE(3)             Linux Programmer's Manual            ISWCTYPE(3)

NAME
-------------------------------------------------

::

          iswctype - wide-character classification


---------------------------------------------------------

::

          #include <wctype.h>

          int iswctype(wint_t wc, wctype_t desc);


---------------------------------------------------------------

::

          If wc is a wide character having the character property
          designated by desc (or in other words: belongs to the character
          class designated by desc), the iswctype() function returns
          nonzero.  Otherwise, it returns zero.  If wc is WEOF, zero is
          returned.

          desc must be a character property descriptor returned by the
          wctype(3) function.


-----------------------------------------------------------------

::

          The iswctype() function returns nonzero if the wc has the
          designated property.  Otherwise, it returns 0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │iswctype()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of iswctype() depends on the LC_CTYPE category of
          the current locale.


---------------------------------------------------------

::

          iswalnum(3), iswalpha(3), iswblank(3), iswcntrl(3), iswdigit(3),
          iswgraph(3), iswlower(3), iswprint(3), iswpunct(3), iswspace(3),
          iswupper(3), iswxdigit(3), wctype(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    ISWCTYPE(3)

--------------

Pages that refer to this page:
`iswalnum(3) <../man3/iswalnum.3.html>`__, 
`iswalpha(3) <../man3/iswalpha.3.html>`__, 
`iswblank(3) <../man3/iswblank.3.html>`__, 
`iswcntrl(3) <../man3/iswcntrl.3.html>`__, 
`iswdigit(3) <../man3/iswdigit.3.html>`__, 
`iswgraph(3) <../man3/iswgraph.3.html>`__, 
`iswlower(3) <../man3/iswlower.3.html>`__, 
`iswprint(3) <../man3/iswprint.3.html>`__, 
`iswpunct(3) <../man3/iswpunct.3.html>`__, 
`iswspace(3) <../man3/iswspace.3.html>`__, 
`iswupper(3) <../man3/iswupper.3.html>`__, 
`iswxdigit(3) <../man3/iswxdigit.3.html>`__, 
`wctype(3) <../man3/wctype.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/iswctype.3.license.html>`__

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
