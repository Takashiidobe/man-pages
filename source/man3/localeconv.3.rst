.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

localeconv(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOCALECONV(3)           Linux Programmer's Manual          LOCALECONV(3)

NAME
-------------------------------------------------

::

          localeconv - get numeric formatting information


---------------------------------------------------------

::

          #include <locale.h>

          struct lconv *localeconv(void);


---------------------------------------------------------------

::

          The localeconv() function returns a pointer to a struct lconv for
          the current locale.  This structure is shown in locale(7), and
          contains all values associated with the locale categories
          LC_NUMERIC and LC_MONETARY.  Programs may also use the functions
          printf(3) and strfmon(3), which behave according to the actual
          locale in use.


-----------------------------------------------------------------

::

          The localeconv() function returns a pointer to a filled in struct
          lconv.  This structure may be (in glibc, is) statically
          allocated, and may be overwritten by subsequent calls.  According
          to POSIX, the caller should not modify the contents of this
          structure.  The localeconv() function always succeeds.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────┬───────────────┬──────────────────────────────────┐
          │Interface    │ Attribute     │ Value                            │
          ├─────────────┼───────────────┼──────────────────────────────────┤
          │localeconv() │ Thread safety │ MT-Unsafe race:localeconv locale │
          └─────────────┴───────────────┴──────────────────────────────────┘


-------------------------------------------------------------------

::

          C89, C99.


-------------------------------------------------

::

          The printf(3) family of functions may or may not honor the
          current locale.


---------------------------------------------------------

::

          locale(1), localedef(1), isalpha(3), nl_langinfo(3),
          setlocale(3), strcoll(3), strftime(3), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                  LOCALECONV(3)

--------------

Pages that refer to this page:
`localedef(1) <../man1/localedef.1.html>`__, 
`nl_langinfo(3) <../man3/nl_langinfo.3.html>`__, 
`setlocale(3) <../man3/setlocale.3.html>`__, 
`locale(5) <../man5/locale.5.html>`__, 
`locale(7) <../man7/locale.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/localeconv.3.license.html>`__

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
