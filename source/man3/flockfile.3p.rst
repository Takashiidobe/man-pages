.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flockfile(3p) — Linux manual page
=================================

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

   FLOCKFILE(3P)           POSIX Programmer's Manual          FLOCKFILE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          flockfile, ftrylockfile, funlockfile — stdio locking functions


---------------------------------------------------------

::

          #include <stdio.h>

          void flockfile(FILE *file);
          int ftrylockfile(FILE *file);
          void funlockfile(FILE *file);


---------------------------------------------------------------

::

          These functions shall provide for explicit application-level
          locking of stdio (FILE *) objects. These functions can be used by
          a thread to delineate a sequence of I/O statements that are
          executed as a unit.

          The flockfile() function shall acquire for a thread ownership of
          a (FILE *) object.

          The ftrylockfile() function shall acquire for a thread ownership
          of a (FILE *) object if the object is available; ftrylockfile()
          is a non-blocking version of flockfile().

          The funlockfile() function shall relinquish the ownership granted
          to the thread.  The behavior is undefined if a thread other than
          the current owner calls the funlockfile() function.

          The functions shall behave as if there is a lock count associated
          with each (FILE *) object. This count is implicitly initialized
          to zero when the (FILE *) object is created. The (FILE *) object
          is unlocked when the count is zero. When the count is positive, a
          single thread owns the (FILE *) object. When the flockfile()
          function is called, if the count is zero or if the count is
          positive and the caller owns the (FILE *) object, the count shall
          be incremented. Otherwise, the calling thread shall be suspended,
          waiting for the count to return to zero. Each call to
          funlockfile() shall decrement the count. This allows matching
          calls to flockfile() (or successful calls to ftrylockfile()) and
          funlockfile() to be nested.

          All functions that reference (FILE *) objects, except those with
          names ending in _unlocked, shall behave as if they use
          flockfile() and funlockfile() internally to obtain ownership of
          these (FILE *) objects.


-----------------------------------------------------------------

::

          None for flockfile() and funlockfile().

          The ftrylockfile() function shall return zero for success and
          non-zero to indicate that the lock cannot be acquired.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications using these functions may be subject to priority
          inversion, as discussed in the Base Definitions volume of
          POSIX.1‐2017, Section 3.291, Priority Inversion.

          A call to exit() can block until locked streams are unlocked
          because a thread having ownership of a (FILE*) object blocks all
          function calls that reference that (FILE*) object (except those
          with names ending in _unlocked) from other threads, including
          calls to exit().


-----------------------------------------------------------

::

          The flockfile() and funlockfile() functions provide an orthogonal
          mutual-exclusion lock for each FILE.  The ftrylockfile() function
          provides a non-blocking attempt to acquire a file lock, analogous
          to pthread_mutex_trylock().

          These locks behave as if they are the same as those used
          internally by stdio for thread-safety.  This both provides
          thread-safety of these functions without requiring a second level
          of internal locking and allows functions in stdio to be
          implemented in terms of other stdio functions.

          Application developers and implementors should be aware that
          there are potential deadlock problems on FILE objects. For
          example, the line-buffered flushing semantics of stdio (requested
          via {_IOLBF}) require that certain input operations sometimes
          cause the buffered contents of implementation-defined line-
          buffered output streams to be flushed. If two threads each hold
          the lock on the other's FILE, deadlock ensues. This type of
          deadlock can be avoided by acquiring FILE locks in a consistent
          order. In particular, the line-buffered output stream deadlock
          can typically be avoided by acquiring locks on input streams
          before locks on output streams if a thread would be acquiring
          both.

          In summary, threads sharing stdio streams with other threads can
          use flockfile() and funlockfile() to cause sequences of I/O
          performed by a single thread to be kept bundled. The only case
          where the use of flockfile() and funlockfile() is required is to
          provide a scope protecting uses of the *_unlocked
          functions/macros. This moves the cost/performance tradeoff to the
          optimal point.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exit(3p), getc_unlocked(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, stdio.h(0p)


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

   IEEE/The Open Group               2017                     FLOCKFILE(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`ftrylockfile(3p) <../man3/ftrylockfile.3p.html>`__, 
`funlockfile(3p) <../man3/funlockfile.3p.html>`__, 
`getc_unlocked(3p) <../man3/getc_unlocked.3p.html>`__

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
