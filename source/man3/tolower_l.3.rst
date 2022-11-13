.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

toupper(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TOUPPER(3)              Linux Programmer's Manual             TOUPPER(3)

NAME
-------------------------------------------------

::

          toupper, tolower, toupper_l, tolower_l - convert uppercase or
          lowercase


---------------------------------------------------------

::

          #include <ctype.h>

          int toupper(int c);
          int tolower(int c);

          int toupper_l(int c, locale_t locale);
          int tolower_l(int c, locale_t locale);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          toupper_l(), tolower_l():
              Since glibc 2.10:
                  _XOPEN_SOURCE >= 700
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          These functions convert lowercase letters to uppercase, and vice
          versa.

          If c is a lowercase letter, toupper() returns its uppercase
          equivalent, if an uppercase representation exists in the current
          locale.  Otherwise, it returns c.  The toupper_l() function
          performs the same task, but uses the locale referred to by the
          locale handle locale.

          If c is an uppercase letter, tolower() returns its lowercase
          equivalent, if a lowercase representation exists in the current
          locale.  Otherwise, it returns c.  The tolower_l() function
          performs the same task, but uses the locale referred to by the
          locale handle locale.

          If c is neither an unsigned char value nor EOF, the behavior of
          these functions is undefined.

          The behavior of toupper_l() and tolower_l() is undefined if
          locale is the special locale object LC_GLOBAL_LOCALE (see
          duplocale(3)) or is not a valid locale object handle.


-----------------------------------------------------------------

::

          The value returned is that of the converted letter, or c if the
          conversion was not possible.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │toupper(), tolower(), toupper_l(),    │ Thread safety │ MT-Safe │
          │tolower_l()                           │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          toupper(), tolower(): C89, C99, 4.3BSD, POSIX.1-2001,
          POSIX.1-2008.

          toupper_l(), tolower_l(): POSIX.1-2008.


---------------------------------------------------

::

          The standards require that the argument c for these functions is
          either EOF or a value that is representable in the type unsigned
          char.  If the argument c is of type char, it must be cast to
          unsigned char, as in the following example:

              char c;
              ...
              res = toupper((unsigned char) c);

          This is necessary because char may be the equivalent signed char,
          in which case a byte where the top bit is set would be sign
          extended when converting to int, yielding a value that is outside
          the range of unsigned char.

          The details of what constitutes an uppercase or lowercase letter
          depend on the locale.  For example, the default "C" locale does
          not know about umlauts, so no conversion is done for them.

          In some non-English locales, there are lowercase letters with no
          corresponding uppercase equivalent; the German sharp s is one
          example.


---------------------------------------------------------

::

          isalpha(3), newlocale(3), setlocale(3), towlower(3), towupper(3),
          uselocale(3), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     TOUPPER(3)

--------------

Pages that refer to this page:
`duplocale(3) <../man3/duplocale.3.html>`__, 
`isalpha(3) <../man3/isalpha.3.html>`__, 
`toascii(3) <../man3/toascii.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__, 
`towupper(3) <../man3/towupper.3.html>`__, 
`wctrans(3) <../man3/wctrans.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/toupper.3.license.html>`__

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
