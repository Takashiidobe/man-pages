.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_property(3) — Linux manual page
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

   SD_BUS_SET_PROPERTY(3)     sd_bus_set_property    SD_BUS_SET_PROPERTY(3)

NAME
-------------------------------------------------

::

          sd_bus_set_property, sd_bus_set_propertyv, sd_bus_get_property,
          sd_bus_get_property_trivial, sd_bus_get_property_string,
          sd_bus_get_property_strv - Set or query D-Bus service properties


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_property(sd_bus *bus, const char *destination,
                                  const char *path, const char *interface,
                                  const char *member,
                                  sd_bus_error *ret_error,
                                  const char *type, ...);

          int sd_bus_set_propertyv(sd_bus *bus, const char *destination,
                                   const char *path, const char *interface,
                                   const char *member,
                                   sd_bus_error *ret_error,
                                   const char *type, va_list ap);

          int sd_bus_get_property(sd_bus *bus, const char *destination,
                                  const char *path, const char *interface,
                                  const char *member,
                                  sd_bus_error *ret_error,
                                  sd_bus_message **reply,
                                  const char *type);

          int sd_bus_get_property_trivial(sd_bus *bus,
                                          const char *destination,
                                          const char *path,
                                          const char *interface,
                                          const char *member,
                                          sd_bus_error *ret_error,
                                          char type, void *ret_ptr);

          int sd_bus_get_property_string(sd_bus *bus,
                                         const char *destination,
                                         const char *path,
                                         const char *interface,
                                         const char *member,
                                         sd_bus_error *ret_error,
                                         char **ret);

          int sd_bus_get_property_strv(sd_bus *bus,
                                       const char *destination,
                                       const char *path,
                                       const char *interface,
                                       const char *member,
                                       sd_bus_error *ret_error,
                                       char ***ret);


---------------------------------------------------------------

::

          These functions set or query D-Bus properties. D-Bus properties
          are service fields exposed via the
          org.freedesktop.DBus.Properties interface. Under the hood, these
          functions call methods of the org.freedesktop.DBus.Properties
          interface and as a result their semantics are similar to
          sd_bus_call_method(3).

          sd_bus_set_property() sets a D-Bus property. If setting the
          property fails or an internal error occurs, an error is returned
          and an extended description of the error is optionally stored in
          ret_error if it is not NULL.  type and the arguments that follow
          it describe the new value of the property and must follow the
          format described in sd_bus_message_append(3).

          sd_bus_set_propertyv() is equivalent to sd_bus_set_property(),
          except that it is called with a "va_list" instead of a variable
          number of arguments.

          sd_bus_get_property() queries a D-Bus property. If retrieving the
          property fails or an internal error occurs, an error is returned
          and an extended description of the error is optionally stored in
          ret_error if it is not NULL. On success, the property is stored
          in reply.  type describes the property type and must follow the
          format described in sd_bus_message_append(3).

          sd_bus_get_property_trivial(), sd_bus_get_property_string() and
          sd_bus_get_property_strv() are shorthands for
          sd_bus_get_property() that are used to query basic, string and
          string vector properties respectively. The caller is responsible
          for freeing the string and string vector results stored in ret by
          sd_bus_get_property_string() and sd_bus_get_property_strv().


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          See the sd_bus_call_method(3) man page for a list of possible
          errors.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_call_method(3)

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

   systemd 249                                       SD_BUS_SET_PROPERTY(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__

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
