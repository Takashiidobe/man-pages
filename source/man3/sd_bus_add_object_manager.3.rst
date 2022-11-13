.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_add_object_manager(3) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_ADD_OBJECT_MANAGER(3)us_add_object_managerS_ADD_OBJECT_MANAGER(3)

NAME
-------------------------------------------------

::

          sd_bus_add_object_manager - Add a D-Bus object manager for a
          D-Bus object sub-tree


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_add_object_manager(sd_bus *bus, sd_bus_slot **slot,
                                        const char *path);


---------------------------------------------------------------

::

          sd_bus_add_object_manager() installs a handler for the given path
          that implements the GetManagedObjects() method of the
          org.freedesktop.DBus.ObjectManager interface. See
          org.freedesktop.DBus.ObjectManager[1] for more information.

          To implement the InterfacesAdded and InterfacesRemoved signals of
          the org.freedesktop.DBus.ObjectManager interface, call
          sd_bus_emit_interfaces_added(3) and
          sd_bus_emit_interfaces_removed(3) whenever interfaces are added
          or removed from the sub-tree, respectively.

          When sd_bus_add_object_manager() succeeds, a slot is created
          internally. If the output parameter slot is NULL, a "floating"
          slot object is created, see sd_bus_slot_set_floating(3).
          Otherwise, a pointer to the slot object is returned. In that
          case, the reference to the slot object should be dropped when the
          object manager is not needed anymore, see sd_bus_slot_unref(3).


-----------------------------------------------------------------

::

          On success, sd_bus_add_object_manager() returns a non-negative
          integer. On failure, it returns a negative errno-style error
          code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              One of the required parameters is NULL or path is not a valid
              object path.

          -ENOPKG
              The bus cannot be resolved.

          -ECHILD
              The bus was created in a different process.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          sd-bus(3), busctl(1), sd_bus_add_object_vtable(3),
          sd_bus_emit_interfaces_added(3), sd_bus_slot_unref(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. org.freedesktop.DBus.ObjectManager
              https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager

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

   systemd 249                                 SD_BUS_ADD_OBJECT_MANAGER(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__

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
