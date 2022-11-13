.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lvmpolld(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LVMPOLLD(8)              System Manager's Manual             LVMPOLLD(8)

NAME
-------------------------------------------------

::

          lvmpolld — LVM poll daemon


---------------------------------------------------------

::

          lvmpolld [-l|--log all|wire|debug] [-p|--pidfile pidfile_path]
          [-s|--socket socket_path] [-B|--binary lvm_binary_path]
          [-t|--timeout timeout_value] [-f|--foreground] [-h|--help]
          [-V|--version]

          lvmpolld [--dump]


---------------------------------------------------------------

::

          lvmpolld is polling daemon for LVM. The daemon receives requests
          for polling of already initialised operations originating in LVM2
          command line tool.  The requests for polling originate in the
          lvconvert, pvmove, lvchange or vgchange LVM2 commands.

          The purpose of lvmpolld is to reduce the number of spawned
          background processes per otherwise unique polling operation.
          There should be only one. It also eliminates the possibility of
          unsolicited termination of background process by external
          factors.

          lvmpolld is used by LVM only if it is enabled in lvm.conf(5) by
          specifying the global/use_lvmpolld setting. If this is not
          defined in the LVM configuration explicitly then default setting
          is used instead (see the output of lvmconfig --type default
          global/use_lvmpolld command).


-------------------------------------------------------

::

          To run the daemon in a test environment both the pidfile_path and
          the socket_path should be changed from the defaults.

          -f|--foreground
                 Don't fork, but run in the foreground.

          -h|--help
                 Show help information.

          -l|--log all|wire|debug
                 Select the type of log messages to generate.  Messages are
                 logged by syslog.  Additionally, when -f is given they are
                 also sent to standard error.  There are two classes of
                 messages: wire and debug. Selecting 'all' supplies both
                 and is equivalent to a comma-separated list -l wire,debug.

          -p|--pidfile pidfile_path
                 Path to the pidfile. This overrides both the built-in
                 default (/run/lvmpolld.pid) and the environment variable
                 LVM_LVMPOLLD_PIDFILE.  This file is used to prevent more
                 than one instance of the daemon running simultaneously.

          -s|--socket socket_path
                 Path to the socket file. This overrides both the built-in
                 default (/run/lvm/lvmpolld.socket) and the environment
                 variable LVM_LVMPOLLD_SOCKET.

          -t|--timeout timeout_value
                 The daemon may shutdown after being idle for the given
                 time (in seconds). When the option is omitted or the value
                 given is zero the daemon never shutdowns on idle.

          -B|--binary lvm_binary_path
                 Optional path to alternative LVM binary (default:
                 /bin/lvm). Use for testing purposes only.

          -V|--version
                 Display the version of lvmpolld daemon.

          --dump Contact the running lvmpolld daemon to obtain the complete
                 state and print it out in a raw format.


-----------------------------------------------------------------------------------

::

          LVM_LVMPOLLD_PIDFILE
                 Path for the pid file.

          LVM_LVMPOLLD_SOCKET
                 Path for the socket file.


---------------------------------------------------------

::

          lvm(8), lvm.conf(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the lvm2 (Logical Volume Manager 2) project.
          Information about the project can be found at 
          ⟨http://www.sourceware.org/lvm2/⟩.  If you have a bug report for
          this manual page, see ⟨https://github.com/lvmteam/lvm2/issues⟩.
          This page was obtained from the tarball
          https://github.com/lvmteam/lvm2/archive/refs/tags/v2_03_13.tar.gz
          fetched from ⟨https://github.com/lvmteam/lvm2/releases⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat Inc         LVM TOOLS 2.03.13(2) (2021-08-11)        LVMPOLLD(8)

--------------

Pages that refer to this page:
`lvchange(8) <../man8/lvchange.8.html>`__, 
`lvconvert(8) <../man8/lvconvert.8.html>`__, 
`lvcreate(8) <../man8/lvcreate.8.html>`__, 
`lvdisplay(8) <../man8/lvdisplay.8.html>`__, 
`lvextend(8) <../man8/lvextend.8.html>`__, 
`lvm(8) <../man8/lvm.8.html>`__, 
`lvmconfig(8) <../man8/lvmconfig.8.html>`__, 
`lvmdevices(8) <../man8/lvmdevices.8.html>`__, 
`lvmdiskscan(8) <../man8/lvmdiskscan.8.html>`__, 
`lvmdump(8) <../man8/lvmdump.8.html>`__, 
`lvm-fullreport(8) <../man8/lvm-fullreport.8.html>`__, 
`lvm-lvpoll(8) <../man8/lvm-lvpoll.8.html>`__, 
`lvreduce(8) <../man8/lvreduce.8.html>`__, 
`lvremove(8) <../man8/lvremove.8.html>`__, 
`lvrename(8) <../man8/lvrename.8.html>`__, 
`lvresize(8) <../man8/lvresize.8.html>`__, 
`lvs(8) <../man8/lvs.8.html>`__, 
`lvscan(8) <../man8/lvscan.8.html>`__, 
`pvchange(8) <../man8/pvchange.8.html>`__, 
`pvck(8) <../man8/pvck.8.html>`__, 
`pvcreate(8) <../man8/pvcreate.8.html>`__, 
`pvdisplay(8) <../man8/pvdisplay.8.html>`__, 
`pvmove(8) <../man8/pvmove.8.html>`__, 
`pvremove(8) <../man8/pvremove.8.html>`__, 
`pvresize(8) <../man8/pvresize.8.html>`__, 
`pvs(8) <../man8/pvs.8.html>`__, 
`pvscan(8) <../man8/pvscan.8.html>`__, 
`vgcfgbackup(8) <../man8/vgcfgbackup.8.html>`__, 
`vgcfgrestore(8) <../man8/vgcfgrestore.8.html>`__, 
`vgchange(8) <../man8/vgchange.8.html>`__, 
`vgck(8) <../man8/vgck.8.html>`__, 
`vgconvert(8) <../man8/vgconvert.8.html>`__, 
`vgcreate(8) <../man8/vgcreate.8.html>`__, 
`vgdisplay(8) <../man8/vgdisplay.8.html>`__, 
`vgexport(8) <../man8/vgexport.8.html>`__, 
`vgextend(8) <../man8/vgextend.8.html>`__, 
`vgimport(8) <../man8/vgimport.8.html>`__, 
`vgimportclone(8) <../man8/vgimportclone.8.html>`__, 
`vgimportdevices(8) <../man8/vgimportdevices.8.html>`__, 
`vgmerge(8) <../man8/vgmerge.8.html>`__, 
`vgmknodes(8) <../man8/vgmknodes.8.html>`__, 
`vgreduce(8) <../man8/vgreduce.8.html>`__, 
`vgremove(8) <../man8/vgremove.8.html>`__, 
`vgrename(8) <../man8/vgrename.8.html>`__, 
`vgs(8) <../man8/vgs.8.html>`__, 
`vgscan(8) <../man8/vgscan.8.html>`__, 
`vgsplit(8) <../man8/vgsplit.8.html>`__

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
