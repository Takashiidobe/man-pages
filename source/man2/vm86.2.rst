.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vm86(2) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VM86(2)                 Linux Programmer's Manual                VM86(2)

NAME
-------------------------------------------------

::

          vm86old, vm86 - enter virtual 8086 mode


---------------------------------------------------------

::

          #include <sys/vm86.h>

          int vm86old(struct vm86_struct *info);
          int vm86(unsigned long fn, struct vm86plus_struct *v86);


---------------------------------------------------------------

::

          The system call vm86() was introduced in Linux 0.97p2.  In Linux
          2.1.15 and 2.0.28, it was renamed to vm86old(), and a new vm86()
          was introduced.  The definition of struct vm86_struct was changed
          in 1.1.8 and 1.1.9.

          These calls cause the process to enter VM86 mode (virtual-8086 in
          Intel literature), and are used by dosemu.

          VM86 mode is an emulation of real mode within a protected mode
          task.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT This return value is specific to i386 and indicates a
                 problem with getting user-space data.

          ENOSYS This return value indicates the call is not implemented on
                 the present architecture.

          EPERM  Saved kernel stack exists.  (This is a kernel sanity
                 check; the saved stack should exist only within vm86 mode
                 itself.)


-------------------------------------------------------------------

::

          This call is specific to Linux on 32-bit Intel processors, and
          should not be used in programs intended to be portable.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        VM86(2)

--------------

Pages that refer to this page:
`modify_ldt(2) <../man2/modify_ldt.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__

--------------

`Copyright and license for this manual
page <../man2/vm86.2.license.html>`__

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
