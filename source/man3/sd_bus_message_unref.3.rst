.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_new(3) — Linux manual page
=========================================

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

   SD_BUS_MESSAGE_NEW(3)      sd_bus_message_new      SD_BUS_MESSAGE_NEW(3)

NAME
-------------------------------------------------

::

          sd_bus_message_new, sd_bus_message_ref, sd_bus_message_unref,
          sd_bus_message_unrefp, SD_BUS_MESSAGE_METHOD_CALL,
          SD_BUS_MESSAGE_METHOD_RETURN, SD_BUS_MESSAGE_METHOD_ERROR,
          SD_BUS_MESSAGE_SIGNAL, sd_bus_message_get_bus - Create a new bus
          message object and create or destroy references to it


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          enum {
                SD_BUS_MESSAGE_METHOD_CALL,
                SD_BUS_MESSAGE_METHOD_RETURN,
                SD_BUS_MESSAGE_METHOD_ERROR,
                SD_BUS_MESSAGE_SIGNAL,
          };

          int sd_bus_message_new(sd_bus *bus, sd_bus_message **m,
                                 uint8_t type);

          sd_bus_message *sd_bus_message_ref(sd_bus_message *m);

          sd_bus_message *sd_bus_message_unref(sd_bus_message *m);

          void sd_bus_message_unrefp(sd_bus_message **mp);

          sd_bus *sd_bus_message_get_bus(sd_bus_message *m);


---------------------------------------------------------------

::

          sd_bus_message_new() creates a new bus message object attached to
          the bus bus and returns it in the output parameter m. This object
          is reference-counted, and will be destroyed when all references
          are gone. Initially, the caller of this function owns the sole
          reference to the message object. Note that the message object
          holds a reference to the bus object, so the bus object will not
          be destroyed as long as the message exists.

          Note: this is a low-level call. In most cases functions like
          sd_bus_message_new_method_call(3),
          sd_bus_message_new_method_error(3),
          sd_bus_message_new_method_return(3), and
          sd_bus_message_new_signal(3) that create a message of a certain
          type and initialize various fields are easier to use.

          The type parameter specifies the type of the message. It must be
          one of SD_BUS_MESSAGE_METHOD_CALL — a method call,
          SD_BUS_MESSAGE_METHOD_RETURN — a method call reply,
          SD_BUS_MESSAGE_METHOD_ERROR — an error reply to a method call,
          SD_BUS_MESSAGE_SIGNAL — a broadcast message with no reply.

          The flag to allow interactive authorization is initialized based
          on the current value set in the bus object, see
          sd_bus_set_allow_interactive_authorization(3). This may be
          changed using
          sd_bus_message_set_allow_interactive_authorization(3).

          sd_bus_message_ref() increases the reference counter of m by one.

          sd_bus_message_unref() decreases the reference counter of m by
          one. Once the reference count has dropped to zero, message object
          is destroyed and cannot be used anymore, so further calls to
          sd_bus_message_ref() or sd_bus_message_unref() are illegal.

          sd_bus_message_unrefp() is similar to sd_bus_message_unref() but
          takes a pointer to a pointer to an sd_bus_message object. This
          call is useful in conjunction with GCC's and LLVM's Clean-up
          Variable Attribute[1]. See sd_bus_new(3) for an example how to
          use the cleanup attribute.

          sd_bus_message_ref() and sd_bus_message_unref() execute no
          operation if the passed in bus message object address is NULL.
          sd_bus_message_unrefp() will first dereference its argument,
          which must not be NULL, and will execute no operation if that is
          NULL.

          sd_bus_message_get_bus() returns the bus object that message m is
          attached to.


-----------------------------------------------------------------

::

          On success, sd_bus_message_new() returns 0 or a positive integer.
          On failure, it returns a negative errno-style error code.

          sd_bus_message_ref() always returns the argument.

          sd_bus_message_unref() always returns NULL.

          sd_bus_message_get_bus() always returns the bus object.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              Specified type is invalid.

          -ENOTCONN
              The bus parameter bus is NULL or the bus is not connected.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3),
          sd_bus_message_new_method_call(3),
          sd_bus_message_new_method_error(3),
          sd_bus_message_new_method_return(3), sd_bus_message_new_signal(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Clean-up Variable Attribute
              https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

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

   systemd 249                                        SD_BUS_MESSAGE_NEW(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_match(3) <../man3/sd_bus_add_match.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_message_get_signature(3) <../man3/sd_bus_message_get_signature.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
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
