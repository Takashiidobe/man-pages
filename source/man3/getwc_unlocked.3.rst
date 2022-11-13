.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

unlocked_stdio(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UNLOCKED_STDIO(3)       Linux Programmer's Manual      UNLOCKED_STDIO(3)

NAME
-------------------------------------------------

::

          getc_unlocked, getchar_unlocked, putc_unlocked, putchar_unlocked
          - nonlocking stdio functions


---------------------------------------------------------

::

          #include <stdio.h>

          int getc_unlocked(FILE *stream);
          int getchar_unlocked(void);
          int putc_unlocked(int c, FILE *stream);
          int putchar_unlocked(int c);

          void clearerr_unlocked(FILE *stream);
          int feof_unlocked(FILE *stream);
          int ferror_unlocked(FILE *stream);
          int fileno_unlocked(FILE *stream);
          int fflush_unlocked(FILE *stream);

          int fgetc_unlocked(FILE *stream);
          int fputc_unlocked(int c, FILE *stream);

          size_t fread_unlocked(void *restrict ptr, size_t size, size_t n,
                                FILE *restrict stream);
          size_t fwrite_unlocked(const void *restrict ptr, size_t size, size_t n,
                                FILE *restrict stream);

          char *fgets_unlocked(char *restrict s, int n, FILE *restrict stream);
          int fputs_unlocked(const char *restrict s, FILE *restrict stream);

          #include <wchar.h>

          wint_t getwc_unlocked(FILE *stream);
          wint_t getwchar_unlocked(void);
          wint_t fgetwc_unlocked(FILE *stream);

          wint_t fputwc_unlocked(wchar_t wc, FILE *stream);
          wint_t putwc_unlocked(wchar_t wc, FILE *stream);
          wint_t putwchar_unlocked(wchar_t wc);

          wchar_t *fgetws_unlocked(wchar_t *restrict ws, int n,
                                FILE *restrict stream);
          int fputws_unlocked(const wchar_t *restrict ws,
                                FILE *restrict stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getc_unlocked(), getchar_unlocked(), putc_unlocked(),
          putchar_unlocked():
              /* Since glibc 2.24: */ _POSIX_C_SOURCE >= 199309L
                  || /* Glibc <= 2.23: */ _POSIX_C_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE

          clearerr_unlocked(), feof_unlocked(), ferror_unlocked(),
          fileno_unlocked(), fflush_unlocked(), fgetc_unlocked(),
          fputc_unlocked(), fread_unlocked(), fwrite_unlocked():
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE

          fgets_unlocked(), fputs_unlocked(), getwc_unlocked(),
          getwchar_unlocked(), fgetwc_unlocked(), fputwc_unlocked(),
          putwchar_unlocked(), fgetws_unlocked(), fputws_unlocked():
              _GNU_SOURCE


---------------------------------------------------------------

::

          Each of these functions has the same behavior as its counterpart
          without the "_unlocked" suffix, except that they do not use
          locking (they do not set locks themselves, and do not test for
          the presence of locks set by others) and hence are thread-unsafe.
          See flockfile(3).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────┬───────────────┬──────────────────────────┐
          │Interface            │ Attribute     │ Value                    │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │getc_unlocked(),     │ Thread safety │ MT-Safe race:stream      │
          │putc_unlocked(),     │               │                          │
          │clearerr_unlocked(), │               │                          │
          │fflush_unlocked(),   │               │                          │
          │fgetc_unlocked(),    │               │                          │
          │fputc_unlocked(),    │               │                          │
          │fread_unlocked(),    │               │                          │
          │fwrite_unlocked(),   │               │                          │
          │fgets_unlocked(),    │               │                          │
          │fputs_unlocked(),    │               │                          │
          │getwc_unlocked(),    │               │                          │
          │fgetwc_unlocked(),   │               │                          │
          │fputwc_unlocked(),   │               │                          │
          │putwc_unlocked(),    │               │                          │
          │fgetws_unlocked(),   │               │                          │
          │fputws_unlocked()    │               │                          │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │getchar_unlocked(),  │ Thread safety │ MT-Unsafe race:stdin     │
          │getwchar_unlocked()  │               │                          │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │putchar_unlocked(),  │ Thread safety │ MT-Unsafe race:stdout    │
          │putwchar_unlocked()  │               │                          │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │feof_unlocked(),     │ Thread safety │ MT-Safe                  │
          │ferror_unlocked(),   │               │                          │
          │fileno_unlocked()    │               │                          │
          └─────────────────────┴───────────────┴──────────────────────────┘


-------------------------------------------------------------------

::

          The four functions getc_unlocked(), getchar_unlocked(),
          putc_unlocked(), putchar_unlocked() are in POSIX.1-2001 and
          POSIX.1-2008.

          The nonstandard *_unlocked() variants occur on a few UNIX
          systems, and are available in recent glibc.  They should probably
          not be used.


---------------------------------------------------------

::

          flockfile(3), stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22              UNLOCKED_STDIO(3)

--------------

Pages that refer to this page: `ferror(3) <../man3/ferror.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`fgetc(3) <../man3/fgetc.3.html>`__, 
`fgetwc(3) <../man3/fgetwc.3.html>`__, 
`fgetws(3) <../man3/fgetws.3.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`fputwc(3) <../man3/fputwc.3.html>`__, 
`fputws(3) <../man3/fputws.3.html>`__, 
`fread(3) <../man3/fread.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`getwchar(3) <../man3/getwchar.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`putwchar(3) <../man3/putwchar.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/unlocked_stdio.3.license.html>`__

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
