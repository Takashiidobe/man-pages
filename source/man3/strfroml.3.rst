.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strfromd(3) — Linux manual page
===============================

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

   STRFROMD(3)             Linux Programmer's Manual            STRFROMD(3)

NAME
-------------------------------------------------

::

          strfromd, strfromf, strfroml - convert a floating-point value
          into a string


---------------------------------------------------------

::

          #include <stdlib.h>

          int strfromd(char *restrict str, size_t n,
                       const char *restrict format, double fp);
          int strfromf(char *restrict str, size_t n,
                       const char *restrict format, float fp);
          int strfroml(char *restrict str, size_t n,
                       const char *restrict format, long double fp);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strfromd(), strfromf(), strfroml():
              __STDC_WANT_IEC_60559_BFP_EXT__


---------------------------------------------------------------

::

          These functions convert a floating-point value, fp, into a string
          of characters, str, with a configurable format string.  At most n
          characters are stored into str.

          The terminating null byte ('\0') is written if and only if n is
          sufficiently large, otherwise the written string is truncated at
          n characters.

          The strfromd(), strfromf(), and strfroml() functions are
          equivalent to

              snprintf(str, n, format, fp);

          except for the format string.

      Format of the format string
          The format string must start with the character '%'.  This is
          followed by an optional precision which starts with the period
          character (.), followed by an optional decimal integer.  If no
          integer is specified after the period character, a precision of
          zero is used.  Finally, the format string should have one of the
          conversion specifiers a, A, e, E, f, F, g, or G.

          The conversion specifier is applied based on the floating-point
          type indicated by the function suffix.  Therefore, unlike
          snprintf(), the format string does not have a length modifier
          character.  See snprintf(3) for a detailed description of these
          conversion specifiers.

          The implementation conforms to the C99 standard on conversion of
          NaN and infinity values:

                 If fp is a NaN, +NaN, or -NaN, and f (or a, e, g) is the
                 conversion specifier, the conversion is to "nan", "nan",
                 or "-nan", respectively.  If F (or A, E, G) is the
                 conversion specifier, the conversion is to "NAN" or
                 "-NAN".

                 Likewise if fp is infinity, it is converted to [-]inf or
                 [-]INF.

          A malformed format string results in undefined behavior.


-----------------------------------------------------------------

::

          The strfromd(), strfromf(), and strfroml() functions return the
          number of characters that would have been written in str if n had
          enough space, not counting the terminating null byte.  Thus, a
          return value of n or greater means that the output was truncated.


---------------------------------------------------------

::

          The strfromd(), strfromf(), and strfroml() functions are
          available in glibc since version 2.25.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7) and the POSIX Safety Concepts section in GNU C
          Library manual.

          ┌─────────────────────────┬─────────────────────┬────────────────┐
          │Interface                │ Attribute           │ Value          │
          ├─────────────────────────┼─────────────────────┼────────────────┤
          │                         │ Thread safety       │ MT-Safe locale │
          │strfromd(), strfromf(),  ├─────────────────────┼────────────────┤
          │strfroml()               │ Async-signal safety │ AS-Unsafe heap │
          │                         ├─────────────────────┼────────────────┤
          │                         │ Async-cancel safety │ AC-Unsafe mem  │
          └─────────────────────────┴─────────────────────┴────────────────┘
          Note: these attributes are preliminary.


-------------------------------------------------------------------

::

          C99, ISO/IEC TS 18661-1.


---------------------------------------------------

::

          The strfromd(), strfromf(), and strfroml() functions take account
          of the LC_NUMERIC category of the current locale.


---------------------------------------------------------

::

          To convert the value 12.1 as a float type to a string using
          decimal notation, resulting in "12.100000":

              #define __STDC_WANT_IEC_60559_BFP_EXT__
              #include <stdlib.h>
              int ssize = 10;
              char s[ssize];
              strfromf(s, ssize, "%f", 12.1);

          To convert the value 12.3456 as a float type to a string using
          decimal notation with two digits of precision, resulting in
          "12.35":

              #define __STDC_WANT_IEC_60559_BFP_EXT__
              #include <stdlib.h>
              int ssize = 10;
              char s[ssize];
              strfromf(s, ssize, "%.2f", 12.3456);

          To convert the value 12.345e19 as a double type to a string using
          scientific notation with zero digits of precision, resulting in
          "1E+20":

              #define __STDC_WANT_IEC_60559_BFP_EXT__
              #include <stdlib.h>
              int ssize = 10;
              char s[ssize];
              strfromd(s, ssize, "%.E", 12.345e19);


---------------------------------------------------------

::

          atof(3), snprintf(3), strtod(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    STRFROMD(3)

--------------

Pages that refer to this page: `atof(3) <../man3/atof.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/strfromd.3.license.html>`__

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
