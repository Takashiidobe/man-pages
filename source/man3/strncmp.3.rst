.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcmp(3) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCMP(3)               Linux Programmer's Manual              STRCMP(3)

NAME
-------------------------------------------------

::

          strcmp, strncmp - compare two strings


---------------------------------------------------------

::

          #include <string.h>

          int strcmp(const char *s1, const char *s2);
          int strncmp(const char *s1, const char *s2, size_t n);


---------------------------------------------------------------

::

          The strcmp() function compares the two strings s1 and s2.  The
          locale is not taken into account (for a locale-aware comparison,
          see strcoll(3)).  The comparison is done using unsigned
          characters.

          strcmp() returns an integer indicating the result of the
          comparison, as follows:

          • 0, if the s1 and s2 are equal;

          • a negative value if s1 is less than s2;

          • a positive value if s1 is greater than s2.

          The strncmp() function is similar, except it compares only the
          first (at most) n bytes of s1 and s2.


-----------------------------------------------------------------

::

          The strcmp() and strncmp() functions return an integer less than,
          equal to, or greater than zero if s1 (or the first n bytes
          thereof) is found, respectively, to be less than, to match, or be
          greater than s2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │strcmp(), strncmp()                   │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          POSIX.1 specifies only that:

                 The sign of a nonzero return value shall be determined by
                 the sign of the difference between the values of the first
                 pair of bytes (both interpreted as type unsigned char)
                 that differ in the strings being compared.

          In glibc, as in most other implementations, the return value is
          the arithmetic result of subtracting the last compared byte in s2
          from the last compared byte in s1.  (If the two characters are
          equal, this difference is 0.)


---------------------------------------------------------

::

          The program below can be used to demonstrate the operation of
          strcmp() (when given two arguments) and strncmp() (when given
          three arguments).  First, some examples using strcmp():

              $ ./string_comp ABC ABC
              <str1> and <str2> are equal
              $ ./string_comp ABC AB      # 'C' is ASCII 67; 'C' - '\0' = 67
              <str1> is greater than <str2> (67)
              $ ./string_comp ABA ABZ     # 'A' is ASCII 65; 'Z' is ASCII 90
              <str1> is less than <str2> (-25)
              $ ./string_comp ABJ ABC
              <str1> is greater than <str2> (7)
              $ ./string_comp $'\201' A   # 0201 - 0101 = 0100 (or 64 decimal)
              <str1> is greater than <str2> (64)

          The last example uses bash(1)-specific syntax to produce a string
          containing an 8-bit ASCII code; the result demonstrates that the
          string comparison uses unsigned characters.

          And then some examples using strncmp():

              $ ./string_comp ABC AB 3
              <str1> is greater than <str2> (67)
              $ ./string_comp ABC AB 2
              <str1> and <str2> are equal in the first 2 bytes

      Program source

          /* string_comp.c

             Licensed under GNU General Public License v2 or later.
          */
          #include <stdio.h>
          #include <stdlib.h>
          #include <string.h>

          int
          main(int argc, char *argv[])
          {
              int res;

              if (argc < 3) {
                  fprintf(stderr, "Usage: %s <str1> <str2> [<len>]\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              if (argc == 3)
                  res = strcmp(argv[1], argv[2]);
              else
                  res = strncmp(argv[1], argv[2], atoi(argv[3]));

              if (res == 0) {
                  printf("<str1> and <str2> are equal");
                  if (argc > 3)
                      printf(" in the first %d bytes\n", atoi(argv[3]));
                  printf("\n");
              } else if (res < 0) {
                  printf("<str1> is less than <str2> (%d)\n", res);
              } else {
                  printf("<str1> is greater than <str2> (%d)\n", res);
              }

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          bcmp(3), memcmp(3), strcasecmp(3), strcoll(3), string(3),
          strncasecmp(3), strverscmp(3), wcscmp(3), wcsncmp(3), ascii(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      STRCMP(3)

--------------

Pages that refer to this page: `bash(1) <../man1/bash.1.html>`__, 
`bcmp(3) <../man3/bcmp.3.html>`__, 
`hsearch(3) <../man3/hsearch.3.html>`__, 
`memcmp(3) <../man3/memcmp.3.html>`__, 
`qsort(3) <../man3/qsort.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`selinux_file_context_cmp(3) <../man3/selinux_file_context_cmp.3.html>`__, 
`strcasecmp(3) <../man3/strcasecmp.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strverscmp(3) <../man3/strverscmp.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`wcscmp(3) <../man3/wcscmp.3.html>`__, 
`wcsncmp(3) <../man3/wcsncmp.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strcmp.3.license.html>`__

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
