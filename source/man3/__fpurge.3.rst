.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fpurge(3) — Linux manual page
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

   FPURGE(3)               Linux Programmer's Manual              FPURGE(3)

NAME
-------------------------------------------------

::

          fpurge, __fpurge - purge a stream


---------------------------------------------------------

::

          /* unsupported */
          #include <stdio.h>

          int fpurge(FILE *stream);

          /* supported */
          #include <stdio.h>
          #include <stdio_ext.h>

          void  __fpurge(FILE *stream);


---------------------------------------------------------------

::

          The function fpurge() clears the buffers of the given stream.
          For output streams this discards any unwritten output.  For input
          streams this discards any input read from the underlying object
          but not yet obtained via getc(3); this includes any text pushed
          back via ungetc(3).  See also fflush(3).

          The function __fpurge() does precisely the same, but without
          returning a value.


-----------------------------------------------------------------

::

          Upon successful completion fpurge() returns 0.  On error, it
          returns -1 and sets errno to indicate the error.


-----------------------------------------------------

::

          EBADF  stream is not an open stream.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │__fpurge()                │ Thread safety │ MT-Safe race:stream │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard and not portable.  The function
          fpurge() was introduced in 4.4BSD and is not available under
          Linux.  The function __fpurge() was introduced in Solaris, and is
          present in glibc 2.1.95 and later.


---------------------------------------------------

::

          Usually it is a mistake to want to discard input buffers.


---------------------------------------------------------

::

          fflush(3), setbuf(3), stdio_ext(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      FPURGE(3)

--------------

Pages that refer to this page: `fflush(3) <../man3/fflush.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`stdio_ext(3) <../man3/stdio_ext.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fpurge.3.license.html>`__

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
