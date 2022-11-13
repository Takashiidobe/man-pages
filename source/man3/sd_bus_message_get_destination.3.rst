.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_set_destination(3) — Linux manual page
=====================================================

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

   SD_BUS_MESSAGE_SET_DESTINATION(3)ge_set_destinationGE_SET_DESTINATION(3)

NAME
-------------------------------------------------

::

          sd_bus_message_set_destination, sd_bus_message_get_destination,
          sd_bus_message_get_path, sd_bus_message_get_interface,
          sd_bus_message_get_member, sd_bus_message_set_sender,
          sd_bus_message_get_sender - Set and query bus message addressing
          information


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_set_destination(sd_bus_message *message,
                                             const char *destination);

          const char*
                                                     sd_bus_message_get_destination(sd_bus_message *message);

          const char* sd_bus_message_get_path(sd_bus_message *message);

          const char*
                                                   sd_bus_message_get_interface(sd_bus_message *message);

          const char* sd_bus_message_get_member(sd_bus_message *message);

          int sd_bus_message_set_sender(sd_bus_message *message,
                                        const char *sender);

          const char* sd_bus_message_get_sender(sd_bus_message *message);


---------------------------------------------------------------

::

          sd_bus_message_set_destination() sets the destination service
          name for the specified bus message object. The specified name
          must be a valid unique or well-known service name.

          sd_bus_message_get_destination(), sd_bus_message_get_path(),
          sd_bus_message_get_interface(), and sd_bus_message_get_member()
          return the destination, path, interface, and member fields from
          message header. The return value will be NULL is message is NULL
          or the message is of a type that doesn't use those fields or the
          message doesn't have them set. See
          sd_bus_message_new_method_call(3) and
          sd_bus_message_set_destination(3) for more discussion of those
          values.

          sd_bus_message_set_sender() sets the sender service name for the
          specified bus message object. The specified name must be a valid
          unique or well-known service name. This function is useful only
          for messages to send on direct connections as for connections to
          bus brokers the broker will fill in the destination field anyway,
          and the sender field set by original sender is ignored.

          sd_bus_message_get_sender() returns the sender field from
          message.

          When a string is returned, it is a pointer to internal storage,
          and may not be modified or freed. It is only valid as long as the
          message remains referenced and this field hasn't been changed by
          a different call.


-----------------------------------------------------------------

::

          On success, these calls return 0 or a positive integer. On
          failure, these calls return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The message parameter or the output parameter are NULL.

          -EPERM
              For sd_bus_message_set_destination() and
              sd_bus_message_set_sender(), the message is already sealed.

          -EEXIST
              The message already has a destination or sender field set.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3), sd_bus_set_sender(3)

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

   systemd 249                            SD_BUS_MESSAGE_SET_DESTINATION(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_message_set_destination(3) <../man3/sd_bus_message_set_destination.3.html>`__, 
`sd_bus_send(3) <../man3/sd_bus_send.3.html>`__, 
`sd_bus_set_sender(3) <../man3/sd_bus_set_sender.3.html>`__

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
