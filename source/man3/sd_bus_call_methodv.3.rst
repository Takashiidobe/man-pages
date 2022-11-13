.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_call_method(3) — Linux manual page
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

   SD_BUS_CALL_METHOD(3)      sd_bus_call_method      SD_BUS_CALL_METHOD(3)

NAME
-------------------------------------------------

::

          sd_bus_call_method, sd_bus_call_methodv,
          sd_bus_call_method_async, sd_bus_call_method_asyncv - Initialize
          a bus message object and invoke the corresponding D-Bus method
          call


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef int (*sd_bus_message_handler_t)(sd_bus_message *m,
                                                  void *userdata,
                                                  sd_bus_error *ret_error);

          int sd_bus_call_method(sd_bus *bus, const char *destination,
                                 const char *path, const char *interface,
                                 const char *member,
                                 sd_bus_error *ret_error,
                                 sd_bus_message **reply, const char *types,
                                 ...);

          int sd_bus_call_methodv(sd_bus *bus, const char *destination,
                                  const char *path, const char *interface,
                                  const char *member,
                                  sd_bus_error *ret_error,
                                  sd_bus_message **reply,
                                  const char *types, va_list ap);

          int sd_bus_call_method_async(sd_bus *bus, sd_bus_slot **slot,
                                       const char *destination,
                                       const char *path,
                                       const char *interface,
                                       const char *member,
                                       sd_bus_message_handler_t callback,
                                       void *userdata, const char *types,
                                       ...);

          int sd_bus_call_method_asyncv(sd_bus *bus, sd_bus_slot **slot,
                                        const char *destination,
                                        const char *path,
                                        const char *interface,
                                        const char *member,
                                        sd_bus_message_handler_t callback,
                                        void *userdata, const char *types,
                                        va_list ap);


---------------------------------------------------------------

::

          sd_bus_call_method() is a convenience function for initializing a
          bus message object and calling the corresponding D-Bus method. It
          combines the sd_bus_message_new_method_call(3),
          sd_bus_message_append(3) and sd_bus_call(3) functions into a
          single function call.

          sd_bus_call_method_async() is a convenience function for
          initializing a bus message object and calling the corresponding
          D-Bus method asynchronously. It combines the
          sd_bus_message_new_method_call(3), sd_bus_message_append(3) and
          sd_bus_call_async(3) functions into a single function call.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          See the man pages of sd_bus_message_new_method_call(3),
          sd_bus_message_append(3), sd_bus_call(3) and sd_bus_call_async(3)
          for a list of possible errors.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_new_method_call(3),
          sd_bus_message_append(3), sd_bus_call(3), sd_bus_set_property(3),
          sd_bus_emit_signal(3)

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

   systemd 249                                        SD_BUS_CALL_METHOD(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__, 
`sd_bus_interface_name_is_valid(3) <../man3/sd_bus_interface_name_is_valid.3.html>`__, 
`sd_bus_message_new_method_call(3) <../man3/sd_bus_message_new_method_call.3.html>`__, 
`sd_bus_send(3) <../man3/sd_bus_send.3.html>`__, 
`sd_bus_set_property(3) <../man3/sd_bus_set_property.3.html>`__, 
`sd_bus_slot_ref(3) <../man3/sd_bus_slot_ref.3.html>`__

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
