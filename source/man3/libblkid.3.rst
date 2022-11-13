.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libblkid(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBBLKID(3)                Programmer's Manual               LIBBLKID(3)

NAME
-------------------------------------------------

::

          libblkid - block device identification library


---------------------------------------------------------

::

          #include <blkid.h>

          cc file.c -lblkid


---------------------------------------------------------------

::

          The libblkid library is used to identify block devices (disks) as
          to their content (e.g., filesystem type) as well as extracting
          additional information such as filesystem labels/volume names,
          unique identifiers/serial numbers. A common use is to allow use
          of LABEL= and UUID= tags instead of hard-coding specific block
          device names into configuration files.

          The low-level part of the library also allows the extraction of
          information about partitions and block device topology.

          The high-level part of the library keeps information about block
          devices in a cache file and is verified to still be valid before
          being returned to the user (if the user has read permission on
          the raw block device, otherwise not). The cache file also allows
          unprivileged users (normally anyone other than root, or those not
          in the "disk" group) to locate devices by label/id. The standard
          location of the cache file can be overridden by the environment
          variable BLKID_FILE.

          In situations where one is getting information about a single
          known device, it does not impact performance whether the cache is
          used or not (unless you are not able to read the block device
          directly).

          The high-level part of the library supports two methods to
          evaluate LABEL/UUID. It reads information directly from a block
          device or read information from /dev/disk/by-* udev symlinks. The
          udev is preferred method by default.

          If you are dealing with multiple devices, use of the cache is
          highly recommended (even if empty) as devices will be scanned at
          most one time and the on-disk cache will be updated if possible.

          In some cases (modular kernels), block devices are not even
          visible until after they are accessed the first time, so it is
          critical that there is some way to locate these devices without
          enumerating only visible devices, so the use of the cache file is
          required in this situation.


-----------------------------------------------------------------------------

::

          The standard location of the /etc/blkid.conf config file can be
          overridden by the environment variable BLKID_CONF. For more
          details about the config file see blkid(8) man page.


-------------------------------------------------------

::

          libblkid was written by Andreas Dilger for the ext2 filesystem
          utilities, with input from Ted Ts’o. The library was subsequently
          heavily modified by Ted Ts’o.

          The low-level probing code was rewritten by Karel Zak.


-------------------------------------------------------

::

          libblkid is available under the terms of the GNU Library General
          Public License (LGPL), version 2 (or at your discretion any later
          version).


---------------------------------------------------------

::

          blkid(8), findfs(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The libblkid library is part of the util-linux package since
          version 2.15. It can be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-06-17                    LIBBLKID(3)

--------------

Pages that refer to this page:
`open_by_handle_at(2) <../man2/open_by_handle_at.2.html>`__, 
`blkid(8) <../man8/blkid.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`wipefs(8) <../man8/wipefs.8.html>`__

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
