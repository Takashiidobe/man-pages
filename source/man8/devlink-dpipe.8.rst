.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-dpipe(8) — Linux manual page
====================================

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

   DEVLINK-DPIPE(8)                  Linux                 DEVLINK-DPIPE(8)

NAME
-------------------------------------------------

::

          devlink-dpipe - devlink dataplane pipeline visualization


---------------------------------------------------------

::

          devlink [ OPTIONS ] dpipe { table | header } { COMMAND | help }

          OPTIONS := { -V[ersion] }

          devlink dpipe table show DEV [ name TABLE_NAME ]

          devlink dpipe table set DEV name TABLE_NAME

          devlink dpipe table dump DEV name TABLE_NAME

          devlink dpipe header show DEV

          devlink dpipe help


---------------------------------------------------------------

::

      devlink dpipe table show - display devlink dpipe table attributes
          name TABLE_NAME
                 Specifies the table to operate on.

      devlink dpipe table set - set devlink dpipe table attributes
          name TABLE_NAME
                 Specifies the table to operate on.

      devlink dpipe table dump - dump devlink dpipe table entries
          name TABLE_NAME
                 Specifies the table to operate on.

      devlink dpipe header show - display devlink dpipe header attributes
          name TABLE_NAME
                 Specifies the table to operate on.


---------------------------------------------------------

::

          devlink dpipe table show pci/0000:01:00.0
              Shows all dpipe tables on specified devlink device.

          devlink dpipe table show pci/0000:01:00.0 name mlxsw_erif
              Shows mlxsw_erif dpipe table on specified devlink device.

          devlink dpipe table set pci/0000:01:00.0 name mlxsw_erif
          counters_enabled true
              Turns on the counters on mlxsw_erif table.

          devlink dpipe table dump pci/0000:01:00.0 name mlxsw_erif
              Dumps content of mlxsw_erif table.

          devlink dpipe header show pci/0000:01:00.0
              Shows all dpipe headers on specified devlink device.


---------------------------------------------------------

::

          devlink(8), devlink-dev(8), devlink-monitor(8),


-----------------------------------------------------

::

          Jiri Pirko <jiri@mellanox.com>

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

   iproute2                       4 Apr 2020               DEVLINK-DPIPE(8)

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
