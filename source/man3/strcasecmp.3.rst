.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcasecmp(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCASECMP(3)           Linux Programmer's Manual          STRCASECMP(3)

NAME
-------------------------------------------------

::

          strcasecmp, strncasecmp - compare two strings ignoring case


---------------------------------------------------------

::

          #include <strings.h>

          int strcasecmp(const char *s1, const char *s2);
          int strncasecmp(const char *s1, const char *s2, size_t n);


---------------------------------------------------------------

::

          The strcasecmp() function performs a byte-by-byte comparison of
          the strings s1 and s2, ignoring the case of the characters.  It
          returns an integer less than, equal to, or greater than zero if
          s1 is found, respectively, to be less than, to match, or be
          greater than s2.

          The strncasecmp() function is similar, except that it compares no
          more than n bytes of s1 and s2.


-----------------------------------------------------------------

::

          The strcasecmp() and strncasecmp() functions return an integer
          less than, equal to, or greater than zero if s1 is, after
          ignoring case, found to be less than, to match, or be greater
          than s2, respectively.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strcasecmp(), strncasecmp()    │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          4.4BSD, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          The strcasecmp() and strncasecmp() functions first appeared in
          4.4BSD, where they were declared in <string.h>.  Thus, for
          reasons of historical compatibility, the glibc <string.h> header
          file also declares these functions, if the _DEFAULT_SOURCE (or,
          in glibc 2.19 and earlier, _BSD_SOURCE) feature test macro is
          defined.

          The POSIX.1-2008 standard says of these functions:

                 When the LC_CTYPE category of the locale being used is
                 from the POSIX locale, these functions shall behave as if
                 the strings had been converted to lowercase and then a
                 byte comparison performed.  Otherwise, the results are
                 unspecified.


---------------------------------------------------------

::

          bcmp(3), memcmp(3), strcmp(3), strcoll(3), string(3), strncmp(3),
          wcscasecmp(3), wcsncasecmp(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  STRCASECMP(3)

--------------

Pages that refer to this page: `bcmp(3) <../man3/bcmp.3.html>`__, 
`memcmp(3) <../man3/memcmp.3.html>`__, 
`strcmp(3) <../man3/strcmp.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strverscmp(3) <../man3/strverscmp.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`wcscasecmp(3) <../man3/wcscasecmp.3.html>`__, 
`wcsncasecmp(3) <../man3/wcsncasecmp.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/strcasecmp.3.license.html>`__

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
