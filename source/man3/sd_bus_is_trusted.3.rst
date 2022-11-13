.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_description(3) — Linux manual page
=============================================

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

   SD_BUS_SET_DESCRIPTION(3)sd_bus_set_descriptionSD_BUS_SET_DESCRIPTION(3)

NAME
-------------------------------------------------

::

          sd_bus_set_description, sd_bus_get_description,
          sd_bus_set_anonymous, sd_bus_is_anonymous, sd_bus_set_trusted,
          sd_bus_is_trusted, sd_bus_set_allow_interactive_authorization,
          sd_bus_get_allow_interactive_authorization, sd_bus_get_scope,
          sd_bus_get_tid, sd_bus_get_unique_name - Set or query properties
          of a bus object


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_description(sd_bus *bus, const char *description);

          int sd_bus_get_description(sd_bus *bus,
                                     const char **description);

          int sd_bus_set_anonymous(sd_bus *bus, int b);

          int sd_bus_is_anonymous(sd_bus *bus);

          int sd_bus_set_trusted(sd_bus *bus, int b);

          int sd_bus_is_trusted(sd_bus *bus);

          int sd_bus_set_allow_interactive_authorization(sd_bus *bus,
                                                         int b);

          int sd_bus_get_allow_interactive_authorization(sd_bus *bus);

          int sd_bus_get_scope(sd_bus *bus, const char **scope);

          int sd_bus_get_tid(sd_bus *bus, pid_t *tid);

          int sd_bus_get_unique_name(sd_bus *bus, const char **unique);


---------------------------------------------------------------

::

          sd_bus_set_description() sets the description string that is used
          in logging to the specified string. The string is copied
          internally and freed when the bus object is deallocated. The
          description argument may be NULL, in which case the description
          is unset. This function must be called before the bus is started.

          sd_bus_get_description() returns a description string in
          description. This string may have been previously set with
          sd_bus_set_description() or sd_bus_open_with_description(3) or
          similar. If not set this way, a default string like "system" or
          "user" will be returned for the system or user buses, and -ENXIO
          otherwise.

          sd_bus_set_anonymous() enables or disables "anonymous
          authentication", i.e. lack of authentication, of the bus peer.
          This function must be called before the bus is started. See the
          Authentication Mechanisms[1] section of the D-Bus specification
          for details.

          sd_bus_is_anonymous() returns true if the bus connection allows
          anonymous authentication (in the sense described in previous
          paragraph).

          sd_bus_set_trusted() sets the "trusted" state on the bus object.
          If true, all connections on the bus are trusted and access to all
          privileged and unprivileged methods is granted. This function
          must be called before the bus is started.

          sd_bus_is_trusted() returns true if the bus connection is trusted
          (in the sense described in previous paragraph).

          sd_bus_set_allow_interactive_authorization() enables or disables
          interactive authorization for method calls. If true, messages are
          marked with the ALLOW_INTERACTIVE_AUTHORIZATION flag specified by
          the D-Bus[2] specification, informing the receiving side that the
          caller is prepared to wait for interactive authorization, which
          might take a considerable time to complete. If this flag is set,
          the user may be queried for passwords or confirmation via
          polkit[3] or a similar framework.

          sd_bus_get_allow_interactive_authorization() returns true if
          interactive authorization is allowed and false if not.

          sd_bus_get_scope() stores the scope of the given bus object in
          scope. The scope of the system bus is "system". The scope of a
          user session bus is "user". If the given bus object is not the
          system or a user session bus, sd_bus_get_scope() returns an
          error.

          sd_bus_get_tid() stores the kernel thread id of the thread
          associated with the given bus object in tid. If bus is a default
          bus object obtained by calling one of the functions of the
          sd_bus_default(3) family of functions, it stores the thread id of
          the thread the bus object was created in. Otherwise, if the bus
          object is attached to an event loop, it stores the thread id of
          the thread the event loop object was created in. If bus is not a
          default bus object and is not attached to an event loop,
          sd_bus_get_tid() returns an error.

          sd_bus_get_unique_name() stores the unique name of the bus object
          on the bus in unique. See The D-Bus specification[4] for more
          information on bus names. Note that the caller does not own the
          string stored in unique and should not free it.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              An argument is invalid.

          -ENOPKG
              The bus cannot be resolved.

          -EPERM
              The bus has already been started.

          -ECHILD
              The bus was created in a different process.

          -ENOMEM
              Memory allocation failed.

          -ENODATA
              The bus object passed to sd_bus_get_scope() was not a system
              or user session bus.

          -ENXIO
              The bus object passed to sd_bus_get_tid() was not a default
              bus object and is not attached to an event loop.

              The bus object passed to sd_bus_get_description() did not
              have a description.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_default_user(3),
          sd_bus_default_system(3), sd_bus_open_user(3),
          sd_bus_open_system(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Authentication Mechanisms
              view-source:https://dbus.freedesktop.org/doc/dbus-specification.html#auth-mechanisms

           2. D-Bus
              view-source:https://dbus.freedesktop.org/doc/dbus-specification.html

           3. polkit
              http://www.freedesktop.org/wiki/Software/polkit

           4. The D-Bus specification
              https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus

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

   systemd 249                                    SD_BUS_SET_DESCRIPTION(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__, 
`sd_bus_message_set_expect_reply(3) <../man3/sd_bus_message_set_expect_reply.3.html>`__

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
