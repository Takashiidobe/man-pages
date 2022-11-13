.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getline(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   GETLINE(3)              Linux Programmer's Manual             GETLINE(3)

NAME
-------------------------------------------------

::

          getline, getdelim - delimited string input


---------------------------------------------------------

::

          #include <stdio.h>

          ssize_t getline(char **restrict lineptr, size_t *restrict n,
                          FILE *restrict stream);
          ssize_t getdelim(char **restrict lineptr, size_t *restrict n,
                          int delim, FILE *restrict stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getline(), getdelim():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          getline() reads an entire line from stream, storing the address
          of the buffer containing the text into *lineptr.  The buffer is
          null-terminated and includes the newline character, if one was
          found.

          If *lineptr is set to NULL before the call, then getline() will
          allocate a buffer for storing the line.  This buffer should be
          freed by the user program even if getline() failed.

          Alternatively, before calling getline(), *lineptr can contain a
          pointer to a malloc(3)-allocated buffer *n bytes in size.  If the
          buffer is not large enough to hold the line, getline() resizes it
          with realloc(3), updating *lineptr and *n as necessary.

          In either case, on a successful call, *lineptr and *n will be
          updated to reflect the buffer address and allocated size
          respectively.

          getdelim() works like getline(), except that a line delimiter
          other than newline can be specified as the delimiter argument.
          As with getline(), a delimiter character is not added if one was
          not present in the input before end of file was reached.


-----------------------------------------------------------------

::

          On success, getline() and getdelim() return the number of
          characters read, including the delimiter character, but not
          including the terminating null byte ('\0').  This value can be
          used to handle embedded null bytes in the line read.

          Both functions return -1 on failure to read a line (including
          end-of-file condition).  In the event of a failure, errno is set
          to indicate the error.


-----------------------------------------------------

::

          EINVAL Bad arguments (n or lineptr is NULL, or stream is not
                 valid).

          ENOMEM Allocation or reallocation of the line buffer failed.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │getline(), getdelim()                 │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          Both getline() and getdelim() were originally GNU extensions.
          They were standardized in POSIX.1-2008.


---------------------------------------------------------

::

          #define _GNU_SOURCE
          #include <stdio.h>
          #include <stdlib.h>

          int
          main(int argc, char *argv[])
          {
              FILE *stream;
              char *line = NULL;
              size_t len = 0;
              ssize_t nread;

              if (argc != 2) {
                  fprintf(stderr, "Usage: %s <file>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              stream = fopen(argv[1], "r");
              if (stream == NULL) {
                  perror("fopen");
                  exit(EXIT_FAILURE);
              }

              while ((nread = getline(&line, &len, stream)) != -1) {
                  printf("Retrieved line of length %zd:\n", nread);
                  fwrite(line, nread, 1, stdout);
              }

              free(line);
              fclose(stream);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          read(2), fgets(3), fopen(3), fread(3), scanf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     GETLINE(3)

--------------

Pages that refer to this page: `fgetc(3) <../man3/fgetc.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getline.3.license.html>`__

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
