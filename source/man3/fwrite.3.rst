.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fread(3) — Linux manual page
============================

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

   FREAD(3)                Linux Programmer's Manual               FREAD(3)

NAME
-------------------------------------------------

::

          fread, fwrite - binary stream input/output


---------------------------------------------------------

::

          #include <stdio.h>

          size_t fread(void *restrict ptr, size_t size, size_t nmemb,
                       FILE *restrict stream);
          size_t fwrite(const void *restrict ptr, size_t size, size_t nmemb,
                       FILE *restrict stream);


---------------------------------------------------------------

::

          The function fread() reads nmemb items of data, each size bytes
          long, from the stream pointed to by stream, storing them at the
          location given by ptr.

          The function fwrite() writes nmemb items of data, each size bytes
          long, to the stream pointed to by stream, obtaining them from the
          location given by ptr.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          On success, fread() and fwrite() return the number of items read
          or written.  This number equals the number of bytes transferred
          only when size is 1.  If an error occurs, or the end of the file
          is reached, the return value is a short item count (or zero).

          The file position indicator for the stream is advanced by the
          number of bytes successfully read or written.

          fread() does not distinguish between end-of-file and error, and
          callers must use feof(3) and ferror(3) to determine which
          occurred.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fread(), fwrite()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89.


---------------------------------------------------------

::

          The program below demonstrates the use of fread() by parsing
          /bin/sh ELF executable in binary mode and printing its magic and
          class:

              $ ./a.out
              ELF magic: 0x7f454c46
              Class: 0x02

      Program source

          #include <stdio.h>
          #include <stdlib.h>

          #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

          int
          main(void)
          {
              FILE *fp = fopen("/bin/sh", "rb");
              if (!fp) {
                  perror("fopen");
                  return EXIT_FAILURE;
              }

              unsigned char buffer[4];

              size_t ret = fread(buffer, sizeof(*buffer), ARRAY_SIZE(buffer), fp);
              if (ret != ARRAY_SIZE(buffer)) {
                  fprintf(stderr, "fread() failed: %zu\n", ret);
                  exit(EXIT_FAILURE);
              }

              printf("ELF magic: %#04x%02x%02x%02x\n", buffer[0], buffer[1],
                     buffer[2], buffer[3]);

              ret = fread(buffer, 1, 1, fp);
              if (ret != 1) {
                  fprintf(stderr, "fread() failed: %zu\n", ret);
                  exit(EXIT_FAILURE);
              }

              printf("Class: %#04x\n", buffer[0]);

              fclose(fp);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          read(2), write(2), feof(3), ferror(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       FREAD(3)

--------------

Pages that refer to this page:
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`fgetc(3) <../man3/fgetc.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__,  `getw(3) <../man3/getw.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/fread.3.license.html>`__

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
