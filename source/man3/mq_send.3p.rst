.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mq_send(3p) — Linux manual page
===============================

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

   MQ_SEND(3P)             POSIX Programmer's Manual            MQ_SEND(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mq_send, mq_timedsend — send a message to a message queue
          (REALTIME)


---------------------------------------------------------

::

          #include <mqueue.h>

          int mq_send(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
              unsigned msg_prio);

          #include <mqueue.h>
          #include <time.h>

          int mq_timedsend(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
              unsigned msg_prio, const struct timespec *abstime);


---------------------------------------------------------------

::

          The mq_send() function shall add the message pointed to by the
          argument msg_ptr to the message queue specified by mqdes.  The
          msg_len argument specifies the length of the message, in bytes,
          pointed to by msg_ptr.  The value of msg_len shall be less than
          or equal to the mq_msgsize attribute of the message queue, or
          mq_send() shall fail.

          If the specified message queue is not full, mq_send() shall
          behave as if the message is inserted into the message queue at
          the position indicated by the msg_prio argument. A message with a
          larger numeric value of msg_prio shall be inserted before
          messages with lower values of msg_prio.  A message shall be
          inserted after other messages in the queue, if any, with equal
          msg_prio.  The value of msg_prio shall be less than
          {MQ_PRIO_MAX}.

          If the specified message queue is full and O_NONBLOCK is not set
          in the message queue description associated with mqdes, mq_send()
          shall block until space becomes available to enqueue the message,
          or until mq_send() is interrupted by a signal. If more than one
          thread is waiting to send when space becomes available in the
          message queue and the Priority Scheduling option is supported,
          then the thread of the highest priority that has been waiting the
          longest shall be unblocked to send its message. Otherwise, it is
          unspecified which waiting thread is unblocked. If the specified
          message queue is full and O_NONBLOCK is set in the message queue
          description associated with mqdes, the message shall not be
          queued and mq_send() shall return an error.

          The mq_timedsend() function shall add a message to the message
          queue specified by mqdes in the manner defined for the mq_send()
          function. However, if the specified message queue is full and
          O_NONBLOCK is not set in the message queue description associated
          with mqdes, the wait for sufficient room in the queue shall be
          terminated when the specified timeout expires. If O_NONBLOCK is
          set in the message queue description, this function shall be
          equivalent to mq_send().

          The timeout shall expire when the absolute time specified by
          abstime passes, as measured by the clock on which timeouts are
          based (that is, when the value of that clock equals or exceeds
          abstime), or if the absolute time specified by abstime has
          already been passed at the time of the call.

          The timeout shall be based on the CLOCK_REALTIME clock.  The
          resolution of the timeout shall be the resolution of the clock on
          which it is based. The timespec argument is defined in the
          <time.h> header.

          Under no circumstance shall the operation fail with a timeout if
          there is sufficient room in the queue to add the message
          immediately. The validity of the abstime parameter need not be
          checked when there is sufficient room in the queue.


-----------------------------------------------------------------

::

          Upon successful completion, the mq_send() and mq_timedsend()
          functions shall return a value of zero. Otherwise, no message
          shall be enqueued, the functions shall return -1, and errno shall
          be set to indicate the error.


-----------------------------------------------------

::

          The mq_send() and mq_timedsend() functions shall fail if:

          EAGAIN The O_NONBLOCK flag is set in the message queue
                 description associated with mqdes, and the specified
                 message queue is full.

          EBADF  The mqdes argument is not a valid message queue descriptor
                 open for writing.

          EINTR  A signal interrupted the call to mq_send() or
                 mq_timedsend().

          EINVAL The value of msg_prio was outside the valid range.

          EINVAL The process or thread would have blocked, and the abstime
                 parameter specified a nanoseconds field value less than
                 zero or greater than or equal to 1000 million.

          EMSGSIZE
                 The specified message length, msg_len, exceeds the message
                 size attribute of the message queue.

          ETIMEDOUT
                 The O_NONBLOCK flag was not set when the message queue was
                 opened, but the timeout expired before the message could
                 be added to the queue.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The value of the symbol {MQ_PRIO_MAX} limits the number of
          priority levels supported by the application.  Message priorities
          range from 0 to {MQ_PRIO_MAX}-1.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mq_open(3p), mq_receive(3p), mq_setattr(3p), time(3p)

          The Base Definitions volume of POSIX.1‐2017, mqueue.h(0p),
          time.h(0p)


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

   IEEE/The Open Group               2017                       MQ_SEND(3P)

--------------

Pages that refer to this page:
`mqueue.h(0p) <../man0/mqueue.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
`mq_notify(3p) <../man3/mq_notify.3p.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_setattr(3p) <../man3/mq_setattr.3p.html>`__, 
`mq_timedsend(3p) <../man3/mq_timedsend.3p.html>`__, 
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
