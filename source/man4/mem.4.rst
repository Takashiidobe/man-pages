.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mem(4) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MEM(4)                  Linux Programmer's Manual                 MEM(4)

NAME
-------------------------------------------------

::

          mem, kmem, port - system memory, kernel memory and system ports


---------------------------------------------------------------

::

          /dev/mem is a character device file that is an image of the main
          memory of the computer.  It may be used, for example, to examine
          (and even patch) the system.

          Byte addresses in /dev/mem are interpreted as physical memory
          addresses.  References to nonexistent locations cause errors to
          be returned.

          Examining and patching is likely to lead to unexpected results
          when read-only or write-only bits are present.

          Since Linux 2.6.26, and depending on the architecture, the
          CONFIG_STRICT_DEVMEM kernel configuration option limits the areas
          which can be accessed through this file.  For example: on x86,
          RAM access is not allowed but accessing memory-mapped PCI regions
          is.

          It is typically created by:

              mknod -m 660 /dev/mem c 1 1
              chown root:kmem /dev/mem

          The file /dev/kmem is the same as /dev/mem, except that the
          kernel virtual memory rather than physical memory is accessed.
          Since Linux 2.6.26, this file is available only if the
          CONFIG_DEVKMEM kernel configuration option is enabled.

          It is typically created by:

              mknod -m 640 /dev/kmem c 1 2
              chown root:kmem /dev/kmem

          /dev/port is similar to /dev/mem, but the I/O ports are accessed.

          It is typically created by:

              mknod -m 660 /dev/port c 1 4
              chown root:kmem /dev/port


---------------------------------------------------

::

          /dev/mem
          /dev/kmem
          /dev/port


---------------------------------------------------------

::

          chown(1), mknod(1), ioperm(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2015-01-02                         MEM(4)

--------------

`Copyright and license for this manual
page <../man4/mem.4.license.html>`__

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
