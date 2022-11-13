.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_new(3) — Linux manual page
=================================

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

   SD_BUS_NEW(3)                  sd_bus_new                  SD_BUS_NEW(3)

NAME
-------------------------------------------------

::

          sd_bus_new, sd_bus_ref, sd_bus_unref, sd_bus_unrefp,
          sd_bus_close_unref, sd_bus_close_unrefp,
          sd_bus_flush_close_unref, sd_bus_flush_close_unrefp - Create a
          new bus object and create or destroy references to it


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_new(sd_bus **bus);

          sd_bus *sd_bus_ref(sd_bus *bus);

          sd_bus *sd_bus_unref(sd_bus *bus);

          sd_bus *sd_bus_close_unref(sd_bus *bus);

          sd_bus *sd_bus_flush_close_unref(sd_bus *bus);

          void sd_bus_unrefp(sd_bus **busp);

          void sd_bus_close_unrefp(sd_bus **busp);

          void sd_bus_flush_close_unrefp(sd_bus **busp);


---------------------------------------------------------------

::

          sd_bus_new() creates a new bus object. This object is
          reference-counted, and will be destroyed when all references are
          gone. Initially, the caller of this function owns the sole
          reference and the bus object will not be connected to any bus. To
          connect it to a bus, make sure to set an address with
          sd_bus_set_address(3) or a related call, and then start the
          connection with sd_bus_start(3).

          In most cases, it is better to use sd_bus_default_user(3),
          sd_bus_default_system(3) or related calls instead of the more
          low-level sd_bus_new() and sd_bus_start(). The higher-level
          functions not only allocate a bus object but also start the
          connection to a well-known bus in a single function call.

          sd_bus_ref() increases the reference counter of bus by one.

          sd_bus_unref() decreases the reference counter of bus by one.
          Once the reference count has dropped to zero, bus is destroyed
          and cannot be used anymore, so further calls to sd_bus_ref() or
          sd_bus_unref() are illegal.

          sd_bus_unrefp() is similar to sd_bus_unref() but takes a pointer
          to a pointer to an sd_bus object. This call is useful in
          conjunction with GCC's and LLVM's Clean-up Variable Attribute[1].
          Note that this function is defined as inline function. Use a
          declaration like the following, in order to allocate a bus object
          that is freed automatically as the code block is left:

              {
                __attribute__((cleanup(sd_bus_unrefp))) sd_bus *bus = NULL;
                int r;
                ...
                r = sd_bus_default(&bus);
                if (r < 0)
                  fprintf(stderr, "Failed to allocate bus: %s\n", strerror(-r));
                ...
              }

          sd_bus_ref() and sd_bus_unref() execute no operation if the
          passed in bus object address is NULL.  sd_bus_unrefp() will first
          dereference its argument, which must not be NULL, and will
          execute no operation if that is NULL.

          sd_bus_close_unref() is similar to sd_bus_unref(), but first
          executes sd_bus_close(3), ensuring that the connection is
          terminated before the reference to the connection is dropped and
          possibly the object freed.

          sd_bus_flush_close_unref() is similar to sd_bus_unref(), but
          first executes sd_bus_flush(3) as well as sd_bus_close(3),
          ensuring that any pending messages are synchronously flushed out
          before the reference to the connection is dropped and possibly
          the object freed. This call is particularly useful immediately
          before exiting from a program as it ensures that any pending
          outgoing messages are written out, and unprocessed but queued
          incoming messages released before the connection is terminated
          and released.

          sd_bus_close_unrefp() is similar to sd_bus_close_unref(), but may
          be used in GCC's and LLVM's Clean-up Variable Attribute, see
          above. Similarly, sd_bus_flush_close_unrefp() is similar to
          sd_bus_flush_close_unref().


-----------------------------------------------------------------

::

          On success, sd_bus_new() returns 0 or a positive integer. On
          failure, it returns a negative errno-style error code.

          sd_bus_ref() always returns the argument.

          sd_bus_unref() and sd_bus_flush_close_unref() always return NULL.

      Errors
          Returned errors may indicate the following problems:

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_default_user(3),
          sd_bus_default_system(3), sd_bus_open_user(3),
          sd_bus_open_system(3), sd_bus_close(3)

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

   systemd 249                                                SD_BUS_NEW(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_close(3) <../man3/sd_bus_close.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_message_get_cookie(3) <../man3/sd_bus_message_get_cookie.3.html>`__, 
`sd_bus_message_get_monotonic_usec(3) <../man3/sd_bus_message_get_monotonic_usec.3.html>`__, 
`sd_bus_message_new(3) <../man3/sd_bus_message_new.3.html>`__, 
`sd_bus_message_set_destination(3) <../man3/sd_bus_message_set_destination.3.html>`__, 
`sd_bus_request_name(3) <../man3/sd_bus_request_name.3.html>`__, 
`sd_bus_set_address(3) <../man3/sd_bus_set_address.3.html>`__, 
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
