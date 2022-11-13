.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IOCTL(2)                Linux Programmer's Manual               IOCTL(2)

NAME
-------------------------------------------------

::

          ioctl - control device


---------------------------------------------------------

::

          #include <sys/ioctl.h>

          int ioctl(int fd, unsigned long request, ...);


---------------------------------------------------------------

::

          The ioctl() system call manipulates the underlying device
          parameters of special files.  In particular, many operating
          characteristics of character special files (e.g., terminals) may
          be controlled with ioctl() requests.  The argument fd must be an
          open file descriptor.

          The second argument is a device-dependent request code.  The
          third argument is an untyped pointer to memory.  It's
          traditionally char *argp (from the days before void * was valid
          C), and will be so named for this discussion.

          An ioctl() request has encoded in it whether the argument is an
          in parameter or out parameter, and the size of the argument argp
          in bytes.  Macros and defines used in specifying an ioctl()
          request are located in the file <sys/ioctl.h>.  See NOTES.


-----------------------------------------------------------------

::

          Usually, on success zero is returned.  A few ioctl() requests use
          the return value as an output parameter and return a nonnegative
          value on success.  On error, -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not a valid file descriptor.

          EFAULT argp references an inaccessible memory area.

          EINVAL request or argp is not valid.

          ENOTTY fd is not associated with a character special device.

          ENOTTY The specified request does not apply to the kind of object
                 that the file descriptor fd references.


-------------------------------------------------------------------

::

          No single standard.  Arguments, returns, and semantics of ioctl()
          vary according to the device driver in question (the call is used
          as a catch-all for operations that don't cleanly fit the UNIX
          stream I/O model).

          The ioctl() system call appeared in Version 7 AT&T UNIX.


---------------------------------------------------

::

          In order to use this call, one needs an open file descriptor.
          Often the open(2) call has unwanted side effects, that can be
          avoided under Linux by giving it the O_NONBLOCK flag.

      ioctl structure
          Ioctl command values are 32-bit constants.  In principle these
          constants are completely arbitrary, but people have tried to
          build some structure into them.

          The old Linux situation was that of mostly 16-bit constants,
          where the last byte is a serial number, and the preceding byte(s)
          give a type indicating the driver.  Sometimes the major number
          was used: 0x03 for the HDIO_* ioctls, 0x06 for the LP* ioctls.
          And sometimes one or more ASCII letters were used.  For example,
          TCGETS has value 0x00005401, with 0x54 = 'T' indicating the
          terminal driver, and CYGETTIMEOUT has value 0x00435906, with 0x43
          0x59 = 'C' 'Y' indicating the cyclades driver.

          Later (0.98p5) some more information was built into the number.
          One has 2 direction bits (00: none, 01: write, 10: read, 11:
          read/write) followed by 14 size bits (giving the size of the
          argument), followed by an 8-bit type (collecting the ioctls in
          groups for a common purpose or a common driver), and an 8-bit
          serial number.

          The macros describing this structure live in <asm/ioctl.h> and
          are _IO(type,nr) and {_IOR,_IOW,_IOWR}(type,nr,size).  They use
          sizeof(size) so that size is a misnomer here: this third argument
          is a data type.

          Note that the size bits are very unreliable: in lots of cases
          they are wrong, either because of buggy macros using
          sizeof(sizeof(struct)), or because of legacy values.

          Thus, it seems that the new structure only gave disadvantages: it
          does not help in checking, but it causes varying values for the
          various architectures.


---------------------------------------------------------

::

          execve(2), fcntl(2), ioctl_console(2), ioctl_fat(2),
          ioctl_ficlonerange(2), ioctl_fideduperange(2), ioctl_fslabel(2),
          ioctl_getfsmap(2), ioctl_iflags(2), ioctl_ns(2), ioctl_tty(2),
          ioctl_userfaultfd(2), open(2), sd(4), tty(4)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       IOCTL(2)

--------------

Pages that refer to this page: `apropos(1) <../man1/apropos.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`whatis(1) <../man1/whatis.1.html>`__, 
`getsockopt(2) <../man2/getsockopt.2.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`ioctl_fat(2) <../man2/ioctl_fat.2.html>`__, 
`ioctl_ficlonerange(2) <../man2/ioctl_ficlonerange.2.html>`__, 
`ioctl_fideduperange(2) <../man2/ioctl_fideduperange.2.html>`__, 
`ioctl_fslabel(2) <../man2/ioctl_fslabel.2.html>`__, 
`ioctl_getfsmap(2) <../man2/ioctl_getfsmap.2.html>`__, 
`ioctl_iflags(2) <../man2/ioctl_iflags.2.html>`__, 
`ioctl_ns(2) <../man2/ioctl_ns.2.html>`__, 
`ioctl_tty(2) <../man2/ioctl_tty.2.html>`__, 
`ioctl_userfaultfd(2) <../man2/ioctl_userfaultfd.2.html>`__, 
`ioctl_xfs_ag_geometry(2) <../man2/ioctl_xfs_ag_geometry.2.html>`__, 
`ioctl_xfs_bulkstat(2) <../man2/ioctl_xfs_bulkstat.2.html>`__, 
`ioctl_xfs_fsbulkstat(2) <../man2/ioctl_xfs_fsbulkstat.2.html>`__, 
`ioctl_xfs_fscounts(2) <../man2/ioctl_xfs_fscounts.2.html>`__, 
`ioctl_xfs_fsgeometry(2) <../man2/ioctl_xfs_fsgeometry.2.html>`__, 
`ioctl_xfs_fsgetxattr(2) <../man2/ioctl_xfs_fsgetxattr.2.html>`__, 
`ioctl_xfs_fsinumbers(2) <../man2/ioctl_xfs_fsinumbers.2.html>`__, 
`ioctl_xfs_getbmapx(2) <../man2/ioctl_xfs_getbmapx.2.html>`__, 
`ioctl_xfs_getresblks(2) <../man2/ioctl_xfs_getresblks.2.html>`__, 
`ioctl_xfs_goingdown(2) <../man2/ioctl_xfs_goingdown.2.html>`__, 
`ioctl_xfs_inumbers(2) <../man2/ioctl_xfs_inumbers.2.html>`__, 
`ioctl_xfs_scrub_metadata(2) <../man2/ioctl_xfs_scrub_metadata.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`perf_event_open(2) <../man2/perf_event_open.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`userfaultfd(2) <../man2/userfaultfd.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`errno(3) <../man3/errno.3.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`if_nametoindex(3) <../man3/if_nametoindex.3.html>`__, 
`openpty(3) <../man3/openpty.3.html>`__, 
`dsp56k(4) <../man4/dsp56k.4.html>`__,  `fd(4) <../man4/fd.4.html>`__, 
`loop(4) <../man4/loop.4.html>`__,  `lp(4) <../man4/lp.4.html>`__, 
`random(4) <../man4/random.4.html>`__, 
`rtc(4) <../man4/rtc.4.html>`__,  `sd(4) <../man4/sd.4.html>`__, 
`smartpqi(4) <../man4/smartpqi.4.html>`__, 
`st(4) <../man4/st.4.html>`__,  `tty(4) <../man4/tty.4.html>`__, 
`vcs(4) <../man4/vcs.4.html>`__,  `arp(7) <../man7/arp.7.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__,  `pty(7) <../man7/pty.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`tcp(7) <../man7/tcp.7.html>`__, 
`termio(7) <../man7/termio.7.html>`__, 
`udp(7) <../man7/udp.7.html>`__,  `unix(7) <../man7/unix.7.html>`__, 
`systemd-makefs@.service(8) <../man8/systemd-makefs@.service.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioctl.2.license.html>`__

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
