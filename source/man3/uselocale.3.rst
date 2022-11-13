.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uselocale(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   USELOCALE(3)            Linux Programmer's Manual           USELOCALE(3)

NAME
-------------------------------------------------

::

          uselocale - set/get the locale for the calling thread


---------------------------------------------------------

::

          #include <locale.h>

          locale_t uselocale(locale_t newloc);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          uselocale():
              Since glibc 2.10:
                  _XOPEN_SOURCE >= 700
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The uselocale() function sets the current locale for the calling
          thread, and returns the thread's previously current locale.
          After a successful call to uselocale(), any calls by this thread
          to functions that depend on the locale will operate as though the
          locale has been set to newloc.

          The newloc argument can have one of the following values:

          A handle returned by a call to newlocale(3) or duplocale(3)
                 The calling thread's current locale is set to the
                 specified locale.

          The special locale object handle LC_GLOBAL_LOCALE
                 The calling thread's current locale is set to the global
                 locale determined by setlocale(3).

          (locale_t) 0
                 The calling thread's current locale is left unchanged (and
                 the current locale is returned as the function result).


-----------------------------------------------------------------

::

          On success, uselocale() returns the locale handle that was set by
          the previous call to uselocale() in this thread, or
          LC_GLOBAL_LOCALE if there was no such previous call.  On error,
          it returns (locale_t) 0, and sets errno to indicate the error.


-----------------------------------------------------

::

          EINVAL newloc does not refer to a valid locale object.


---------------------------------------------------------

::

          The uselocale() function first appeared in version 2.3 of the GNU
          C library.


-------------------------------------------------------------------

::

          POSIX.1-2008.


---------------------------------------------------

::

          Unlike setlocale(3), uselocale() does not allow selective
          replacement of individual locale categories.  To employ a locale
          that differs in only a few categories from the current locale,
          use calls to duplocale(3) and newlocale(3) to obtain a locale
          object equivalent to the current locale and modify the desired
          categories in that object.


---------------------------------------------------------

::

          See newlocale(3) and duplocale(3).


---------------------------------------------------------

::

          locale(1), duplocale(3), freelocale(3), newlocale(3),
          setlocale(3), locale(5), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   USELOCALE(3)

--------------

Pages that refer to this page:
`duplocale(3) <../man3/duplocale.3.html>`__, 
`isalpha(3) <../man3/isalpha.3.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`locale(5) <../man5/locale.5.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/uselocale.3.license.html>`__

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
