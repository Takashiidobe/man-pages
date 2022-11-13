.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strsep(3) — Linux manual page
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

   STRSEP(3)               Linux Programmer's Manual              STRSEP(3)

NAME
-------------------------------------------------

::

          strsep - extract token from string


---------------------------------------------------------

::

          #include <string.h>

          char *strsep(char **restrict stringp, const char *restrict delim);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strsep():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          If *stringp is NULL, the strsep() function returns NULL and does
          nothing else.  Otherwise, this function finds the first token in
          the string *stringp, that is delimited by one of the bytes in the
          string delim.  This token is terminated by overwriting the
          delimiter with a null byte ('\0'), and *stringp is updated to
          point past the token.  In case no delimiter was found, the token
          is taken to be the entire string *stringp, and *stringp is made
          NULL.


-----------------------------------------------------------------

::

          The strsep() function returns a pointer to the token, that is, it
          returns the original value of *stringp.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │strsep()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.4BSD.


---------------------------------------------------

::

          The strsep() function was introduced as a replacement for
          strtok(3), since the latter cannot handle empty fields.  However,
          strtok(3) conforms to C89/C99 and hence is more portable.


-------------------------------------------------

::

          Be cautious when using this function.  If you do use it, note
          that:

          * This function modifies its first argument.

          * This function cannot be used on constant strings.

          * The identity of the delimiting character is lost.


---------------------------------------------------------

::

          index(3), memchr(3), rindex(3), strchr(3), string(3), strpbrk(3),
          strspn(3), strstr(3), strtok(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRSEP(3)

--------------

Pages that refer to this page: `index(3) <../man3/index.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/strsep.3.license.html>`__

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
