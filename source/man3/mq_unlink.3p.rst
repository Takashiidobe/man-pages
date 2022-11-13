.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mq_unlink(3p) — Linux manual page
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

   MQ_UNLINK(3P)           POSIX Programmer's Manual          MQ_UNLINK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mq_unlink — remove a message queue (REALTIME)


---------------------------------------------------------

::

          #include <mqueue.h>

          int mq_unlink(const char *name);


---------------------------------------------------------------

::

          The mq_unlink() function shall remove the message queue named by
          the string name.  If one or more processes have the message queue
          open when mq_unlink() is called, destruction of the message queue
          shall be postponed until all references to the message queue have
          been closed. However, the mq_unlink() call need not block until
          all references have been closed; it may return immediately.

          After a successful call to mq_unlink(), reuse of the name shall
          subsequently cause mq_open() to behave as if no message queue of
          this name exists (that is, mq_open() will fail if O_CREAT is not
          set, or will create a new message queue if O_CREAT is set).


-----------------------------------------------------------------

::

          Upon successful completion, the function shall return a value of
          zero.  Otherwise, the named message queue shall be unchanged by
          this function call, and the function shall return a value of -1
          and set errno to indicate the error.


-----------------------------------------------------

::

          The mq_unlink() function shall fail if:

          EACCES Permission is denied to unlink the named message queue.

          EINTR  The call to mq_unlink() blocked waiting for all references
                 to the named message queue to be closed and a signal
                 interrupted the call.

          ENOENT The named message queue does not exist.

          The mq_unlink() function may fail if:

          ENAMETOOLONG
                 The length of the name argument exceeds {_POSIX_PATH_MAX}
                 on systems that do not support the XSI option or exceeds
                 {_XOPEN_PATH_MAX} on XSI systems, or has a pathname
                 component that is longer than {_POSIX_NAME_MAX} on systems
                 that do not support the XSI option or longer than
                 {_XOPEN_NAME_MAX} on XSI systems.  A call to mq_unlink()
                 with a name argument that contains the same message queue
                 name as was previously used in a successful mq_open() call
                 shall not give an [ENAMETOOLONG] error.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          A future version might require the mq_open() and mq_unlink()
          functions to have semantics similar to normal file system
          operations.


---------------------------------------------------------

::

          mq_close(3p), mq_open(3p), msgctl(3p), msgget(3p), msgrcv(3p),
          msgsnd(3p)

          The Base Definitions volume of POSIX.1‐2017, mqueue.h(0p)


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

   IEEE/The Open Group               2017                     MQ_UNLINK(3P)

--------------

Pages that refer to this page:
`mqueue.h(0p) <../man0/mqueue.h.0p.html>`__, 
`mq_close(3p) <../man3/mq_close.3p.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`msgctl(3p) <../man3/msgctl.3p.html>`__, 
`msgget(3p) <../man3/msgget.3p.html>`__, 
`msgrcv(3p) <../man3/msgrcv.3p.html>`__, 
`msgsnd(3p) <../man3/msgsnd.3p.html>`__

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
