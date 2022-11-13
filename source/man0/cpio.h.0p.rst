.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cpio.h(0p) — Linux manual page
==============================

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

   cpio.h(0P)              POSIX Programmer's Manual             cpio.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          cpio.h — cpio archive values


---------------------------------------------------------

::

          #include <cpio.h>


---------------------------------------------------------------

::

          The <cpio.h> header shall define the symbolic constants needed by
          the c_mode field of the cpio archive format, with the names and
          values given in the following table:

        ┌─────────┬───────────────────────────────────────────┬───────────────┐
        │  Name   │                Description                │ Value (Octal) │
        ├─────────┼───────────────────────────────────────────┼───────────────┤
        │C_IRUSR  │ Read by owner.                            │    0000400    │
        │C_IWUSR  │ Write by owner.                           │    0000200    │
        │C_IXUSR  │ Execute by owner.                         │    0000100    │
        │C_IRGRP  │ Read by group.                            │    0000040    │
        │C_IWGRP  │ Write by group.                           │    0000020    │
        │C_IXGRP  │ Execute by group.                         │    0000010    │
        │C_IROTH  │ Read by others.                           │    0000004    │
        │C_IWOTH  │ Write by others.                          │    0000002    │
        │C_IXOTH  │ Execute by others.                        │    0000001    │
        │C_ISUID  │ Set user ID.                              │    0004000    │
        │C_ISGID  │ Set group ID.                             │    0002000    │
        │C_ISVTX  │ On directories, restricted deletion flag. │    0001000    │
        │C_ISDIR  │ Directory.                                │    0040000    │
        │C_ISFIFO │ FIFO.                                     │    0010000    │
        │C_ISREG  │ Regular file.                             │    0100000    │
        │C_ISBLK  │ Block special.                            │    0060000    │
        │C_ISCHR  │ Character special.                        │    0020000    │
        │C_ISCTG  │ Reserved.                                 │    0110000    │
        │C_ISLNK  │ Symbolic link.                            │    0120000    │
        │C_ISSOCK │ Socket.                                   │    0140000    │
        └─────────┴───────────────────────────────────────────┴───────────────┘
          The <cpio.h> header shall define the following symbolic constant
          as a string:

              MAGIC    "070707"

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

   IEEE/The Open Group               2017                        cpio.h(0P)

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
