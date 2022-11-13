.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cpuid(4) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CPUID(4)                Linux Programmer's Manual               CPUID(4)

NAME
-------------------------------------------------

::

          cpuid - x86 CPUID access device


---------------------------------------------------------------

::

          CPUID provides an interface for querying information about the
          x86 CPU.

          This device is accessed by lseek(2) or pread(2) to the
          appropriate CPUID level and reading in chunks of 16 bytes.  A
          larger read size means multiple reads of consecutive levels.

          The lower 32 bits of the file position is used as the incoming
          %eax, and the upper 32 bits of the file position as the incoming
          %ecx, the latter is intended for "counting" eax levels like
          eax=4.

          This driver uses /dev/cpu/CPUNUM/cpuid, where CPUNUM is the minor
          number, and on an SMP box will direct the access to CPU CPUNUM as
          listed in /proc/cpuinfo.

          This file is protected so that it can be read only by the user
          root, or members of the group root.


---------------------------------------------------

::

          The CPUID instruction can be directly executed by a program using
          inline assembler.  However this device allows convenient access
          to all CPUs without changing process affinity.

          Most of the information in cpuid is reported by the kernel in
          cooked form either in /proc/cpuinfo or through subdirectories in
          /sys/devices/system/cpu.  Direct CPUID access through this device
          should only be used in exceptional cases.

          The cpuid driver is not auto-loaded.  On modular kernels you
          might need to use the following command to load it explicitly
          before use:

              $ modprobe cpuid

          There is no support for CPUID functions that require additional
          input registers.

          Very old x86 CPUs don't support CPUID.


---------------------------------------------------------

::

          cpuid(1)

          Intel Corporation, Intel 64 and IA-32 Architectures Software
          Developer's Manual Volume 2A: Instruction Set Reference, A-M,
          3-180 CPUID reference.

          Intel Corporation, Intel Processor Identification and the CPUID
          Instruction, Application note 485.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-08-02                       CPUID(4)

--------------

`Copyright and license for this manual
page <../man4/cpuid.4.license.html>`__

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
