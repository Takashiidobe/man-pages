.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

duplocale(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   DUPLOCALE(3)            Linux Programmer's Manual           DUPLOCALE(3)

NAME
-------------------------------------------------

::

          duplocale - duplicate a locale object


---------------------------------------------------------

::

          #include <locale.h>

          locale_t duplocale(locale_t locobj);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          duplocale():
              Since glibc 2.10:
                  _XOPEN_SOURCE >= 700
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The duplocale() function creates a duplicate of the locale object
          referred to by locobj.

          If locobj is LC_GLOBAL_LOCALE, duplocale() creates a locale
          object containing a copy of the global locale determined by
          setlocale(3).


-----------------------------------------------------------------

::

          On success, duplocale() returns a handle for the new locale
          object.  On error, it returns (locale_t) 0, and sets errno to
          indicate the error.


-----------------------------------------------------

::

          ENOMEM Insufficient memory to create the duplicate locale object.


---------------------------------------------------------

::

          The duplocale() function first appeared in version 2.3 of the GNU
          C library.


-------------------------------------------------------------------

::

          POSIX.1-2008.


---------------------------------------------------

::

          Duplicating a locale can serve the following purposes:

          *  To create a copy of a locale object in which one of more
             categories are to be modified (using newlocale(3)).

          *  To obtain a handle for the current locale which can used in
             other functions that employ a locale handle, such as
             toupper_l(3).  This is done by applying duplocale() to the
             value returned by the following call:

                 loc = uselocale((locale_t) 0);

             This technique is necessary, because the above uselocale(3)
             call may return the value LC_GLOBAL_LOCALE, which results in
             undefined behavior if passed to functions such as
             toupper_l(3).  Calling duplocale() can be used to ensure that
             the LC_GLOBAL_LOCALE value is converted into a usable locale
             object.  See EXAMPLES, below.

          Each locale object created by duplocale() should be deallocated
          using freelocale(3).


---------------------------------------------------------

::

          The program below uses uselocale(3) and duplocale() to obtain a
          handle for the current locale which is then passed to
          toupper_l(3).  The program takes one command-line argument, a
          string of characters that is converted to uppercase and displayed
          on standard output.  An example of its use is the following:

              $ ./a.out abc
              ABC

      Program source

          #define _XOPEN_SOURCE 700
          #include <ctype.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <locale.h>

          #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                                  } while (0)

          int
          main(int argc, char *argv[])
          {
              locale_t loc, nloc;

              if (argc != 2) {
                  fprintf(stderr, "Usage: %s string\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              /* This sequence is necessary, because uselocale() might return
                 the value LC_GLOBAL_LOCALE, which can't be passed as an
                 argument to toupper_l(). */

              loc = uselocale((locale_t) 0);
              if (loc == (locale_t) 0)
                  errExit("uselocale");

              nloc = duplocale(loc);
              if (nloc == (locale_t) 0)
                  errExit("duplocale");

              for (char *p = argv[1]; *p; p++)
                  putchar(toupper_l(*p, nloc));

              printf("\n");

              freelocale(nloc);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          freelocale(3), newlocale(3), setlocale(3), uselocale(3),
          locale(5), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   DUPLOCALE(3)

--------------

Pages that refer to this page: `isalpha(3) <../man3/isalpha.3.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`strfmon(3) <../man3/strfmon.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__, 
`towupper(3) <../man3/towupper.3.html>`__, 
`uselocale(3) <../man3/uselocale.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/duplocale.3.license.html>`__

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
