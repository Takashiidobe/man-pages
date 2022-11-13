.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_add_node_enumerator(3) — Linux manual page
=================================================

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

   SD_BUS_ADD_NODE_ENUMERATOR(3)_add_node_enumerator_ADD_NODE_ENUMERATOR(3)

NAME
-------------------------------------------------

::

          sd_bus_add_node_enumerator - Add a node enumerator for a D-Bus
          object path prefix


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef int (*sd_bus_node_enumerator_t)(sd_bus *bus,
                                                  const char *prefix,
                                                  void *userdata,
                                                  char ***ret_nodes,
                                                  sd_bus_error *ret_error);

          int sd_bus_add_node_enumerator(sd_bus *bus, sd_bus_slot **slot,
                                         const char *path,
                                         sd_bus_node_enumerator_t callback,
                                         void *userdata);


---------------------------------------------------------------

::

          sd_bus_add_node_enumerator() adds a D-Bus node enumerator for the
          given path prefix. The given callback is called to enumerate all
          the available objects with the given path prefix when required
          (e.g. when org.freedesktop.DBus.Introspectable.Introspect or
          org.freedesktop.DBus.ObjectManager.GetManagedObjects are called
          on a D-Bus service managed by sd-bus).

          callback is called with the path and userdata pointer registered
          with sd_bus_add_node_enumerator(). When called, it should store
          all the child object paths of the given path prefix in ret_nodes
          with a NULL terminator item. The callback should return a
          non-negative value on success. If an error occurs, it can either
          return a negative integer, set ret_error to a non-empty error or
          do both. Any errors returned by the callback are encoded as D-Bus
          errors and sent back to the caller. Errors in ret_error take
          priority over negative return values.

          Note that a node enumerator callback will only ever be called for
          a single path prefix and hence, for normal operation, prefix can
          be ignored. Also, a node enumerator is only used to enumerate the
          available child objects under a given prefix. To install a
          handler for a set of dynamic child objects, use
          sd_bus_add_fallback_vtable(3).

          When sd_bus_add_node_enumerator() succeeds, a slot is created
          internally. If the output parameter slot is NULL, a "floating"
          slot object is created, see sd_bus_slot_set_floating(3).
          Otherwise, a pointer to the slot object is returned. In that
          case, the reference to the slot object should be dropped when the
          node enumerator is not needed anymore, see sd_bus_slot_unref(3).


-----------------------------------------------------------------

::

          On success, sd_bus_add_node_enumerator() returns a non-negative
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

          sd-bus(3), busctl(1), sd_bus_add_fallback_vtable(3),
          sd_bus_slot_unref(3)

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

   systemd 249                                SD_BUS_ADD_NODE_ENUMERATOR(3)

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
