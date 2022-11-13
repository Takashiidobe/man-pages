.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcpy(3) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCPY(3)               Linux Programmer's Manual              STRCPY(3)

NAME
-------------------------------------------------

::

          strcpy, strncpy - copy a string


---------------------------------------------------------

::

          #include <string.h>

          char *strcpy(char *restrict dest, const char *src);
          char *strncpy(char *restrict dest, const char *restrict src, size_t n);


---------------------------------------------------------------

::

          The strcpy() function copies the string pointed to by src,
          including the terminating null byte ('\0'), to the buffer pointed
          to by dest.  The strings may not overlap, and the destination
          string dest must be large enough to receive the copy.  Beware of
          buffer overruns!  (See BUGS.)

          The strncpy() function is similar, except that at most n bytes of
          src are copied.  Warning: If there is no null byte among the
          first n bytes of src, the string placed in dest will not be null-
          terminated.

          If the length of src is less than n, strncpy() writes additional
          null bytes to dest to ensure that a total of n bytes are written.

          A simple implementation of strncpy() might be:

              char *
              strncpy(char *dest, const char *src, size_t n)
              {
                  size_t i;

                  for (i = 0; i < n && src[i] != '\0'; i++)
                      dest[i] = src[i];
                  for ( ; i < n; i++)
                      dest[i] = '\0';

                  return dest;
              }


-----------------------------------------------------------------

::

          The strcpy() and strncpy() functions return a pointer to the
          destination string dest.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │strcpy(), strncpy()                   │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          Some programmers consider strncpy() to be inefficient and error
          prone.  If the programmer knows (i.e., includes code to test!)
          that the size of dest is greater than the length of src, then
          strcpy() can be used.

          One valid (and intended) use of strncpy() is to copy a C string
          to a fixed-length buffer while ensuring both that the buffer is
          not overflowed and that unused bytes in the destination buffer
          are zeroed out (perhaps to prevent information leaks if the
          buffer is to be written to media or transmitted to another
          process via an interprocess communication technique).

          If there is no terminating null byte in the first n bytes of src,
          strncpy() produces an unterminated string in dest.  If buf has
          length buflen, you can force termination using something like the
          following:

              if (buflen > 0) {
                  strncpy(buf, str, buflen - 1);
                  buf[buflen - 1]= '\0';
              }

          (Of course, the above technique ignores the fact that, if src
          contains more than buflen - 1 bytes, information is lost in the
          copying to dest.)

      strlcpy()
          Some systems (the BSDs, Solaris, and others) provide the
          following function:

              size_t strlcpy(char *dest, const char *src, size_t size);

          This function is similar to strncpy(), but it copies at most
          size-1 bytes to dest, always adds a terminating null byte, and
          does not pad the destination with (further) null bytes.  This
          function fixes some of the problems of strcpy() and strncpy(),
          but the caller must still handle the possibility of data loss if
          size is too small.  The return value of the function is the
          length of src, which allows truncation to be easily detected: if
          the return value is greater than or equal to size, truncation
          occurred.  If loss of data matters, the caller must either check
          the arguments before the call, or test the function return value.
          strlcpy() is not present in glibc and is not standardized by
          POSIX, but is available on Linux via the libbsd library.


-------------------------------------------------

::

          If the destination string of a strcpy() is not large enough, then
          anything might happen.  Overflowing fixed-length string buffers
          is a favorite cracker technique for taking complete control of
          the machine.  Any time a program reads or copies data into a
          buffer, the program first needs to check that there's enough
          space.  This may be unnecessary if you can show that overflow is
          impossible, but be careful: programs can get changed over time,
          in ways that may make the impossible possible.


---------------------------------------------------------

::

          bcopy(3), memccpy(3), memcpy(3), memmove(3), stpcpy(3),
          stpncpy(3), strdup(3), string(3), wcscpy(3), wcsncpy(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRCPY(3)

--------------

Pages that refer to this page: `bcopy(3) <../man3/bcopy.3.html>`__, 
`memccpy(3) <../man3/memccpy.3.html>`__, 
`memcpy(3) <../man3/memcpy.3.html>`__, 
`memmove(3) <../man3/memmove.3.html>`__, 
`pmstrncpy(3) <../man3/pmstrncpy.3.html>`__, 
`stpcpy(3) <../man3/stpcpy.3.html>`__, 
`stpncpy(3) <../man3/stpncpy.3.html>`__, 
`strcat(3) <../man3/strcat.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`wcpcpy(3) <../man3/wcpcpy.3.html>`__, 
`wcscpy(3) <../man3/wcscpy.3.html>`__, 
`wcsncpy(3) <../man3/wcsncpy.3.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strcpy.3.license.html>`__

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
