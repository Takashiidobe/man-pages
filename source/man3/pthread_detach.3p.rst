.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_detach(3p) — Linux manual page
======================================

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

   PTHREAD_DETACH(3P)      POSIX Programmer's Manual     PTHREAD_DETACH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_detach — detach a thread


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_detach(pthread_t thread);


---------------------------------------------------------------

::

          The pthread_detach() function shall indicate to the
          implementation that storage for the thread thread can be
          reclaimed when that thread terminates. If thread has not
          terminated, pthread_detach() shall not cause it to terminate.

          The behavior is undefined if the value specified by the thread
          argument to pthread_detach() does not refer to a joinable thread.


-----------------------------------------------------------------

::

          If the call succeeds, pthread_detach() shall return 0; otherwise,
          an error number shall be returned to indicate the error.


-----------------------------------------------------

::

          The pthread_detach() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The pthread_join() or pthread_detach() functions should
          eventually be called for every thread that is created so that
          storage associated with the thread may be reclaimed.

          It has been suggested that a ``detach'' function is not
          necessary; the detachstate thread creation attribute is
          sufficient, since a thread need never be dynamically detached.
          However, need arises in at least two cases:

           1. In a cancellation handler for a pthread_join() it is nearly
              essential to have a pthread_detach() function in order to
              detach the thread on which pthread_join() was waiting.
              Without it, it would be necessary to have the handler do
              another pthread_join() to attempt to detach the thread, which
              would both delay the cancellation processing for an unbounded
              period and introduce a new call to pthread_join(), which
              might itself need a cancellation handler. A dynamic detach is
              nearly essential in this case.

           2. In order to detach the ``initial thread'' (as may be
              desirable in processes that set up server threads).

          If an implementation detects that the value specified by the
          thread argument to pthread_detach() does not refer to a joinable
          thread, it is recommended that the function should fail and
          report an [EINVAL] error.

          If an implementation detects use of a thread ID after the end of
          its lifetime, it is recommended that the function should fail and
          report an [ESRCH] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_join(3p)

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

   IEEE/The Open Group               2017                PTHREAD_DETACH(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__

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
