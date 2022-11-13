.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_negotiate_fds(3) — Linux manual page
===========================================

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

   SD_BUS_NEGOTIATE_FDS(3)   sd_bus_negotiate_fds   SD_BUS_NEGOTIATE_FDS(3)

NAME
-------------------------------------------------

::

          sd_bus_negotiate_fds, sd_bus_negotiate_timestamp,
          sd_bus_negotiate_creds, sd_bus_get_creds_mask - Control feature
          negotiation on bus connections


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_negotiate_fds(sd_bus *bus, int b);

          int sd_bus_negotiate_timestamp(sd_bus *bus, int b);

          int sd_bus_negotiate_creds(sd_bus *bus, int b, uint64_t mask);

          int sd_bus_get_creds_mask(sd_bus *bus, uint64_t *mask);


---------------------------------------------------------------

::

          sd_bus_negotiate_fds() controls whether file descriptor passing
          shall be negotiated for the specified bus connection. It takes a
          bus object and a boolean, which, when true, enables file
          descriptor passing, and, when false, disables it. Note that not
          all transports and servers support file descriptor passing. In
          particular, networked transports generally do not support file
          descriptor passing. To find out whether file descriptor passing
          is available after negotiation, use sd_bus_can_send(3) and pass
          SD_BUS_TYPE_UNIX_FD. Note that file descriptor passing is always
          enabled for both sending and receiving or for neither, but never
          only in one direction. By default, file descriptor passing is
          negotiated for all connections.

          sd_bus_negotiate_timestamp() controls whether implicit sender
          timestamps shall be attached automatically to all incoming
          messages. Takes a bus object and a boolean, which, when true,
          enables timestamping, and, when false, disables it. Use
          sd_bus_message_get_monotonic_usec(3),
          sd_bus_message_get_realtime_usec(3), sd_bus_message_get_seqnum(3)
          to query the timestamps of incoming messages. If negotiation is
          disabled or not supported, these calls will fail with -ENODATA.
          Note that currently no transports support timestamping of
          messages. By default, message timestamping is not negotiated for
          connections.

          sd_bus_negotiate_creds() controls whether and which implicit
          sender credentials shall be attached automatically to all
          incoming messages. Takes a bus object and a boolean indicating
          whether to enable or disable the credential parts encoded in the
          bit mask value argument. Note that not all transports support
          attaching sender credentials to messages, or do not support all
          types of sender credential parameters, or might suppress them
          under certain circumstances for individual messages.
          Specifically, dbus1 only supports SD_BUS_CREDS_UNIQUE_NAME. The
          sender credentials are suitable for authorization decisions. By
          default, only SD_BUS_CREDS_WELL_KNOWN_NAMES and
          SD_BUS_CREDS_UNIQUE_NAME are enabled. In fact, these two
          credential fields are always sent along and cannot be turned off.

          sd_bus_get_creds_mask() returns the set of sender credentials
          that was negotiated to be attached to all incoming messages in
          mask. This value is an upper boundary only. Hence, always make
          sure to explicitly check which credentials are attached to a
          specific message before using it.

          The sd_bus_negotiate_fds() function may be called only before the
          connection has been started with sd_bus_start(3). Both
          sd_bus_negotiate_timestamp() and sd_bus_negotiate_creds() may
          also be called after a connection has been set up. Note that,
          when operating on a connection that is shared between multiple
          components of the same program (for example via
          sd_bus_default(3)), it is highly recommended to only enable
          additional per message metadata fields, but never disable them
          again, in order not to disable functionality needed by other
          components.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EPERM
              The bus connection has already been started.

          -EINVAL
              An argument is invalid.

          -ENOPKG
              The bus cannot be resolved.

          -ECHILD
              The bus was created in a different process.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_start(3), sd_bus_can_send(3),
          sd_bus_message_get_monotonic_usec(3),
          sd_bus_message_get_realtime_usec(3),
          sd_bus_message_get_seqnum(3), sd_bus_message_get_creds(3)

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

   systemd 249                                      SD_BUS_NEGOTIATE_FDS(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_get_monotonic_usec(3) <../man3/sd_bus_message_get_monotonic_usec.3.html>`__

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
