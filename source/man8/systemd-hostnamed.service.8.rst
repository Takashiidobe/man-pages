.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-hostnamed.service(8) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-HOSTNAMED.SERVICE(8)emd-hostnamed.serviceMD-HOSTNAMED.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-hostnamed.service, systemd-hostnamed - Daemon to control
          system hostname from programs


---------------------------------------------------------

::

          systemd-hostnamed.service

          /usr/lib/systemd/systemd-hostnamed


---------------------------------------------------------------

::

          systemd-hostnamed.service is a system service that may be used to
          change the system's hostname and related machine metadata from
          user programs. It is automatically activated on request and
          terminates itself when unused.

          It currently offers access to five variables:

          •   The current hostname (Example: "dhcp-192-168-47-11")

          •   The static (configured) hostname (Example:
              "lennarts-computer")

          •   The pretty hostname (Example: "Lennart's Computer")

          •   A suitable icon name for the local host (Example:
              "computer-laptop")

          •   A chassis type (Example: "tablet")

          The static hostname is stored in /etc/hostname, see hostname(5)
          for more information. The pretty hostname, chassis type, and icon
          name are stored in /etc/machine-info, see machine-info(5).

          The tool hostnamectl(1) is a command line client to this service.

          See org.freedesktop.hostname1(5) and
          org.freedesktop.LogControl1(5) for a description of the D-Bus
          API.


---------------------------------------------------------

::

          systemd(1), hostname(5), machine-info(5), hostnamectl(1),
          sethostname(2)

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

   systemd 249                                 SYSTEMD-HOSTNAMED.SERVICE(8)

--------------

Pages that refer to this page:
`hostnamectl(1) <../man1/hostnamectl.1.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`machine-info(5) <../man5/machine-info.5.html>`__, 
`org.freedesktop.hostname1(5) <../man5/org.freedesktop.hostname1.5.html>`__, 
`os-release(5) <../man5/os-release.5.html>`__

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
