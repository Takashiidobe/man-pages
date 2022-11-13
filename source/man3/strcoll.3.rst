.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcoll(3) — Linux manual page
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

   STRCOLL(3)              Linux Programmer's Manual             STRCOLL(3)

NAME
-------------------------------------------------

::

          strcoll - compare two strings using the current locale


---------------------------------------------------------

::

          #include <string.h>

          int strcoll(const char *s1, const char *s2);


---------------------------------------------------------------

::

          The strcoll() function compares the two strings s1 and s2.  It
          returns an integer less than, equal to, or greater than zero if
          s1 is found, respectively, to be less than, to match, or be
          greater than s2.  The comparison is based on strings interpreted
          as appropriate for the program's current locale for category
          LC_COLLATE.  (See setlocale(3).)


-----------------------------------------------------------------

::

          The strcoll() function returns an integer less than, equal to, or
          greater than zero if s1 is found, respectively, to be less than,
          to match, or be greater than s2, when both are interpreted as
          appropriate for the current locale.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strcoll()                      │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          In the POSIX or C locales strcoll() is equivalent to strcmp(3).


---------------------------------------------------------

::

          bcmp(3), memcmp(3), setlocale(3), strcasecmp(3), strcmp(3),
          string(3), strxfrm(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     STRCOLL(3)

--------------

Pages that refer to this page: `bash(1) <../man1/bash.1.html>`__, 
`bcmp(3) <../man3/bcmp.3.html>`__, 
`localeconv(3) <../man3/localeconv.3.html>`__, 
`memcmp(3) <../man3/memcmp.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`setlocale(3) <../man3/setlocale.3.html>`__, 
`strcasecmp(3) <../man3/strcasecmp.3.html>`__, 
`strcmp(3) <../man3/strcmp.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strverscmp(3) <../man3/strverscmp.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strcoll.3.license.html>`__

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
