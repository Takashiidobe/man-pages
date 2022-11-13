.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-fsck@.service(8) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-FSCK@.SERVICE(8)  systemd-fsck@.service SYSTEMD-FSCK@.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-fsck@.service, systemd-fsck-root.service, systemd-fsck -
          File system checker logic


---------------------------------------------------------

::

          systemd-fsck@.service

          systemd-fsck-root.service

          /usr/lib/systemd/systemd-fsck


---------------------------------------------------------------

::

          systemd-fsck@.service and systemd-fsck-root.service are services
          responsible for file system checks. They are instantiated for
          each device that is configured for file system checking.
          systemd-fsck-root.service is responsible for file system checks
          on the root file system, but only if the root filesystem was not
          checked in the initramfs.  systemd-fsck@.service is used for all
          other file systems and for the root file system in the initramfs.

          These services are started at boot if passno in /etc/fstab for
          the file system is set to a value greater than zero. The file
          system check for root is performed before the other file systems.
          Other file systems may be checked in parallel, except when they
          are on the same rotating disk.

          systemd-fsck does not know any details about specific
          filesystems, and simply executes file system checkers specific to
          each filesystem type (/sbin/fsck.type). These checkers will
          decide if the filesystem should actually be checked based on the
          time since last check, number of mounts, unclean unmount, etc.

          If a file system check fails for a service without nofail,
          emergency mode is activated, by isolating to emergency.target.


-------------------------------------------------------------------------------

::

          systemd-fsck understands these kernel command line parameters:

          fsck.mode=
              One of "auto", "force", "skip". Controls the mode of
              operation. The default is "auto", and ensures that file
              system checks are done when the file system checker deems
              them necessary.  "force" unconditionally results in full file
              system checks.  "skip" skips any file system checks.

          fsck.repair=
              One of "preen", "yes", "no". Controls the mode of operation.
              The default is "preen", and will automatically repair
              problems that can be safely fixed.  "yes" will answer yes to
              all questions by fsck and "no" will answer no to all
              questions.


---------------------------------------------------------

::

          systemd(1), fsck(8), systemd-quotacheck.service(8),
          fsck.btrfs(8), fsck.cramfs(8), fsck.ext4(8), fsck.fat(8),
          fsck.hfsplus(8), fsck.minix(8), fsck.ntfs(8), fsck.xfs(8)

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

   systemd 249                                     SYSTEMD-FSCK@.SERVICE(8)

--------------

Pages that refer to this page:
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd-quotacheck.service(8) <../man8/systemd-quotacheck.service.8.html>`__

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
