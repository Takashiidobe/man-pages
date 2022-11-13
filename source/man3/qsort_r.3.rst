.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qsort(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
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

   QSORT(3)                Linux Programmer's Manual               QSORT(3)

NAME
-------------------------------------------------

::

          qsort, qsort_r - sort an array


---------------------------------------------------------

::

          #include <stdlib.h>

          void qsort(void *base, size_t nmemb, size_t size,
                     int (*compar)(const void *, const void *));
          void qsort_r(void *base, size_t nmemb, size_t size,
                     int (*compar)(const void *, const void *, void *),
                     void *arg);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          qsort_r():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The qsort() function sorts an array with nmemb elements of size
          size.  The base argument points to the start of the array.

          The contents of the array are sorted in ascending order according
          to a comparison function pointed to by compar, which is called
          with two arguments that point to the objects being compared.

          The comparison function must return an integer less than, equal
          to, or greater than zero if the first argument is considered to
          be respectively less than, equal to, or greater than the second.
          If two members compare as equal, their order in the sorted array
          is undefined.

          The qsort_r() function is identical to qsort() except that the
          comparison function compar takes a third argument.  A pointer is
          passed to the comparison function via arg.  In this way, the
          comparison function does not need to use global variables to pass
          through arbitrary arguments, and is therefore reentrant and safe
          to use in threads.


-----------------------------------------------------------------

::

          The qsort() and qsort_r() functions return no value.


---------------------------------------------------------

::

          qsort_r() was added to glibc in version 2.8.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │qsort(), qsort_r()                    │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          qsort(): POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          To compare C strings, the comparison function can call strcmp(3),
          as shown in the example below.


---------------------------------------------------------

::

          For one example of use, see the example under bsearch(3).

          Another example is the following program, which sorts the strings
          given in its command-line arguments:

          #include <stdio.h>
          #include <stdlib.h>
          #include <string.h>

          static int
          cmpstringp(const void *p1, const void *p2)
          {
              /* The actual arguments to this function are "pointers to
                 pointers to char", but strcmp(3) arguments are "pointers
                 to char", hence the following cast plus dereference. */

              return strcmp(*(const char **) p1, *(const char **) p2);
          }

          int
          main(int argc, char *argv[])
          {
              if (argc < 2) {
                  fprintf(stderr, "Usage: %s <string>...\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              qsort(&argv[1], argc - 1, sizeof(char *), cmpstringp);

              for (int j = 1; j < argc; j++)
                  puts(argv[j]);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          sort(1), alphasort(3), strcmp(3), versionsort(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       QSORT(3)

--------------

Pages that refer to this page: `bsearch(3) <../man3/bsearch.3.html>`__, 
`fts(3) <../man3/fts.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`tsearch(3) <../man3/tsearch.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/qsort.3.license.html>`__

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
