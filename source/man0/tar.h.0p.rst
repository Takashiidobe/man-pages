.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tar.h(0p) — Linux manual page
=============================

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

   tar.h(0P)               POSIX Programmer's Manual              tar.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tar.h — extended tar definitions


---------------------------------------------------------

::

          #include <tar.h>


---------------------------------------------------------------

::

          The <tar.h> header shall define the following symbolic constants
          with the indicated values.

          General definitions:

          ┌───────────┬────────────┬────────────────────────────────────────┐
          │   Name    │   Value    │              Description               │
          ├───────────┼────────────┼────────────────────────────────────────┤
          │TMAGIC     │  "ustar"   │ Used in the magic field in the ustar   │
          │           │            │ header block, including the trailing   │
          │           │            │ null byte.                             │
          │TMAGLEN    │     6      │ Length in octets of the magic field.   │
          │TVERSION   │    "00"    │ Used in the version field in the ustar │
          │           │            │ header block, excluding the trailing   │
          │           │            │ null byte.                             │
          │TVERSLEN   │     2      │ Length in octets of the version field. │
          └───────────┴────────────┴────────────────────────────────────────┘
          Typeflag field definitions:

          ┌───────────┬────────────┬────────────────────────────────┐
          │   Name    │   Value    │          Description           │
          ├───────────┼────────────┼────────────────────────────────┤
          │REGTYPE    │    '0'     │ Regular file.                  │
          │AREGTYPE   │    '\0'    │ Regular file.                  │
          │LNKTYPE    │    '1'     │ Link.                          │
          │SYMTYPE    │    '2'     │ Symbolic link.                 │
          │CHRTYPE    │    '3'     │ Character special.             │
          │BLKTYPE    │    '4'     │ Block special.                 │
          │DIRTYPE    │    '5'     │ Directory.                     │
          │FIFOTYPE   │    '6'     │ FIFO special.                  │
          │CONTTYPE   │    '7'     │ Reserved.                      │
          └───────────┴────────────┴────────────────────────────────┘
          Mode field bit definitions (octal):

          ┌───────────┬────────────┬──────────────────────────────────────────────┐
          │   Name    │   Value    │                 Description                  │
          ├───────────┼────────────┼──────────────────────────────────────────────┤
          │TSUID      │   04000    │ Set UID on execution.                        │
          │TSGID      │   02000    │ Set GID on execution.                        │
          │TSVTX      │   01000    │ On directories, restricted deletion flag.    │
          │TUREAD     │   00400    │ Read by owner.                               │
          │TUWRITE    │   00200    │ Write by owner special.                      │
          │TUEXEC     │   00100    │ Execute/search by owner.                     │
          │TGREAD     │   00040    │ Read by group.                               │
          │TGWRITE    │   00020    │ Write by group.                              │
          │TGEXEC     │   00010    │ Execute/search by group.                     │
          │TOREAD     │   00004    │ Read by other.                               │
          │TOWRITE    │   00002    │ Write by other.                              │
          │TOEXEC     │   00001    │ Execute/search by other.                     │
          └───────────┴────────────┴──────────────────────────────────────────────┘
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

          The Shell and Utilities volume of POSIX.1‐2017, pax(1p)


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

   IEEE/The Open Group               2017                         tar.h(0P)

--------------

Pages that refer to this page: `pax(1p) <../man1/pax.1p.html>`__

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
