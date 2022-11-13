.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-remount-fs.service(8) — Linux manual page
=================================================

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

   SYSTEMD-REMOUNT-FS.SERVICE(8)d-remount-fs.serviceD-REMOUNT-FS.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-remount-fs.service, systemd-remount-fs - Remount root and
          kernel file systems


---------------------------------------------------------

::

          systemd-remount-fs.service

          /usr/lib/systemd/systemd-remount-fs


---------------------------------------------------------------

::

          systemd-remount-fs.service is an early boot service that applies
          mount options listed in fstab(5), or gathered from the partition
          table (when systemd-gpt-auto-generator(8) is active) to the root
          file system, the /usr/ file system, and the kernel API file
          systems. This is required so that the mount options of these file
          systems — which are pre-mounted by the kernel, the initial RAM
          disk, container environments or system manager code — are updated
          to those configured in /etc/fstab and the other sources. This
          service ignores normal file systems and only changes the root
          file system (i.e.  /), /usr/, and the virtual kernel API file
          systems such as /proc/, /sys/ or /dev/. This service executes no
          operation if no configuration is found (/etc/fstab does not exist
          or lists no entries for the mentioned file systems, or the
          partition table does not contain relevant entries).

          For a longer discussion of kernel API file systems see API File
          Systems[1].

          Note: systemd-remount-fs.service is usually pulled in by
          systemd-fstab-generator(8), hence it is also affected by the
          kernel command line option fstab=, which may be used to disable
          the generator. It may also pulled in by
          systemd-gpt-auto-generator(8), which is affected by
          systemd.gpt_auto and other options.


---------------------------------------------------------

::

          systemd(1), fstab(5), mount(8), systemd-fstab-generator(8),
          systemd-gpt-auto-generator(8)


---------------------------------------------------

::

           1. API File Systems
              https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems

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

   systemd 249                                SYSTEMD-REMOUNT-FS.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-fstab-generator(8) <../man8/systemd-fstab-generator.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__

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
