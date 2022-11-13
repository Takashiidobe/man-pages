.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nss-myhostname(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSS-MYHOSTNAME(8)            nss-myhostname            NSS-MYHOSTNAME(8)

NAME
-------------------------------------------------

::

          nss-myhostname, libnss_myhostname.so.2 - Hostname resolution for
          the locally configured system hostname


---------------------------------------------------------

::

          libnss_myhostname.so.2


---------------------------------------------------------------

::

          nss-myhostname is a plug-in module for the GNU Name Service
          Switch (NSS) functionality of the GNU C Library (glibc),
          primarily providing hostname resolution for the locally
          configured system hostname as returned by gethostname(2). The
          precise hostnames resolved by this module are:

          •   The local, configured hostname is resolved to all locally
              configured IP addresses ordered by their scope, or — if none
              are configured — the IPv4 address 127.0.0.2 (which is on the
              local loopback) and the IPv6 address ::1 (which is the local
              host).

          •   The hostnames "localhost" and "localhost.localdomain" (as
              well as any hostname ending in ".localhost" or
              ".localhost.localdomain") are resolved to the IP addresses
              127.0.0.1 and ::1.

          •   The hostname "_gateway" is resolved to all current default
              routing gateway addresses, ordered by their metric. This
              assigns a stable hostname to the current gateway, useful for
              referencing it independently of the current network
              configuration state.

          •   The hostname "_outbound" is resolved to the local IPv4 and
              IPv6 addresses that are most likely used for communication
              with other hosts. This is determined by requesting a routing
              decision to the configured default gateways from the kernel
              and then using the local IP addresses selected by this
              decision. This hostname is only available if there is at
              least one local default gateway configured. This assigns a
              stable hostname to the local outbound IP addresses, useful
              for referencing them independently of the current network
              configuration state.

          Various software relies on an always-resolvable local hostname.
          When using dynamic hostnames, this is traditionally achieved by
          patching /etc/hosts at the same time as changing the hostname.
          This is problematic since it requires a writable /etc/ file
          system and is fragile because the file might be edited by the
          administrator at the same time. With nss-myhostname enabled,
          changing /etc/hosts is unnecessary, and on many systems, the file
          becomes entirely optional.

          To activate the NSS modules, add "myhostname" to the line
          starting with "hosts:" in /etc/nsswitch.conf.

          It is recommended to place "myhostname" after "file" and before
          "dns". This resolves well-known hostnames like "localhost" and
          the machine hostnames locally. It is consistent with the
          behaviour of nss-resolve, and still allows overriding via
          /etc/hosts.

          Please keep in mind that nss-myhostname (and nss-resolve) also
          resolve in the other direction — from locally attached IP
          addresses to hostnames. If you rely on that lookup being provided
          by DNS, you might want to order things differently.


-------------------------------------------------------

::

          Here is an example /etc/nsswitch.conf file that enables
          nss-myhostname correctly:

              passwd:         compat systemd
              group:          compat [SUCCESS=merge] systemd
              shadow:         compat systemd
              gshadow:        files systemd

              hosts:          mymachines resolve [!UNAVAIL=return] files myhostname dns
              networks:       files

              protocols:      db files
              services:       db files
              ethers:         db files
              rpc:            db files

              netgroup:       nis

          To test, use glibc's getent tool:

              $ getent ahosts `hostname`
              ::1       STREAM omega
              ::1       DGRAM
              ::1       RAW
              127.0.0.2       STREAM
              127.0.0.2       DGRAM
              127.0.0.2       RAW

          In this case, the local hostname is omega.


---------------------------------------------------------

::

          systemd(1), nss-systemd(8), nss-resolve(8), nss-mymachines(8),
          nsswitch.conf(5), getent(1)

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

   systemd 249                                            NSS-MYHOSTNAME(8)

--------------

Pages that refer to this page:
`nss-mymachines(8) <../man8/nss-mymachines.8.html>`__, 
`nss-resolve(8) <../man8/nss-resolve.8.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__

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
