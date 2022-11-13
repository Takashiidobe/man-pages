.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

isgreater(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ISGREATER(3)            Linux Programmer's Manual           ISGREATER(3)

NAME
-------------------------------------------------

::

          isgreater, isgreaterequal, isless, islessequal, islessgreater,
          isunordered - floating-point relational tests without exception
          for NaN


---------------------------------------------------------

::

          #include <math.h>

          int isgreater(x, y);
          int isgreaterequal(x, y);
          int isless(x, y);
          int islessequal(x, y);
          int islessgreater(x, y);
          int isunordered(x, y);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

              All functions described here:
                  _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The normal relational operations (like <, "less than") fail if
          one of the operands is NaN.  This will cause an exception.  To
          avoid this, C99 defines the macros listed below.

          These macros are guaranteed to evaluate their arguments only
          once.  The arguments must be of real floating-point type (note:
          do not pass integer values as arguments to these macros, since
          the arguments will not be promoted to real-floating types).

          isgreater()
                 determines (x) > (y) without an exception if x or y is
                 NaN.

          isgreaterequal()
                 determines (x) >= (y) without an exception if x or y is
                 NaN.

          isless()
                 determines (x) < (y) without an exception if x or y is
                 NaN.

          islessequal()
                 determines (x) <= (y) without an exception if x or y is
                 NaN.

          islessgreater()
                 determines (x) < (y) || (x) > (y) without an exception if
                 x or y is NaN.  This macro is not equivalent to x != y
                 because that expression is true if x or y is NaN.

          isunordered()
                 determines whether its arguments are unordered, that is,
                 whether at least one of the arguments is a NaN.


-----------------------------------------------------------------

::

          The macros other than isunordered() return the result of the
          relational comparison; these macros return 0 if either argument
          is a NaN.

          isunordered() returns 1 if x or y is NaN and 0 otherwise.


-----------------------------------------------------

::

          No errors occur.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │isgreater(), isgreaterequal(),        │ Thread safety │ MT-Safe │
          │isless(), islessequal(),              │               │         │
          │islessgreater(), isunordered()        │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          Not all hardware supports these functions, and where hardware
          support isn't provided, they will be emulated by macros.  This
          will result in a performance penalty.  Don't use these functions
          if NaN is of no concern for you.


---------------------------------------------------------

::

          fpclassify(3), isnan(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   ISGREATER(3)

--------------

Pages that refer to this page:
`fpclassify(3) <../man3/fpclassify.3.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/isgreater.3.license.html>`__

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
