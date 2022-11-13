.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pts(4) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTS(4)                  Linux Programmer's Manual                 PTS(4)

NAME
-------------------------------------------------

::

          ptmx, pts - pseudoterminal master and slave


---------------------------------------------------------------

::

          The file /dev/ptmx (the pseudoterminal multiplexor device) is a
          character file with major number 5 and minor number 2, usually
          with mode 0666 and ownership root:root.  It is used to create a
          pseudoterminal master and slave pair.

          When a process opens /dev/ptmx, it gets a file descriptor for a
          pseudoterminal master and a pseudoterminal slave device is
          created in the /dev/pts directory.  Each file descriptor obtained
          by opening /dev/ptmx is an independent pseudoterminal master with
          its own associated slave, whose path can be found by passing the
          file descriptor to ptsname(3).

          Before opening the pseudoterminal slave, you must pass the
          master's file descriptor to grantpt(3) and unlockpt(3).

          Once both the pseudoterminal master and slave are open, the slave
          provides processes with an interface that is identical to that of
          a real terminal.

          Data written to the slave is presented on the master file
          descriptor as input.  Data written to the master is presented to
          the slave as input.

          In practice, pseudoterminals are used for implementing terminal
          emulators such as xterm(1), in which data read from the
          pseudoterminal master is interpreted by the application in the
          same way a real terminal would interpret the data, and for
          implementing remote-login programs such as sshd(8), in which data
          read from the pseudoterminal master is sent across the network to
          a client program that is connected to a terminal or terminal
          emulator.

          Pseudoterminals can also be used to send input to programs that
          normally refuse to read input from pipes (such as su(1), and
          passwd(1)).


---------------------------------------------------

::

          /dev/ptmx, /dev/pts/*


---------------------------------------------------

::

          The Linux support for the above (known as UNIX 98 pseudoterminal
          naming) is done using the devpts filesystem, which should be
          mounted on /dev/pts.


---------------------------------------------------------

::

          getpt(3), grantpt(3), ptsname(3), unlockpt(3), pty(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13                         PTS(4)

--------------

Pages that refer to this page: `getpt(3) <../man3/getpt.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`ttyname(3) <../man3/ttyname.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `pty(7) <../man7/pty.7.html>`__

--------------

`Copyright and license for this manual
page <../man4/pts.4.license.html>`__

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
