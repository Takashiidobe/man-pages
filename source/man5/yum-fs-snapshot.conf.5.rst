.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-fs-snapshot.conf(5) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `OPTION <#OPTION>`__ \|           |                                   |
| `OPTION - [lvm] section           |                                   |
|  <#OPTION_-_%5Blvm%5D_section>`__ |                                   |
| \|                                |                                   |
| `OPTION - [lvm] section           |                                   |
|  <#OPTION_-_%5Blvm%5D_section>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-FS-SNAPSHOT.CONF(5)       File Formats       YUM-FS-SNAPSHOT.CONF(5)

NAME
-------------------------------------------------

::

          yum-fs-snapshot.conf(5)


---------------------------------------------------------

::

          yum-fs-snapshot.conf(5) is the configuration file for
          yum-fs-snapshot(1) Yum plugin for snapshotting your filesystems
          before running a yum transaction.  By default, this plugin will
          snapshot all filesystems that it is capable of snapshotting.
          This includes block-level snapshots using LVM snapshots.


---------------------------------------------------

::

          /etc/yum/pluginconf.d/fs-snapshot.conf


---------------------------------------------------------------

::

          yum-fs-snapshot.conf(5) utilizes configuration options in the
          form of

          OPTION=VALUE


-----------------------------------------------------

::

          exclude
                 This is a space delimited list of the mount points you do
                 not wish to have snapshotted by this plugin.

.. _option-top-1:


-----------------------------------------------------

::

          create_snapshots_in_post
                 This is a boolean value used to control whether snapshots
                 are also created after running the yum transaction.


-----------------------------------------------------------------------------------------

::

          enabled
                 This is a boolean value used to control whether LVM
                 snapshots will be created for filesystems built on LVM
                 logical volumes.

.. _option---lvm-section-top-1:


-----------------------------------------------------------------------------------------

::

          lvcreate_size_args
                 This is the space delimited lvcreate argument list that is
                 used to specify the size of the snapshot LV.  Valid
                 lvcreate size options are -l or -L.  If not specified then
                 LVM snapshots will not be created for volumes that are not
                 thinly provisioned.


-----------------------------------------------------

::

                 Josef Bacik <josef@toxicpanda.com>
                 Mike Snitzer <msnitzer@fedoraproject.org>


---------------------------------------------------------

::

          yum-fs-snapshot(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum-utils (Yum Package Manager
          utilities) project.  Information about the project can be found
          at ⟨https://github.com/rpm-software-management/yum⟩.  It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum-utils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-03-11.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                3 February 2010     YUM-FS-SNAPSHOT.CONF(5)

--------------

Pages that refer to this page:
`yum-fs-snapshot(1) <../man1/yum-fs-snapshot.1.html>`__, 
`yum-fs-snapshot.conf(5) <../man5/yum-fs-snapshot.conf.5.html>`__

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
