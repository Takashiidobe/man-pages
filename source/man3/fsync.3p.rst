.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fsync(3p) — Linux manual page
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

   FSYNC(3P)               POSIX Programmer's Manual              FSYNC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fsync — synchronize changes to a file


---------------------------------------------------------

::

          #include <unistd.h>

          int fsync(int fildes);


---------------------------------------------------------------

::

          The fsync() function shall request that all data for the open
          file descriptor named by fildes is to be transferred to the
          storage device associated with the file described by fildes.  The
          nature of the transfer is implementation-defined. The fsync()
          function shall not return until the system has completed that
          action or until an error is detected.

          If _POSIX_SYNCHRONIZED_IO is defined, the fsync() function shall
          force all currently queued I/O operations associated with the
          file indicated by file descriptor fildes to the synchronized I/O
          completion state. All I/O operations shall be completed as
          defined for synchronized I/O file integrity completion.


-----------------------------------------------------------------

::

          Upon successful completion, fsync() shall return 0. Otherwise, -1
          shall be returned and errno set to indicate the error. If the
          fsync() function fails, outstanding I/O operations are not
          guaranteed to have been completed.


-----------------------------------------------------

::

          The fsync() function shall fail if:

          EBADF  The fildes argument is not a valid descriptor.

          EINTR  The fsync() function was interrupted by a signal.

          EINVAL The fildes argument does not refer to a file on which this
                 operation is possible.

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          In the event that any of the queued I/O operations fail, fsync()
          shall return the error conditions defined for read() and write().

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The fsync() function should be used by programs which require
          modifications to a file to be completed before continuing; for
          example, a program which contains a simple transaction facility
          might use it to ensure that all modifications to a file or files
          caused by a transaction are recorded.


-----------------------------------------------------------

::

          The fsync() function is intended to force a physical write of
          data from the buffer cache, and to assure that after a system
          crash or other failure that all data up to the time of the
          fsync() call is recorded on the disk. Since the concepts of
          ``buffer cache'', ``system crash'', ``physical write'', and
          ``non-volatile storage'' are not defined here, the wording has to
          be more abstract.

          If _POSIX_SYNCHRONIZED_IO is not defined, the wording relies
          heavily on the conformance document to tell the user what can be
          expected from the system. It is explicitly intended that a null
          implementation is permitted. This could be valid in the case
          where the system cannot assure non-volatile storage under any
          circumstances or when the system is highly fault-tolerant and the
          functionality is not required. In the middle ground between these
          extremes, fsync() might or might not actually cause data to be
          written where it is safe from a power failure. The conformance
          document should identify at least that one configuration exists
          (and how to obtain that configuration) where this can be assured
          for at least some files that the user can select to use for
          critical data. It is not intended that an exhaustive list is
          required, but rather sufficient information is provided so that
          if critical data needs to be saved, the user can determine how
          the system is to be configured to allow the data to be written to
          non-volatile storage.

          It is reasonable to assert that the key aspects of fsync() are
          unreasonable to test in a test suite. That does not make the
          function any less valuable, just more difficult to test. A formal
          conformance test should probably force a system crash (power
          shutdown) during the test for this condition, but it needs to be
          done in such a way that automated testing does not require this
          to be done except when a formal record of the results is being
          made. It would also not be unreasonable to omit testing for
          fsync(), allowing it to be treated as a quality-of-implementation
          issue.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sync(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


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

   IEEE/The Open Group               2017                         FSYNC(3P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`aio_fsync(3p) <../man3/aio_fsync.3p.html>`__, 
`fdatasync(3p) <../man3/fdatasync.3p.html>`__, 
`sync(3p) <../man3/sync.3p.html>`__

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
