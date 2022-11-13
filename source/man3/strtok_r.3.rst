.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strtok(3) — Linux manual page
=============================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRTOK(3)               Linux Programmer's Manual              STRTOK(3)

NAME
-------------------------------------------------

::

          strtok, strtok_r - extract tokens from strings


---------------------------------------------------------

::

          #include <string.h>

          char *strtok(char *restrict str, const char *restrict delim);
          char *strtok_r(char *restrict str, const char *restrict delim,
                         char **restrict saveptr);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strtok_r():
              _POSIX_C_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The strtok() function breaks a string into a sequence of zero or
          more nonempty tokens.  On the first call to strtok(), the string
          to be parsed should be specified in str.  In each subsequent call
          that should parse the same string, str must be NULL.

          The delim argument specifies a set of bytes that delimit the
          tokens in the parsed string.  The caller may specify different
          strings in delim in successive calls that parse the same string.

          Each call to strtok() returns a pointer to a null-terminated
          string containing the next token.  This string does not include
          the delimiting byte.  If no more tokens are found, strtok()
          returns NULL.

          A sequence of calls to strtok() that operate on the same string
          maintains a pointer that determines the point from which to start
          searching for the next token.  The first call to strtok() sets
          this pointer to point to the first byte of the string.  The start
          of the next token is determined by scanning forward for the next
          nondelimiter byte in str.  If such a byte is found, it is taken
          as the start of the next token.  If no such byte is found, then
          there are no more tokens, and strtok() returns NULL.  (A string
          that is empty or that contains only delimiters will thus cause
          strtok() to return NULL on the first call.)

          The end of each token is found by scanning forward until either
          the next delimiter byte is found or until the terminating null
          byte ('\0') is encountered.  If a delimiter byte is found, it is
          overwritten with a null byte to terminate the current token, and
          strtok() saves a pointer to the following byte; that pointer will
          be used as the starting point when searching for the next token.
          In this case, strtok() returns a pointer to the start of the
          found token.

          From the above description, it follows that a sequence of two or
          more contiguous delimiter bytes in the parsed string is
          considered to be a single delimiter, and that delimiter bytes at
          the start or end of the string are ignored.  Put another way: the
          tokens returned by strtok() are always nonempty strings.  Thus,
          for example, given the string "aaa;;bbb,", successive calls to
          strtok() that specify the delimiter string ";," would return the
          strings "aaa" and "bbb", and then a null pointer.

          The strtok_r() function is a reentrant version of strtok().  The
          saveptr argument is a pointer to a char * variable that is used
          internally by strtok_r() in order to maintain context between
          successive calls that parse the same string.

          On the first call to strtok_r(), str should point to the string
          to be parsed, and the value of *saveptr is ignored (but see
          NOTES).  In subsequent calls, str should be NULL, and saveptr
          (and the buffer that it points to) should be unchanged since the
          previous call.

          Different strings may be parsed concurrently using sequences of
          calls to strtok_r() that specify different saveptr arguments.


-----------------------------------------------------------------

::

          The strtok() and strtok_r() functions return a pointer to the
          next token, or NULL if there are no more tokens.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────┬───────────────┬───────────────────────┐
          │Interface               │ Attribute     │ Value                 │
          ├────────────────────────┼───────────────┼───────────────────────┤
          │strtok()                │ Thread safety │ MT-Unsafe race:strtok │
          ├────────────────────────┼───────────────┼───────────────────────┤
          │strtok_r()              │ Thread safety │ MT-Safe               │
          └────────────────────────┴───────────────┴───────────────────────┘


-------------------------------------------------------------------

::

          strtok()
                 POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.

          strtok_r()
                 POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          On some implementations, *saveptr is required to be NULL on the
          first call to strtok_r() that is being used to parse str.


-------------------------------------------------

::

          Be cautious when using these functions.  If you do use them, note
          that:

          * These functions modify their first argument.

          * These functions cannot be used on constant strings.

          * The identity of the delimiting byte is lost.

          * The strtok() function uses a static buffer while parsing, so
            it's not thread safe.  Use strtok_r() if this matters to you.


---------------------------------------------------------

::

          The program below uses nested loops that employ strtok_r() to
          break a string into a two-level hierarchy of tokens.  The first
          command-line argument specifies the string to be parsed.  The
          second argument specifies the delimiter byte(s) to be used to
          separate that string into "major" tokens.  The third argument
          specifies the delimiter byte(s) to be used to separate the
          "major" tokens into subtokens.

          An example of the output produced by this program is the
          following:

              $ ./a.out 'a/bbb///cc;xxx:yyy:' ':;' '/'
              1: a/bbb///cc
                       --> a
                       --> bbb
                       --> cc
              2: xxx
                       --> xxx
              3: yyy
                       --> yyy

      Program source

          #include <stdio.h>
          #include <stdlib.h>
          #include <string.h>

          int
          main(int argc, char *argv[])
          {
              char *str1, *str2, *token, *subtoken;
              char *saveptr1, *saveptr2;

              if (argc != 4) {
                  fprintf(stderr, "Usage: %s string delim subdelim\n",
                          argv[0]);
                  exit(EXIT_FAILURE);
              }

              for (int j = 1, str1 = argv[1]; ; j++, str1 = NULL) {
                  token = strtok_r(str1, argv[2], &saveptr1);
                  if (token == NULL)
                      break;
                  printf("%d: %s\n", j, token);

                  for (str2 = token; ; str2 = NULL) {
                      subtoken = strtok_r(str2, argv[3], &saveptr2);
                      if (subtoken == NULL)
                          break;
                      printf(" --> %s\n", subtoken);
                  }
              }

              exit(EXIT_SUCCESS);
          }

          Another example program using strtok() can be found in
          getaddrinfo_a(3).


---------------------------------------------------------

::

          index(3), memchr(3), rindex(3), strchr(3), string(3), strpbrk(3),
          strsep(3), strspn(3), strstr(3), wcstok(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRTOK(3)

--------------

Pages that refer to this page: `index(3) <../man3/index.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`wcstok(3) <../man3/wcstok.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strtok.3.license.html>`__

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
