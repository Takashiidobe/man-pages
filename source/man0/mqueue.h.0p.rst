.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mqueue.h(0p) — Linux manual page
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

   mqueue.h(0P)            POSIX Programmer's Manual           mqueue.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mqueue.h — message queues (REALTIME)


---------------------------------------------------------

::

          #include <mqueue.h>


---------------------------------------------------------------

::

          The <mqueue.h> header shall define the mqd_t type, which is used
          for message queue descriptors. This is not an array type.

          The <mqueue.h> header shall define the pthread_attr_t, size_t,
          and ssize_t types as described in <sys/types.h>.

          The <mqueue.h> header shall define the struct timespec structure
          as described in <time.h>.

          The tag sigevent shall be declared as naming an incomplete
          structure type, the contents of which are described in the
          <signal.h> header.

          The <mqueue.h> header shall define the mq_attr structure, which
          is used in getting and setting the attributes of a message queue.
          Attributes are initially set when the message queue is created.
          An mq_attr structure shall have at least the following fields:

              long    mq_flags    Message queue flags.
              long    mq_maxmsg   Maximum number of messages.
              long    mq_msgsize  Maximum message size.
              long    mq_curmsgs  Number of messages currently queued.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int      mq_close(mqd_t);
              int      mq_getattr(mqd_t, struct mq_attr *);
              int      mq_notify(mqd_t, const struct sigevent *);
              mqd_t    mq_open(const char *, int, ...);
              ssize_t  mq_receive(mqd_t, char *, size_t, unsigned *);
              int      mq_send(mqd_t, const char *, size_t, unsigned);
              int      mq_setattr(mqd_t, const struct mq_attr *restrict,
                           struct mq_attr *restrict);
              ssize_t  mq_timedreceive(mqd_t, char *restrict, size_t,
                           unsigned *restrict, const struct timespec *restrict);
              int      mq_timedsend(mqd_t, const char *, size_t, unsigned,
                           const struct timespec *);
              int      mq_unlink(const char *);

          Inclusion of the <mqueue.h> header may make visible symbols
          defined in the headers <fcntl.h>, <signal.h>, and <time.h>.

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

          fcntl.h(0p), signal.h(0p), sys_types.h(0p), time.h(0p)

          The System Interfaces volume of POSIX.1‐2017, mq_close(3p),
          mq_getattr(3p), mq_notify(3p), mq_open(3p), mq_receive(3p),
          mq_send(3p), mq_setattr(3p), mq_unlink(3p)


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

   IEEE/The Open Group               2017                      mqueue.h(0P)

--------------

Pages that refer to this page:
`mq_close(3p) <../man3/mq_close.3p.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
`mq_notify(3p) <../man3/mq_notify.3p.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_send(3p) <../man3/mq_send.3p.html>`__, 
`mq_setattr(3p) <../man3/mq_setattr.3p.html>`__, 
`mq_unlink(3p) <../man3/mq_unlink.3p.html>`__

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
