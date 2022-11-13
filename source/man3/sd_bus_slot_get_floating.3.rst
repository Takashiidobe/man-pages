.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_slot_set_floating(3) — Linux manual page
===============================================

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

   SD_BUS_SLOT_SET_FLOATING(3)bus_slot_set_floatingBUS_SLOT_SET_FLOATING(3)

NAME
-------------------------------------------------

::

          sd_bus_slot_set_floating, sd_bus_slot_get_floating - Control
          whether a bus slot object is "floating"


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_slot_set_floating(sd_bus_slot *slot, int b);

          int sd_bus_slot_get_floating(sd_bus_slot *slot);


---------------------------------------------------------------

::

          sd_bus_slot_set_floating() controls whether the specified bus
          slot object slot shall be "floating" or not. A floating bus slot
          object's lifetime is bound to the lifetime of the bus object it
          is associated with, meaning that it remains allocated as long as
          the bus object itself and is freed automatically when the bus
          object is freed. Regular (i.e. non-floating) bus slot objects
          keep the bus referenced, hence the bus object remains allocated
          at least as long as there remains at least one referenced bus
          slot object around. The floating state hence controls the
          direction of referencing between the bus object and the bus slot
          objects: if floating the bus pins the bus slot, and otherwise the
          bus slot pins the bus objects. Use sd_bus_slot_set_floating() to
          switch between both modes: if the b parameter is zero, the slot
          object is considered floating, otherwise it is made a regular
          (non-floating) slot object.

          Bus slot objects may be allocated with calls such as
          sd_bus_add_match(3). If the slot of these functions is non-NULL
          the slot object will be of the regular kind (i.e. non-floating),
          otherwise it will be created floating. With
          sd_bus_slot_set_floating() a bus slot object allocated as regular
          can be converted into a floating object and back. This is
          particularly useful for creating a bus slot object, then changing
          parameters of it, and then turning it into a floating object,
          whose lifecycle is managed by the bus object.

          sd_bus_slot_get_floating() returns the current floating state of
          the specified bus slot object. It returns negative on error, zero
          if the bus slot object is a regular (non-floating) object and
          positive otherwise.


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The slot parameter is NULL.

          -ECHILD
              The bus connection has been created in a different process.

          -ESTALE
              The bus object the specified bus slot object is associated
              with has already been freed, and hence no change in the
              floating state can be made anymore.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_slot_set_destroy_callback(3),
          sd_bus_add_match(3)

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

   systemd 249                                  SD_BUS_SLOT_SET_FLOATING(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_match(3) <../man3/sd_bus_add_match.3.html>`__, 
`sd_bus_add_node_enumerator(3) <../man3/sd_bus_add_node_enumerator.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__, 
`sd_bus_add_object_manager(3) <../man3/sd_bus_add_object_manager.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_slot_set_destroy_callback(3) <../man3/sd_bus_slot_set_destroy_callback.3.html>`__

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
