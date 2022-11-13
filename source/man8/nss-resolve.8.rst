.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nss-resolve(8) — Linux manual page
==================================

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

   NSS-RESOLVE(8)                 nss-resolve                NSS-RESOLVE(8)

NAME
-------------------------------------------------

::

          nss-resolve, libnss_resolve.so.2 - Hostname resolution via
          systemd-resolved.service


---------------------------------------------------------

::

          libnss_resolve.so.2


---------------------------------------------------------------

::

          nss-resolve is a plug-in module for the GNU Name Service Switch
          (NSS) functionality of the GNU C Library (glibc) enabling it to
          resolve hostnames via the systemd-resolved(8) local network name
          resolution service. It replaces the nss-dns plug-in module that
          traditionally resolves hostnames via DNS.

          To activate the NSS module, add "resolve [!UNAVAIL=return]" to
          the line starting with "hosts:" in /etc/nsswitch.conf.
          Specifically, it is recommended to place "resolve" early in
          /etc/nsswitch.conf's "hosts:" line. It should be before the
          "files" entry, since systemd-resolved supports /etc/hosts
          internally, but with caching. To the contrary, it should be after
          "mymachines", to give hostnames given to local VMs and containers
          precedence over names received over DNS. Finally, we recommend
          placing "dns" somewhere after "resolve", to fall back to nss-dns
          if systemd-resolved.service is not available.

          Note that systemd-resolved will synthesize DNS resource records
          in a few cases, for example for "localhost" and the current local
          hostname, see systemd-resolved(8) for the full list. This
          duplicates the functionality of nss-myhostname(8), but it is
          still recommended (see examples below) to keep nss-myhostname
          configured in /etc/nsswitch.conf, to keep those names resolveable
          if systemd-resolved is not running.

          Please keep in mind that nss-myhostname (and nss-resolve) also
          resolve in the other direction — from locally attached IP
          addresses to hostnames. If you rely on that lookup being provided
          by DNS, you might want to order things differently.


-------------------------------------------------------

::

          Here is an example /etc/nsswitch.conf file that enables
          nss-resolve correctly:

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


---------------------------------------------------------

::

          systemd(1), systemd-resolved(8), nss-systemd(8),
          nss-myhostname(8), nss-mymachines(8), nsswitch.conf(5)

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

   systemd 249                                               NSS-RESOLVE(8)

--------------

Pages that refer to this page:
`nss-myhostname(8) <../man8/nss-myhostname.8.html>`__, 
`nss-mymachines(8) <../man8/nss-mymachines.8.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__, 
`systemd-resolved.service(8) <../man8/systemd-resolved.service.8.html>`__

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
