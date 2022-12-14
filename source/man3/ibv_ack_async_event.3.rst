.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_get_async_event(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_GET_ASYNC_EVENT(3)ibibverbs Programmer's ManualBV_GET_ASYNC_EVENT(3)

NAME
-------------------------------------------------

::

          ibv_get_async_event, ibv_ack_async_event - get or acknowledge
          asynchronous events


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_get_async_event(struct ibv_context *context,
                                  struct ibv_async_event *event);

          void ibv_ack_async_event(struct ibv_async_event *event);


---------------------------------------------------------------

::

          ibv_get_async_event() waits for the next async event of the RDMA
          device context context and returns it through the pointer event,
          which is an ibv_async_event struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_async_event {
                  union {
                          struct ibv_cq  *cq;             /* CQ that got the event */
                          struct ibv_qp  *qp;             /* QP that got the event */
                          struct ibv_srq *srq;            /* SRQ that got the event */
                          int             port_num;       /* port number that got the event */
                  } element;
                  enum ibv_event_type     event_type;     /* type of the event */
          };

          One member of the element union will be valid, depending on the
          event_type member of the structure.  event_type will be one of
          the following events:

          QP events:

          IBV_EVENT_QP_FATAL  Error occurred on a QP and it transitioned to
          error state

          IBV_EVENT_QP_REQ_ERR  Invalid Request Local Work Queue Error

          IBV_EVENT_QP_ACCESS_ERR  Local access violation error

          IBV_EVENT_COMM_EST  Communication was established on a QP

          IBV_EVENT_SQ_DRAINED  Send Queue was drained of outstanding
          messages in progress

          IBV_EVENT_PATH_MIG  A connection has migrated to the alternate
          path

          IBV_EVENT_PATH_MIG_ERR  A connection failed to migrate to the
          alternate path

          IBV_EVENT_QP_LAST_WQE_REACHED  Last WQE Reached on a QP
          associated with an SRQ

          CQ events:

          IBV_EVENT_CQ_ERR  CQ is in error (CQ overrun)

          SRQ events:

          IBV_EVENT_SRQ_ERR  Error occurred on an SRQ

          IBV_EVENT_SRQ_LIMIT_REACHED  SRQ limit was reached

          Port events:

          IBV_EVENT_PORT_ACTIVE  Link became active on a port

          IBV_EVENT_PORT_ERR  Link became unavailable on a port

          IBV_EVENT_LID_CHANGE  LID was changed on a port

          IBV_EVENT_PKEY_CHANGE  P_Key table was changed on a port

          IBV_EVENT_SM_CHANGE  SM was changed on a port

          IBV_EVENT_CLIENT_REREGISTER  SM sent a CLIENT_REREGISTER request
          to a port

          IBV_EVENT_GID_CHANGE  GID table was changed on a port

          CA events:

          IBV_EVENT_DEVICE_FATAL  CA is in FATAL state

          ibv_ack_async_event() acknowledge the async event event.


-----------------------------------------------------------------

::

          ibv_get_async_event() returns 0 on success, and -1 on error.

          ibv_ack_async_event() returns no value.


---------------------------------------------------

::

          All async events that ibv_get_async_event() returns must be
          acknowledged using ibv_ack_async_event().  To avoid races,
          destroying an object (CQ, SRQ or QP) will wait for all affiliated
          events for the object to be acknowledged; this avoids an
          application retrieving an affiliated event after the
          corresponding object has already been destroyed.

          ibv_get_async_event() is a blocking function.  If multiple
          threads call this function simultaneously, then when an async
          event occurs, only one thread will receive it, and it is not
          possible to predict which thread will receive it.


---------------------------------------------------------

::

          The following code example demonstrates one possible way to work
          with async events in non-blocking mode.  It performs the
          following steps:

          1. Set the async events queue work mode to be non-blocked
          2. Poll the queue until it has an async event
          3. Get the async event and ack it

          /* change the blocking mode of the async event queue */
          flags = fcntl(ctx->async_fd, F_GETFL);
          rc = fcntl(ctx->async_fd, F_SETFL, flags | O_NONBLOCK);
          if (rc < 0) {
                  fprintf(stderr, "Failed to change file descriptor of async event queue\n");
                  return 1;
          }

          /*
           * poll the queue until it has an event and sleep ms_timeout
           * milliseconds between any iteration
           */
          my_pollfd.fd      = ctx->async_fd;
          my_pollfd.events  = POLLIN;
          my_pollfd.revents = 0;

          do {
                  rc = poll(&my_pollfd, 1, ms_timeout);
          } while (rc == 0);
          if (rc < 0) {
                  fprintf(stderr, "poll failed\n");
                  return 1;
          }

          /* Get the async event */
          if (ibv_get_async_event(ctx, &async_event)) {
                  fprintf(stderr, "Failed to get async_event\n");
                  return 1;
          }

          /* Ack the event */
          ibv_ack_async_event(&async_event);


---------------------------------------------------------

::

          ibv_open_device(3)


-------------------------------------------------------

::

          Dotan Barak <dotanba@gmail.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the rdma-core (RDMA Core Userspace Libraries
          and Daemons) project.  Information about the project can be found
          at ⟨https://github.com/linux-rdma/rdma-core⟩.  If you have a bug
          report for this manual page, send it to
          linux-rdma@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/linux-rdma/rdma-core.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-18.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   libibverbs                     2006-10-31         IBV_GET_ASYNC_EVENT(3)

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
