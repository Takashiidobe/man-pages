.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nss-mymachines(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATI                      |                                   |
| ON IN /ETC/NSSWITCH.CONF <#CONFIG |                                   |
| URATION_IN_/ETC/NSSWITCH.CONF>`__ |                                   |
| \|                                |                                   |
| `EXAMPLE: MAPPINGS PROVIDED BY    |                                   |
|  NSS-MYMACHINES <#EXAMPLE:_MAPPIN |                                   |
| GS_PROVIDED_BY_NSS-MYMACHINES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSS-MYMACHINES(8)            nss-mymachines            NSS-MYMACHINES(8)

NAME
-------------------------------------------------

::

          nss-mymachines, libnss_mymachines.so.2 - Hostname resolution for
          local container instances


---------------------------------------------------------

::

          libnss_mymachines.so.2


---------------------------------------------------------------

::

          nss-mymachines is a plug-in module for the GNU Name Service
          Switch (NSS) functionality of the GNU C Library (glibc),
          providing hostname resolution for the names of containers running
          locally that are registered with systemd-machined.service(8). The
          container names are resolved to the IP addresses of the specific
          container, ordered by their scope. This functionality only
          applies to containers using network namespacing (see the
          description of --private-network in systemd-nspawn(1)). Note that
          the name that is resolved is the one registered with
          systemd-machined, which may be different than the hostname
          configured inside of the container.

          Note that this NSS module only makes available names of the
          containers running immediately below the current system context.
          It does not provide host name resolution for containers running
          side-by-side with the invoking system context, or containers
          further up or down the container hierarchy. Or in other words, on
          the host system it provides host name resolution for the
          containers running immediately below the host environment. When
          used inside a container environment however, it will not be able
          to provide name resolution for containers running on the host (as
          those are siblings and not children of the current container
          environment), but instead only for nested containers running
          immediately below its own container environment.

          To activate the NSS module, add "mymachines" to the line starting
          with "hosts:" in /etc/nsswitch.conf.

          It is recommended to place "mymachines" before the "resolve" or
          "dns" entry of the "hosts:" line of /etc/nsswitch.conf in order
          to make sure that its mappings are preferred over other resolvers
          such as DNS.


---------------------------------------------------------------------------------------------------------------

::

          Here is an example /etc/nsswitch.conf file that enables
          nss-mymachines correctly:

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


---------------------------------------------------------------------------------------------------------------------------------

::

          The container "rawhide" is spawned using systemd-nspawn(1):

              # systemd-nspawn -M rawhide --boot --network-veth --private-users=pick
              Spawning container rawhide on /var/lib/machines/rawhide.
              Selected user namespace base 20119552 and range 65536.
              ...

              $ machinectl --max-addresses=3
              MACHINE CLASS     SERVICE        OS     VERSION ADDRESSES
              rawhide container systemd-nspawn fedora 30      169.254.40.164 fe80::94aa:3aff:fe7b:d4b9

              $ ping -c1 rawhide
              PING rawhide(fe80::94aa:3aff:fe7b:d4b9%ve-rawhide (fe80::94aa:3aff:fe7b:d4b9%ve-rawhide)) 56 data bytes
              64 bytes from fe80::94aa:3aff:fe7b:d4b9%ve-rawhide (fe80::94aa:3aff:fe7b:d4b9%ve-rawhide): icmp_seq=1 ttl=64 time=0.045 ms
              ...
              $ ping -c1 -4 rawhide
              PING rawhide (169.254.40.164) 56(84) bytes of data.
              64 bytes from 169.254.40.164 (169.254.40.164): icmp_seq=1 ttl=64 time=0.064 ms
              ...

              # machinectl shell rawhide /sbin/ip a
              Connected to machine rawhide. Press ^] three times within 1s to exit session.
              1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
                  ...
              2: host0@if21: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
                  link/ether 96:aa:3a:7b:d4:b9 brd ff:ff:ff:ff:ff:ff link-netnsid 0
                  inet 169.254.40.164/16 brd 169.254.255.255 scope link host0
                     valid_lft forever preferred_lft forever
                  inet6 fe80::94aa:3aff:fe7b:d4b9/64 scope link
                     valid_lft forever preferred_lft forever
              Connection to machine rawhide terminated.


---------------------------------------------------------

::

          systemd(1), systemd-machined.service(8), machinectl(1),
          nss-systemd(8), nss-resolve(8), nss-myhostname(8),
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

   systemd 249                                            NSS-MYMACHINES(8)

--------------

Pages that refer to this page:
`org.freedesktop.machine1(5) <../man5/org.freedesktop.machine1.5.html>`__, 
`nss-myhostname(8) <../man8/nss-myhostname.8.html>`__, 
`nss-resolve(8) <../man8/nss-resolve.8.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__

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
