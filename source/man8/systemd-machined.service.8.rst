.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-machined.service(8) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-MACHINED.SERVICE(8)temd-machined.serviceTEMD-MACHINED.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-machined.service, systemd-machined - Virtual machine and
          container registration manager


---------------------------------------------------------

::

          systemd-machined.service

          /usr/lib/systemd/systemd-machined


---------------------------------------------------------------

::

          systemd-machined is a system service that keeps track of locally
          running virtual machines and containers.

          systemd-machined is useful for registering and keeping track of
          both OS containers (containers that share the host kernel but run
          a full init system of their own and behave in most regards like a
          full virtual operating system rather than just one virtualized
          app) and full virtual machines (virtualized hardware running
          normal operating systems and possibly different kernels).

          systemd-machined should not be used for registering/keeping track
          of application sandbox containers. A machine in the context of
          systemd-machined is supposed to be an abstract term covering both
          OS containers and full virtual machines, but not application
          sandboxes.

          Machines registered with machined are exposed in various ways in
          the system. For example:

          •   Tools like ps(1) will show to which machine a specific
              process belongs in a column of its own, and so will
              gnome-system-monitor[1] or systemd-cgls(1).

          •   systemd's various tools (systemctl(1), journalctl(1),
              loginctl(1), hostnamectl(1), timedatectl(1), localectl(1),
              machinectl(1), ...) support the -M switch to operate on local
              containers instead of the host system.

          •   systemctl list-machines will show the system state of all
              local containers, connecting to the container's init system
              for that.

          •   systemctl's --recursive switch has the effect of not only
              showing the locally running services, but recursively showing
              the services of all registered containers.

          •   The machinectl command provides access to a number of useful
              operations on registered containers, such as introspecting
              them, rebooting, shutting them down, and getting a login
              prompt on them.

          •   The sd-bus(3) library exposes the
              sd_bus_open_system_machine(3) call to connect to the system
              bus of any registered container.

          •   The nss-mymachines(8) module makes sure all registered
              containers can be resolved via normal glibc gethostbyname(3)
              or getaddrinfo(3) calls.

          See systemd-nspawn(1) for some examples on how to run containers
          with OS tools.

          If you are interested in writing a VM or container manager that
          makes use of machined, please have look at Writing Virtual
          Machine or Container Managers[2]. Also see the New Control Group
          Interfaces[3].

          The daemon provides both a C library interface (which is shared
          with systemd-logind.service(8)) as well as a D-Bus interface. The
          library interface may be used to introspect and watch the state
          of virtual machines/containers. The bus interface provides the
          same but in addition may also be used to register or terminate
          machines. For more information please consult sd-login(3) and
          org.freedesktop.machine1(5) and org.freedesktop.LogControl1(5).

          A small companion daemon systemd-importd.service(8) is also
          available, which implements importing, exporting, and downloading
          of container and VM images.

          For each container registered with systemd-machined.service that
          employs user namespacing, users/groups are synthesized for the
          used UIDs/GIDs. These are made available to the system using the
          User/Group Record Lookup API via Varlink[4], and thus may be
          resolved with userdbctl(1) or the usual glibc NSS calls.


---------------------------------------------------------

::

          systemd(1), machinectl(1), systemd-nspawn(1), nss-mymachines(8),
          systemd.special(7)


---------------------------------------------------

::

           1. gnome-system-monitor
              https://help.gnome.org/users/gnome-system-monitor/

           2. Writing Virtual Machine or Container Managers
              https://www.freedesktop.org/wiki/Software/systemd/writing-vm-managers

           3. New Control Group Interfaces
              https://www.freedesktop.org/wiki/Software/systemd/ControlGroupInterface/

           4. User/Group Record Lookup API via Varlink
              https://systemd.io/USER_GROUP_API

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

   systemd 249                                  SYSTEMD-MACHINED.SERVICE(8)

--------------

Pages that refer to this page: `busctl(1) <../man1/busctl.1.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_set_address(3) <../man3/sd_bus_set_address.3.html>`__, 
`sd_machine_get_class(3) <../man3/sd_machine_get_class.3.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`org.freedesktop.import1(5) <../man5/org.freedesktop.import1.5.html>`__, 
`org.freedesktop.machine1(5) <../man5/org.freedesktop.machine1.5.html>`__, 
`systemd.slice(5) <../man5/systemd.slice.5.html>`__, 
`nss-mymachines(8) <../man8/nss-mymachines.8.html>`__, 
`nss-systemd(8) <../man8/nss-systemd.8.html>`__, 
`systemd-importd.service(8) <../man8/systemd-importd.service.8.html>`__

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
