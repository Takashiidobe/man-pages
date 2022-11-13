.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_new_method_call(3) — Linux manual page
=====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_NEW_METHOD_CALL(3)ge_new_method_callGE_NEW_METHOD_CALL(3)

NAME
-------------------------------------------------

::

          sd_bus_message_new_method_call, sd_bus_message_new_method_return
          - Create a method call message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_new_method_call(sd_bus *bus,
                                             sd_bus_message **m,
                                             const char *destination,
                                             const char *path,
                                             const char *interface,
                                             const char *member);

          int sd_bus_message_new_method_return(sd_bus_message *call,
                                               sd_bus_message **m);


---------------------------------------------------------------

::

          The sd_bus_message_new_method_call() function creates a new bus
          message object that encapsulates a D-Bus method call, and returns
          it in the m output parameter. The call will be made on the
          destination destination, path path, on the interface interface,
          member member.

          Briefly, the destination is a dot-separated name that identifies
          a service connected to the bus. The path is a slash-separated
          identifier of an object within the destination that resembles a
          file system path. The meaning of this path is defined by the
          destination. The interface is a dot-separated name that resembles
          a Java interface name that identifies a group of methods and
          signals supported by the object identified by path. Methods and
          signals are collectively called members and are identified by a
          simple name composed of ASCII letters, numbers, and underscores.
          See the D-Bus Tutorial[1] for an in-depth explanation.

          The destination parameter may be NULL. The interface parameter
          may be NULL, if the destination has only a single member with the
          given name and there is no ambiguity if the interface name is
          omitted.

          Note that this is a low level interface. See
          sd_bus_call_method(3) for a more convenient way of calling D-Bus
          methods.

          The sd_bus_message_new_method_return() function creates a new bus
          message object that is a reply to the method call call and
          returns it in the m output parameter. The call parameter must be
          a method call message. The sender of call is used as the
          destination.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The output parameter m is NULL.

              The destination parameter is non-null and is not a valid
              D-Bus service name ("org.somewhere.Something"), the path
              parameter is not a valid D-Bus path ("/an/object/path"), the
              interface parameter is non-null and is not a valid D-Bus
              interface name ("an.interface.name"), or the member parameter
              is not a valid D-Bus member ("Name").

              The call parameter is not a method call object.

          -ENOTCONN
              The bus parameter bus is NULL or the bus is not connected.

          -ENOMEM
              Memory allocation failed.

          -EPERM
              The call parameter is not sealed.

          -EOPNOTSUPP
              The call message does not have a cookie.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Example 1. Make a call to a D-Bus method that takes a single
          parameter

              #include <stdio.h>
              #include <string.h>
              #include <unistd.h>
              #include <sys/types.h>

              #include <systemd/sd-bus.h>
              #define _cleanup_(f) __attribute__((cleanup(f)))

              /* This is equivalent to:
               * busctl call org.freedesktop.systemd1 /org/freedesktop/systemd1 \
               *       org.freedesktop.systemd1.Manager GetUnitByPID $$
               *
               * Compile with 'cc -lsystemd print-unit-path.c'
               */

              #define DESTINATION "org.freedesktop.systemd1"
              #define PATH        "/org/freedesktop/systemd1"
              #define INTERFACE   "org.freedesktop.systemd1.Manager"
              #define MEMBER      "GetUnitByPID"

              static int log_error(int error, const char *message) {
                fprintf(stderr, "%s: %s\n", message, strerror(-error));
                return error;
              }

              static int print_unit_path(sd_bus *bus) {
                _cleanup_(sd_bus_message_unrefp) sd_bus_message *m = NULL;
                _cleanup_(sd_bus_error_free) sd_bus_error error = SD_BUS_ERROR_NULL;
                _cleanup_(sd_bus_message_unrefp) sd_bus_message *reply = NULL;
                int r;

                r = sd_bus_message_new_method_call(bus, &m,
                                                   DESTINATION, PATH, INTERFACE, MEMBER);
                if (r < 0)
                  return log_error(r, "Failed to create bus message");

                r = sd_bus_message_append(m, "u", (unsigned) getpid());
                if (r < 0)
                  return log_error(r, "Failed to append to bus message");

                r = sd_bus_call(bus, m, -1, &error, &reply);
                if (r < 0)
                  return log_error(r, "Call failed");

                const char *ans;
                r = sd_bus_message_read(reply, "o", &ans);
                if (r < 0)
                  return log_error(r, "Failed to read reply");

                printf("Unit path is \"%s\".\n", ans);

                return 0;
              }

              int main(int argc, char **argv) {
                _cleanup_(sd_bus_flush_close_unrefp) sd_bus *bus = NULL;
                int r;

                r = sd_bus_open_system(&bus);
                if (r < 0)
                  return log_error(r, "Failed to acquire bus");

                print_unit_path(bus);
              }

          This defines a minimally useful program that will open a
          connection to the bus, create a message object, send it, wait for
          the reply, and finally extract and print the answer. It does
          error handling and proper memory management.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_call(3), sd_bus_call_method(3),
          sd_bus_path_encode(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. D-Bus Tutorial
              https://dbus.freedesktop.org/doc/dbus-tutorial.html#concepts

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

   systemd 249                            SD_BUS_MESSAGE_NEW_METHOD_CALL(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__, 
`sd_bus_message_sensitive(3) <../man3/sd_bus_message_sensitive.3.html>`__, 
`sd_bus_message_set_destination(3) <../man3/sd_bus_message_set_destination.3.html>`__, 
`sd_bus_reply_method_return(3) <../man3/sd_bus_reply_method_return.3.html>`__

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
