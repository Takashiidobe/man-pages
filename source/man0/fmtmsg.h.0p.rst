.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fmtmsg.h(0p) — Linux manual page
================================

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

   fmtmsg.h(0P)            POSIX Programmer's Manual           fmtmsg.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fmtmsg.h — message display structures


---------------------------------------------------------

::

          #include <fmtmsg.h>


---------------------------------------------------------------

::

          The <fmtmsg.h> header shall define the following symbolic
          constants:

          MM_HARD       Source of the condition is hardware.

          MM_SOFT       Source of the condition is software.

          MM_FIRM       Source of the condition is firmware.

          MM_APPL       Condition detected by application.

          MM_UTIL       Condition detected by utility.

          MM_OPSYS      Condition detected by operating system.

          MM_RECOVER    Recoverable error.

          MM_NRECOV     Non-recoverable error.

          MM_HALT       Error causing application to halt.

          MM_ERROR      Application has encountered a non-fatal fault.

          MM_WARNING    Application has detected unusual non-error
                        condition.

          MM_INFO       Informative message.

          MM_NOSEV      No severity level provided for the message.

          MM_PRINT      Display message on standard error.

          MM_CONSOLE    Display message on system console.

          The table below indicates the null values and identifiers for
          fmtmsg() arguments. The <fmtmsg.h> header shall define the
          symbolic constants in the Identifier column, which shall have the
          type indicated in the Type column:

                    ┌─────────┬────────┬────────────┬────────────┐
                    │Argument │  Type  │ Null-Value │ Identifier │
                    ├─────────┼────────┼────────────┼────────────┤
                    │label    │ char * │ (char*)0   │ MM_NULLLBL │
                    │severity │ int    │ 0          │ MM_NULLSEV │
                    │class    │ long   │ 0L         │ MM_NULLMC  │
                    │text     │ char * │ (char*)0   │ MM_NULLTXT │
                    │action   │ char * │ (char*)0   │ MM_NULLACT │
                    │tag      │ char * │ (char*)0   │ MM_NULLTAG │
                    └─────────┴────────┴────────────┴────────────┘
          The <fmtmsg.h> header shall also define the following symbolic
          constants for use as return values for fmtmsg():

          MM_OK         The function succeeded.

          MM_NOTOK      The function failed completely.

          MM_NOMSG      The function was unable to generate a message on
                        standard error, but otherwise succeeded.

          MM_NOCON      The function was unable to generate a console
                        message, but otherwise succeeded.

          The following shall be declared as a function and may also be
          defined as a macro. A function prototype shall be provided.

              int fmtmsg(long, const char *, int,
                  const char *, const char *, const char *);

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

          The System Interfaces volume of POSIX.1‐2017, fmtmsg(3p)


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

   IEEE/The Open Group               2017                      fmtmsg.h(0P)

--------------

Pages that refer to this page: `fmtmsg(3p) <../man3/fmtmsg.3p.html>`__

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
