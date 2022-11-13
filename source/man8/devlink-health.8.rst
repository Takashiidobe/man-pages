.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-health(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DEVLINK-HEALTH(8)                 Linux                DEVLINK-HEALTH(8)

NAME
-------------------------------------------------

::

          devlink-health - devlink health reporting and recovery


---------------------------------------------------------

::

          devlink [ OPTIONS ] health  { COMMAND | help }

          OPTIONS := { -V[ersion] }

          devlink health show [ { DEV | DEV/PORT_INDEX } reporter REPORTER
                  ]

          devlink health recover { DEV | DEV/PORT_INDEX } reporter REPORTER

          devlink health diagnose { DEV | DEV/PORT_INDEX } reporter
                  REPORTER

          devlink health dump show { DEV | DEV/PORT_INDEX } reporter
                  REPORTER

          devlink health test { DEV | DEV/PORT_INDEX } reporter REPORTER

          devlink health dump clear { DEV | DEV/PORT_INDEX } reporter
                  REPORTER

          devlink health set { DEV | DEV/PORT_INDEX } reporter REPORTER [
                  grace_period MSEC ] [ auto_recover { true | false } ] [
                  auto_dump { true | false } ]

          devlink health help


---------------------------------------------------------------

::

      devlink health show - Show status and configuration on all supported
          reporters.
          Displays info about reporters registered on devlink devices and
          ports.

          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

      devlink health recover - Initiate a recovery operation on a reporter.
          This action performs a recovery and increases the recoveries
          counter on success.

          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

      devlink health diagnose - Retrieve diagnostics data on a reporter.
          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

      devlink health test - Trigger a test event on a reporter.
          DEV - specifies the devlink device.

          REPORTER - specifies the reporter's name registered on the
          devlink device.

      devlink health dump show - Display the last saved dump.
          devlink health saves a single dump per reporter. If an dump is
          not already stored by the Devlink, this command will generate a
          new
          dump. The dump can be generated either automatically when a
          reporter reports on an error or manually at the user's request.

          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

      devlink health dump clear - Delete the saved dump.
          Deleting the saved dump enables a generation of a new dump on
          the next "devlink health dump show" command.

          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

      devlink health set - Configure health reporter.
          Please note that some params are not supported on a reporter
          which doesn't support a recovery or dump method.

          DEV - specifies the devlink device.
          DEV/PORT_INDEX - specifies the devlink port.

          REPORTER - specifies the reporter's name registered on specified
          devlink device or port.

          grace_period MSEC
                 Time interval between consecutive auto recoveries.

          auto_recover { true | false }
                 Indicates whether the devlink should execute automatic
                 recover on error.

          auto_dump { true | false }
                 Indicates whether the devlink should execute automatic
                 dump on error.


---------------------------------------------------------

::

          devlink health show
              List status and configuration of available reporters on
              devices and ports.

          devlink health show pci/0000:00:09.0/1 reporter tx
              List status and configuration of tx reporter registered on
              port on pci/0000:00:09.0/1

          devlink health recover pci/0000:00:09.0 reporter fw_fatal
              Initiate recovery on fw_fatal reporter registered on device
              on pci/0000:00:09.0.

          devlink health recover pci/0000:00:09.0/1 reporter tx
              Initiate recovery on tx reporter registered on port on
              pci/0000:00:09.0/1.

          devlink health diagnose pci/0000:00:09.0 reporter fw
              List diagnostics data on the specified device and reporter.

          devlink health dump show pci/0000:00:09.0/1 reporter tx
              Display the last saved dump on the specified port and
              reporter.

          devlink health dump clear pci/0000:00:09.0/1 reporter tx
              Delete saved dump on the specified port and reporter.

          devlink health set pci/0000:00:09.0 reporter fw_fatal
          grace_period 3500
              Set time interval between auto recoveries to minimum of 3500
              msec on the specified device and reporter.

          devlink health set pci/0000:00:09.0/1 reporter tx grace_period
          3500
              Set time interval between auto recoveries to minimum of 3500
              msec on the specified port and reporter.

          devlink health set pci/0000:00:09.0 reporter fw_fatal
          auto_recover false
              Turn off auto recovery on the specified device and reporter.


---------------------------------------------------------

::

          devlink(8), devlink-dev(8), devlink-port(8), devlink-param(8),
          devlink-region(8),


-----------------------------------------------------

::

          Aya Levin <ayal@mellanox.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute2                       20 Feb 2019             DEVLINK-HEALTH(8)

--------------

Pages that refer to this page: `devlink(8) <../man8/devlink.8.html>`__, 
`devlink-monitor(8) <../man8/devlink-monitor.8.html>`__, 
`devlink-port(8) <../man8/devlink-port.8.html>`__

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
