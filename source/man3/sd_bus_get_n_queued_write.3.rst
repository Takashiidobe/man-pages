.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_get_n_queued_read(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_GET_N_QUEUED_READ(3)   sd_bus_get_fd  SD_BUS_GET_N_QUEUED_READ(3)

NAME
-------------------------------------------------

::

          sd_bus_get_n_queued_read, sd_bus_get_n_queued_write - Get the
          number of pending bus messages in the read and write queues of a
          bus connection object


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_get_n_queued_read(sd_bus *bus, uint64_t *ret);

          int sd_bus_get_n_queued_write(sd_bus *bus, uint64_t *ret);


---------------------------------------------------------------

::

          sd_bus_get_n_queued_read() may be used to query the number of bus
          messages in the read queue of a bus connection object. The read
          queue contains all messages read from the transport medium (e.g.
          network socket) but not yet processed locally. The function
          expects two arguments: the bus object to query, and a pointer to
          a 64bit counter variable to write the current queue size to. Use
          sd_bus_process() in order to process queued messages, i.e. to
          reduce the size of the read queue (as well as, in fact, the write
          queue, see below).

          Similarly, sd_bus_get_n_queued_write() may be used to query the
          number of currently pending bus messages in the write queue of a
          bus connection object. The write queue contains all messages
          enqueued into the connection with a call such as sd_bus_send()
          but not yet written to the transport medium. The expected
          arguments are similar to sd_bus_get_n_queued_read(). Here too,
          use sd_bus_process() to reduce the size of the write queue.
          Alternatively, use sd_bus_flush() to synchronously write out any
          pending bus messages until the write queue is empty.


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ECHILD
              The bus connection was created in a different process.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_process(3), sd_bus_send(3),
          sd_bus_flush(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                  SD_BUS_GET_N_QUEUED_READ(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__

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
