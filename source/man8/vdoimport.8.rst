.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vdoimport(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FSADM(8)                                                        FSADM(8)

NAME
-------------------------------------------------

::

          vdoimport — utility to import VDO volumes into a new volume
          group.


---------------------------------------------------------

::

          vdoimport
                 [options] device


---------------------------------------------------------------

::

          vdoimport utility imports VDO volumes created and managed by
          vdo(8) manager into lvm2(8) managed VDO LV. This is realized by
          moving VDO superblock by 2MiB and creating lvm2 metadata at the
          front of this device. The operation is not reversible, thus after
          conversion to lvm2 the access to VDO data is only possible with
          lvm2(8) commands, vdo(8) manager no longer control such volume.


-------------------------------------------------------

::

          -f|--force
                 Bypass some sanity checks.

          -h|--help
                 Display the help text.

          -n|--name
                 Specifies the name of converted VDO LV. When the name is
                 not specified, some automatic name is selected. In case
                 the converted VDO volume is already using LV a backend
                 device, the name of this LV is used for VDO LV.  In this
                 case also the of volume group must stay same.

          -v|--verbose
                 Be more verbose.

          -y|--yes
                 Answer "yes" at any prompts.

          --dry-run
                 Print commands without running them.


---------------------------------------------------------------

::

          On successful completion, the status code is 0.  A status code of
          1 is used for failure.


---------------------------------------------------------

::

          Convert VDO volume created by vdo manager into logical volume LV1
          with within volume group VG1.

          # vdoimport --name VG1/LV1 /dev/mapper/vdo-volume


-----------------------------------------------------------------------------------

::

          TMPDIR The temporary directory name for mount points. Defaults to
                 "/tmp".

          DM_DEV_DIR
                 The device directory name.  Defaults to "/dev" and must be
                 an absolute path.


---------------------------------------------------------

::

          lvm(8), lvm.conf(5),

          vdo(8), vdo2lvm(8),

COLOPHON
---------------------------------------------------------

::

          This page is part of the lvm2 (Logical Volume Manager 2) project.
          Information about the project can be found at 
          ⟨http://www.sourceware.org/lvm2/⟩.  If you have a bug report for
          this manual page, see ⟨https://github.com/lvmteam/lvm2/issues⟩.
          This page was obtained from the tarball
          https://github.com/lvmteam/lvm2/archive/refs/tags/v2_03_13.tar.gz
          fetched from ⟨https://github.com/lvmteam/lvm2/releases⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat, Inc        LVM TOOLS 2.03.13(2) (2021-08-11)           FSADM(8)

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
