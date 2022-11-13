.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_new_signal(3) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_NEW_SIGNAL(3)us_message_new_signalS_MESSAGE_NEW_SIGNAL(3)

NAME
-------------------------------------------------

::

          sd_bus_message_new_signal - Create a signal message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_new_signal(sd_bus *bus, sd_bus_message **m,
                                        const char *path,
                                        const char *interface,
                                        const char *member);


---------------------------------------------------------------

::

          The sd_bus_message_new_signal() function creates a new bus
          message object that encapsulates a D-Bus signal, and returns it
          in the m output parameter. The signal will be sent to path path,
          on the interface interface, member member. When this message is
          sent, no reply is expected. See sd_bus_message_new_method_call(1)
          for a short description of the meaning of the path, interface,
          and member parameters.


-----------------------------------------------------------------

::

          This function returns 0 if the message object was successfully
          created, and a negative errno-style error code otherwise.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The output parameter m is NULL.

              The path parameter is not a valid D-Bus path
              ("/an/object/path"), the interface parameter is not a valid
              D-Bus interface name ("an.interface.name"), or the member
              parameter is not a valid D-Bus member ("Name").

          -ENOTCONN
              The bus parameter bus is NULL or the bus is not connected.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Example 1. Send a simple signal

              #include <systemd/sd-bus.h>
              #define _cleanup_(f) __attribute__((cleanup(f)))

              int send_unit_files_changed(sd_bus *bus) {
                _cleanup_(sd_bus_message_unrefp) sd_bus_message *message = NULL;
                int r;

                r = sd_bus_message_new_signal(bus, &message,
                                              "/org/freedesktop/systemd1",
                                              "org.freedesktop.systemd1.Manager",
                                              "UnitFilesChanged");
                if (r < 0)
                  return r;

                return sd_bus_send(bus, message, NULL);
              }

          This function in systemd sources is used to emit the
          "UnitFilesChanged" signal when the unit files have been changed.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_emit_signal(3)

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

   systemd 249                                 SD_BUS_MESSAGE_NEW_SIGNAL(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__

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
