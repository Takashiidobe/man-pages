.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioperm(2) — Linux manual page
=============================

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

   IOPERM(2)               Linux Programmer's Manual              IOPERM(2)

NAME
-------------------------------------------------

::

          ioperm - set port input/output permissions


---------------------------------------------------------

::

          #include <sys/io.h>

          int ioperm(unsigned long from, unsigned long num, int turn_on);


---------------------------------------------------------------

::

          ioperm() sets the port access permission bits for the calling
          thread for num bits starting from port address from.  If turn_on
          is nonzero, then permission for the specified bits is enabled;
          otherwise it is disabled.  If turn_on is nonzero, the calling
          thread must be privileged (CAP_SYS_RAWIO).

          Before Linux 2.6.8, only the first 0x3ff I/O ports could be
          specified in this manner.  For more ports, the iopl(2) system
          call had to be used (with a level argument of 3).  Since Linux
          2.6.8, 65,536 I/O ports can be specified.

          Permissions are inherited by the child created by fork(2) (but
          see NOTES).  Permissions are preserved across execve(2); this is
          useful for giving port access permissions to unprivileged
          programs.

          This call is mostly for the i386 architecture.  On many other
          architectures it does not exist or will always return an error.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL Invalid values for from or num.

          EIO    (on PowerPC) This call is not supported.

          ENOMEM Out of memory.

          EPERM  The calling thread has insufficient privilege.


-------------------------------------------------------------------

::

          ioperm() is Linux-specific and should not be used in programs
          intended to be portable.


---------------------------------------------------

::

          The /proc/ioports file shows the I/O ports that are currently
          allocated on the system.

          Before Linux 2.4, permissions were not inherited by a child
          created by fork(2).

          Glibc has an ioperm() prototype both in <sys/io.h> and in
          <sys/perm.h>.  Avoid the latter, it is available on i386 only.


---------------------------------------------------------

::

          iopl(2), outb(2), capabilities(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      IOPERM(2)

--------------

Pages that refer to this page: `fork(2) <../man2/fork.2.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`iopl(2) <../man2/iopl.2.html>`__,  `outb(2) <../man2/outb.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`mem(4) <../man4/mem.4.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioperm.2.license.html>`__

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
