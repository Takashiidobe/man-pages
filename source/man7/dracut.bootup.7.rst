.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dracut.bootup(7) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DRACUT.BOOTUP(7)                 dracut                 DRACUT.BOOTUP(7)

NAME
-------------------------------------------------

::

          dracut.bootup - boot ordering in the initramfs


---------------------------------------------------------------

::

          This flow chart illustrates the ordering of the services, if
          systemd is used in the dracut initramfs.

                                                  systemd-journal.socket
                                                             |
                                                             v
                                                  dracut-cmdline.service
                                                             |
                                                             v
                                                  dracut-pre-udev.service
                                                             |
                                                             v
                                                   systemd-udevd.service
                                                             |
                                                             v
              local-fs-pre.target                dracut-pre-trigger.service
                       |                                     |
                       v                                     v
               (various mounts)  (various swap  systemd-udev-trigger.service
                       |           devices...)               |             (various low-level   (various low-level
                       |               |                     |             services: seed,       API VFS mounts:
                       v               v                     v             tmpfiles, random     mqueue, configfs,
                local-fs.target   swap.target     dracut-initqueue.service    sysctl, ...)        debugfs, ...)
                       |               |                     |                    |                    |
                       \_______________|____________________ | ___________________|____________________/
                                                            \|/
                                                             v
                                                      sysinit.target
                                                             |
                                           _________________/|\___________________
                                          /                  |                    \
                                          |                  |                    |
                                          v                  |                    v
                                      (various               |              rescue.service
                                     sockets...)             |                    |
                                          |                  |                    v
                                          v                  |              rescue.target
                                   sockets.target            |
                                          |                  |
                                          \_________________ |                                 emergency.service
                                                            \|                                         |
                                                             v                                         v
                                                       basic.target                             emergency.target
                                                             |
                                      ______________________/|
                                     /                       |
                                     |                       v
                                     |            dracut-pre-mount.service
                                     |                       |
                                     |                       v
                                     |                  sysroot.mount
                                     |                       |
                                     |                       v
                                     |             initrd-root-fs.target
                         (custom initrd services)            |
                                     |                       v
                                     |             dracut-mount.service
                                     |                       |
                                     |                       v
                                     |            initrd-parse-etc.service
                                     |                       |
                                     |                       v
                                     |            (sysroot-usr.mount and
                                     |             various mounts marked
                                     |               with fstab option
                                     |                x-initrd.mount)
                                     |                       |
                                     |                       v
                                     |                initrd-fs.target
                                     \______________________ |
                                                            \|
                                                             v
                                                        initrd.target
                                                             |
                                                             v
                                                  dracut-pre-pivot.service
                                                             |
                                                             v
                                                   initrd-cleanup.service
                                                        isolates to
                                                  initrd-switch-root.target
                                                             |
                                                             v
                                      ______________________/|
                                     /                       |
                                     |        initrd-udevadm-cleanup-db.service
                                     |                       |
                         (custom initrd services)            |
                                     |                       |
                                     \______________________ |
                                                            \|
                                                             v
                                                 initrd-switch-root.target
                                                             |
                                                             v
                                                 initrd-switch-root.service
                                                             |
                                                             v
                                                        switch-root


-----------------------------------------------------

::

          Harald Hoyer


---------------------------------------------------------

::

          dracut(8) bootup(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the dracut (event driven initramfs
          infrastructure) project.  Information about the project can be
          found at ⟨https://dracut.wiki.kernel.org/index.php/Main_Page⟩.
          If you have a bug report for this manual page, send it to
          initramfs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/boot/dracut/dracut.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-05-27.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   dracut 050-2-g9e68789d         05/16/2020               DRACUT.BOOTUP(7)

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
