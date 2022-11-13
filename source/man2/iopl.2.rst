.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iopl(2) — Linux manual page
===========================

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

   IOPL(2)                 Linux Programmer's Manual                IOPL(2)

NAME
-------------------------------------------------

::

          iopl - change I/O privilege level


---------------------------------------------------------

::

          #include <sys/io.h>

          int iopl(int level);


---------------------------------------------------------------

::

          iopl() changes the I/O privilege level of the calling thread, as
          specified by the two least significant bits in level.

          The I/O privilege level for a normal thread is 0.  Permissions
          are inherited from parents to children.

          This call is deprecated, is significantly slower than ioperm(2),
          and is only provided for older X servers which require access to
          all 65536 I/O ports.  It is mostly for the i386 architecture.  On
          many other architectures it does not exist or will always return
          an error.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL level is greater than 3.

          ENOSYS This call is unimplemented.

          EPERM  The calling thread has insufficient privilege to call
                 iopl(); the CAP_SYS_RAWIO capability is required to raise
                 the I/O privilege level above its current value.


-------------------------------------------------------------------

::

          iopl() is Linux-specific and should not be used in programs that
          are intended to be portable.


---------------------------------------------------

::

          Glibc2 has a prototype both in <sys/io.h> and in <sys/perm.h>.
          Avoid the latter, it is available on i386 only.

          Prior to Linux 5.5 iopl() allowed the thread to disable
          interrupts while running at a higher I/O privilege level.  This
          will probably crash the system, and is not recommended.

          Prior to Linux 3.7, on some architectures (such as i386),
          permissions were inherited by the child produced by fork(2) and
          were preserved across execve(2).  This behavior was inadvertently
          changed in Linux 3.7, and won't be reinstated.


---------------------------------------------------------

::

          ioperm(2), outb(2), capabilities(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        IOPL(2)

--------------

Pages that refer to this page: `ioperm(2) <../man2/ioperm.2.html>`__, 
`outb(2) <../man2/outb.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/iopl.2.license.html>`__

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
