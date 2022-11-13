.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_get_name_creds(3) — Linux manual page
============================================

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

   SD_BUS_GET_NAME_CREDS(3)  sd_bus_get_name_creds SD_BUS_GET_NAME_CREDS(3)

NAME
-------------------------------------------------

::

          sd_bus_get_name_creds, sd_bus_get_owner_creds - Query bus client
          credentials


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_get_name_creds(sd_bus *bus, const char *name,
                                    uint64_t mask, sd_bus_creds **creds);

          int sd_bus_get_owner_creds(sd_bus *bus, uint64_t mask,
                                     sd_bus_creds **creds);


---------------------------------------------------------------

::

          sd_bus_get_name_creds() queries the credentials of the bus client
          identified by name. The mask parameter is a combo of
          SD_BUS_CREDS_* flags that indicate which credential info the
          caller is interested in. See sd_bus_creds_new_from_pid(3) for a
          list of possible flags. On success, creds contains a new
          sd_bus_creds instance with the requested information. Ownership
          of this instance belongs to the caller and it should be freed
          once no longer needed by calling sd_bus_creds_unref(3).

          sd_bus_get_owner_creds() queries the credentials of the creator
          of the given bus. The mask and creds parameters behave the same
          as in sd_bus_get_name_creds().


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


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_creds_unref(3)

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

   systemd 249                                     SD_BUS_GET_NAME_CREDS(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_creds_new_from_pid(3) <../man3/sd_bus_creds_new_from_pid.3.html>`__, 
`sd_bus_query_sender_creds(3) <../man3/sd_bus_query_sender_creds.3.html>`__

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
