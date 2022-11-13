.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-makefs@.service(8) — Linux manual page
==============================================

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

   SYSTEMD-MAKEFS@.SERVICE(8)ystemd-makefs@.serviceSTEMD-MAKEFS@.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-makefs@.service, systemd-mkswap@.service, systemd-
          growfs@.service, systemd-makefs, systemd-growfs - Creating and
          growing file systems on demand


---------------------------------------------------------

::

          systemd-makefs@device.service

          systemd-mkswap@device.service

          systemd-growfs@mountpoint.service

          /usr/lib/systemd/systemd-makefs

          /usr/lib/systemd/systemd-growfs


---------------------------------------------------------------

::

          systemd-makefs@.service, systemd-mkswap@.service, and
          systemd-growfs@.service are used to implement the
          x-systemd.makefs and x-systemd.growfs options in fstab(5), see
          systemd.mount(5). They are instantiated for each device for which
          the file system or swap structure needs to be initialized, and
          for each mount point where the file system needs to be grown.

          These services are started at boot, either right before or right
          after the mount point or swap device are used.

          systemd-makefs knows very little about specific file systems and
          swap devices, and after checking that the block device does not
          already contain a file system or other content, it will execute
          binaries specific to each filesystem type (/sbin/mkfs.type or
          /sbin/mkswap).

          systemd-growfs knows very little about specific file systems and
          swap devices, and will instruct the kernel to grow the mounted
          filesystem to full size of the underlying block device.
          Nevertheless, it needs to know the ioctl(2) number specific to
          each file system, so only certain types are supported. Currently:
          ext4(5), btrfs(5), xfs(5), and dm-crypt partitions (see
          cryptsetup(8)).

          If the creation of a file system or swap device fails, the mount
          point or swap is failed too. If the growing of a file system
          fails, a warning is emitted.


---------------------------------------------------------

::

          systemd(1), systemd.mount(8), systemd-fstab-generator(8),
          systemd-repart(8), mkfs.btrfs(8), mkfs.cramfs(8), mkfs.ext4(8),
          mkfs.fat(8), mkfs.hfsplus(8), mkfs.minix(8), mkfs.ntfs(8),
          mkfs.xfs(8)

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

   systemd 249                                   SYSTEMD-MAKEFS@.SERVICE(8)

--------------

Pages that refer to this page:
`repart.d(5) <../man5/repart.d.5.html>`__, 
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`systemd-repart(8) <../man8/systemd-repart.8.html>`__

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
