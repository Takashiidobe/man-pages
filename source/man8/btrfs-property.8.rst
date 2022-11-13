.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-property(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SUBCOMMAND <#SUBCOMMAND>`__ \|   |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-PROPERTY(8)             Btrfs Manual             BTRFS-PROPERTY(8)

NAME
-------------------------------------------------

::

          btrfs-property - get/set/list properties for given filesystem
          object


---------------------------------------------------------

::

          btrfs property <subcommand> <args>


---------------------------------------------------------------

::

          btrfs property is used to get/set/list property for given
          filesystem object. The object can be an inode (file or
          directory), subvolume or the whole filesystem. See the
          description of get subcommand for more information about both
          btrfs object and property.

          btrfs property provides an unified and user-friendly method to
          tune different btrfs properties instead of using the traditional
          method like chattr(1) or lsattr(1).


-------------------------------------------------------------

::

          get [-t <type>] <object> [<name>]
              get property from a btrfs <object> of given <type>

              A btrfs object, which is set by <object>, can be a btrfs
              filesystem itself, a btrfs subvolume, an inode (file or
              directory) inside btrfs, or a device on which a btrfs exists.

              The option -t can be used to explicitly specify what type of
              object you meant. This is only needed when a property could
              be set for more then one object type.

              Possible types are s[ubvol], f[ilesystem], i[node] and
              d[evice], where the first lettes is a shortcut.

              Set the name of property by name. If no name is specified,
              all properties for the given object are printed.  name is one
              of the following:

              ro
                  read-only flag of subvolume: true or false

              label
                  label of the filesystem. For an unmounted filesystem,
                  provide a path to a block device as object. For a mounted
                  filesystem, specify a mount point.

              compression
                  compression algorithm set for an inode, possible values:
                  lzo, zlib, zstd. To disable compression use "" (empty
                  string), no or none.

          list [-t <type>] <object>
              Lists available properties with their descriptions for the
              given object.

              See the description of get subcommand for the meaning of each
              option.

          set [-t <type>] <object> <name> <value>
              Sets a property on a btrfs object.

              See the description of get subcommand for the meaning of each
              option.


---------------------------------------------------------------

::

          btrfs property returns a zero exit status if it succeeds. Non
          zero is returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), lsattr(1), chattr(1)

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

   Btrfs v4.6.1                   05/16/2020              BTRFS-PROPERTY(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__

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
