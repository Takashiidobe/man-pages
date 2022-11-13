.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bsearch(3) — Linux manual page
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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BSEARCH(3)              Linux Programmer's Manual             BSEARCH(3)

NAME
-------------------------------------------------

::

          bsearch - binary search of a sorted array


---------------------------------------------------------

::

          #include <stdlib.h>

          void *bsearch(const void *key, const void *base,
                        size_t nmemb, size_t size,
                        int (*compar)(const void *, const void *));


---------------------------------------------------------------

::

          The bsearch() function searches an array of nmemb objects, the
          initial member of which is pointed to by base, for a member that
          matches the object pointed to by key.  The size of each member of
          the array is specified by size.

          The contents of the array should be in ascending sorted order
          according to the comparison function referenced by compar.  The
          compar routine is expected to have two arguments which point to
          the key object and to an array member, in that order, and should
          return an integer less than, equal to, or greater than zero if
          the key object is found, respectively, to be less than, to match,
          or be greater than the array member.


-----------------------------------------------------------------

::

          The bsearch() function returns a pointer to a matching member of
          the array, or NULL if no match is found.  If there are multiple
          elements that match the key, the element returned is unspecified.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │bsearch()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------------

::

          The example below first sorts an array of structures using
          qsort(3), then retrieves desired elements using bsearch().

          #include <stdio.h>
          #include <stdlib.h>
          #include <string.h>

          struct mi {
              int nr;
              char *name;
          } months[] = {
              { 1, "jan" }, { 2, "feb" }, { 3, "mar" }, { 4, "apr" },
              { 5, "may" }, { 6, "jun" }, { 7, "jul" }, { 8, "aug" },
              { 9, "sep" }, {10, "oct" }, {11, "nov" }, {12, "dec" }
          };

          #define nr_of_months (sizeof(months)/sizeof(months[0]))

          static int
          compmi(const void *m1, const void *m2)
          {
              const struct mi *mi1 = m1;
              const struct mi *mi2 = m2;
              return strcmp(mi1->name, mi2->name);
          }

          int
          main(int argc, char *argv[])
          {
              qsort(months, nr_of_months, sizeof(months[0]), compmi);
              for (int i = 1; i < argc; i++) {
                  struct mi key;
                  struct mi *res;

                  key.name = argv[i];
                  res = bsearch(&key, months, nr_of_months,
                                sizeof(months[0]), compmi);
                  if (res == NULL)
                      printf("'%s': unknown month\n", argv[i]);
                  else
                      printf("%s: month #%d\n", res->name, res->nr);
              }
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          hsearch(3), lsearch(3), qsort(3), tsearch(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-08-27                     BSEARCH(3)

--------------

Pages that refer to this page: `hsearch(3) <../man3/hsearch.3.html>`__, 
`lsearch(3) <../man3/lsearch.3.html>`__, 
`qsort(3) <../man3/qsort.3.html>`__, 
`tsearch(3) <../man3/tsearch.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/bsearch.3.license.html>`__

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
