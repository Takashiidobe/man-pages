.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_slot_ref(3) — Linux manual page
======================================

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

   SD_BUS_SLOT_REF(3)           sd_bus_slot_ref          SD_BUS_SLOT_REF(3)

NAME
-------------------------------------------------

::

          sd_bus_slot_ref, sd_bus_slot_unref, sd_bus_slot_unrefp - Create
          and destroy references to a bus slot object


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          sd_bus_slot *sd_bus_slot_ref(sd_bus_slot *slot);

          sd_bus_slot *sd_bus_slot_unref(sd_bus_slot *slot);

          void sd_bus_slot_unrefp(sd_bus_slot **slotp);


---------------------------------------------------------------

::

          sd_bus_slot_ref() increases the reference counter of slot by one.

          sd_bus_slot_unref() decreases the reference counter of slot by
          one. Once the reference count has dropped to zero, slot object is
          destroyed and cannot be used anymore, so further calls to
          sd_bus_slot_ref() or sd_bus_slot_unref() are illegal.

          sd_bus_slot_unrefp() is similar to sd_bus_slot_unref() but takes
          a pointer to a pointer to an sd_bus_slot object. This call is
          useful in conjunction with GCC's and LLVM's Clean-up Variable
          Attribute[1]. See sd_bus_new(3) for an example how to use the
          cleanup attribute.

          sd_bus_slot_ref() and sd_bus_slot_unref() execute no operation if
          the passed in bus object address is NULL.  sd_bus_slot_unrefp()
          will first dereference its argument, which must not be NULL, and
          will execute no operation if that is NULL.


-----------------------------------------------------------------

::

          sd_bus_slot_ref() always returns the argument.

          sd_bus_slot_unref() always returns NULL.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3), sd_bus_message_new(3),
          sd_bus_call_method_async(3)

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

   systemd 249                                           SD_BUS_SLOT_REF(3)

--------------

Pages that refer to this page:
`sd_bus_add_match(3) <../man3/sd_bus_add_match.3.html>`__, 
`sd_bus_add_node_enumerator(3) <../man3/sd_bus_add_node_enumerator.3.html>`__, 
`sd_bus_add_object(3) <../man3/sd_bus_add_object.3.html>`__, 
`sd_bus_add_object_manager(3) <../man3/sd_bus_add_object_manager.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_request_name(3) <../man3/sd_bus_request_name.3.html>`__, 
`sd_bus_slot_set_description(3) <../man3/sd_bus_slot_set_description.3.html>`__

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
