.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

raw(8) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RAW(8)                    System Administration                   RAW(8)

NAME
-------------------------------------------------

::

          raw - bind a Linux raw character device


---------------------------------------------------------

::

          raw /dev/raw/raw<N> <major> <minor>

          raw /dev/raw/raw<N> /dev/<blockdev>

          raw -q /dev/raw/raw<N>

          raw -qa


---------------------------------------------------------------

::

          raw is used to bind a Linux raw character device to a block
          device. Any block device may be used: at the time of binding, the
          device driver does not even have to be accessible (it may be
          loaded on demand as a kernel module later).

          raw is used in two modes: it either sets raw device bindings, or
          it queries existing bindings. When setting a raw device,
          /dev/raw/raw<N> is the device name of an existing raw device node
          in the filesystem. The block device to which it is to be bound
          can be specified either in terms of its major and minor device
          numbers, or as a path name /dev/<blockdev> to an existing block
          device file.

          The bindings already in existence can be queried with the -q
          option, which is used either with a raw device filename to query
          that one device, or with the -a option to query all bound raw
          devices.

          Unbinding can be done by specifying major and minor 0.

          Once bound to a block device, a raw device can be opened, read
          and written, just like the block device it is bound to. However,
          the raw device does not behave exactly like the block device. In
          particular, access to the raw device bypasses the kernel’s block
          buffer cache entirely: all I/O is done directly to and from the
          address space of the process performing the I/O. If the
          underlying block device driver can support DMA, then no data
          copying at all is required to complete the I/O.

          Because raw I/O involves direct hardware access to a process’s
          memory, a few extra restrictions must be observed. All I/Os must
          be correctly aligned in memory and on disk: they must start at a
          sector offset on disk, they must be an exact number of sectors
          long, and the data buffer in virtual memory must also be aligned
          to a multiple of the sector size. The sector size is 512 bytes
          for most devices.


-------------------------------------------------------

::

          -q, --query
              Set query mode. raw will query an existing binding instead of
              setting a new one.

          -a, --all
              With -q, specify that all bound raw devices should be
              queried.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------

::

          Rather than using raw devices applications should prefer open2
          devices, such as /dev/sda1, with the O_DIRECT flag.


-------------------------------------------------

::

          The Linux dd(1) command should be used without the bs= option, or
          the blocksize needs to be a multiple of the sector size of the
          device (512 bytes usually), otherwise it will fail with "Invalid
          Argument" messages (EINVAL).

          Raw I/O devices do not maintain cache coherency with the Linux
          block device buffer cache. If you use raw I/O to overwrite data
          already in the buffer cache, the buffer cache will no longer
          correspond to the contents of the actual storage device
          underneath. This is deliberate, but is regarded as either a bug
          or a feature, depending on who you ask!


-------------------------------------------------------

::

          Stephen Tweedie <sct@redhat.com>


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The raw command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                         RAW(8)

--------------

Pages that refer to this page: `open(2) <../man2/open.2.html>`__

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
