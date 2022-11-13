.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umask(3p) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   UMASK(3P)               POSIX Programmer's Manual              UMASK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          umask — set and get the file mode creation mask


---------------------------------------------------------

::

          #include <sys/stat.h>

          mode_t umask(mode_t cmask);


---------------------------------------------------------------

::

          The umask() function shall set the file mode creation mask of the
          process to cmask and return the previous value of the mask. Only
          the file permission bits of cmask (see <sys/stat.h>) are used;
          the meaning of the other bits is implementation-defined.

          The file mode creation mask of the process is used to turn off
          permission bits in the mode argument supplied during calls to the
          following functions:

           *  open(), openat(), creat(), mkdir(), mkdirat(), mkfifo(), and
              mkfifoat()

           *  mknod(), mknodat()

           *  mq_open()

           *  sem_open()

          Bit positions that are set in cmask are cleared in the mode of
          the created file.


-----------------------------------------------------------------

::

          The file permission bits in the value returned by umask() shall
          be the previous value of the file mode creation mask. The state
          of any other bits in that value is unspecified, except that a
          subsequent call to umask() with the returned value as cmask shall
          leave the state of the mask the same as its state before the
          first call, including any unspecified use of those bits.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Unsigned argument and return types for umask() were proposed. The
          return type and the argument were both changed to mode_t.

          Historical implementations have made use of additional bits in
          cmask for their implementation-defined purposes. The addition of
          the text that the meaning of other bits of the field is
          implementation-defined permits these implementations to conform
          to this volume of POSIX.1‐2017.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          creat(3p), exec(1p), mkdir(3p), mkfifo(3p), mknod(3p),
          mq_open(3p), open(3p), sem_open(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_stat.h(0p),
          sys_types.h(0p)


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

   IEEE/The Open Group               2017                         UMASK(3P)

--------------

Pages that refer to this page:
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`mkdir(1p) <../man1/mkdir.1p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`umask(1p) <../man1/umask.1p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`mkdir(3p) <../man3/mkdir.3p.html>`__, 
`mkfifo(3p) <../man3/mkfifo.3p.html>`__, 
`mknod(3p) <../man3/mknod.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__

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
