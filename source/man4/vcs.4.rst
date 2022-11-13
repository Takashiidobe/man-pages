.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vcs(4) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VCS(4)                  Linux Programmer's Manual                 VCS(4)

NAME
-------------------------------------------------

::

          vcs, vcsa - virtual console memory


---------------------------------------------------------------

::

          /dev/vcs0 is a character device with major number 7 and minor
          number 0, usually with mode 0644 and ownership root:tty.  It
          refers to the memory of the currently displayed virtual console
          terminal.

          /dev/vcs[1-63] are character devices for virtual console
          terminals, they have major number 7 and minor number 1 to 63,
          usually mode 0644 and ownership root:tty.  /dev/vcsa[0-63] are
          the same, but using unsigned shorts (in host byte order) that
          include attributes, and prefixed with four bytes giving the
          screen dimensions and cursor position: lines, columns, x, y.  (x
          = y = 0 at the top left corner of the screen.)

          When a 512-character font is loaded, the 9th bit position can be
          fetched by applying the ioctl(2) VT_GETHIFONTMASK operation
          (available in Linux kernels 2.6.18 and above) on /dev/tty[1-63];
          the value is returned in the unsigned short pointed to by the
          third ioctl(2) argument.

          These devices replace the screendump ioctl(2) operations of
          ioctl_console(2), so the system administrator can control access
          using filesystem permissions.

          The devices for the first eight virtual consoles may be created
          by:

              for x in 0 1 2 3 4 5 6 7 8; do
                  mknod -m 644 /dev/vcs$x c 7 $x;
                  mknod -m 644 /dev/vcsa$x c 7 $[$x+128];
              done
              chown root:tty /dev/vcs*

          No ioctl(2) requests are supported.


---------------------------------------------------

::

          /dev/vcs[0-63]
          /dev/vcsa[0-63]


---------------------------------------------------------

::

          Introduced with version 1.1.92 of the Linux kernel.


---------------------------------------------------------

::

          You may do a screendump on vt3 by switching to vt1 and typing

              cat /dev/vcs3 >foo

          Note that the output does not contain newline characters, so some
          processing may be required, like in

              fold -w 81 /dev/vcs3 | lpr

          or (horrors)

              setterm -dump 3 -file /proc/self/fd/1

          The /dev/vcsa0 device is used for Braille support.

          This program displays the character and screen attributes under
          the cursor of the second virtual console, then changes the
          background color there:

          #include <unistd.h>
          #include <stdlib.h>
          #include <stdio.h>
          #include <fcntl.h>
          #include <sys/ioctl.h>
          #include <linux/vt.h>

          int
          main(void)
          {
              int fd;
              char *device = "/dev/vcsa2";
              char *console = "/dev/tty2";
              struct {unsigned char lines, cols, x, y;} scrn;
              unsigned short s;
              unsigned short mask;
              unsigned char attrib;
              int ch;

              fd = open(console, O_RDWR);
              if (fd < 0) {
                  perror(console);
                  exit(EXIT_FAILURE);
              }
              if (ioctl(fd, VT_GETHIFONTMASK, &mask) < 0) {
                  perror("VT_GETHIFONTMASK");
                  exit(EXIT_FAILURE);
              }
              (void) close(fd);
              fd = open(device, O_RDWR);
              if (fd < 0) {
                  perror(device);
                  exit(EXIT_FAILURE);
              }
              (void) read(fd, &scrn, 4);
              (void) lseek(fd, 4 + 2*(scrn.y*scrn.cols + scrn.x), SEEK_SET);
              (void) read(fd, &s, 2);
              ch = s & 0xff;
              if (s & mask)
                  ch |= 0x100;
              attrib = ((s & ~mask) >> 8);
              printf("ch=%#03x attrib=%#02x\n", ch, attrib);
              s ^= 0x1000;
              (void) lseek(fd, -2, SEEK_CUR);
              (void) write(fd, &s, 2);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          ioctl_console(2), tty(4), ttyS(4), gpm(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-11-01                         VCS(4)

--------------

Pages that refer to this page:
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`tty(4) <../man4/tty.4.html>`__

--------------

`Copyright and license for this manual
page <../man4/vcs.4.license.html>`__

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
