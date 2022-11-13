.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strtod(3p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRTOD(3P)              POSIX Programmer's Manual             STRTOD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          strtod, strtof, strtold — convert a string to a double-precision
          number


---------------------------------------------------------

::

          #include <stdlib.h>

          double strtod(const char *restrict nptr, char **restrict endptr);
          float strtof(const char *restrict nptr, char **restrict endptr);
          long double strtold(const char *restrict nptr, char **restrict endptr);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          These functions shall convert the initial portion of the string
          pointed to by nptr to double, float, and long double
          representation, respectively. First, they decompose the input
          string into three parts:

           1. An initial, possibly empty, sequence of white-space
              characters (as specified by isspace())

           2. A subject sequence interpreted as a floating-point constant
              or representing infinity or NaN

           3. A final string of one or more unrecognized characters,
              including the terminating NUL character of the input string

          Then they shall attempt to convert the subject sequence to a
          floating-point number, and return the result.

          The expected form of the subject sequence is an optional '+' or
          '-' sign, then one of the following:

           *  A non-empty sequence of decimal digits optionally containing
              a radix character; then an optional exponent part consisting
              of the character 'e' or the character 'E', optionally
              followed by a '+' or '-' character, and then followed by one
              or more decimal digits

           *  A 0x or 0X, then a non-empty sequence of hexadecimal digits
              optionally containing a radix character; then an optional
              binary exponent part consisting of the character 'p' or the
              character 'P', optionally followed by a '+' or '-' character,
              and then followed by one or more decimal digits

           *  One of INF or INFINITY, ignoring case

           *  One of NAN or NAN(n-char-sequenceopt), ignoring case in the
              NAN part, where:

                  n-char-sequence:
                      digit
                      nondigit
                      n-char-sequence digit
                      n-char-sequence nondigit

          The subject sequence is defined as the longest initial
          subsequence of the input string, starting with the first non-
          white-space character, that is of the expected form. The subject
          sequence contains no characters if the input string is not of the
          expected form.

          If the subject sequence has the expected form for a floating-
          point number, the sequence of characters starting with the first
          digit or the decimal-point character (whichever occurs first)
          shall be interpreted as a floating constant of the C language,
          except that the radix character shall be used in place of a
          period, and that if neither an exponent part nor a radix
          character appears in a decimal floating-point number, or if a
          binary exponent part does not appear in a hexadecimal floating-
          point number, an exponent part of the appropriate type with value
          zero is assumed to follow the last digit in the string. If the
          subject sequence begins with a <hyphen-minus>, the sequence shall
          be interpreted as negated. A character sequence INF or INFINITY
          shall be interpreted as an infinity, if representable in the
          return type, else as if it were a floating constant that is too
          large for the range of the return type. A character sequence NAN
          or NAN(n-char-sequenceopt) shall be interpreted as a quiet NaN,
          if supported in the return type, else as if it were a subject
          sequence part that does not have the expected form; the meaning
          of the n-char sequences is implementation-defined. A pointer to
          the final string is stored in the object pointed to by endptr,
          provided that endptr is not a null pointer.

          If the subject sequence has the hexadecimal form and FLT_RADIX is
          a power of 2, the value resulting from the conversion is
          correctly rounded.

          The radix character is defined in the current locale (category
          LC_NUMERIC).  In the POSIX locale, or in a locale where the radix
          character is not defined, the radix character shall default to a
          <period> ('.').

          In other than the C or POSIX locale, additional locale-specific
          subject sequence forms may be accepted.

          If the subject sequence is empty or does not have the expected
          form, no conversion shall be performed; the value of nptr is
          stored in the object pointed to by endptr, provided that endptr
          is not a null pointer.

          These functions shall not change the setting of errno if
          successful.

          Since 0 is returned on error and is also a valid return on
          success, an application wishing to check for error situations
          should set errno to 0, then call strtod(), strtof(), or
          strtold(), then check errno.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return the
          converted value. If no conversion could be performed, 0 shall be
          returned, and errno may be set to [EINVAL].

          If the correct value is outside the range of representable
          values, ±HUGE_VAL, ±HUGE_VALF, or ±HUGE_VALL shall be returned
          (according to the sign of the value), and errno shall be set to
          [ERANGE].

          If the correct value would cause an underflow, a value whose
          magnitude is no greater than the smallest normalized positive
          number in the return type shall be returned and errno set to
          [ERANGE].


-----------------------------------------------------

::

          These functions shall fail if:

          ERANGE The value to be returned would cause overflow or
                 underflow.

          These functions may fail if:

          EINVAL No conversion could be performed.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If the subject sequence has the hexadecimal form and FLT_RADIX is
          not a power of 2, and the result is not exactly representable,
          the result should be one of the two numbers in the appropriate
          internal format that are adjacent to the hexadecimal floating
          source value, with the extra stipulation that the error should
          have a correct sign for the current rounding direction.

          If the subject sequence has the decimal form and at most
          DECIMAL_DIG (defined in <float.h>) significant digits, the result
          should be correctly rounded. If the subject sequence D has the
          decimal form and more than DECIMAL_DIG significant digits,
          consider the two bounding, adjacent decimal strings L and U, both
          having DECIMAL_DIG significant digits, such that the values of L,
          D, and U satisfy L <= D <= U.  The result should be one of the
          (equal or adjacent) values that would be obtained by correctly
          rounding L and U according to the current rounding direction,
          with the extra stipulation that the error with respect to D
          should have a correct sign for the current rounding direction.

          The changes to strtod() introduced by the ISO/IEC 9899:1999
          standard can alter the behavior of well-formed applications
          complying with the ISO/IEC 9899:1990 standard and thus earlier
          versions of this standard. One such example would be:

              int
              what_kind_of_number (char *s)
              {
                  char *endp;
                  double d;
                  long l;

                  d = strtod(s, &endp);
                  if (s != endp && *endp == `\0')
                      printf("It's a float with value %g\n", d);
                  else
                  {
                      l = strtol(s, &endp, 0);
                      if (s != endp && *endp == `\0')
                          printf("It's an integer with value %ld\n", 1);
                      else
                          return 1;
                  }
                  return 0;
              }

          If the function is called with:

              what_kind_of_number ("0x10")

          an ISO/IEC 9899:1990 standard-compliant library will result in
          the function printing:

              It's an integer with value 16

          With the ISO/IEC 9899:1999 standard, the result is:

              It's a float with value 16

          The change in behavior is due to the inclusion of floating-point
          numbers in hexadecimal notation without requiring that either a
          decimal point or the binary exponent be present.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fscanf(3p), isspace(3p), localeconv(3p), setlocale(3p),
          strtol(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 7, Locale,
          float.h(0p), stdlib.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                        STRTOD(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`awk(1p) <../man1/awk.1p.html>`__, 
`printf(1p) <../man1/printf.1p.html>`__, 
`atof(3p) <../man3/atof.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`nan(3p) <../man3/nan.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`strtol(3p) <../man3/strtol.3p.html>`__, 
`strtold(3p) <../man3/strtold.3p.html>`__, 
`strtoul(3p) <../man3/strtoul.3p.html>`__

--------------

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
