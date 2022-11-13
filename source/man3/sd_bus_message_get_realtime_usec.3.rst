.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_get_monotonic_usec(3) — Linux manual page
========================================================

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

   SD_BUS_MESSAGE_GET_MONOTONIC_USEC(3)et_monotonic_usecT_MONOTONIC_USEC(3)

NAME
-------------------------------------------------

::

          sd_bus_message_get_monotonic_usec,
          sd_bus_message_get_realtime_usec, sd_bus_message_get_seqnum -
          Retrieve the sender timestamps and sequence number of a message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_get_monotonic_usec(sd_bus_message *message,
                                                uint64_t *usec);

          int sd_bus_message_get_realtime_usec(sd_bus_message *message,
                                               uint64_t *usec);

          int sd_bus_message_get_seqnum(sd_bus_message *message,
                                        uint64_t *seqnum);


---------------------------------------------------------------

::

          sd_bus_message_get_monotonic_usec() returns the monotonic
          timestamp of the time the message was sent. This value is in
          microseconds since the CLOCK_MONOTONIC epoch, see
          clock_gettime(2) for details.

          Similarly, sd_bus_message_get_realtime_usec() returns the
          realtime (wallclock) timestamp of the time the message was sent.
          This value is in microseconds since Jan 1st, 1970, i.e. in the
          CLOCK_REALTIME clock.

          sd_bus_message_get_seqnum() returns the kernel-assigned sequence
          number of the message. The kernel assigns a global, monotonically
          increasing sequence number to all messages transmitted on the
          local system, at the time the message was sent. This sequence
          number is useful for determining message send order, even across
          different buses of the local system. The sequence number combined
          with the boot ID of the system (as returned by
          sd_id128_get_boot(3)) is a suitable globally unique identifier
          for bus messages.

          Note that the sending order and receiving order of messages might
          differ, in particular for broadcast messages. This means that the
          sequence number and the timestamps of messages a client reads are
          not necessarily monotonically increasing.

          These timestamps and the sequence number are attached to each
          message by the kernel and cannot be manipulated by the sender.

          Note that these timestamps are only available on some bus
          transports, and only after support for them has been negotiated
          with the sd_bus_negotiate_timestamp(3) call.


-----------------------------------------------------------------

::

          On success, these calls return 0 or a positive integer. On
          failure, these calls return a negative errno-style error code.

          On success, the timestamp or sequence number is returned in the
          specified 64-bit unsigned integer variable.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              A specified parameter is invalid.

          -ENODATA
              No timestamp or sequence number information is attached to
              the passed message. This error is returned if the underlying
              transport does not support timestamping or assigning of
              sequence numbers, or if this feature has not been negotiated
              with sd_bus_negotiate_timestamp(3).


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3),
          sd_bus_negotiate_timestamp(3), clock_gettime(2),
          sd_id128_get_boot(3)

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

   systemd 249                         SD_BUS_MESSAGE_GET_MONOTONIC_USEC(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_negotiate_fds(3) <../man3/sd_bus_negotiate_fds.3.html>`__

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
