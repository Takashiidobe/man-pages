.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bdflush(2) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BDFLUSH(2)              Linux Programmer's Manual             BDFLUSH(2)

NAME
-------------------------------------------------

::

          bdflush - start, flush, or tune buffer-dirty-flush daemon


---------------------------------------------------------

::

          #include <sys/kdaemon.h>

          int bdflush(int func, long *address);
          int bdflush(int func, long data);

          Note: There is no glibc wrapper for this system call; see
          VERSIONS.


---------------------------------------------------------------

::

          Note: Since Linux 2.6, this system call is deprecated and does
          nothing.  It is likely to disappear altogether in a future kernel
          release.  Nowadays, the task performed by bdflush() is handled by
          the kernel pdflush thread.

          bdflush() starts, flushes, or tunes the buffer-dirty-flush
          daemon.  Only a privileged process (one with the CAP_SYS_ADMIN
          capability) may call bdflush().

          If func is negative or 0, and no daemon has been started, then
          bdflush() enters the daemon code and never returns.

          If func is 1, some dirty buffers are written to disk.

          If func is 2 or more and is even (low bit is 0), then address is
          the address of a long word, and the tuning parameter numbered
          (func-2)/2 is returned to the caller in that address.

          If func is 3 or more and is odd (low bit is 1), then data is a
          long word, and the kernel sets tuning parameter numbered
          (func-3)/2 to that value.

          The set of parameters, their values, and their valid ranges are
          defined in the Linux kernel source file fs/buffer.c.


-----------------------------------------------------------------

::

          If func is negative or 0 and the daemon successfully starts,
          bdflush() never returns.  Otherwise, the return value is 0 on
          success and -1 on failure, with errno set to indicate the error.


-----------------------------------------------------

::

          EBUSY  An attempt was made to enter the daemon code after another
                 process has already entered.

          EFAULT address points outside your accessible address space.

          EINVAL An attempt was made to read or write an invalid parameter
                 number, or to write an invalid value to a parameter.

          EPERM  Caller does not have the CAP_SYS_ADMIN capability.


---------------------------------------------------------

::

          Since version 2.23, glibc no longer supports this obsolete system
          call.


-------------------------------------------------------------------

::

          bdflush() is Linux-specific and should not be used in programs
          intended to be portable.


---------------------------------------------------------

::

          sync(1), fsync(2), sync(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     BDFLUSH(2)

--------------

Pages that refer to this page: `fsync(2) <../man2/fsync.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/bdflush.2.license.html>`__

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
