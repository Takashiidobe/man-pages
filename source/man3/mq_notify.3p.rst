.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mq_notify(3p) — Linux manual page
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

   MQ_NOTIFY(3P)           POSIX Programmer's Manual          MQ_NOTIFY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mq_notify — notify process that a message is available (REALTIME)


---------------------------------------------------------

::

          #include <mqueue.h>

          int mq_notify(mqd_t mqdes, const struct sigevent *notification);


---------------------------------------------------------------

::

          If the argument notification is not NULL, this function shall
          register the calling process to be notified of message arrival at
          an empty message queue associated with the specified message
          queue descriptor, mqdes.  The notification specified by the
          notification argument shall be sent to the process when the
          message queue transitions from empty to non-empty. At any time,
          only one process may be registered for notification by a message
          queue. If the calling process or any other process has already
          registered for notification of message arrival at the specified
          message queue, subsequent attempts to register for that message
          queue shall fail.

          If notification is NULL and the process is currently registered
          for notification by the specified message queue, the existing
          registration shall be removed.

          When the notification is sent to the registered process, its
          registration shall be removed. The message queue shall then be
          available for registration.

          If a process has registered for notification of message arrival
          at a message queue and some thread is blocked in mq_receive() or
          mq_timedreceive() waiting to receive a message when a message
          arrives at the queue, the arriving message shall satisfy the
          appropriate mq_receive() or mq_timedreceive(), respectively. The
          resulting behavior is as if the message queue remains empty, and
          no notification shall be sent.


-----------------------------------------------------------------

::

          Upon successful completion, the mq_notify() function shall return
          a value of zero; otherwise, the function shall return a value of
          -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The mq_notify() function shall fail if:

          EBADF  The mqdes argument is not a valid message queue
                 descriptor.

          EBUSY  A process is already registered for notification by the
                 message queue.

          The mq_notify() function may fail if:

          EINVAL The notification argument is NULL and the process is
                 currently not registered.

          The following sections are informative.


---------------------------------------------------------

::

          The following program registers a notification request for the
          message queue named in its command-line argument. Notification is
          performed by creating a thread. The thread executes a function
          which reads one message from the queue and then terminates the
          process.

              #include <pthread.h>
              #include <mqueue.h>
              #include <assert.h>
              #include <stdio.h>
              #include <stdlib.h>
              #include <unistd.h>

              static void                     /* Thread start function */
              tfunc(union sigval sv)
              {
                  struct mq_attr attr;
                  ssize_t nr;
                  void *buf;
                  mqd_t mqdes = *((mqd_t *) sv.sival_ptr);

                  /* Determine maximum msg size; allocate buffer to receive msg */

                  if (mq_getattr(mqdes, &attr) == -1) {
                      perror("mq_getattr");
                      exit(EXIT_FAILURE);
                  }
                  buf = malloc(attr.mq_msgsize);

                  if (buf == NULL) {
                      perror("malloc");
                      exit(EXIT_FAILURE);
                  }

                  nr = mq_receive(mqdes, buf, attr.mq_msgsize, NULL);
                  if (nr == -1) {
                      perror("mq_receive");
                      exit(EXIT_FAILURE);
                  }

                  printf("Read %ld bytes from message queue\n", (long) nr);
                  free(buf);
                  exit(EXIT_SUCCESS);         /* Terminate the process */
              }

              int
              main(int argc, char *argv[])
              {
                  mqd_t mqdes;
                  struct sigevent not;

                  assert(argc == 2);

                  mqdes = mq_open(argv[1], O_RDONLY);
                  if (mqdes == (mqd_t) -1) {
                      perror("mq_open");
                      exit(EXIT_FAILURE);
                  }

                  not.sigev_notify = SIGEV_THREAD;
                  not.sigev_notify_function = tfunc;
                  not.sigev_notify_attributes = NULL;
                  not.sigev_value.sival_ptr = &mqdes;   /* Arg. to thread func. */
                  if (mq_notify(mqdes, &not) == -1) {
                      perror("mq_notify");
                      exit(EXIT_FAILURE);
                  }

                  pause();    /* Process will be terminated by thread function */
              }


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

          mq_open(3p), mq_send(3p), mq_receive(3p), msgctl(3p), msgget(3p),
          msgrcv(3p), msgsnd(3p)

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

   IEEE/The Open Group               2017                     MQ_NOTIFY(3P)

--------------

Pages that refer to this page:
`mqueue.h(0p) <../man0/mqueue.h.0p.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
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
