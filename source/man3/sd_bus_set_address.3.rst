.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_address(3) — Linux manual page
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

   SD_BUS_SET_ADDRESS(3)      sd_bus_set_address      SD_BUS_SET_ADDRESS(3)

NAME
-------------------------------------------------

::

          sd_bus_set_address, sd_bus_get_address, sd_bus_set_exec - Set or
          query the address of the bus connection


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_address(sd_bus *bus, const char *address);

          int sd_bus_get_address(sd_bus *bus, const char **address);

          int sd_bus_set_exec(sd_bus *bus, const char *path,
                              char *const *argv);


---------------------------------------------------------------

::

          sd_bus_set_address() configures a list of addresses of bus
          brokers to try to connect to from a subsequent sd_bus_start(3)
          call. The argument is a ";"-separated list of addresses to try.
          Each item must be one of the following:

          •   A unix socket address specified as "unix:guid=guid,path=path"
              or "unix:guid=guid,abstract=path". Exactly one of the path=
              and abstract= keys must be present, while guid= is optional.

          •   A TCP socket address specified as
              "tcp:[guid=guid,][host=host][,port=port][,family=family]".
              One or both of the host= and port= keys must be present,
              while the rest is optional.  family may be either ipv4 or
              ipv6.

          •   An executable to spawn specified as
              "unixexec:guid=guid,path=path,argv1=argument,argv2=argument,...".
              The path= key must be present, while guid= is optional.

          •   A machine (container) to connect to specified as
              "x-machine-unix:guid=guid,machine=machine,pid=pid". Exactly
              one of the machine= and pid= keys must be present, while
              guid= is optional.  machine is the name of a local container.
              See machinectl(1) for more information about the "machine"
              concept.  "machine=.host" may be used to specify the host
              machine. A connection to the standard system bus socket
              inside of the specified machine will be created.

          In all cases, parameter guid is an identifier of the remote peer,
          in the syntax accepted by sd_id128_from_string(3). If specified,
          the identifier returned by the peer after the connection is
          established will be checked and the connection will be rejected
          in case of a mismatch.

          Note that the addresses passed to sd_bus_set_address() may not be
          verified immediately. If they are invalid, an error may be
          returned e.g. from a subsequent call to sd_bus_start(3).

          sd_bus_get_address() returns any previously set addresses. In
          addition to being explicitly set by sd_bus_set_address(), the
          address will also be set automatically by sd_bus_open(3) and
          similar calls, based on environment variables or built-in
          defaults.

          sd_bus_set_exec() is a shorthand function for setting a
          "unixexec" address that spawns the given executable with the
          given arguments. If argv is NULL, the given executable is spawned
          without any extra arguments.


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              The input parameters bus or address are NULL.

          -ENOPKG
              The bus object bus could not be resolved.

          -EPERM
              The input parameter bus is in a wrong state
              (sd_bus_set_address() may only be called once on a
              newly-created bus object).

          -ECHILD
              The bus object bus was created in a different process.

          -ENODATA
              The bus object bus has no address configured.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_new(3), sd_bus_start(3),
          systemd-machined.service(8), machinectl(1)

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

   systemd 249                                        SD_BUS_SET_ADDRESS(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_new(3) <../man3/sd_bus_new.3.html>`__, 
`sd_bus_set_server(3) <../man3/sd_bus_set_server.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__

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
