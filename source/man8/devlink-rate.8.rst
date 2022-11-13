.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-rate(8) — Linux manual page
===================================

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

   DEVLINK-RATE(8)                   Linux                  DEVLINK-RATE(8)

NAME
-------------------------------------------------

::

          devlink-rate - devlink rate management


---------------------------------------------------------

::

          devlink [ OPTIONS ] port function rate  { COMMAND | help }

          OPTIONS := { -j[son] | -p[retty] | -i[ec] }

          devlink port function rate show [ { DEV/PORT_INDEX |
                  DEV/NODE_NAME } ]

          devlink port function rate set { DEV/PORT_INDEX | DEV/NODE_NAME }
                  [ tx_share VALUE ] [ tx_max VALUE ] [ { parent NODE_NAME
                  | noparent } ]

          devlink port function rate add DEV/NODE_NAME [ tx_share VALUE ] [
                  tx_max VALUE ] [ { parent NODE_NAME | noparent } ]

          devlink port function rate del DEV/NODE_NAME

          devlink port function rate help


---------------------------------------------------------------

::

      devlink port function rate show - display rate objects.
          Displays specified rate object or, if not specified, all rate
          objects. Rate object can be presented by one of the two types:

          leaf    Represents a single devlink port; created/destroyed by
                  the driver and bound to the devlink port. As example,
                  some driver may create leaf rate object for every devlink
                  port associated with VF. Since leaf have 1to1 mapping to
                  it's devlink port, in user space it is referred as
                  corresponding devlink port DEV/PORT_INDEX;

          node    Represents a group of rate objects; created/deleted by
                  the user (see command below) and bound to the devlink
                  device rather then to the devlink port. In userspace it
                  is referred as DEV/NODE_NAME, where node name can be any,
                  except decimal number, to avoid collisions with leafs.

          Command output show rate object identifier, it's type and rate
          values along with parent node name. Rate values printed in SI
          units which are more suitable to represent specific value. To
          print values in IEC units -i switch is used. JSON (-j) output
          always print rate values in bytes per second. Zero rate values
          means "unlimited" rates and ommited in output, as well as parent
          node name.

      devlink port function rate set - set rate object parameters.
          Allows set rate object's parameters. If any parameter specified
          multiple times the last occurrence is used.

          DEV/PORT_INDEX - specifies devlink leaf rate object.
          DEV/NODE_NAME - specifies devlink node rate object.

          tx_share VALUE - specifies minimal tx rate value shared among all
          rate objects. If rate object is a part of some rate group, then
          this value shared with rate objects of this rate group.

          tx_max VALUE - specifies maximum tx rate value.

          VALUE   These parameter accept a floating point number, possibly
                  followed by either a unit (both SI and IEC units
                  supported).

                  bit or a bare number
                         Bits per second

                  kbit   Kilobits per second

                  mbit   Megabits per second

                  gbit   Gigabits per second

                  tbit   Terabits per second

                  bps    Bytes per second

                  kbps   Kilobytes per second

                  mbps   Megabytes per second

                  gbps   Gigabytes per second

                  tbps   Terabytes per second

                  To specify in IEC units, replace the SI prefix (k-, m-,
                  g-, t-) with IEC prefix (ki-, mi-, gi- and ti-)
                  respectively. Input is case-insensitive.

          parent NODE_NAME | noparent - set rate object parent to existing
          node with name NODE_NAME or unset parent. Rate limits of the
          parent node applied to all it's children. Actual behaviour is
          details of driver's implementation. Setting parent to empty ("")
          name due to the kernel logic threated as parent unset.

      devlink port function rate add - create node rate object with
          specified parameters.
          Creates rate object of type node and sets parameters. Parameters
          same as for the "set" command.

          DEV/NODE_NAME - specifies the devlink node rate object to create.

      devlink port function rate del - delete node rate object
          Delete specified devlink node rate object. Node can't be deleted
          if there is any child, user must explicitly unset the parent.

          DEV/NODE_NAME - specifies devlink node rate object to delete.

      devlink port function rate help - display usage information
          Display devlink rate usage information


---------------------------------------------------------

::

          * Display all rate objects:

              # devlink port function rate show
              pci/0000:03:00.0/1 type leaf parent some_group
              pci/0000:03:00.0/2 type leaf tx_share 12Mbit
              pci/0000:03:00.0/some_group type node tx_share 1Gbps tx_max
              5Gbps

          * Display leaf rate object bound to the 1st devlink port of the
          pci/0000:03:00.0 device:

              # devlink port function rate show pci/0000:03:00.0/1
              pci/0000:03:00.0/1 type leaf

          * Display leaf rate object rate values using IEC units:

              # devlink -i port function rate show pci/0000:03:00.0/2
              pci/0000:03:00.0/2 type leaf 11718Kibit

          * Display node rate object with name some_group of the
          pci/0000:03:00.0 device:

              # devlink port function rate show pci/0000:03:00.0/some_group
              pci/0000:03:00.0/some_group type node

          * Display pci/0000:03:00.0/2 leaf rate object as pretty JSON
          output:

              # devlink -jp port function rate show pci/0000:03:00.0/2
              {
                  "rate": {
                      "pci/0000:03:00.0/2": {
                          "type": "leaf",
                          "tx_share": 1500000
                      }
                  }
              }

          * Create node rate object with name "1st_group" on
          pci/0000:03:00.0 device:

              # devlink port function rate add pci/0000:03:00.0/1st_group

          * Create node rate object with specified parameters:

              # devlink port function rate add pci/0000:03:00.0/2nd_group \
                   tx_share 10Mbit tx_max 30Mbit parent 1st_group

          * Set parameters to the specified leaf rate object:

              # devlink port function rate set pci/0000:03:00.0/1 \
                   tx_share 2Mbit tx_max 10Mbit

          * Set leaf's parent to "1st_group":

              # devlink port function rate set pci/0000:03:00.0/1 parent
              1st_group

          * Unset leaf's parent:

              # devlink port function rate set pci/0000:03:00.0/1 noparent

          * Delete node rate object:

              # devlink port function rate del pci/0000:03:00.0/2nd_group


---------------------------------------------------------

::

          devlink(8), devlink-port(8)


-----------------------------------------------------

::

          Dmytro Linkin <dlinkin@nvidia.com>

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

   iproute2                       12 Mar 2021               DEVLINK-RATE(8)

--------------

Pages that refer to this page:
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
