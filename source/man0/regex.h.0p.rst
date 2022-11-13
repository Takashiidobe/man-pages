.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

regex.h(0p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   regex.h(0P)             POSIX Programmer's Manual            regex.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          regex.h — regular expression matching types


---------------------------------------------------------

::

          #include <regex.h>


---------------------------------------------------------------

::

          The <regex.h> header shall define the structures and symbolic
          constants used by the regcomp(), regexec(), regerror(), and
          regfree() functions.

          The <regex.h> header shall define the regex_t structure type,
          which shall include at least the following member:

              size_t    re_nsub    Number of parenthesized subexpressions.

          The <regex.h> header shall define the size_t type as described in
          <sys/types.h>.

          The <regex.h> header shall define the regoff_t type as a signed
          integer type that can hold the largest value that can be stored
          in either a ptrdiff_t type or a ssize_t type.

          The <regex.h> header shall define the regmatch_t structure type,
          which shall include at least the following members:

              regoff_t    rm_so    Byte offset from start of string
                                   to start of substring.
              regoff_t    rm_eo    Byte offset from start of string of the
                                   first character after the end of substring.

          The <regex.h> header shall define the following symbolic
          constants for the cflags parameter to the regcomp() function:

          REG_EXTENDED  Use Extended Regular Expressions.

          REG_ICASE     Ignore case in match.

          REG_NOSUB     Report only success or fail in regexec().

          REG_NEWLINE   Change the handling of <newline>.

          The <regex.h> header shall define the following symbolic
          constants for the eflags parameter to the regexec() function:

          REG_NOTBOL    The <circumflex> character ('^'), when taken as a
                        special character, does not match the beginning of
                        string.

          REG_NOTEOL    The <dollar-sign> ('$'), when taken as a special
                        character, does not match the end of string.

          The <regex.h> header shall define the following symbolic
          constants as error return values:

          REG_NOMATCH   regexec() failed to match.

          REG_BADPAT    Invalid regular expression.

          REG_ECOLLATE  Invalid collating element referenced.

          REG_ECTYPE    Invalid character class type referenced.

          REG_EESCAPE   Trailing <backslash> character in pattern.

          REG_ESUBREG   Number in \digit invalid or in error.

          REG_EBRACK    "[]" imbalance.

          REG_EPAREN    "\(\)" or "()" imbalance.

          REG_EBRACE    "\{\}" imbalance.

          REG_BADBR     Content of "\{\}" invalid: not a number, number too
                        large, more than two numbers, first larger than
                        second.

          REG_ERANGE    Invalid endpoint in range expression.

          REG_ESPACE    Out of memory.

          REG_BADRPT    '?', '*', or '+' not preceded by valid regular
                        expression.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int    regcomp(regex_t *restrict, const char *restrict, int);
              size_t regerror(int, const regex_t *restrict, char *restrict, size_t);
              int    regexec(const regex_t *restrict, const char *restrict, size_t,
                         regmatch_t [restrict], int);
              void   regfree(regex_t *);

          The implementation may define additional macros or constants
          using names beginning with REG_.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, regcomp(3p)


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

   IEEE/The Open Group               2017                       regex.h(0P)

--------------

Pages that refer to this page: `regcomp(3p) <../man3/regcomp.3p.html>`__

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
