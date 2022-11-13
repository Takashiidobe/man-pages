.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fwide(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
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

   FWIDE(3)                Linux Programmer's Manual               FWIDE(3)

NAME
-------------------------------------------------

::

          fwide - set and determine the orientation of a FILE stream


---------------------------------------------------------

::

          #include <wchar.h>

          int fwide(FILE *stream, int mode);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fwide():
              _XOPEN_SOURCE >= 500 || _ISOC99_SOURCE
                  || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          When mode is zero, the fwide() function determines the current
          orientation of stream.  It returns a positive value if stream is
          wide-character oriented, that is, if wide-character I/O is
          permitted but char I/O is disallowed.  It returns a negative
          value if stream is byte oriented—that is, if char I/O is
          permitted but wide-character I/O is disallowed.  It returns zero
          if stream has no orientation yet; in this case the next I/O
          operation might change the orientation (to byte oriented if it is
          a char I/O operation, or to wide-character oriented if it is a
          wide-character I/O operation).

          Once a stream has an orientation, it cannot be changed and
          persists until the stream is closed.

          When mode is nonzero, the fwide() function first attempts to set
          stream's orientation (to wide-character oriented if mode is
          greater than 0, or to byte oriented if mode is less than 0).  It
          then returns a value denoting the current orientation, as above.


-----------------------------------------------------------------

::

          The fwide() function returns the stream's orientation, after
          possibly changing it.  A positive return value means wide-
          character oriented.  A negative return value means byte oriented.
          A return value of zero means undecided.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          Wide-character output to a byte oriented stream can be performed
          through the fprintf(3) function with the %lc and %ls directives.

          Char oriented output to a wide-character oriented stream can be
          performed through the fwprintf(3) function with the %c and %s
          directives.


---------------------------------------------------------

::

          fprintf(3), fwprintf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       FWIDE(3)

--------------

Pages that refer to this page: `wprintf(3) <../man3/wprintf.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fwide.3.license.html>`__

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
