.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ttyS(4) — Linux manual page
===========================

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

   TTYS(4)                 Linux Programmer's Manual                TTYS(4)

NAME
-------------------------------------------------

::

          ttyS - serial terminal lines


---------------------------------------------------------------

::

          ttyS[0-3] are character devices for the serial terminal lines.

          They are typically created by:

              mknod -m 660 /dev/ttyS0 c 4 64 # base address 0x3f8
              mknod -m 660 /dev/ttyS1 c 4 65 # base address 0x2f8
              mknod -m 660 /dev/ttyS2 c 4 66 # base address 0x3e8
              mknod -m 660 /dev/ttyS3 c 4 67 # base address 0x2e8
              chown root:tty /dev/ttyS[0-3]


---------------------------------------------------

::

          /dev/ttyS[0-3]


---------------------------------------------------------

::

          chown(1), mknod(1), tty(4), agetty(8), mingetty(8), setserial(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          1992-12-19                        TTYS(4)

--------------

Pages that refer to this page:
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`mouse(4) <../man4/mouse.4.html>`__,  `tty(4) <../man4/tty.4.html>`__, 
`vcs(4) <../man4/vcs.4.html>`__, 
`ldattach(8) <../man8/ldattach.8.html>`__

--------------

`Copyright and license for this manual
page <../man4/ttyS.4.license.html>`__

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
