.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

personality(2) — Linux manual page
==================================

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

   PERSONALITY(2)          Linux Programmer's Manual         PERSONALITY(2)

NAME
-------------------------------------------------

::

          personality - set the process execution domain


---------------------------------------------------------

::

          #include <sys/personality.h>

          int personality(unsigned long persona);


---------------------------------------------------------------

::

          Linux supports different execution domains, or personalities, for
          each process.  Among other things, execution domains tell Linux
          how to map signal numbers into signal actions.  The execution
          domain system allows Linux to provide limited support for
          binaries compiled under other UNIX-like operating systems.

          If persona is not 0xffffffff, then personality() sets the
          caller's execution domain to the value specified by persona.
          Specifying persona as 0xffffffff provides a way of retrieving the
          current persona without changing it.

          A list of the available execution domains can be found in
          <sys/personality.h>.  The execution domain is a 32-bit value in
          which the top three bytes are set aside for flags that cause the
          kernel to modify the behavior of certain system calls so as to
          emulate historical or architectural quirks.  The least
          significant byte is a value defining the personality the kernel
          should assume.  The flag values are as follows:

          ADDR_COMPAT_LAYOUT (since Linux 2.6.9)
                 With this flag set, provide legacy virtual address space
                 layout.

          ADDR_NO_RANDOMIZE (since Linux 2.6.12)
                 With this flag set, disable address-space-layout
                 randomization.

          ADDR_LIMIT_32BIT (since Linux 2.2)
                 Limit the address space to 32 bits.

          ADDR_LIMIT_3GB (since Linux 2.4.0)
                 With this flag set, use 0xc0000000 as the offset at which
                 to search a virtual memory chunk on mmap(2); otherwise use
                 0xffffe000.

          FDPIC_FUNCPTRS (since Linux 2.6.11)
                 User-space function pointers to signal handlers point (on
                 certain architectures) to descriptors.

          MMAP_PAGE_ZERO (since Linux 2.4.0)
                 Map page 0 as read-only (to support binaries that depend
                 on this SVr4 behavior).

          READ_IMPLIES_EXEC (since Linux 2.6.8)
                 With this flag set, PROT_READ implies PROT_EXEC for
                 mmap(2).

          SHORT_INODE (since Linux 2.4.0)
                 No effects(?).

          STICKY_TIMEOUTS (since Linux 1.2.0)
                 With this flag set, select(2), pselect(2), and ppoll(2) do
                 not modify the returned timeout argument when interrupted
                 by a signal handler.

          UNAME26 (since Linux 3.1)
                 Have uname(2) report a 2.6.40+ version number rather than
                 a 3.x version number.  Added as a stopgap measure to
                 support broken applications that could not handle the
                 kernel version-numbering switch from 2.6.x to 3.x.

          WHOLE_SECONDS (since Linux 1.2.0)
                 No effects(?).

          The available execution domains are:

          PER_BSD (since Linux 1.2.0)
                 BSD. (No effects.)

          PER_HPUX (since Linux 2.4)
                 Support for 32-bit HP/UX.  This support was never
                 complete, and was dropped so that since Linux 4.0, this
                 value has no effect.

          PER_IRIX32 (since Linux 2.2)
                 IRIX 5 32-bit.  Never fully functional; support dropped in
                 Linux 2.6.27.  Implies STICKY_TIMEOUTS.

          PER_IRIX64 (since Linux 2.2)
                 IRIX 6 64-bit.  Implies STICKY_TIMEOUTS; otherwise no
                 effects.

          PER_IRIXN32 (since Linux 2.2)
                 IRIX 6 new 32-bit.  Implies STICKY_TIMEOUTS; otherwise no
                 effects.

          PER_ISCR4 (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS; otherwise no effects.

          PER_LINUX (since Linux 1.2.0)
                 Linux.

          PER_LINUX32 (since Linux 2.2)
                 [To be documented.]

          PER_LINUX32_3GB (since Linux 2.4)
                 Implies ADDR_LIMIT_3GB.

          PER_LINUX_32BIT (since Linux 2.0)
                 Implies ADDR_LIMIT_32BIT.

          PER_LINUX_FDPIC (since Linux 2.6.11)
                 Implies FDPIC_FUNCPTRS.

          PER_OSF4 (since Linux 2.4)
                 OSF/1 v4.  On alpha, clear top 32 bits of iov_len in the
                 user's buffer for compatibility with old versions of OSF/1
                 where iov_len was defined as.  int.

          PER_OSR5 (since Linux 2.4)
                 Implies STICKY_TIMEOUTS and WHOLE_SECONDS; otherwise no
                 effects.

          PER_RISCOS (since Linux 2.2)
                 [To be documented.]

          PER_SCOSVR3 (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS, WHOLE_SECONDS, and SHORT_INODE;
                 otherwise no effects.

          PER_SOLARIS (since Linux 2.4)
                 Implies STICKY_TIMEOUTS; otherwise no effects.

          PER_SUNOS (since Linux 2.4.0)
                 Implies STICKY_TIMEOUTS.  Divert library and dynamic
                 linker searches to /usr/gnemul.  Buggy, largely
                 unmaintained, and almost entirely unused; support was
                 removed in Linux 2.6.26.

          PER_SVR3 (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS and SHORT_INODE; otherwise no
                 effects.

          PER_SVR4 (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS and MMAP_PAGE_ZERO; otherwise no
                 effects.

          PER_UW7 (since Linux 2.4)
                 Implies STICKY_TIMEOUTS and MMAP_PAGE_ZERO; otherwise no
                 effects.

          PER_WYSEV386 (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS and SHORT_INODE; otherwise no
                 effects.

          PER_XENIX (since Linux 1.2.0)
                 Implies STICKY_TIMEOUTS and SHORT_INODE; otherwise no
                 effects.


-----------------------------------------------------------------

::

          On success, the previous persona is returned.  On error, -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL The kernel was unable to change the personality.


---------------------------------------------------------

::

          This system call first appeared in Linux 1.1.20 (and thus first
          in a stable kernel release with Linux 1.2.0); library support was
          added in glibc 2.3.


-------------------------------------------------------------------

::

          personality() is Linux-specific and should not be used in
          programs intended to be portable.


---------------------------------------------------------

::

          setarch(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 PERSONALITY(2)

--------------

Pages that refer to this page:
`mprotect(2) <../man2/mprotect.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`setarch(8) <../man8/setarch.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/personality.2.license.html>`__

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
