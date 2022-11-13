.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-veritysetup@.service(8) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-VERITYSETUP@.SERVICE(8)eritysetup@.serviceERITYSETUP@.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-veritysetup@.service, systemd-veritysetup - Disk
          integrity protection logic


---------------------------------------------------------

::

          systemd-veritysetup@.service

          /usr/lib/systemd/systemd-veritysetup


---------------------------------------------------------------

::

          systemd-veritysetup@.service is a service responsible for setting
          up integrity protection (verity) block devices. It should be
          instantiated for each device that requires integrity protection.

          At early boot and when the system manager configuration is
          reloaded kernel command line configuration for integrity
          protected block devices is translated into
          systemd-veritysetup@.service units by
          systemd-veritysetup-generator(8).

          systemd-veritysetup@.service calls systemd-veritysetup.


---------------------------------------------------------

::

          The following commands are understood by systemd-veritysetup:

          attach volume datadevice hashdevice roothash [option...]
              Create a block device volume using datadevice and hashdevice
              as the backing devices.  roothash forms the root of the tree
              of hashes stored on hashdevice. See Kernel dm-verity[1]
              documentation for details.

          detach volume
              Detach (destroy) the block device volume.

          help
              Print short information about command syntax.


---------------------------------------------------------

::

          systemd(1), systemd-veritysetup-generator(8), veritysetup(8)


---------------------------------------------------

::

           1. Kernel dm-verity
              https://www.kernel.org/doc/html/latest/admin-guide/device-mapper/verity.html

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

   systemd 249                              SYSTEMD-VERITYSETUP@.SERVICE(8)

--------------

Pages that refer to this page:
`veritytab(5) <../man5/veritytab.5.html>`__, 
`systemd-veritysetup-generator(8) <../man8/systemd-veritysetup-generator.8.html>`__

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
