.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

string(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRING(3)               Linux Programmer's Manual              STRING(3)

NAME
-------------------------------------------------

::

          stpcpy, strcasecmp, strcat, strchr, strcmp, strcoll, strcpy,
          strcspn, strdup, strfry, strlen, strncat, strncmp, strncpy,
          strncasecmp, strpbrk, strrchr, strsep, strspn, strstr, strtok,
          strxfrm, index, rindex - string operations


---------------------------------------------------------

::

          #include <strings.h>

          int strcasecmp(const char *s1, const char *s2);
                 Compare the strings s1 and s2 ignoring case.

          int strncasecmp(const char *s1, const char *s2, size_t n);
                 Compare the first n bytes of the strings s1 and s2
                 ignoring case.

          char *index(const char *s, int c);
                 Return a pointer to the first occurrence of the character
                 c in the string s.

          char *rindex(const char *s, int c);
                 Return a pointer to the last occurrence of the character c
                 in the string s.

          #include <string.h>

          char *stpcpy(char *restrict dest, const char *restrict src);
                 Copy a string from src to dest, returning a pointer to the
                 end of the resulting string at dest.

          char *strcat(char *restrict dest, const char *restrict src);
                 Append the string src to the string dest, returning a
                 pointer dest.

          char *strchr(const char *s, int c);
                 Return a pointer to the first occurrence of the character
                 c in the string s.

          int strcmp(const char *s1, const char *s2);
                 Compare the strings s1 with s2.

          int strcoll(const char *s1, const char *s2);
                 Compare the strings s1 with s2 using the current locale.

          char *strcpy(char *restrict dest, const char *restrict src);
                 Copy the string src to dest, returning a pointer to the
                 start of dest.

          size_t strcspn(const char *s, const char *reject);
                 Calculate the length of the initial segment of the string
                 s which does not contain any of bytes in the string
                 reject,

          char *strdup(const char *s);
                 Return a duplicate of the string s in memory allocated
                 using malloc(3).

          char *strfry(char *string);
                 Randomly swap the characters in string.

          size_t strlen(const char *s);
                 Return the length of the string s.

          char *strncat(char *restrict dest, const char *restrict src,
          size_t n);
                 Append at most n bytes from the string src to the string
                 dest, returning a pointer to dest.

          int strncmp(const char *s1, const char *s2, size_t n);
                 Compare at most n bytes of the strings s1 and s2.

          char *strncpy(char *restrict dest, const char *restrict src,
          size_t n);
                 Copy at most n bytes from string src to dest, returning a
                 pointer to the start of dest.

          char *strpbrk(const char *s, const char *accept);
                 Return a pointer to the first occurrence in the string s
                 of one of the bytes in the string accept.

          char *strrchr(const char *s, int c);
                 Return a pointer to the last occurrence of the character c
                 in the string s.

          char *strsep(char **restrict stringp, const char *restrict
          delim);
                 Extract the initial token in stringp that is delimited by
                 one of the bytes in delim.

          size_t strspn(const char *s, const char *accept);
                 Calculate the length of the starting segment in the string
                 s that consists entirely of bytes in accept.

          char *strstr(const char *haystack, const char *needle);
                 Find the first occurrence of the substring needle in the
                 string haystack, returning a pointer to the found
                 substring.

          char *strtok(char *restrict s, const char *restrict delim);
                 Extract tokens from the string s that are delimited by one
                 of the bytes in delim.

          size_t strxfrm(char *restrict dst, const char *restrict src,
          size_t n);
                 Transforms src to the current locale and copies the first
                 n bytes to dst.


---------------------------------------------------------------

::

          The string functions perform operations on null-terminated
          strings.  See the individual man pages for descriptions of each
          function.


---------------------------------------------------------

::

          bstring(3), index(3), rindex(3), stpcpy(3), strcasecmp(3),
          strcat(3), strchr(3), strcmp(3), strcoll(3), strcpy(3),
          strcspn(3), strdup(3), strfry(3), strlen(3), strncasecmp(3),
          strncat(3), strncmp(3), strncpy(3), strpbrk(3), strrchr(3),
          strsep(3), strspn(3), strstr(3), strtok(3), strxfrm(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      STRING(3)

--------------

Pages that refer to this page: `bstring(3) <../man3/bstring.3.html>`__, 
`index(3) <../man3/index.3.html>`__, 
`stpcpy(3) <../man3/stpcpy.3.html>`__, 
`strcasecmp(3) <../man3/strcasecmp.3.html>`__, 
`strcat(3) <../man3/strcat.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`strcmp(3) <../man3/strcmp.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`strcpy(3) <../man3/strcpy.3.html>`__, 
`strdup(3) <../man3/strdup.3.html>`__, 
`strfry(3) <../man3/strfry.3.html>`__, 
`strlen(3) <../man3/strlen.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/string.3.license.html>`__

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
