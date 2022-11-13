.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigevent(7) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGEVENT(7)             Linux Programmer's Manual            SIGEVENT(7)

NAME
-------------------------------------------------

::

          sigevent - structure for notification from asynchronous routines


---------------------------------------------------------

::

          #include <signal.h>

          union sigval {            /* Data passed with notification */
              int     sival_int;    /* Integer value */
              void   *sival_ptr;    /* Pointer value */
          };

          struct sigevent {
              int    sigev_notify;  /* Notification method */
              int    sigev_signo;   /* Notification signal */
              union sigval sigev_value;
                                    /* Data passed with notification */
              void (*sigev_notify_function)(union sigval);
                                    /* Function used for thread
                                       notification (SIGEV_THREAD) */
              void  *sigev_notify_attributes;
                                    /* Attributes for notification thread
                                       (SIGEV_THREAD) */
              pid_t  sigev_notify_thread_id;
                                    /* ID of thread to signal
                                       (SIGEV_THREAD_ID); Linux-specific */
          };


---------------------------------------------------------------

::

          The sigevent structure is used by various APIs to describe the
          way a process is to be notified about an event (e.g., completion
          of an asynchronous request, expiration of a timer, or the arrival
          of a message).

          The definition shown in the SYNOPSIS is approximate: some of the
          fields in the sigevent structure may be defined as part of a
          union.  Programs should employ only those fields relevant to the
          value specified in sigev_notify.

          The sigev_notify field specifies how notification is to be
          performed.  This field can have one of the following values:

          SIGEV_NONE
                 A "null" notification: don't do anything when the event
                 occurs.

          SIGEV_SIGNAL
                 Notify the process by sending the signal specified in
                 sigev_signo.

                 If the signal is caught with a signal handler that was
                 registered using the sigaction(2) SA_SIGINFO flag, then
                 the following fields are set in the siginfo_t structure
                 that is passed as the second argument of the handler:

                 si_code
                        This field is set to a value that depends on the
                        API delivering the notification.

                 si_signo
                        This field is set to the signal number (i.e., the
                        same value as in sigev_signo).

                 si_value
                        This field is set to the value specified in
                        sigev_value.

                 Depending on the API, other fields may also be set in the
                 siginfo_t structure.

                 The same information is also available if the signal is
                 accepted using sigwaitinfo(2).

          SIGEV_THREAD
                 Notify the process by invoking sigev_notify_function "as
                 if" it were the start function of a new thread.  (Among
                 the implementation possibilities here are that each timer
                 notification could result in the creation of a new thread,
                 or that a single thread is created to receive all
                 notifications.)  The function is invoked with sigev_value
                 as its sole argument.  If sigev_notify_attributes is not
                 NULL, it should point to a pthread_attr_t structure that
                 defines attributes for the new thread (see
                 pthread_attr_init(3)).

          SIGEV_THREAD_ID (Linux-specific)
                 Currently used only by POSIX timers; see timer_create(2).


---------------------------------------------------------

::

          timer_create(2), aio_fsync(3), aio_read(3), aio_write(3),
          getaddrinfo_a(3), lio_listio(3), mq_notify(3), aio(7),
          pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    SIGEVENT(7)

--------------

Pages that refer to this page:
`timer_create(2) <../man2/timer_create.2.html>`__, 
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`getaddrinfo_a(3) <../man3/getaddrinfo_a.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`mq_notify(3) <../man3/mq_notify.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/sigevent.7.license.html>`__

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
