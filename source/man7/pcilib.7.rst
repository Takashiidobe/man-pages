.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcilib(7) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AC                               |                                   |
| CESS METHODS <#ACCESS_METHODS>`__ |                                   |
| \| `PARAMETERS <#PARAMETERS>`__   |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   pcilib(7)                   The PCI Utilities                  pcilib(7)

NAME
-------------------------------------------------

::

          pcilib - a library for accessing PCI devices


---------------------------------------------------------------

::

          The PCI library (also known as pcilib and libpci) is a portable
          library for accessing PCI devices and their configuration space.


---------------------------------------------------------------------

::

          The library supports a variety of methods to access the
          configuration space on different operating systems. By default,
          the first matching method in this list is used, but you can
          specify override the decision (see the -A switch of lspci).

          linux-sysfs
                 The /sys filesystem on Linux 2.6 and newer. The standard
                 header of the config space is available to all users, the
                 rest only to root. Supports extended configuration space,
                 PCI domains, VPD (from Linux 2.6.26), physical slots (also
                 since Linux 2.6.26) and information on attached kernel
                 drivers.

          linux-proc
                 The /proc/bus/pci interface supported by Linux 2.1 and
                 newer. The standard header of the config space is
                 available to all users, the rest only to root.

          intel-conf1
                 Direct hardware access via Intel configuration mechanism
                 1. Available on i386 and compatibles on Linux,
                 Solaris/x86, GNU Hurd, Windows, BeOS and Haiku. Requires
                 root privileges.

          intel-conf2
                 Direct hardware access via Intel configuration mechanism
                 2. Available on i386 and compatibles on Linux,
                 Solaris/x86, GNU Hurd, Windows, BeOS and Haiku. Requires
                 root privileges. Warning: This method is able to address
                 only the first 16 devices on any bus and it seems to be
                 very unreliable in many cases.

          fbsd-device
                 The /dev/pci device on FreeBSD. Requires root privileges.

          aix-device
                 Access method used on AIX. Requires root privileges.

          nbsd-libpci
                 The /dev/pci0 device on NetBSD accessed using the local
                 libpci library.

          obsd-device
                 The /dev/pci device on OpenBSD. Requires root privileges.

          dump   Read the contents of configuration registers from a file
                 specified in the dump.name parameter. The format
                 corresponds to the output of lspci -x.

          darwin Access method used on Mac OS X / Darwin. Must be run as
                 root and the system must have been booted with
                 debug=0x144.


-------------------------------------------------------------

::

          The library is controlled by several parameters. They should have
          sensible default values, but in case you want to do something
          unusual (or even something weird), you can override them (see the
          -O switch of lspci).

      Parameters of specific access methods
          dump.name
                 Name of the bus dump file to read from.

          fbsd.path
                 Path to the FreeBSD PCI device.

          nbsd.path
                 Path to the NetBSD PCI device.

          obsd.path
                 Path to the OpenBSD PCI device.

          proc.path
                 Path to the procfs bus tree.

          sysfs.path
                 Path to the sysfs device tree.

      Parameters for resolving of ID's via DNS
          net.domain
                 DNS domain containing the ID database.

          net.cache_name
                 Name of the file used for caching of resolved ID's.

      Parameters for resolving of ID's via UDEV's HWDB
          hwdb.disable
                 Disable use of HWDB if set to a non-zero value.


---------------------------------------------------------

::

          lspci(8), setpci(8), pci.ids(5), update-pciids(8)


-----------------------------------------------------

::

          The PCI Utilities are maintained by Martin Mares <mj@ucw.cz>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the pciutils (PCI utilities) project.
          Information about the project can be found at 
          ⟨http://mj.ucw.cz/sw/pciutils/⟩.  If you have a bug report for
          this manual page, send it to linux-pci@vger.kernel.org.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/pciutils/pciutils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-12-06.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   pciutils-3.6.4               25 January 2020                   pcilib(7)

--------------

Pages that refer to this page: `pci.ids(5) <../man5/pci.ids.5.html>`__, 
`lspci(8) <../man8/lspci.8.html>`__, 
`setpci(8) <../man8/setpci.8.html>`__

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
