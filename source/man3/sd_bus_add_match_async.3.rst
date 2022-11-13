.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_add_match(3) — Linux manual page
=======================================

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

   SD_BUS_ADD_MATCH(3)         sd_bus_add_match         SD_BUS_ADD_MATCH(3)

NAME
-------------------------------------------------

::

          sd_bus_add_match, sd_bus_add_match_async, sd_bus_match_signal,
          sd_bus_match_signal_async - Add a match rule for incoming message
          dispatching


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef int (*sd_bus_message_handler_t)(sd_bus_message *m,
                                                  void *userdata,
                                                  sd_bus_error *ret_error);

          int sd_bus_add_match(sd_bus *bus, sd_bus_slot **slot,
                               const char *match,
                               sd_bus_message_handler_t callback,
                               void *userdata);

          int sd_bus_add_match_async(sd_bus *bus, sd_bus_slot **slot,
                                     const char *match,
                                     sd_bus_message_handler_t callback,
                                     sd_bus_message_handler_t install_callback,
                                     void *userdata);

          int sd_bus_match_signal(sd_bus *bus, sd_bus_slot **slot,
                                  const char *sender, const char *path,
                                  const char *interface,
                                  const char *member,
                                  sd_bus_message_handler_t callback,
                                  void *userdata);

          int sd_bus_match_signal_async(sd_bus *bus, sd_bus_slot **slot,
                                        const char *sender,
                                        const char *path,
                                        const char *interface,
                                        const char *member,
                                        sd_bus_message_handler_t callback,
                                        sd_bus_message_handler_t install_callback,
                                        void *userdata);


---------------------------------------------------------------

::

          sd_bus_add_match() installs a match rule for messages received on
          the specified bus connection object bus. The syntax of the match
          rule expression passed in match is described in the D-Bus
          Specification[1]. The specified handler function callback is
          called for each incoming message matching the specified
          expression, the userdata parameter is passed as-is to the
          callback function. The match is installed synchronously when
          connected to a bus broker, i.e. the call sends a control message
          requested the match to be added to the broker and waits until the
          broker confirms the match has been installed successfully.

          sd_bus_add_match_async() operates very similar to
          sd_bus_add_match(), however it installs the match asynchronously,
          in a non-blocking fashion: a request is sent to the broker, but
          the call does not wait for a response. The install_callback
          function is called when the response is later received, with the
          response message from the broker as parameter. If this function
          is specified as NULL a default implementation is used that
          terminates the bus connection should installing the match fail.

          sd_bus_match_signal() is very similar to sd_bus_add_match(), but
          only matches signals, and instead of a match expression accepts
          four parameters: sender (the service name of the sender), path
          (the object path of the emitting object), interface (the
          interface the signal belongs to), member (the signal name), from
          which the match string is internally generated. Optionally, these
          parameters may be specified as NULL in which case the relevant
          field of incoming signals is not tested.

          sd_bus_match_signal_async() combines the signal matching logic of
          sd_bus_match_signal() with the asynchronous behaviour of
          sd_bus_add_match_async().

          On success, and if non-NULL, the slot return parameter will be
          set to a slot object that may be used as a reference to the
          installed match, and may be utilized to remove it again at a
          later time with sd_bus_slot_unref(3). If specified as NULL the
          lifetime of the match is bound to the lifetime of the bus object
          itself, and the match is generally not removed independently. See
          sd_bus_slot_set_floating(3) for details.

          The message m passed to the callback is only borrowed, that is,
          the callback should not call sd_bus_message_unref(3) on it. If
          the callback wants to hold on to the message beyond the lifetime
          of the callback, it needs to call sd_bus_message_ref(3) to create
          a new reference.

          If an error occurs during the callback invocation, the callback
          should return a negative error number (optionally, a more precise
          error may be returned in ret_error, as well). If it wants other
          callbacks that match the same rule to be called, it should return
          0. Otherwise it should return a positive integer.

          If the bus refers to a direct connection (i.e. not a bus
          connection, as set with sd_bus_set_bus_client(3)) the match is
          only installed on the client side, and the synchronous and
          asynchronous functions operate the same.


-----------------------------------------------------------------

::

          On success, sd_bus_add_match() and the other calls return 0 or a
          positive integer. On failure, they return a negative errno-style
          error code.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_slot_unref(3),
          sd_bus_message_ref(3), sd_bus_set_bus_client(3),
          sd_bus_slot_set_floating(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. D-Bus Specification
              https://dbus.freedesktop.org/doc/dbus-specification.html

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

   systemd 249                                          SD_BUS_ADD_MATCH(3)

--------------

Pages that refer to this page: `busctl(1) <../man1/busctl.1.html>`__, 
`sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_set_connected_signal(3) <../man3/sd_bus_set_connected_signal.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__, 
`sd_bus_slot_set_destroy_callback(3) <../man3/sd_bus_slot_set_destroy_callback.3.html>`__, 
`sd_bus_slot_set_floating(3) <../man3/sd_bus_slot_set_floating.3.html>`__, 
`sd_bus_slot_set_userdata(3) <../man3/sd_bus_slot_set_userdata.3.html>`__

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
