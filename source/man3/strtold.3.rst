.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strtod(3) — Linux manual page
=============================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRTOD(3)               Linux Programmer's Manual              STRTOD(3)

NAME
-------------------------------------------------

::

          strtod, strtof, strtold - convert ASCII string to floating-point
          number


---------------------------------------------------------

::

          #include <stdlib.h>

          double strtod(const char *restrict nptr, char **restrict endptr);
          float strtof(const char *restrict nptr, char **restrict endptr);
          long double strtold(const char *restrict nptr, char **restrict endptr);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strtof(), strtold():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The strtod(), strtof(), and strtold() functions convert the
          initial portion of the string pointed to by nptr to double,
          float, and long double representation, respectively.

          The expected form of the (initial portion of the) string is
          optional leading white space as recognized by isspace(3), an
          optional plus ('+') or minus sign ('-') and then either (i) a
          decimal number, or (ii) a hexadecimal number, or (iii) an
          infinity, or (iv) a NAN (not-a-number).

          A decimal number consists of a nonempty sequence of decimal
          digits possibly containing a radix character (decimal point,
          locale-dependent, usually '.'), optionally followed by a decimal
          exponent.  A decimal exponent consists of an 'E' or 'e', followed
          by an optional plus or minus sign, followed by a nonempty
          sequence of decimal digits, and indicates multiplication by a
          power of 10.

          A hexadecimal number consists of a "0x" or "0X" followed by a
          nonempty sequence of hexadecimal digits possibly containing a
          radix character, optionally followed by a binary exponent.  A
          binary exponent consists of a 'P' or 'p', followed by an optional
          plus or minus sign, followed by a nonempty sequence of decimal
          digits, and indicates multiplication by a power of 2.  At least
          one of radix character and binary exponent must be present.

          An infinity is either "INF" or "INFINITY", disregarding case.

          A NAN is "NAN" (disregarding case) optionally followed by a
          string, (n-char-sequence), where n-char-sequence specifies in an
          implementation-dependent way the type of NAN (see NOTES).


-----------------------------------------------------------------

::

          These functions return the converted value, if any.

          If endptr is not NULL, a pointer to the character after the last
          character used in the conversion is stored in the location
          referenced by endptr.

          If no conversion is performed, zero is returned and (unless
          endptr is null) the value of nptr is stored in the location
          referenced by endptr.

          If the correct value would cause overflow, plus or minus
          HUGE_VAL, HUGE_VALF, or HUGE_VALL is returned (according to the
          return type and sign of the value), and ERANGE is stored in
          errno.

          If the correct value would cause underflow, a value with
          magnitude no larger than DBL_MIN, FLT_MIN, or LDBL_MIN is
          returned and ERANGE is stored in errno.


-----------------------------------------------------

::

          ERANGE Overflow or underflow occurred.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strtod(), strtof(), strtold()  │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.

          strtod() was also described in C89.


---------------------------------------------------

::

          Since 0 can legitimately be returned on both success and failure,
          the calling program should set errno to 0 before the call, and
          then determine if an error occurred by checking whether errno has
          a nonzero value after the call.

          In the glibc implementation, the n-char-sequence that optionally
          follows "NAN" is interpreted as an integer number (with an
          optional '0' or '0x' prefix to select base 8 or 16) that is to be
          placed in the mantissa component of the returned value.


---------------------------------------------------------

::

          See the example on the strtol(3) manual page; the use of the
          functions described in this manual page is similar.


---------------------------------------------------------

::

          atof(3), atoi(3), atol(3), nan(3), nanf(3), nanl(3), strfromd(3),
          strtol(3), strtoul(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      STRTOD(3)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`atof(3) <../man3/atof.3.html>`__,  `atoi(3) <../man3/atoi.3.html>`__, 
`nan(3) <../man3/nan.3.html>`__,  `scanf(3) <../man3/scanf.3.html>`__, 
`strfromd(3) <../man3/strfromd.3.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strtod.3.license.html>`__

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
