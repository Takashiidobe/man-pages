.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strtol(3) — Linux manual page
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

   STRTOL(3)               Linux Programmer's Manual              STRTOL(3)

NAME
-------------------------------------------------

::

          strtol, strtoll, strtoq - convert a string to a long integer


---------------------------------------------------------

::

          #include <stdlib.h>

          long strtol(const char *restrict nptr,
                      char **restrict endptr, int base);
          long long strtoll(const char *restrict nptr,
                      char **restrict endptr, int base);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strtoll():
              _ISOC99_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          The strtol() function converts the initial part of the string in
          nptr to a long integer value according to the given base, which
          must be between 2 and 36 inclusive, or be the special value 0.

          The string may begin with an arbitrary amount of white space (as
          determined by isspace(3)) followed by a single optional '+' or
          '-' sign.  If base is zero or 16, the string may then include a
          "0x" or "0X" prefix, and the number will be read in base 16;
          otherwise, a zero base is taken as 10 (decimal) unless the next
          character is '0', in which case it is taken as 8 (octal).

          The remainder of the string is converted to a long value in the
          obvious manner, stopping at the first character which is not a
          valid digit in the given base.  (In bases above 10, the letter
          'A' in either uppercase or lowercase represents 10, 'B'
          represents 11, and so forth, with 'Z' representing 35.)

          If endptr is not NULL, strtol() stores the address of the first
          invalid character in *endptr.  If there were no digits at all,
          strtol() stores the original value of nptr in *endptr (and
          returns 0).  In particular, if *nptr is not '\0' but **endptr is
          '\0' on return, the entire string is valid.

          The strtoll() function works just like the strtol() function but
          returns a long long integer value.


-----------------------------------------------------------------

::

          The strtol() function returns the result of the conversion,
          unless the value would underflow or overflow.  If an underflow
          occurs, strtol() returns LONG_MIN.  If an overflow occurs,
          strtol() returns LONG_MAX.  In both cases, errno is set to
          ERANGE.  Precisely the same holds for strtoll() (with LLONG_MIN
          and LLONG_MAX instead of LONG_MIN and LONG_MAX).


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
          │strtol(), strtoll(), strtoq()  │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          strtol(): POSIX.1-2001, POSIX.1-2008, C89, C99 SVr4, 4.3BSD.

          strtoll(): POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          Since strtol() can legitimately return 0, LONG_MAX, or LONG_MIN
          (LLONG_MAX or LLONG_MIN for strtoll()) on both success and
          failure, the calling program should set errno to 0 before the
          call, and then determine if an error occurred by checking whether
          errno has a nonzero value after the call.

          According to POSIX.1, in locales other than "C" and "POSIX",
          these functions may accept other, implementation-defined numeric
          strings.

          BSD also has

              quad_t strtoq(const char *nptr, char **endptr, int base);

          with completely analogous definition.  Depending on the wordsize
          of the current architecture, this may be equivalent to strtoll()
          or to strtol().


---------------------------------------------------------

::

          The program shown below demonstrates the use of strtol().  The
          first command-line argument specifies a string from which
          strtol() should parse a number.  The second (optional) argument
          specifies the base to be used for the conversion.  (This argument
          is converted to numeric form using atoi(3), a function that
          performs no error checking and has a simpler interface than
          strtol().)  Some examples of the results produced by this program
          are the following:

              $ ./a.out 123
              strtol() returned 123
              $ ./a.out '    123'
              strtol() returned 123
              $ ./a.out 123abc
              strtol() returned 123
              Further characters after number: "abc"
              $ ./a.out 123abc 55
              strtol: Invalid argument
              $ ./a.out ''
              No digits were found
              $ ./a.out 4000000000
              strtol: Numerical result out of range

      Program source

          #include <stdlib.h>
          #include <limits.h>
          #include <stdio.h>
          #include <errno.h>

          int
          main(int argc, char *argv[])
          {
              int base;
              char *endptr, *str;
              long val;

              if (argc < 2) {
                  fprintf(stderr, "Usage: %s str [base]\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              str = argv[1];
              base = (argc > 2) ? atoi(argv[2]) : 0;

              errno = 0;    /* To distinguish success/failure after call */
              val = strtol(str, &endptr, base);

              /* Check for various possible errors. */

              if (errno != 0) {
                  perror("strtol");
                  exit(EXIT_FAILURE);
              }

              if (endptr == str) {
                  fprintf(stderr, "No digits were found\n");
                  exit(EXIT_FAILURE);
              }

              /* If we got here, strtol() successfully parsed a number. */

              printf("strtol() returned %ld\n", val);

              if (*endptr != '\0')        /* Not necessarily an error... */
                  printf("Further characters after number: \"%s\"\n", endptr);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          atof(3), atoi(3), atol(3), strtod(3), strtoimax(3), strtoul(3),

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRTOL(3)

--------------

Pages that refer to this page: `pmstore(1) <../man1/pmstore.1.html>`__, 
`pmtrace(1) <../man1/pmtrace.1.html>`__, 
`atof(3) <../man3/atof.3.html>`__,  `atoi(3) <../man3/atoi.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtoimax(3) <../man3/strtoimax.3.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__, 
`groff_font(5) <../man5/groff_font.5.html>`__, 
`slapo-retcode(5) <../man5/slapo-retcode.5.html>`__, 
`bpf-helpers(7) <../man7/bpf-helpers.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strtol.3.license.html>`__

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
