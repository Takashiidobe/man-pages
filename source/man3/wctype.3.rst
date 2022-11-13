.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wctype(3) — Linux manual page
=============================

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

   WCTYPE(3)               Linux Programmer's Manual              WCTYPE(3)

NAME
-------------------------------------------------

::

          wctype - wide-character classification


---------------------------------------------------------

::

          #include <wctype.h>

          wctype_t wctype(const char *name);


---------------------------------------------------------------

::

          The wctype_t type represents a property which a wide character
          may or may not have.  In other words, it represents a class of
          wide characters.  This type's nature is implementation-dependent,
          but the special value (wctype_t) 0 denotes an invalid property.
          Nonzero wctype_t values can be passed to the iswctype(3) function
          to actually test whether a given wide character has the property.

          The wctype() function returns a property, given by its name.  The
          set of valid names depends on the LC_CTYPE category of the
          current locale, but the following names are valid in all locales.

              "alnum" - realizes the isalnum(3) classification function
              "alpha" - realizes the isalpha(3) classification function
              "blank" - realizes the isblank(3) classification function
              "cntrl" - realizes the iscntrl(3) classification function
              "digit" - realizes the isdigit(3) classification function
              "graph" - realizes the isgraph(3) classification function
              "lower" - realizes the islower(3) classification function
              "print" - realizes the isprint(3) classification function
              "punct" - realizes the ispunct(3) classification function
              "space" - realizes the isspace(3) classification function
              "upper" - realizes the isupper(3) classification function
              "xdigit" - realizes the isxdigit(3) classification function


-----------------------------------------------------------------

::

          The wctype() function returns a property descriptor if the name
          is valid.  Otherwise, it returns (wctype_t) 0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │wctype()                       │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of wctype() depends on the LC_CTYPE category of the
          current locale.


---------------------------------------------------------

::

          iswctype(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      WCTYPE(3)

--------------

Pages that refer to this page:
`iswctype(3) <../man3/iswctype.3.html>`__, 
`regex(7) <../man7/regex.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/wctype.3.license.html>`__

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
