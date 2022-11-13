.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_getconcurrency(3p) — Linux manual page
==============================================

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

   PTHREAD_GETCONCURRENCY(3P)SIX Programmer's ManualREAD_GETCONCURRENCY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_getconcurrency, pthread_setconcurrency — get and set the
          level of concurrency


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_getconcurrency(void);
          int pthread_setconcurrency(int new_level);


---------------------------------------------------------------

::

          Unbound threads in a process may or may not be required to be
          simultaneously active. By default, the threads implementation
          ensures that a sufficient number of threads are active so that
          the process can continue to make progress. While this conserves
          system resources, it may not produce the most effective level of
          concurrency.

          The pthread_setconcurrency() function allows an application to
          inform the threads implementation of its desired concurrency
          level, new_level.  The actual level of concurrency provided by
          the implementation as a result of this function call is
          unspecified.

          If new_level is zero, it causes the implementation to maintain
          the concurrency level at its discretion as if
          pthread_setconcurrency() had never been called.

          The pthread_getconcurrency() function shall return the value set
          by a previous call to the pthread_setconcurrency() function. If
          the pthread_setconcurrency() function was not previously called,
          this function shall return zero to indicate that the
          implementation is maintaining the concurrency level.

          A call to pthread_setconcurrency() shall inform the
          implementation of its desired concurrency level.  The
          implementation shall use this as a hint, not a requirement.

          If an implementation does not support multiplexing of user
          threads on top of several kernel-scheduled entities, the
          pthread_setconcurrency() and pthread_getconcurrency() functions
          are provided for source code compatibility but they shall have no
          effect when called. To maintain the function semantics, the
          new_level parameter is saved when pthread_setconcurrency() is
          called so that a subsequent call to pthread_getconcurrency()
          shall return the same value.


-----------------------------------------------------------------

::

          If successful, the pthread_setconcurrency() function shall return
          zero; otherwise, an error number shall be returned to indicate
          the error.

          The pthread_getconcurrency() function shall always return the
          concurrency level set by a previous call to
          pthread_setconcurrency().  If the pthread_setconcurrency()
          function has never been called, pthread_getconcurrency() shall
          return zero.


-----------------------------------------------------

::

          The pthread_setconcurrency() function shall fail if:

          EINVAL The value specified by new_level is negative.

          EAGAIN The value specified by new_level would cause a system
                 resource to be exceeded.

          The pthread_setconcurrency() function shall not return an error
          code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Application developers should note that an implementation can
          always ignore any calls to pthread_setconcurrency() and return a
          constant for pthread_getconcurrency().  For this reason, it is
          not recommended that portable applications use this function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions may be removed in a future version.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p)


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

   IEEE/The Open Group               2017        PTHREAD_GETCONCURRENCY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_setconcurrency(3p) <../man3/pthread_setconcurrency.3p.html>`__

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
