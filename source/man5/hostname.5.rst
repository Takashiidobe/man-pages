.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hostname(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `HOSTNAME S                       |                                   |
| EMANTICS <#HOSTNAME_SEMANTICS>`__ |                                   |
| \| `HISTORY <#HISTORY>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HOSTNAME(5)                     hostname                     HOSTNAME(5)

NAME
-------------------------------------------------

::

          hostname - Local hostname configuration file


---------------------------------------------------------

::

          /etc/hostname


---------------------------------------------------------------

::

          The /etc/hostname file configures the name of the local system.
          Unless overridden as described in the next section, systemd(1)
          will set this hostname during boot using the sethostname(2)
          system call.

          The file should contain a single newline-terminated hostname
          string. Comments (lines starting with a "#") are ignored. The
          hostname should be composed of up to 64 7-bit ASCII lower-case
          alphanumeric characters or hyphens forming a valid DNS domain
          name. It is recommended that this name contains only a single
          label, i.e. without any dots. Invalid characters will be filtered
          out in an attempt to make the name valid, but obviously it is
          recommended to use a valid name and not rely on this filtering.

          You may use hostnamectl(1) to change the value of this file
          during runtime from the command line. Use systemd-firstboot(1) to
          initialize it on mounted (but not booted) system images.


-----------------------------------------------------------------------------

::

          systemd(1) and the associated tools will obtain the hostname in
          the following ways:

          •   If the kernel commandline parameter systemd.hostname=
              specifies a valid hostname, systemd(1) will use it to set the
              hostname during early boot, see kernel-command-line(7),

          •   Otherwise, the "static" hostname specified by /etc/hostname
              as described above will be used.

          •   Otherwise, a transient hostname may be set during runtime,
              for example based on information in a DHCP lease, see
              systemd-hostnamed.service(8). Both NetworkManager[1] and
              systemd-networkd.service(8) allow this. Note that
              systemd-hostnamed.service(8) gives higher priority to the
              static hostname, so the transient hostname will only be used
              if the static hostname is not configured.

          •   Otherwise, a fallback hostname configured at compilation time
              will be used ("localhost").

          Effectively, the static hostname has higher priority than a
          transient hostname, which has higher priority than the fallback
          hostname. Transient hostnames are equivalent, so setting a new
          transient hostname causes the previous transient hostname to be
          forgotten. The hostname specified on the kernel command line is
          like a transient hostname, with the exception that it has higher
          priority when the machine boots. Also note that those are the
          semantics implemented by systemd tools, but other programs may
          also set the hostname.


-------------------------------------------------------

::

          The simple configuration file format of /etc/hostname originates
          from Debian GNU/Linux.


---------------------------------------------------------

::

          systemd(1), sethostname(2), hostname(1), hostname(7),
          machine-id(5), machine-info(5), hostnamectl(1),
          systemd-hostnamed.service(8), systemd-firstboot(1)


---------------------------------------------------

::

           1. NetworkManager
              https://developer.gnome.org/NetworkManager/stable/

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

   systemd 249                                                  HOSTNAME(5)

--------------

Pages that refer to this page:
`hostnamectl(1) <../man1/hostnamectl.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`machine-info(5) <../man5/machine-info.5.html>`__, 
`os-release(5) <../man5/os-release.5.html>`__, 
`systemd-hostnamed.service(8) <../man8/systemd-hostnamed.service.8.html>`__

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
