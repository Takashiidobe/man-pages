.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_error_add_map(3) — Linux manual page
===========================================

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

   SD_BUS_ERROR_ADD_MAP(3)   sd_bus_error_add_map   SD_BUS_ERROR_ADD_MAP(3)

NAME
-------------------------------------------------

::

          sd_bus_error_add_map, sd_bus_error_map, SD_BUS_ERROR_MAP,
          SD_BUS_ERROR_END - Additional sd-dbus error mappings


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          typedef struct {
                  const char *name;
                  int code;
                  ...
          } sd_bus_error_map;

          SD_BUS_ERROR_MAP(name, code)

          SD_BUS_ERROR_MAP_END

          int sd_bus_error_add_map(const sd_bus_map *map);


---------------------------------------------------------------

::

          The sd_bus_error_add_map() call may be used to register
          additional mappings for converting D-Bus errors to Linux
          errno-style errors. The mappings defined with this call are
          consulted by calls such as sd_bus_error_set(3) or
          sd_bus_error_get_errno(3). By default, a number of generic,
          standardized mappings are known, as documented in
          sd-bus-errors(3). Use this call to add further,
          application-specific mappings.

          The function takes a pointer to an array of sd_bus_error_map
          structures. A reference to the specified array is added to the
          lookup tables for error mappings. Note that the structure is not
          copied, and that it is hence essential that the array stays
          available and constant during the entire remaining runtime of the
          process.

          The mapping array should be put together with a series of
          SD_BUS_ERROR_MAP() macro invocations that take a literal name
          string and a (positive) errno-style error number. The last entry
          of the array should be an invocation of the SD_BUS_ERROR_MAP_END
          macro. The array should not be put together without use of these
          two macros.

          Note that the call is idempotent: it is safe to invoke it
          multiple times with the parameter, which will only add the passed
          mapping array once.

          Note that the memory allocated by this call is not intended to be
          freed during the lifetime of the process. It should not be freed
          explicitly.


-----------------------------------------------------------------

::

          sd_bus_error_add_map() returns a positive value when the new
          array was added to the lookup tables. It returns zero when the
          same array was already added before. On error, a negative
          errno-style error code is returned. See below for known error
          codes.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The specified mapping array is invalid.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_error(3), sd-bus-errors(3),
          errno(3), strerror_r(3)

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

   systemd 249                                      SD_BUS_ERROR_ADD_MAP(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_error(3) <../man3/sd_bus_error.3.html>`__, 
`sd_bus_message_get_type(3) <../man3/sd_bus_message_get_type.3.html>`__

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
