.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-boot-system-token.service(8) — Linux manual page
========================================================

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

   SYSTEMD-BOOT-SYSTEM-TOKEN.SERVICE(8)tem-token.serviceEM-TOKEN.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-boot-system-token.service - Generate an initial boot
          loader system token and random seed


---------------------------------------------------------

::

          systemd-boot-system-token.service


---------------------------------------------------------------

::

          systemd-boot-system-token.service is a system service that
          automatically generates a 'system token' to store in an EFI
          variable in the system's NVRAM and a random seed to store on the
          EFI System Partition ESP on disk. The boot loader may then
          combine these two randomized data fields by cryptographic
          hashing, and pass it to the OS it boots as initialization seed
          for its entropy pool. The random seed stored in the ESP is
          refreshed on each reboot ensuring that multiple subsequent boots
          will boot with different seeds. The 'system token' is generated
          randomly once, and then persistently stored in the system's EFI
          variable storage.

          The systemd-boot-system-token.service unit invokes the bootctl
          random-seed command, which updates the random seed in the ESP,
          and initializes the 'system token' if it's not initialized yet.
          The service is conditionalized so that it is run only when all of
          the below apply:

          •   A boot loader is used that implements the Boot Loader
              Interface[1] (which defines the 'system token' concept).

          •   Either a 'system token' was not set yet, or the boot loader
              has not passed the OS a random seed yet (and thus most likely
              has been missing the random seed file in the ESP).

          •   The system is not running in a VM environment. This case is
              explicitly excluded since on VM environments the ESP backing
              storage and EFI variable storage is typically not physically
              separated and hence booting the same OS image in multiple
              instances would replicate both, thus reusing the same random
              seed and 'system token' among all instances, which defeats
              its purpose. Note that it's still possible to use boot loader
              random seed provisioning in this mode, but the automatic
              logic implemented by this service has no effect then, and the
              user instead has to manually invoke the bootctl random-seed
              acknowledging these restrictions.

          For further details see bootctl(1), regarding the command this
          service invokes.


---------------------------------------------------------

::

          systemd(1), bootctl(1), systemd-boot(7)


---------------------------------------------------

::

           1. Boot Loader Interface
              https://systemd.io/BOOT_LOADER_INTERFACE

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

   systemd 249                         SYSTEMD-BOOT-SYSTEM-TOKEN.SERVICE(8)

--------------

Pages that refer to this page: `bootctl(1) <../man1/bootctl.1.html>`__, 
`systemd-boot(7) <../man7/systemd-boot.7.html>`__

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
