.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysfs(5) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSFS(5)                Linux Programmer's Manual               SYSFS(5)

NAME
-------------------------------------------------

::

          sysfs - a filesystem for exporting kernel objects


---------------------------------------------------------------

::

          The sysfs filesystem is a pseudo-filesystem which provides an
          interface to kernel data structures.  (More precisely, the files
          and directories in sysfs provide a view of the kobject structures
          defined internally within the kernel.)  The files under sysfs
          provide information about devices, kernel modules, filesystems,
          and other kernel components.

          The sysfs filesystem is commonly mounted at /sys.  Typically, it
          is mounted automatically by the system, but it can also be
          mounted manually using a command such as:

              mount -t sysfs sysfs /sys

          Many of the files in the sysfs filesystem are read-only, but some
          files are writable, allowing kernel variables to be changed.  To
          avoid redundancy, symbolic links are heavily used to connect
          entries across the filesystem tree.

      Files and directories
          The following list describes some of the files and directories
          under the /sys hierarchy.

          /sys/block
                 This subdirectory contains one symbolic link for each
                 block device that has been discovered on the system.  The
                 symbolic links point to corresponding directories under
                 /sys/devices.

          /sys/bus
                 This directory contains one subdirectory for each of the
                 bus types in the kernel.  Inside each of these directories
                 are two subdirectories:

                 devices
                        This subdirectory contains symbolic links to
                        entries in /sys/devices that correspond to the
                        devices discovered on this bus.

                 drivers
                        This subdirectory contains one subdirectory for
                        each device driver that is loaded on this bus.

          /sys/class
                 This subdirectory contains a single layer of further
                 subdirectories for each of the device classes that have
                 been registered on the system (e.g., terminals, network
                 devices, block devices, graphics devices, sound devices,
                 and so on).  Inside each of these subdirectories are
                 symbolic links for each of the devices in this class.
                 These symbolic links refer to entries in the /sys/devices
                 directory.

          /sys/class/net
                 Each of the entries in this directory is a symbolic link
                 representing one of the real or virtual networking devices
                 that are visible in the network namespace of the process
                 that is accessing the directory.  Each of these symbolic
                 links refers to entries in the /sys/devices directory.

          /sys/dev
                 This directory contains two subdirectories block/ and
                 char/, corresponding, respectively, to the block and
                 character devices on the system.  Inside each of these
                 subdirectories are symbolic links with names of the form
                 major-ID:minor-ID, where the ID values correspond to the
                 major and minor ID of a specific device.  Each symbolic
                 link points to the sysfs directory for a device.  The
                 symbolic links inside /sys/dev thus provide an easy way to
                 look up the sysfs interface using the device IDs returned
                 by a call to stat(2) (or similar).

                 The following shell session shows an example from
                 /sys/dev:

                     $ stat -c "%t %T" /dev/null
                     1 3
                     $ readlink /sys/dev/char/1\:3
                     ../../devices/virtual/mem/null
                     $ ls -Fd /sys/devices/virtual/mem/null
                     /sys/devices/virtual/mem/null/
                     $ ls -d1 /sys/devices/virtual/mem/null/*
                     /sys/devices/virtual/mem/null/dev
                     /sys/devices/virtual/mem/null/power/
                     /sys/devices/virtual/mem/null/subsystem@
                     /sys/devices/virtual/mem/null/uevent

          /sys/devices
                 This is a directory that contains a filesystem
                 representation of the kernel device tree, which is a
                 hierarchy of device structures within the kernel.

          /sys/firmware
                 This subdirectory contains interfaces for viewing and
                 manipulating firmware-specific objects and attributes.

          /sys/fs
                 This directory contains subdirectories for some
                 filesystems.  A filesystem will have a subdirectory here
                 only if it chose to explicitly create the subdirectory.

          /sys/fs/cgroup
                 This directory conventionally is used as a mount point for
                 a tmpfs(5) filesystem containing mount points for
                 cgroups(7) filesystems.

          /sys/fs/smackfs
                 The directory contains configuration files for the SMACK
                 LSM.  See the kernel source file
                 Documentation/admin-guide/LSM/Smack.rst.

          /sys/hypervisor
                 [To be documented]

          /sys/kernel
                 This subdirectory contains various files and
                 subdirectories that provide information about the running
                 kernel.

          /sys/kernel/cgroup/
                 For information about the files in this directory, see
                 cgroups(7).

          /sys/kernel/debug/tracing
                 Mount point for the tracefs filesystem used by the
                 kernel's ftrace facility.  (For information on ftrace, see
                 the kernel source file Documentation/trace/ftrace.txt.)

          /sys/kernel/mm
                 This subdirectory contains various files and
                 subdirectories that provide information about the kernel's
                 memory management subsystem.

          /sys/kernel/mm/hugepages
                 This subdirectory contains one subdirectory for each of
                 the huge page sizes that the system supports.  The
                 subdirectory name indicates the huge page size (e.g.,
                 hugepages-2048kB).  Within each of these subdirectories is
                 a set of files that can be used to view and (in some
                 cases) change settings associated with that huge page
                 size.  For further information, see the kernel source file
                 Documentation/admin-guide/mm/hugetlbpage.rst.

          /sys/module
                 This subdirectory contains one subdirectory for each
                 module that is loaded into the kernel.  The name of each
                 directory is the name of the module.  In each of the
                 subdirectories, there may be following files:

                 coresize
                        [to be documented]

                 initsize
                        [to be documented]

                 initstate
                        [to be documented]

                 refcnt [to be documented]

                 srcversion
                        [to be documented]

                 taint  [to be documented]

                 uevent [to be documented]

                 version
                        [to be documented]

                 In each of the subdirectories, there may be following
                 subdirectories:

                 drivers
                        [To be documented]

                 holders
                        [To be documented]

                 notes  [To be documented]

                 parameters
                        This directory contains one file for each module
                        parameter, with each file containing the value of
                        the corresponding parameter.  Some of these files
                        are writable, allowing the

                 sections
                        This subdirectories contains files with information
                        about module sections.  This information is mainly
                        used for debugging.

                 [To be documented]

          /sys/power
                 [To be documented]


---------------------------------------------------------

::

          The sysfs filesystem first appeared in Linux 2.6.0.


-------------------------------------------------------------------

::

          The sysfs filesystem is Linux-specific.


---------------------------------------------------

::

          This manual page is incomplete, possibly inaccurate, and is the
          kind of thing that needs to be updated very often.


---------------------------------------------------------

::

          proc(5), udev(7)

          P. Mochel. (2005).  The sysfs filesystem.  Proceedings of the
          2005 Ottawa Linux Symposium.

          The kernel source file Documentation/filesystems/sysfs.txt and
          various other files in Documentation/ABI and
          Documentation/*/sysfs.txt

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       SYSFS(5)

--------------

Pages that refer to this page: `sysfs(2) <../man2/sysfs.2.html>`__, 
`filesystems(5) <../man5/filesystems.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`network_namespaces(7) <../man7/network_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man5/sysfs.5.license.html>`__

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
