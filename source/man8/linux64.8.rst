.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setarch(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETARCH(8)                System Administration               SETARCH(8)

NAME
-------------------------------------------------

::

          setarch - change reported architecture in new program environment
          and/or set personality flags


---------------------------------------------------------

::

          setarch [arch] [options] [program [argument...]]

          setarch --list|-h|-V

          arch [options] [program [argument...]]


---------------------------------------------------------------

::

          setarch modifies execution domains and process personality flags.

          The execution domains currently only affects the output of uname
          -m. For example, on an AMD64 system, running setarch i386 program
          will cause program to see i686 instead of x86_64 as the machine
          type. It can also be used to set various personality options. The
          default program is /bin/sh.

          Since version 2.33 the arch command line argument is optional and
          setarch may be used to change personality flags (ADDR_LIMIT_*,
          SHORT_INODE, etc) without modification of the execution domain.


-------------------------------------------------------

::

          --list
              List the architectures that setarch knows about. Whether
              setarch can actually set each of these architectures depends
              on the running kernel.

          --uname-2.6
              Causes the program to see a kernel version number beginning
              with 2.6. Turns on UNAME26.

          -v, --verbose
              Be verbose.

          -3, --3gb
              Specifies program should use a maximum of 3GB of address
              space. Supported on x86. Turns on ADDR_LIMIT_3GB.

          --4gb
              This option has no effect. It is retained for backward
              compatibility only, and may be removed in future releases.

          -B, --32bit
              Limit the address space to 32 bits to emulate hardware.
              Supported on ARM and Alpha. Turns on ADDR_LIMIT_32BIT.

          -F, --fdpic-funcptrs
              Treat user-space function pointers to signal handlers as
              pointers to address descriptors. This option has no effect on
              architectures that do not support FDPIC ELF binaries. In
              kernel v4.14 support is limited to ARM, Blackfin, Fujitsu
              FR-V, and SuperH CPU architectures.

          -I, --short-inode
              Obsolete bug emulation flag. Turns on SHORT_INODE.

          -L, --addr-compat-layout
              Provide legacy virtual address space layout. Use when the
              program binary does not have PT_GNU_STACK ELF header. Turns
              on ADDR_COMPAT_LAYOUT.

          -R, --addr-no-randomize
              Disables randomization of the virtual address space. Turns on
              ADDR_NO_RANDOMIZE.

          -S, --whole-seconds
              Obsolete bug emulation flag. Turns on WHOLE_SECONDS.

          -T, --sticky-timeouts
              This makes select(2), pselect(2), and ppoll(2) system calls
              preserve the timeout value instead of modifying it to reflect
              the amount of time not slept when interrupted by a signal
              handler. Use when program depends on this behavior. For more
              details see the timeout description in select(2) manual page.
              Turns on STICKY_TIMEOUTS.

          -X, --read-implies-exec
              If this is set then mmap(3p) PROT_READ will also add the
              PROT_EXEC bit - as expected by legacy x86 binaries. Notice
              that the ELF loader will automatically set this bit when it
              encounters a legacy binary. Turns on READ_IMPLIES_EXEC.

          -Z, --mmap-page-zero
              SVr4 bug emulation that will set mmap(3p) page zero as
              read-only. Use when program depends on this behavior, and the
              source code is not available to be fixed. Turns on
              MMAP_PAGE_ZERO.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

              setarch --addr-no-randomize mytestprog
              setarch ppc32 rpmbuild --target=ppc --rebuild foo.src.rpm
              setarch ppc32 -v -vL3 rpmbuild --target=ppc --rebuild bar.src.rpm
              setarch ppc32 --32bit rpmbuild --target=ppc --rebuild foo.src.rpm


-------------------------------------------------------

::

          Elliot Lee <sopwith@redhat.com>, Jindrich Novy
          <jnovy@redhat.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          personality(2), select(2)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The setarch command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.109-b366e69    2021-06-20                     SETARCH(8)

--------------

Pages that refer to this page:
`personality(2) <../man2/personality.2.html>`__

--------------

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
