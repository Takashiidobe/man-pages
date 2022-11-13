.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strtoul(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRTOUL(3)              Linux Programmer's Manual             STRTOUL(3)

NAME
-------------------------------------------------

::

          strtoul, strtoull, strtouq - convert a string to an unsigned long
          integer


---------------------------------------------------------

::

          #include <stdlib.h>

          unsigned long strtoul(const char *restrict nptr,
                                char **restrict endptr, int base);
          unsigned long long strtoull(const char *restrict nptr,
                                char **restrict endptr, int base);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strtoull():
              _ISOC99_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          The strtoul() function converts the initial part of the string in
          nptr to an unsigned long value according to the given base, which
          must be between 2 and 36 inclusive, or be the special value 0.

          The string may begin with an arbitrary amount of white space (as
          determined by isspace(3)) followed by a single optional '+' or
          '-' sign.  If base is zero or 16, the string may then include a
          "0x" prefix, and the number will be read in base 16; otherwise, a
          zero base is taken as 10 (decimal) unless the next character is
          '0', in which case it is taken as 8 (octal).

          The remainder of the string is converted to an unsigned long
          value in the obvious manner, stopping at the first character
          which is not a valid digit in the given base.  (In bases above
          10, the letter 'A' in either uppercase or lowercase represents
          10, 'B' represents 11, and so forth, with 'Z' representing 35.)

          If endptr is not NULL, strtoul() stores the address of the first
          invalid character in *endptr.  If there were no digits at all,
          strtoul() stores the original value of nptr in *endptr (and
          returns 0).  In particular, if *nptr is not '\0' but **endptr is
          '\0' on return, the entire string is valid.

          The strtoull() function works just like the strtoul() function
          but returns an unsigned long long value.


-----------------------------------------------------------------

::

          The strtoul() function returns either the result of the
          conversion or, if there was a leading minus sign, the negation of
          the result of the conversion represented as an unsigned value,
          unless the original (nonnegated) value would overflow; in the
          latter case, strtoul() returns ULONG_MAX and sets errno to
          ERANGE.  Precisely the same holds for strtoull() (with ULLONG_MAX
          instead of ULONG_MAX).


-----------------------------------------------------

::

          EINVAL (not in C99) The given base contains an unsupported value.

          ERANGE The resulting value was out of range.

          The implementation may also set errno to EINVAL in case no
          conversion was performed (no digits seen, and 0 returned).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strtoul(), strtoull(),         │ Thread safety │ MT-Safe locale │
          │strtouq()                      │               │                │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          strtoul(): POSIX.1-2001, POSIX.1-2008, C89, C99 SVr4.

          strtoull(): POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          Since strtoul() can legitimately return 0 or ULONG_MAX
          (ULLONG_MAX for strtoull()) on both success and failure, the
          calling program should set errno to 0 before the call, and then
          determine if an error occurred by checking whether errno has a
          nonzero value after the call.

          In locales other than the "C" locale, other strings may be
          accepted.  (For example, the thousands separator of the current
          locale may be supported.)

          BSD also has

              u_quad_t strtouq(const char *nptr, char **endptr, int base);

          with completely analogous definition.  Depending on the wordsize
          of the current architecture, this may be equivalent to strtoull()
          or to strtoul().

          Negative values are considered valid input and are silently
          converted to the equivalent unsigned long value.


---------------------------------------------------------

::

          See the example on the strtol(3) manual page; the use of the
          functions described in this manual page is similar.


---------------------------------------------------------

::

          a64l(3), atof(3), atoi(3), atol(3), strtod(3), strtol(3),
          strtoumax(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     STRTOUL(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`a64l(3) <../man3/a64l.3.html>`__,  `atof(3) <../man3/atof.3.html>`__, 
`atoi(3) <../man3/atoi.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtoimax(3) <../man3/strtoimax.3.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`bpf-helpers(7) <../man7/bpf-helpers.7.html>`__, 
`logrotate(8) <../man8/logrotate.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/strtoul.3.license.html>`__

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
