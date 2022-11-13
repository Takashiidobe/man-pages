.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

networkctl(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NETWORKCTL(1)                  networkctl                  NETWORKCTL(1)

NAME
-------------------------------------------------

::

          networkctl - Query the status of network links


---------------------------------------------------------

::

          networkctl [OPTIONS...] COMMAND [LINK...]


---------------------------------------------------------------

::

          networkctl may be used to introspect the state of the network
          links as seen by systemd-networkd. Please refer to
          systemd-networkd.service(8) for an introduction to the basic
          concepts, functionality, and configuration syntax.


---------------------------------------------------------

::

          The following commands are understood:

          list [PATTERN...]
              Show a list of existing links and their status. If one ore
              more PATTERNs are specified, only links matching one of them
              are shown. If no further arguments are specified shows all
              links, otherwise just the specified links. Produces output
              similar to:

                  IDX LINK         TYPE     OPERATIONAL SETUP
                    1 lo           loopback carrier     unmanaged
                    2 eth0         ether    routable    configured
                    3 virbr0       ether    no-carrier  unmanaged
                    4 virbr0-nic   ether    off         unmanaged

                  4 links listed.

              The operational status is one of the following:

              missing
                  the device is missing

              off
                  the device is powered down

              no-carrier
                  the device is powered up, but it does not yet have a
                  carrier

              dormant
                  the device has a carrier, but is not yet ready for normal
                  traffic

              degraded-carrier
                  for bond or bridge master, one of the bonding or bridge
                  slave network interfaces is in off, no-carrier, or
                  dormant state

              carrier
                  the link has a carrier, or for bond or bridge master, all
                  bonding or bridge slave network interfaces are enslaved
                  to the master

              degraded
                  the link has carrier and addresses valid on the local
                  link configured

              enslaved
                  the link has carrier and is enslaved to bond or bridge
                  master network interface

              routable
                  the link has carrier and routable address configured

              The setup status is one of the following:

              pending
                  udev is still processing the link, we don't yet know if
                  we will manage it

              failed
                  networkd failed to manage the link

              configuring
                  in the process of retrieving configuration or configuring
                  the link

              configured
                  link configured successfully

              unmanaged
                  networkd is not handling the link

              linger
                  the link is gone, but has not yet been dropped by
                  networkd

          status [PATTERN...]
              Show information about the specified links: type, state,
              kernel module driver, hardware and IP address, configured DNS
              servers, etc. If one ore more PATTERNs are specified, only
              links matching one of them are shown.

              When no links are specified, an overall network status is
              shown. Also see the option --all.

              Produces output similar to:

                  ●        State: routable
                    Online state: online
                         Address: 10.193.76.5 on eth0
                                  192.168.122.1 on virbr0
                                  169.254.190.105 on eth0
                                  fe80::5054:aa:bbbb:cccc on eth0
                         Gateway: 10.193.11.1 (CISCO SYSTEMS, INC.) on eth0
                             DNS: 8.8.8.8
                                  8.8.4.4

              In the overall network status, the online state depends on
              the individual online state of all required links. Managed
              links are required for online by default. In this case, the
              online state is one of the following:

              unknown
                  all links have unknown online status (i.e. there are no
                  required links)

              offline
                  all required links are offline

              partial
                  some, but not all, required links are online

              online
                  all required links are online

          lldp [PATTERN...]
              Show discovered LLDP (Link Layer Discovery Protocol)
              neighbors. If one or more PATTERNs are specified only
              neighbors on those interfaces are shown. Otherwise shows
              discovered neighbors on all interfaces. Note that for this
              feature to work, LLDP= must be turned on for the specific
              interface, see systemd.network(5) for details.

              Produces output similar to:

                  LINK             CHASSIS ID        SYSTEM NAME      CAPS        PORT ID           PORT DESCRIPTION
                  enp0s25          00:e0:4c:00:00:00 GS1900           ..b........ 2                 Port #2

                  Capability Flags:
                  o - Other; p - Repeater;  b - Bridge; w - WLAN Access Point; r - Router;
                  t - Telephone; d - DOCSIS cable device; a - Station; c - Customer VLAN;
                  s - Service VLAN, m - Two-port MAC Relay (TPMR)

                  1 neighbors listed.

          label
              Show numerical address labels that can be used for address
              selection. This is the same information that ip-addrlabel(8)
              shows. See RFC 3484[1] for a discussion of address labels.

              Produces output similar to:

                  Prefix/Prefixlen                          Label
                          ::/0                                  1
                      fc00::/7                                  5
                      fec0::/10                                11
                      2002::/16                                 2
                      3ffe::/16                                12
                   2001:10::/28                                 7
                      2001::/32                                 6
                  ::ffff:0.0.0.0/96                             4
                          ::/96                                 3
                         ::1/128                                0

          delete DEVICE...
              Deletes virtual netdevs. Takes interface name or index
              number.

          up DEVICE...
              Bring devices up. Takes interface name or index number.

          down DEVICE...
              Bring devices down. Takes interface name or index number.

          renew DEVICE...
              Renew dynamic configurations e.g. addresses received from
              DHCP server. Takes interface name or index number.

          forcerenew DEVICE...
              Send a FORCERENEW message to all connected clients,
              triggering DHCP reconfiguration. Takes interface name or
              index number.

          reconfigure DEVICE...
              Reconfigure network interfaces. Takes interface name or index
              number. Note that this does not reload .netdev or .network
              corresponding to the specified interface. So, if you edit
              config files, it is necessary to call networkctl reload first
              to apply new settings.

          reload
              Reload .netdev and .network files. If a new .netdev file is
              found, then the corresponding netdev is created. Note that
              even if an existing .netdev is modified or removed,
              systemd-networkd does not update or remove the netdev. If a
              new, modified or removed .network file is found, then all
              interfaces which match the file are reconfigured.


-------------------------------------------------------

::

          The following options are understood:

          -a --all
              Show all links with status.

          -s --stats
              Show link statistics with status.

          -l, --full
              Do not ellipsize the output.

          -n, --lines=
              When used with status, controls the number of journal lines
              to show, counting from the most recent ones. Takes a positive
              integer argument. Defaults to 10.

          --json=MODE
              Shows output formatted as JSON. Expects one of "short" (for
              the shortest possible output without any redundant whitespace
              or line breaks), "pretty" (for a pretty version of the same,
              with indentation and line breaks) or "off" (to turn off JSON
              output, the default).

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          --no-legend
              Do not print the legend, i.e. column headers and the footer
              with hints.

          --no-pager
              Do not pipe output into a pager.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd-networkd.service(8), systemd.network(5),
          systemd.netdev(5), ip(8)


---------------------------------------------------

::

           1. RFC 3484
              https://tools.ietf.org/html/rfc3484

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

   systemd 249                                                NETWORKCTL(1)

--------------

Pages that refer to this page:
`systemd.network(5) <../man5/systemd.network.5.html>`__, 
`systemd-networkd.service(8) <../man8/systemd-networkd.service.8.html>`__, 
`systemd-networkd-wait-online.service(8) <../man8/systemd-networkd-wait-online.service.8.html>`__

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
