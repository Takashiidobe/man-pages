.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_get_type(3) — Linux manual page
==============================================

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

   SD_BUS_MESSAGE_GET_TYPE(3)d_bus_message_get_type_BUS_MESSAGE_GET_TYPE(3)

NAME
-------------------------------------------------

::

          sd_bus_message_get_type, sd_bus_message_get_error,
          sd_bus_message_get_errno, sd_bus_message_get_creds,
          sd_bus_message_is_signal, sd_bus_message_is_method_call,
          sd_bus_message_is_method_error - Query bus message
          addressing/credentials metadata


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_get_type(sd_bus_message *m, uint8_t *type);

          sd_bus_error* sd_bus_message_get_error(sd_bus_message *m);

          int sd_bus_message_get_errno(sd_bus_message *m);

          sd_bus_creds* sd_bus_message_get_creds(sd_bus_message *m);

          int sd_bus_message_is_signal(sd_bus_message *m,
                                       const char *interface,
                                       const char *member);

          int sd_bus_message_is_method_call(sd_bus_message *m,
                                            const char *interface,
                                            const char *member);

          int sd_bus_message_is_method_error(sd_bus_message *m,
                                             const char *name);


---------------------------------------------------------------

::

          sd_bus_message_get_type() returns the type of a message in the
          output parameter type, one of SD_BUS_MESSAGE_METHOD_CALL,
          SD_BUS_MESSAGE_METHOD_RETURN, SD_BUS_MESSAGE_METHOD_ERROR,
          SD_BUS_MESSAGE_SIGNAL. This type is either specified as a
          parameter when the message is created using
          sd_bus_message_new(3), or is set automatically when the message
          is created using sd_bus_message_new_signal(3),
          sd_bus_message_new_method_call(3),
          sd_bus_message_new_method_error(3) and similar functions.

          sd_bus_message_get_error() returns the error stored in the
          message m, if there is any. Otherwise, it returns NULL.
          sd_bus_message_get_errno() returns the error stored in the
          message m as a positive errno-style value, if there is any.
          Otherwise, it returns zero. Errors are mapped to errno values
          according to the default and any additional registered error
          mappings. See sd-bus-errors(3) and sd_bus_error_add_map(3).

          sd_bus_message_get_creds() returns the message credentials
          attached to the message m. If no credentials are attached to the
          message, it returns NULL. Ownership of the credentials instance
          is not transferred to the caller and hence should not be freed.

          sd_bus_message_is_signal() checks if message m is a signal
          message. If interface is non-null, it also checks if the message
          has the same interface set. If member is non-null, it also checks
          if the message has the same member set. Also see
          sd_bus_message_new_signal(3). It returns true when all checks
          pass.

          sd_bus_message_is_method_call() checks if message m is a method
          call message. If interface is non-null, it also checks if the
          message has the same interface set. If member is non-null, it
          also checks if the message has the same member set. Also see
          sd_bus_message_new_method_call(3). It returns true when all
          checks pass.

          sd_bus_message_is_method_error() checks if message m is an error
          reply message. If name is non-null, it also checks if the message
          has the same error identifier set. Also see
          sd_bus_message_new_method_error(3). It returns true when all
          checks pass.


-----------------------------------------------------------------

::

          On success, these functions (except sd_bus_message_get_error()
          and sd_bus_message_get_creds()) return a non-negative integer. On
          failure, they return a negative errno-style error code.
          sd_bus_message_get_errno() always returns a non-negative integer,
          even on failure.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The message parameter m or an output parameter is NULL.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_new(3),
          sd_bus_message_set_destination(3), sd-bus-errors(3),
          sd_bus_error_add_map(3)

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

   systemd 249                                   SD_BUS_MESSAGE_GET_TYPE(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_creds_new_from_pid(3) <../man3/sd_bus_creds_new_from_pid.3.html>`__, 
`sd_bus_negotiate_fds(3) <../man3/sd_bus_negotiate_fds.3.html>`__

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
