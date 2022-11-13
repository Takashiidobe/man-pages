.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pciconfig_read(2) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCICONFIG_READ(2)       Linux Programmer's Manual      PCICONFIG_READ(2)

NAME
-------------------------------------------------

::

          pciconfig_read, pciconfig_write, pciconfig_iobase - pci device
          information handling


---------------------------------------------------------

::

          #include <pci.h>

          int pciconfig_read(unsigned long bus, unsigned long dfn,
                             unsigned long off, unsigned long len,
                             unsigned char *buf);
          int pciconfig_write(unsigned long bus, unsigned long dfn,
                             unsigned long off, unsigned long len,
                             unsigned char *buf);
          int pciconfig_iobase(int which, unsigned long bus,
                             unsigned long devfn);


---------------------------------------------------------------

::

          Most of the interaction with PCI devices is already handled by
          the kernel PCI layer, and thus these calls should not normally
          need to be accessed from user space.

          pciconfig_read()
                 Reads to buf from device dev at offset off value.

          pciconfig_write()
                 Writes from buf to device dev at offset off value.

          pciconfig_iobase()
                 You pass it a bus/devfn pair and get a physical address
                 for either the memory offset (for things like prep, this
                 is 0xc0000000), the IO base for PIO cycles, or the ISA
                 holes if any.


-----------------------------------------------------------------

::

          pciconfig_read()
                 On success, zero is returned.  On error, -1 is returned
                 and errno is set to indicate the error.

          pciconfig_write()
                 On success, zero is returned.  On error, -1 is returned
                 and errno is set to indicate the error.

          pciconfig_iobase()
                 Returns information on locations of various I/O regions in
                 physical memory according to the which value.  Values for
                 which are: IOBASE_BRIDGE_NUMBER, IOBASE_MEMORY, IOBASE_IO,
                 IOBASE_ISA_IO, IOBASE_ISA_MEM.


-----------------------------------------------------

::

          EINVAL len value is invalid.  This does not apply to
                 pciconfig_iobase().

          EIO    I/O error.

          ENODEV For pciconfig_iobase(), "hose" value is NULL.  For the
                 other calls, could not find a slot.

          ENOSYS The system has not implemented these calls (CONFIG_PCI not
                 defined).

          EOPNOTSUPP
                 This return value is valid only for pciconfig_iobase().
                 It is returned if the value for which is invalid.

          EPERM  User does not have the CAP_SYS_ADMIN capability.  This
                 does not apply to pciconfig_iobase().


-------------------------------------------------------------------

::

          These calls are Linux-specific, available since Linux
          2.0.26/2.1.11.


---------------------------------------------------------

::

          capabilities(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22              PCICONFIG_READ(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/pciconfig_read.2.license.html>`__

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
