.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mempcpy(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MEMPCPY(3)              Linux Programmer's Manual             MEMPCPY(3)

NAME
-------------------------------------------------

::

          mempcpy, wmempcpy  - copy memory area


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <string.h>

          void *mempcpy(void *restrict dest, const void *restrict src, size_t n);

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <wchar.h>

          wchar_t *wmempcpy(wchar_t *restrict dest, const wchar_t *restrict src,
                            size_t n);


---------------------------------------------------------------

::

          The mempcpy() function is nearly identical to the memcpy(3)
          function.  It copies n bytes from the object beginning at src
          into the object pointed to by dest.  But instead of returning the
          value of dest it returns a pointer to the byte following the last
          written byte.

          This function is useful in situations where a number of objects
          shall be copied to consecutive memory positions.

          The wmempcpy() function is identical but takes wchar_t type
          arguments and copies n wide characters.


-----------------------------------------------------------------

::

          dest + n.


---------------------------------------------------------

::

          mempcpy() first appeared in glibc in version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │mempcpy(), wmempcpy()                 │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is a GNU extension.


---------------------------------------------------------

::

          void *
          combine(void *o1, size_t s1, void *o2, size_t s2)
          {
              void *result = malloc(s1 + s2);
              if (result != NULL)
                  mempcpy(mempcpy(result, o1, s1), o2, s2);
              return result;
          }


---------------------------------------------------------

::

          memccpy(3), memcpy(3), memmove(3), wmemcpy(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     MEMPCPY(3)

--------------

Pages that refer to this page: `memcpy(3) <../man3/memcpy.3.html>`__, 
`wmemcpy(3) <../man3/wmemcpy.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mempcpy.3.license.html>`__

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
