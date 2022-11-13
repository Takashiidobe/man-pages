.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

abort(3p) — Linux manual page
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

   ABORT(3P)               POSIX Programmer's Manual              ABORT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          abort — generate an abnormal process abort


---------------------------------------------------------

::

          #include <stdlib.h>

          void abort(void);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The abort() function shall cause abnormal process termination to
          occur, unless the signal SIGABRT is being caught and the signal
          handler does not return.

          The abnormal termination processing shall include the default
          actions defined for SIGABRT and may include an attempt to effect
          fclose() on all open streams.

          The SIGABRT signal shall be sent to the calling process as if by
          means of raise() with the argument SIGABRT.

          The status made available to wait(), waitid(), or waitpid() by
          abort() shall be that of a process terminated by the SIGABRT
          signal.  The abort() function shall override blocking or ignoring
          the SIGABRT signal.


-----------------------------------------------------------------

::

          The abort() function shall not return.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Catching the signal is intended to provide the application
          developer with a portable means to abort processing, free from
          possible interference from any implementation-supplied functions.


-----------------------------------------------------------

::

          The ISO/IEC 9899:1999 standard requires the abort() function to
          be async-signal-safe. Since POSIX.1‐2008 defers to the ISO C
          standard, this required a change to the DESCRIPTION from ``shall
          include the effect of fclose()'' to ``may include an attempt to
          effect fclose().''

          The revised wording permits some backwards-compatibility and
          avoids a potential deadlock situation.

          The Open Group Base Resolution bwg2002‐003 is applied, removing
          the following XSI shaded paragraph from the DESCRIPTION:

          ``On XSI-conformant systems, in addition the abnormal termination
          processing shall include the effect of fclose() on message
          catalog descriptors.''

          There were several reasons to remove this paragraph:

           *  No special processing of open message catalogs needs to be
              performed prior to abnormal process termination.

           *  The main reason to specifically mention that abort() includes
              the effect of fclose() on open streams is to flush output
              queued on the stream. Message catalogs in this context are
              read-only and, therefore, do not need to be flushed.

           *  The effect of fclose() on a message catalog descriptor is
              unspecified. Message catalog descriptors are allowed, but not
              required to be implemented using a file descriptor, but there
              is no mention in POSIX.1‐2008 of a message catalog descriptor
              using a standard I/O stream FILE object as would be expected
              by fclose().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exit(3p), kill(3p), raise(3p), signal(3p), wait(3p), waitid(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                         ABORT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`assert(3p) <../man3/assert.3p.html>`__

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
