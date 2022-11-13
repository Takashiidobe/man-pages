.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbsinit(3) — Linux manual page
==============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MBSINIT(3)              Linux Programmer's Manual             MBSINIT(3)

NAME
-------------------------------------------------

::

          mbsinit - test for initial shift state


---------------------------------------------------------

::

          #include <wchar.h>

          int mbsinit(const mbstate_t *ps);


---------------------------------------------------------------

::

          Character conversion between the multibyte representation and the
          wide character representation uses conversion state, of type
          mbstate_t.  Conversion of a string uses a finite-state machine;
          when it is interrupted after the complete conversion of a number
          of characters, it may need to save a state for processing the
          remaining characters.  Such a conversion state is needed for the
          sake of encodings such as ISO-2022 and UTF-7.

          The initial state is the state at the beginning of conversion of
          a string.  There are two kinds of state: the one used by
          multibyte to wide character conversion functions, such as
          mbsrtowcs(3), and the one used by wide character to multibyte
          conversion functions, such as wcsrtombs(3), but they both fit in
          a mbstate_t, and they both have the same representation for an
          initial state.

          For 8-bit encodings, all states are equivalent to the initial
          state.  For multibyte encodings like UTF-8, EUC-*, BIG5, or SJIS,
          the wide character to multibyte conversion functions never
          produce non-initial states, but the multibyte to wide-character
          conversion functions like mbrtowc(3) do produce non-initial
          states when interrupted in the middle of a character.

          One possible way to create an mbstate_t in initial state is to
          set it to zero:

              mbstate_t state;
              memset(&state, 0, sizeof(state));

          On Linux, the following works as well, but might generate
          compiler warnings:

              mbstate_t state = { 0 };

          The function mbsinit() tests whether *ps corresponds to an
          initial state.


-----------------------------------------------------------------

::

          mbsinit() returns nonzero if *ps is an initial state, or if ps is
          NULL.  Otherwise, it returns 0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │mbsinit()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mbsinit() depends on the LC_CTYPE category of the
          current locale.


---------------------------------------------------------

::

          mbrlen(3), mbrtowc(3), mbsrtowcs(3), wcrtomb(3), wcsrtombs(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     MBSINIT(3)

--------------

Pages that refer to this page: `mbrtowc(3) <../man3/mbrtowc.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbsrtowcs(3) <../man3/mbsrtowcs.3.html>`__, 
`wcrtomb(3) <../man3/wcrtomb.3.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mbsinit.3.license.html>`__

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
