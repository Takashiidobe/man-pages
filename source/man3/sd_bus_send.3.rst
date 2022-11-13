.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_send(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_SEND(3)                 sd_bus_send                SD_BUS_SEND(3)

NAME
-------------------------------------------------

::

          sd_bus_send, sd_bus_send_to, sd_bus_message_send - Queue a D-Bus
          message for transfer


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_send(sd_bus *bus, sd_bus_message *m,
                          uint64_t *cookie);

          int sd_bus_send_to(sd_bus *bus, sd_bus_message *m,
                             const char *destination, uint64_t *cookie);

          int sd_bus_message_send(sd_bus_message *m);


---------------------------------------------------------------

::

          sd_bus_send() queues the bus message object m for transfer. If
          bus is NULL, the bus that m is attached to is used.  bus only
          needs to be set when the message is sent to a different bus than
          the one it's attached to, for example when forwarding messages.
          If the output parameter cookie is not NULL, it is set to the
          message identifier. This value can later be used to match
          incoming replies to their corresponding messages. If cookie is
          set to NULL and the message is not sealed, sd_bus_send() assumes
          the message m doesn't expect a reply and adds the necessary
          headers to indicate this.

          Note that in most scenarios, sd_bus_send() should not be called
          directly. Instead, use higher level functions such as
          sd_bus_call_method(3) and sd_bus_reply_method_return(3) which
          call sd_bus_send() internally.

          sd_bus_send_to() is a shorthand for sending a message to a
          specific destination. It's main use case is to simplify sending
          unicast signal messages (signals that only have a single
          receiver). It's behavior is similar to calling
          sd_bus_message_set_destination(3) followed by calling
          sd_bus_send().

          sd_bus_send()/sd_bus_send_to() will write the message directly to
          the underlying transport (e.g. kernel socket buffer) if possible.
          If the connection is not set up fully yet the message is queued
          locally. If the transport buffers are congested any unwritten
          message data is queued locally, too. If the connection has been
          closed or is currently being closed the call fails.
          sd_bus_process(3) should be invoked to write out any queued
          message data to the transport.

          sd_bus_message_send() is the same as sd_bus_send() but without
          the first and last argument.  sd_bus_message_send(m) is
          equivalent to sd_bus_send(sd_bus_message_get_bus(m), m, NULL).


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The input parameter m is NULL.

          -EOPNOTSUPP
              The bus connection does not support sending file descriptors.

          -ECHILD
              The bus connection was allocated in a parent process and is
              being reused in a child process after fork().

          -ENOBUFS
              The bus connection's write queue is full.

          -ENOTCONN
              The input parameter bus is NULL or the bus is not connected.

          -ECONNRESET
              The bus connection was closed while waiting for the response.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_call_method(3),
          sd_bus_message_set_destination(3), sd_bus_reply_method_return(3),
          sd_bus_process(3)

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

   systemd 249                                               SD_BUS_SEND(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__, 
`sd_bus_enqueue_for_read(3) <../man3/sd_bus_enqueue_for_read.3.html>`__, 
`sd_bus_get_n_queued_read(3) <../man3/sd_bus_get_n_queued_read.3.html>`__, 
`sd_bus_message_seal(3) <../man3/sd_bus_message_seal.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__

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
