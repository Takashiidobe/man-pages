.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mq_send(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MQ_SEND(3)              Linux Programmer's Manual             MQ_SEND(3)

NAME
-------------------------------------------------

::

          mq_send, mq_timedsend - send a message to a message queue


---------------------------------------------------------

::

          #include <mqueue.h>

          int mq_send(mqd_t mqdes, const char *msg_ptr,
                        size_t msg_len, unsigned int msg_prio);

          #include <time.h>
          #include <mqueue.h>

          int mq_timedsend(mqd_t mqdes, const char *msg_ptr,
                        size_t msg_len, unsigned int msg_prio,
                        const struct timespec *abs_timeout);

          Link with -lrt.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          mq_timedsend():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          mq_send() adds the message pointed to by msg_ptr to the message
          queue referred to by the message queue descriptor mqdes.  The
          msg_len argument specifies the length of the message pointed to
          by msg_ptr; this length must be less than or equal to the queue's
          mq_msgsize attribute.  Zero-length messages are allowed.

          The msg_prio argument is a nonnegative integer that specifies the
          priority of this message.  Messages are placed on the queue in
          decreasing order of priority, with newer messages of the same
          priority being placed after older messages with the same
          priority.  See mq_overview(7) for details on the range for the
          message priority.

          If the message queue is already full (i.e., the number of
          messages on the queue equals the queue's mq_maxmsg attribute),
          then, by default, mq_send() blocks until sufficient space becomes
          available to allow the message to be queued, or until the call is
          interrupted by a signal handler.  If the O_NONBLOCK flag is
          enabled for the message queue description, then the call instead
          fails immediately with the error EAGAIN.

          mq_timedsend() behaves just like mq_send(), except that if the
          queue is full and the O_NONBLOCK flag is not enabled for the
          message queue description, then abs_timeout points to a structure
          which specifies how long the call will block.  This value is an
          absolute timeout in seconds and nanoseconds since the Epoch,
          1970-01-01 00:00:00 +0000 (UTC), specified in the following
          structure:

              struct timespec {
                  time_t tv_sec;        /* seconds */
                  long   tv_nsec;       /* nanoseconds */
              };

          If the message queue is full, and the timeout has already expired
          by the time of the call, mq_timedsend() returns immediately.


-----------------------------------------------------------------

::

          On success, mq_send() and mq_timedsend() return zero; on error,
          -1 is returned, with errno set to indicate the error.


-----------------------------------------------------

::

          EAGAIN The queue was full, and the O_NONBLOCK flag was set for
                 the message queue description referred to by mqdes.

          EBADF  The descriptor specified in mqdes was invalid or not
                 opened for writing.

          EINTR  The call was interrupted by a signal handler; see
                 signal(7).

          EINVAL The call would have blocked, and abs_timeout was invalid,
                 either because tv_sec was less than zero, or because
                 tv_nsec was less than zero or greater than 1000 million.

          EMSGSIZE
                 msg_len was greater than the mq_msgsize attribute of the
                 message queue.

          ETIMEDOUT
                 The call timed out before a message could be transferred.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │mq_send(), mq_timedsend()             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          On Linux, mq_timedsend() is a system call, and mq_send() is a
          library function layered on top of that system call.


---------------------------------------------------------

::

          mq_close(3), mq_getattr(3), mq_notify(3), mq_open(3),
          mq_receive(3), mq_unlink(3), mq_overview(7), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     MQ_SEND(3)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`mq_close(3) <../man3/mq_close.3.html>`__, 
`mq_getattr(3) <../man3/mq_getattr.3.html>`__, 
`mq_notify(3) <../man3/mq_notify.3.html>`__, 
`mq_open(3) <../man3/mq_open.3.html>`__, 
`mq_receive(3) <../man3/mq_receive.3.html>`__, 
`mq_unlink(3) <../man3/mq_unlink.3.html>`__, 
`mq_overview(7) <../man7/mq_overview.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/mq_send.3.license.html>`__

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
