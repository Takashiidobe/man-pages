.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_emit_signal(3) — Linux manual page
=========================================

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

   SD_BUS_EMIT_SIGNAL(3)      sd_bus_emit_signal      SD_BUS_EMIT_SIGNAL(3)

NAME
-------------------------------------------------

::

          sd_bus_emit_signal, sd_bus_emit_signalv,
          sd_bus_emit_interfaces_added, sd_bus_emit_interfaces_added_strv,
          sd_bus_emit_interfaces_removed,
          sd_bus_emit_interfaces_removed_strv,
          sd_bus_emit_properties_changed,
          sd_bus_emit_properties_changed_strv, sd_bus_emit_object_added,
          sd_bus_emit_object_removed - Convenience functions for emitting
          (standard) D-Bus signals


---------------------------------------------------------

::

          #include <systemd/sd-bus-vtable.h>

          int sd_bus_emit_signal(sd_bus *bus, const char *path,
                                 const char *interface, const char *member,
                                 const char *types, ...);

          int sd_bus_emit_signalv(sd_bus *bus, const char *path,
                                  const char *interface,
                                  const char *member, const char *types,
                                  va_list ap);

          int sd_bus_emit_interfaces_added(sd_bus *bus, const char *path,
                                           const char *interface, ...);

          int sd_bus_emit_interfaces_added_strv(sd_bus *bus,
                                                const char *path,
                                                const char **interfaces);

          int sd_bus_emit_interfaces_removed(sd_bus *bus, const char *path,
                                             const char *interface, ...);

          int sd_bus_emit_interfaces_removed_strv(sd_bus *bus,
                                                  const char *path,
                                                  const char **interfaces);

          int sd_bus_emit_properties_changed(sd_bus *bus, const char *path,
                                             const char *interface,
                                             const char *name, ...);

          int sd_bus_emit_properties_changed_strv(sd_bus *bus,
                                                  const char *path,
                                                  const char *interface,
                                                  const char **names);

          int sd_bus_emit_object_added(sd_bus *bus, const char *path);

          int sd_bus_emit_object_removed(sd_bus *bus, const char *path);


---------------------------------------------------------------

::

          sd_bus_emit_signal() is a convenience function for initializing a
          bus message object and emitting the corresponding D-Bus signal.
          It combines the sd_bus_message_new_signal(3),
          sd_bus_message_append(3) and sd_bus_send(3) functions into a
          single function call.  sd_bus_emit_signalv() is equivalent to
          sd_bus_message_append(), except that it is called with a
          "va_list" instead of a variable number of arguments.

          sd_bus_emit_interfaces_added() and
          sd_bus_emit_interfaces_removed() are used to implement the
          InterfacesAdded and InterfacesRemoved signals of the
          org.freedesktop.DBus.ObjectManager interface. They take a path
          whose interfaces have been modified as an argument and a variable
          list of interfaces that have been added or removed, respectively.
          The final argument passed to sd_bus_emit_interfaces_added() and
          sd_bus_emit_interfaces_removed() must be NULL. This allows both
          functions to safely determine the number of passed interface
          arguments.  sd_bus_emit_interfaces_added_strv() and
          sd_bus_emit_interfaces_removed_strv() are identical to their
          respective counterparts but both take the list of interfaces as a
          single argument instead of a variable number of arguments.

          sd_bus_emit_properties_changed() is used to implement the
          PropertiesChanged signal of the org.freedesktop.DBus.Properties
          interface. It takes an object path, interface and a variable list
          of property names as its arguments. The final argument passed to
          sd_bus_emit_properties_changed() must be NULL. This allows it to
          safely determine the number of passed property names.
          sd_bus_emit_properties_changed_strv() is identical to
          sd_bus_emit_properties_changed() but takes the list of property
          names as a single argument instead of a variable number of
          arguments.

          sd_bus_emit_object_added() and sd_bus_emit_object_removed() are
          convenience functions for emitting the InterfacesAdded or
          InterfacesRemoved signals for all interfaces registered on a
          specific object path, respectively. This includes any parent
          fallback vtables if they are not overridden by a more applicable
          child vtable. It also includes all the standard D-Bus interfaces
          implemented by sd-bus itself on any registered object.

          Note that sd_bus_emit_interfaces_added(),
          sd_bus_emit_interfaces_removed(), sd_bus_emit_object_added() and
          sd_bus_emit_object_removed() require an object manager to have
          been registered on the given object path or one of its parent
          object paths using sd_bus_add_object_manager(3).


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              One of the required parameters is NULL or invalid. A reserved
              D-Bus interface was passed as the interface parameter.

          -ENOPKG
              The bus cannot be resolved.

          -ECHILD
              The bus was created in a different process.

          -ENOMEM
              Memory allocation failed.

          -ESRCH
              One of sd_bus_emit_interfaces_added(),
              sd_bus_emit_interfaces_removed(), sd_bus_emit_object_added()
              or sd_bus_emit_object_removed() was called on an object
              without an object manager registered on its own object path
              or one of its parent object paths.

          See the man pages of sd_bus_message_new_signal(3),
          sd_bus_message_append(3) and sd_bus_send(3) for more possible
          errors.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-bus(3), busctl(1), sd_bus_message_new_signal(3),
          sd_bus_message_append(3), sd_bus_send(3), sd_bus_call_method(3)

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

   systemd 249                                        SD_BUS_EMIT_SIGNAL(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__, 
`sd_bus_add_object_manager(3) <../man3/sd_bus_add_object_manager.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__, 
`sd_bus_message_new_signal(3) <../man3/sd_bus_message_new_signal.3.html>`__

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
