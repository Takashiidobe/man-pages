.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_request_name(3) — Linux manual page
==========================================

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

   SD_BUS_REQUEST_NAME(3)     sd_bus_request_name    SD_BUS_REQUEST_NAME(3)

NAME
-------------------------------------------------

::

          sd_bus_request_name, sd_bus_request_name_async,
          sd_bus_release_name, sd_bus_release_name_async - Request or
          release a well-known service name on a bus


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef int (*sd_bus_message_handler_t)(sd_bus_message *m,
                                                  void *userdata,
                                                  sd_bus_error *ret_error);

          int sd_bus_request_name(sd_bus *bus, const char *name,
                                  uint64_t flags);

          int sd_bus_request_name_async(sd_bus *bus, sd_bus_slot **slot,
                                        const char *name, uint64_t flags,
                                        sd_bus_message_handler_t callback,
                                        void *userdata);

          int sd_bus_release_name(sd_bus *bus, const char *name);

          int sd_bus_release_name_async(sd_bus *bus, sd_bus_slot **slot,
                                        const char *name,
                                        sd_bus_message_handler_t callback,
                                        void *userdata);


---------------------------------------------------------------

::

          sd_bus_request_name() requests a well-known service name on a
          bus. It takes a bus connection, a valid bus name, and a flags
          parameter. The flags parameter is a combination of zero or more
          of the following flags:

          SD_BUS_NAME_ALLOW_REPLACEMENT
              After acquiring the name successfully, permit other peers to
              take over the name when they try to acquire it with the
              SD_BUS_NAME_REPLACE_EXISTING flag set. If
              SD_BUS_NAME_ALLOW_REPLACEMENT is not set on the original
              request, such a request by other peers will be denied.

          SD_BUS_NAME_REPLACE_EXISTING
              Take over the name if it was already acquired by another
              peer, and that other peer has permitted takeover by setting
              SD_BUS_NAME_ALLOW_REPLACEMENT while acquiring it.

          SD_BUS_NAME_QUEUE
              Queue the acquisition of the name when the name is already
              taken.

          sd_bus_request_name() operates in a synchronous fashion: a
          message requesting the name is sent to the bus broker, and the
          call waits until the broker responds.

          sd_bus_request_name_async() is an asynchronous version of
          sd_bus_request_name(). Instead of waiting for the request to
          complete, the request message is enqueued. The specified callback
          will be called when the broker's response is received. If the
          parameter is specified as NULL a default implementation is used
          instead which will terminate the connection when the name cannot
          be acquired. The function returns a slot object in its slot
          parameter — if it is passed as non-NULL — which may be used as a
          reference to the name request operation. Use sd_bus_slot_unref(3)
          to destroy this reference. Note that destroying the reference
          will not unregister the name, but simply ensure the specified
          callback is no longer called.

          sd_bus_release_name() releases an acquired well-known name. It
          takes a bus connection and a valid bus name as parameters. This
          function operates synchronously, sending a release request
          message to the bus broker and waiting for it to reply.

          sd_bus_release_name_async() is an asynchronous version of
          sd_bus_release_name(). The specified callback function is called
          when the name has been released successfully. If specified as
          NULL a generic implementation is used that ignores the result of
          the operation. As above, the slot (if non-NULL) is set to an
          object that may be used to reference the operation.

          These functions are supported only on bus connections, i.e.
          connections to a bus broker and not on direct connections.


-----------------------------------------------------------------

::

          On success, these calls return 0 or a positive integer. On
          failure, these calls return a negative errno-style error code.

          If SD_BUS_NAME_QUEUE is specified, sd_bus_request_name() will
          return 0 when the name is already taken by another peer and the
          client has been added to the queue for the name. In that case,
          the caller can subscribe to "NameOwnerChanged" signals to be
          notified when the name is successfully acquired.
          sd_bus_request_name() returns > 0 when the name has immediately
          been acquired successfully.

      Errors
          Returned errors may indicate the following problems:

          -EALREADY
              The caller already is the owner of the specified name.

          -EEXIST
              The name has already been acquired by a different peer, and
              SD_BUS_NAME_REPLACE_EXISTING was not specified or the other
              peer did not specify SD_BUS_NAME_ALLOW_REPLACEMENT while
              acquiring the name.

          -ESRCH
              It was attempted to release a name that is currently not
              registered on the bus.

          -EADDRINUSE
              It was attempted to release a name that is owned by a
              different peer on the bus.

          -EINVAL
              A specified parameter is invalid. This is also generated when
              the requested name is a special service name reserved by the
              D-Bus specification, or when the operation is requested on a
              connection that does not refer to a bus.

          -ENOTCONN
              The bus connection has been disconnected.

          -ECHILD
              The bus connection has been created in a different process
              than the current one.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3), sd_bus_slot_unref(3)

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

   systemd 249                                       SD_BUS_REQUEST_NAME(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__

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
