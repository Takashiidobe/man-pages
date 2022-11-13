.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-networkd.service(8) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATIO                     |                                   |
| N FILES <#CONFIGURATION_FILES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-NETWORKD.SERVICE(8)temd-networkd.serviceTEMD-NETWORKD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-networkd.service, systemd-networkd - Network manager


---------------------------------------------------------

::

          systemd-networkd.service

          /usr/lib/systemd/systemd-networkd


---------------------------------------------------------------

::

          systemd-networkd is a system service that manages networks. It
          detects and configures network devices as they appear, as well as
          creating virtual network devices.

          To configure low-level link settings independently of networks,
          see systemd.link(5).

          systemd-networkd will create network devices based on the
          configuration in systemd.netdev(5) files, respecting the [Match]
          sections in those files.

          systemd-networkd will manage network addresses and routes for any
          link for which it finds a .network file with an appropriate
          [Match] section, see systemd.network(5). For those links, it will
          flush existing network addresses and routes when bringing up the
          device. Any links not matched by one of the .network files will
          be ignored. It is also possible to explicitly tell
          systemd-networkd to ignore a link by using Unmanaged=yes option,
          see systemd.network(5).

          When systemd-networkd exits, it generally leaves existing network
          devices and configuration intact. This makes it possible to
          transition from the initramfs and to restart the service without
          breaking connectivity. This also means that when configuration is
          updated and systemd-networkd is restarted, netdev interfaces for
          which configuration was removed will not be dropped, and may need
          to be cleaned up manually.

          systemd-networkd may be introspected and controlled at runtime
          using networkctl(1).


-------------------------------------------------------------------------------

::

          The configuration files are read from the files located in the
          system network directory /usr/lib/systemd/network, the volatile
          runtime network directory /run/systemd/network and the local
          administration network directory /etc/systemd/network.

          Networks are configured in .network files, see
          systemd.network(5), and virtual network devices are configured in
          .netdev files, see systemd.netdev(5).


---------------------------------------------------------

::

          networkctl(1), systemd(1), systemd.link(5), systemd.network(5),
          systemd.netdev(5), systemd-networkd-wait-online.service(8),
          systemd-network-generator.service(8)

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

   systemd 249                                  SYSTEMD-NETWORKD.SERVICE(8)

--------------

Pages that refer to this page:
`networkctl(1) <../man1/networkctl.1.html>`__, 
`resolvectl(1) <../man1/resolvectl.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`networkd.conf(5) <../man5/networkd.conf.5.html>`__, 
`org.freedesktop.resolve1(5) <../man5/org.freedesktop.resolve1.5.html>`__, 
`resolved.conf(5) <../man5/resolved.conf.5.html>`__, 
`systemd.netdev(5) <../man5/systemd.netdev.5.html>`__, 
`systemd.network(5) <../man5/systemd.network.5.html>`__, 
`timesyncd.conf(5) <../man5/timesyncd.conf.5.html>`__, 
`systemd-networkd-wait-online.service(8) <../man8/systemd-networkd-wait-online.service.8.html>`__, 
`systemd-network-generator.service(8) <../man8/systemd-network-generator.service.8.html>`__, 
`systemd-resolved.service(8) <../man8/systemd-resolved.service.8.html>`__, 
`systemd-timesyncd.service(8) <../man8/systemd-timesyncd.service.8.html>`__

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
