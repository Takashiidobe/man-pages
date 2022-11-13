.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcstok(3) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WCSTOK(3)               Linux Programmer's Manual              WCSTOK(3)

NAME
-------------------------------------------------

::

          wcstok - split wide-character string into tokens


---------------------------------------------------------

::

          #include <wchar.h>

          wchar_t *wcstok(wchar_t *restrict wcs, const wchar_t *restrict delim,
                          wchar_t **restrict ptr);


---------------------------------------------------------------

::

          The wcstok() function is the wide-character equivalent of the
          strtok(3) function, with an added argument to make it
          multithread-safe.  It can be used to split a wide-character
          string wcs into tokens, where a token is defined as a substring
          not containing any wide-characters from delim.

          The search starts at wcs, if wcs is not NULL, or at *ptr, if wcs
          is NULL.  First, any delimiter wide-characters are skipped, that
          is, the pointer is advanced beyond any wide-characters which
          occur in delim.  If the end of the wide-character string is now
          reached, wcstok() returns NULL, to indicate that no tokens were
          found, and stores an appropriate value in *ptr, so that
          subsequent calls to wcstok() will continue to return NULL.
          Otherwise, the wcstok() function recognizes the beginning of a
          token and returns a pointer to it, but before doing that, it
          zero-terminates the token by replacing the next wide-character
          which occurs in delim with a null wide character (L'\0'), and it
          updates *ptr so that subsequent calls will continue searching
          after the end of recognized token.


-----------------------------------------------------------------

::

          The wcstok() function returns a pointer to the next token, or
          NULL if no further token was found.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │wcstok()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The original wcs wide-character string is destructively modified
          during the operation.


---------------------------------------------------------

::

          The following code loops over the tokens contained in a wide-
          character string.

          wchar_t *wcs = ...;
          wchar_t *token;
          wchar_t *state;
          for (token = wcstok(wcs, L" \t\n", &state);
              token != NULL;
              token = wcstok(NULL, L" \t\n", &state)) {
              ...
          }


---------------------------------------------------------

::

          strtok(3), wcschr(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-08-27                      WCSTOK(3)

--------------

Pages that refer to this page: `strtok(3) <../man3/strtok.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/wcstok.3.license.html>`__

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
