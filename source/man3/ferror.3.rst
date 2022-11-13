.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ferror(3) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FERROR(3)               Linux Programmer's Manual              FERROR(3)

NAME
-------------------------------------------------

::

          clearerr, feof, ferror - check and reset stream status


---------------------------------------------------------

::

          #include <stdio.h>

          void clearerr(FILE *stream);
          int feof(FILE *stream);
          int ferror(FILE *stream);


---------------------------------------------------------------

::

          The function clearerr() clears the end-of-file and error
          indicators for the stream pointed to by stream.

          The function feof() tests the end-of-file indicator for the
          stream pointed to by stream, returning nonzero if it is set.  The
          end-of-file indicator can be cleared only by the function
          clearerr().

          The function ferror() tests the error indicator for the stream
          pointed to by stream, returning nonzero if it is set.  The error
          indicator can be reset only by the clearerr() function.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          The feof() function returns nonzero if the end-of-file indicator
          is set for stream; otherwise, it returns zero.

          The ferror() function returns nonzero if the error indicator is
          set for stream; otherwise, it returns zero.


-----------------------------------------------------

::

          These functions should not fail and do not set errno.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │clearerr(), feof(), ferror()          │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The functions clearerr(), feof(), and ferror() conform to C89,
          C99, POSIX.1-2001, and POSIX.1-2008.


---------------------------------------------------

::

          POSIX.1-2008 specifies that these functions shall not change the
          value of errno if stream is valid.


---------------------------------------------------------

::

          open(2), fdopen(3), fileno(3), stdio(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      FERROR(3)

--------------

Pages that refer to this page: `fgetc(3) <../man3/fgetc.3.html>`__, 
`fread(3) <../man3/fread.3.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__,  `getw(3) <../man3/getw.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ferror.3.license.html>`__

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
