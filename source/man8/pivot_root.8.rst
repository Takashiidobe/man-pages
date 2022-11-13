.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pivot_root(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PIVOT_ROOT(8)             System Administration            PIVOT_ROOT(8)

NAME
-------------------------------------------------

::

          pivot_root - change the root filesystem


---------------------------------------------------------

::

          pivot_root new_root put_old


---------------------------------------------------------------

::

          pivot_root moves the root file system of the current process to
          the directory put_old and makes new_root the new root file
          system. Since pivot_root(8) simply calls pivot_root(2), we refer
          to the man page of the latter for further details.

          Note that, depending on the implementation of pivot_root, root
          and current working directory of the caller may or may not
          change. The following is a sequence for invoking pivot_root that
          works in either case, assuming that pivot_root and chroot are in
          the current PATH:

              cd new_root
              pivot_root . put_old
              exec chroot . command

          Note that chroot must be available under the old root and under
          the new root, because pivot_root may or may not have implicitly
          changed the root directory of the shell.

          Note that exec chroot changes the running executable, which is
          necessary if the old root directory should be unmounted
          afterwards. Also note that standard input, output, and error may
          still point to a device on the old root file system, keeping it
          busy. They can easily be changed when invoking chroot (see below;
          note the absence of leading slashes to make it work whether
          pivot_root has changed the shell’s root or not).


-------------------------------------------------------

::

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Change the root file system to /dev/hda1 from an interactive
          shell:

              mount /dev/hda1 /new-root
              cd /new-root
              pivot_root . old-root
              exec chroot . sh <dev/console >dev/console 2>&1
              umount /old-root

          Mount the new root file system over NFS from 10.0.0.1:/my_root
          and run init:

              ifconfig lo 127.0.0.1 up   # for portmap
              # configure Ethernet or such
              portmap   # for lockd (implicitly started by mount)
              mount -o ro 10.0.0.1:/my_root /mnt
              killall portmap   # portmap keeps old root busy
              cd /mnt
              pivot_root . old_root
              exec chroot . sh -c 'umount /old_root; exec /sbin/init' \
                <dev/console >dev/console 2>&1


---------------------------------------------------------

::

          chroot(1), pivot_root(2), mount(8), switch_root(8), umount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The pivot_root command is part of the util-linux package which
          can be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                  PIVOT_ROOT(8)

--------------

Pages that refer to this page:
`pivot_root(2) <../man2/pivot_root.2.html>`__, 
`initrd(4) <../man4/initrd.4.html>`__, 
`lxc.container.conf(5) <../man5/lxc.container.conf.5.html>`__, 
`mount_namespaces(7) <../man7/mount_namespaces.7.html>`__, 
`pivot_root(8) <../man8/pivot_root.8.html>`__

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
