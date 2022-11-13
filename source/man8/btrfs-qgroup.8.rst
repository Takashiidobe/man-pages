.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-qgroup(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `QGROUP <#QGROUP>`__ \|           |                                   |
| `SUBCOMMAND <#SUBCOMMAND>`__ \|   |                                   |
| `QUOTA RESCAN <#QUOTA_RESCAN>`__  |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-QGROUP(8)               Btrfs Manual               BTRFS-QGROUP(8)

NAME
-------------------------------------------------

::

          btrfs-qgroup - control the quota group of a btrfs filesystem


---------------------------------------------------------

::

          btrfs qgroup <subcommand> <args>


---------------------------------------------------------------

::

          btrfs qgroup is used to control quota group (qgroup) of a btrfs
          filesystem.

              Note
              To use qgroup you need to enable quota first using btrfs
              quota enable command.

              Warning
              Qgroup is not stable yet and will impact performance in
              current mainline kernel (v4.14).


-----------------------------------------------------

::

          Quota groups or qgroup in btrfs make a tree hierarchy, the leaf
          qgroups are attached to subvolumes. The size limits are set per
          qgroup and apply when any limit is reached in tree that contains
          a given subvolume.

          The limits are separated between shared and exclusive and reflect
          the extent ownership. For example a fresh snapshot shares almost
          all the blocks with the original subvolume, new writes to either
          subvolume will raise towards the exclusive limit.

          The qgroup identifiers conform to level/id where level 0 is
          reserved to the qgroups associated with subvolumes. Such qgroups
          are created automatically.

          The qgroup hierarchy is built by commands create and assign.

              Note
              If the qgroup of a subvolume is destroyed, quota about the
              subvolume will not be functional until qgroup 0/<subvolume
              id> is created again.


-------------------------------------------------------------

::

          assign [options] <src> <dst> <path>
              Assign qgroup <src> as the child qgroup of <dst> in the btrfs
              filesystem identified by <path>.

              Options

              --rescan
                  (default since: 4.19) Automatically schedule quota rescan
                  if the new qgroup assignment would lead to quota
                  inconsistency. See QUOTA RESCAN for more information.

              --no-rescan
                  Explicitly ask not to do a rescan, even if the assignment
                  will make the quotas inconsistent. This may be useful for
                  repeated calls where the rescan would add unnecessary
                  overhead.

          create <qgroupid> <path>
              Create a subvolume quota group.

              For the 0/<subvolume id> qgroup, a qgroup can be created even
              before the subvolume is created.

          destroy <qgroupid> <path>
              Destroy a qgroup.

              If a qgroup is not isolated, meaning it is a parent or child
              qgroup, then it can only be destroyed after the relationship
              is removed.

          limit [options] <size>|none [<qgroupid>] <path>
              Limit the size of a qgroup to <size> or no limit in the btrfs
              filesystem identified by <path>.

              If <qgroupid> is not given, qgroup of the subvolume
              identified by <path> is used if possible.

              Options

              -c
                  limit amount of data after compression. This is the
                  default, it is currently not possible to turn off this
                  option.

              -e
                  limit space exclusively assigned to this qgroup.

          remove <src> <dst> <path>
              Remove the relationship between child qgroup <src> and parent
              qgroup <dst> in the btrfs filesystem identified by <path>.

              Options

              --rescan
                  (default since: 4.19) Automatically schedule quota rescan
                  if the removed qgroup relation would lead to quota
                  inconsistency. See QUOTA RESCAN for more information.

              --no-rescan
                  Explicitly ask not to do a rescan, even if the removal
                  will make the quotas inconsistent. This may be useful for
                  repeated calls where the rescan would add unnecessary
                  overhead.

          show [options] <path>
              Show all qgroups in the btrfs filesystem identified by
              <path>.

              Options

              -p
                  print parent qgroup id.

              -c
                  print child qgroup id.

              -r
                  print limit of referenced size of qgroup.

              -e
                  print limit of exclusive size of qgroup.

              -F
                  list all qgroups which impact the given path(include
                  ancestral qgroups)

              -f
                  list all qgroups which impact the given path(exclude
                  ancestral qgroups)

              --raw
                  raw numbers in bytes, without the B suffix.

              --human-readable
                  print human friendly numbers, base 1024, this is the
                  default

              --iec
                  select the 1024 base for the following options, according
                  to the IEC standard.

              --si
                  select the 1000 base for the following options, according
                  to the SI standard.

              --kbytes
                  show sizes in KiB, or kB with --si.

              --mbytes
                  show sizes in MiB, or MB with --si.

              --gbytes
                  show sizes in GiB, or GB with --si.

              --tbytes
                  show sizes in TiB, or TB with --si.

              --sort=[+/-]<attr>[,[+/-]<attr>]...
                  list qgroups in order of <attr>.

                  <attr> can be one or more of
                  qgroupid,rfer,excl,max_rfer,max_excl.

                  Prefix '+' means ascending order and '-' means descending
                  order of <attr>. If no prefix is given, use ascending
                  order by default.

                  If multiple <attr>s is given, use comma to separate.

              --sync
                  To retrieve information after updating the state of
                  qgroups, force sync of the filesystem identified by
                  <path> before getting information.


-----------------------------------------------------------------

::

          The rescan reads all extent sharing metadata and updates the
          respective qgoups accordingly.

          The information consists of bytes owned exclusively (excl) or
          shared/referred to (rfer). There’s no explicit information about
          which extents are shared or owned exclusively. This means when
          qgroup relationship changes, extent owners change and qgroup
          numbers are no longer consistent unless we do a full rescan.

          However there are cases where we can avoid a full rescan, if a
          subvolume whose rfer number equals its excl number, which means
          all bytes are exclusively owned, then assigning/removing this
          subvolume only needs to add/subtract rfer number from its parent
          qgroup. This can speed up the rescan.


---------------------------------------------------------

::

          Example 1. Make a parent group that has two quota group children

          Given the following filesystem mounted at /mnt/my-vault

              Label: none  uuid: 60d2ab3b-941a-4f22-8d1a-315f329797b2
                     Total devices 1 FS bytes used 128.00KiB
                     devid    1 size 5.00GiB used 536.00MiB path /dev/vdb

          Enable quota and create subvolumes. Check subvolume ids.

              $ cd /mnt/my-vault
              $ btrfs quota enable .
              $ btrfs subvolume create a
              $ btrfs subvolume create b
              $ btrfs subvolume list .

              ID 261 gen 61 top level 5 path a
              ID 262 gen 62 top level 5 path b

          Create qgroup and set limit to 10MiB.

              $ btrfs qgroup create 1/100 .
              $ btrfs qgroup limit 10M 1/100 .
              $ btrfs qgroup assign 0/261 1/100 .
              $ btrfs qgroup assign 0/262 1/100 .

          And check qgroups.

              $ btrfs qgroup show .

              qgroupid         rfer         excl
              --------         ----         ----
              0/5          16.00KiB     16.00KiB
              0/261        16.00KiB     16.00KiB
              0/262        16.00KiB     16.00KiB
              1/100        32.00KiB     32.00KiB


---------------------------------------------------------------

::

          btrfs qgroup returns a zero exit status if it succeeds. Non zero
          is returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), btrfs-subvolume(8), btrfs-quota(8),

COLOPHON
---------------------------------------------------------

::

          This page is part of the btrfs-progs (btrfs filesystem tools)
          project.  Information about the project can be found at 
          ⟨https://btrfs.wiki.kernel.org/index.php/Btrfs_source_repositories⟩.
          If you have a bug report for this manual page, see
          ⟨https://btrfs.wiki.kernel.org/index.php/Problem_FAQ#How_do_I_report_bugs_and_issues.3F⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-30.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Btrfs v4.6.1                   10/25/2020                BTRFS-QGROUP(8)

--------------

Pages that refer to this page:
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__, 
`btrfs(8) <../man8/btrfs.8.html>`__, 
`btrfs-quota(8) <../man8/btrfs-quota.8.html>`__, 
`btrfs-subvolume(8) <../man8/btrfs-subvolume.8.html>`__

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
