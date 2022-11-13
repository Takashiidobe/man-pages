.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tty(4) — Linux manual page
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

   TTY(4)                  Linux Programmer's Manual                 TTY(4)

NAME
-------------------------------------------------

::

          tty - controlling terminal


---------------------------------------------------------------

::

          The file /dev/tty is a character file with major number 5 and
          minor number 0, usually with mode 0666 and ownership root:tty.
          It is a synonym for the controlling terminal of a process, if
          any.

          In addition to the ioctl(2) requests supported by the device that
          tty refers to, the ioctl(2) request TIOCNOTTY is supported.

      TIOCNOTTY
          Detach the calling process from its controlling terminal.

          If the process is the session leader, then SIGHUP and SIGCONT
          signals are sent to the foreground process group and all
          processes in the current session lose their controlling tty.

          This ioctl(2) call works only on file descriptors connected to
          /dev/tty.  It is used by daemon processes when they are invoked
          by a user at a terminal.  The process attempts to open /dev/tty.
          If the open succeeds, it detaches itself from the terminal by
          using TIOCNOTTY, while if the open fails, it is obviously not
          attached to a terminal and does not need to detach itself.


---------------------------------------------------

::

          /dev/tty


---------------------------------------------------------

::

          chown(1), mknod(1), ioctl(2), ioctl_console(2), ioctl_tty(2),
          termios(3), ttyS(4), vcs(4), pty(7), agetty(8), mingetty(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-03-06                         TTY(4)

--------------

Pages that refer to this page: `setterm(1) <../man1/setterm.1.html>`__, 
`tset(1) <../man1/tset.1.html>`__, 
`ioctl(2) <../man2/ioctl.2.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`ttyS(4) <../man4/ttyS.4.html>`__,  `vcs(4) <../man4/vcs.4.html>`__, 
`pty(7) <../man7/pty.7.html>`__, 
`termio(7) <../man7/termio.7.html>`__, 
`pam_selinux(8) <../man8/pam_selinux.8.html>`__

--------------

`Copyright and license for this manual
page <../man4/tty.4.license.html>`__

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
