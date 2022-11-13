.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_select.h(0p) — Linux manual page
====================================

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

   sys_select.h(0P)        POSIX Programmer's Manual       sys_select.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/select.h — select types


---------------------------------------------------------

::

          #include <sys/select.h>


---------------------------------------------------------------

::

          The <sys/select.h> header shall define the timeval structure,
          which shall include at least the following members:

              time_t         tv_sec      Seconds.
              suseconds_t    tv_usec     Microseconds.

          The <sys/select.h> header shall define the time_t and suseconds_t
          types as described in <sys/types.h>.

          The <sys/select.h> header shall define the sigset_t type as
          described in <signal.h>.

          The <sys/select.h> header shall define the timespec structure as
          described in <time.h>.

          The <sys/select.h> header shall define the fd_set type as a
          structure.

          The <sys/select.h> header shall define the following symbolic
          constant, which shall have a value suitable for use in #if
          preprocessing directives:

          FD_SETSIZE  Maximum number of file descriptors in an fd_set
                      structure.

          The following shall be declared as functions, defined as macros,
          or both. If functions are declared, function prototypes shall be
          provided.

              void FD_CLR(int, fd_set *);
              int  FD_ISSET(int, fd_set *);
              void FD_SET(int, fd_set *);
              void FD_ZERO(fd_set *);

          If implemented as macros, these may evaluate their arguments more
          than once, so applications should ensure that the arguments they
          supply are never expressions with side-effects.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int  pselect(int, fd_set *restrict, fd_set *restrict, fd_set *restrict,
                       const struct timespec *restrict, const sigset_t *restrict);
              int  select(int, fd_set *restrict, fd_set *restrict, fd_set *restrict,
                       struct timeval *restrict);

          Inclusion of the <sys/select.h> header may make visible all
          symbols from the headers <signal.h> and <time.h>.

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

          signal.h(0p), sys_time.h(0p), sys_types.h(0p), time.h(0p)

          The System Interfaces volume of POSIX.1‐2017, pselect(3p)


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

   IEEE/The Open Group               2017                  sys_select.h(0P)

--------------

Pages that refer to this page:
`sys_time.h(0p) <../man0/sys_time.h.0p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__

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
