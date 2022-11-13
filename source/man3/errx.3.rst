.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

err(3) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   ERR(3)                  Linux Programmer's Manual                 ERR(3)

NAME
-------------------------------------------------

::

          err, verr, errx, verrx, warn, vwarn, warnx, vwarnx - formatted
          error messages


---------------------------------------------------------

::

          #include <err.h>

          noreturn void err(int eval, const char *fmt, ...);
          noreturn void errx(int eval, const char *fmt, ...);

          void warn(const char *fmt, ...);
          void warnx(const char *fmt, ...);

          #include <stdarg.h>

          noreturn void verr(int eval, const char *fmt, va_list args);
          noreturn void verrx(int eval, const char *fmt, va_list args);

          void vwarn(const char *fmt, va_list args);
          void vwarnx(const char *fmt, va_list args);


---------------------------------------------------------------

::

          The err() and warn() family of functions display a formatted
          error message on the standard error output.  In all cases, the
          last component of the program name, a colon character, and a
          space are output.  If the fmt argument is not NULL, the
          printf(3)-like formatted error message is output.  The output is
          terminated by a newline character.

          The err(), verr(), warn(), and vwarn() functions append an error
          message obtained from strerror(3) based on the global variable
          errno, preceded by another colon and space unless the fmt
          argument is NULL.

          The errx() and warnx() functions do not append an error message.

          The err(), verr(), errx(), and verrx() functions do not return,
          but exit with the value of the argument eval.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │err(), errx(), warn(),         │ Thread safety │ MT-Safe locale │
          │warnx(), verr(), verrx(),      │               │                │
          │vwarn(), vwarnx()              │               │                │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard BSD extensions.


---------------------------------------------------------

::

          Display the current errno information string and exit:

              p = malloc(size);
              if (p == NULL)
                  err(EXIT_FAILURE, NULL);
              fd = open(file_name, O_RDONLY, 0);
              if (fd == -1)
                  err(EXIT_FAILURE, "%s", file_name);

          Display an error message and exit:

              if (tm.tm_hour < START_TIME)
                  errx(EXIT_FAILURE, "too early, wait until %s",
                          start_time_string);

          Warn of an error:

              fd = open(raw_device, O_RDONLY, 0);
              if (fd == -1)
                  warnx("%s: %s: trying the block device",
                          raw_device, strerror(errno));
              fd = open(block_device, O_RDONLY, 0);
              if (fd == -1)
                  err(EXIT_FAILURE, "%s", block_device);


---------------------------------------------------------

::

          error(3), exit(3), perror(3), printf(3), strerror(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                         ERR(3)

--------------

Pages that refer to this page: `errno(3) <../man3/errno.3.html>`__, 
`error(3) <../man3/error.3.html>`__, 
`perror(3) <../man3/perror.3.html>`__, 
`strerror(3) <../man3/strerror.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/err.3.license.html>`__

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
