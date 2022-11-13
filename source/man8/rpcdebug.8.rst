.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpcdebug(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rpcdebug(8)              System Manager's Manual             rpcdebug(8)

NAME
-------------------------------------------------

::

          rpcdebug - set and clear NFS and RPC kernel debug flags


---------------------------------------------------------

::

          rpcdebug -vh
          rpcdebug -m module
          rpcdebug -m module -s flags...
          rpcdebug -m module -c flags...


---------------------------------------------------------------

::

          The rpcdebug command allows an administrator to set and clear the
          Linux kernel's NFS client and server debug flags.  Setting these
          flags causes the kernel to emit messages to the system log in
          response to NFS activity; this is typically useful when debugging
          NFS problems.

          The first form in the synopsis can be used to list all available
          debug flags.  The second form shows the currently set debug flags
          for the given module.  The third form sets one or more flags, and
          the fourth form clears one or more flags.

          The value all may be used to set or clear all the flags for the
          given module.


-------------------------------------------------------

::

          -c     Clear the given debug flags.

          -h     Print a help message and exit.  When combined with the -v
                 option, also prints the available debug flags.

          -m module
                 Specify which module's flags to set or clear.  Available
                 modules are:

                 nfsd   The NFS server.

                 nfs    The NFS client.

                 nlm    The Network Lock Manager, in either an NFS client
                        or server.

                 rpc    The Remote Procedure Call module, in either an NFS
                        client or server.

          -s     Set the given debug flags.

          -v     Increase the verbosity of rpcdebug's output.


---------------------------------------------------

::

          /proc/sys/sunrpc/{rpc,nfs,nfsd,nlm}_debug
                 procfs-based interface to kernel debug flags.


---------------------------------------------------------

::

          rpc.nfsd(8), nfs(5), syslogd(8).


-------------------------------------------------

::

          Bugs can be found or reported at http://nfs.sf.net/ .


-----------------------------------------------------

::

          Program by Olaf Kirch <okir@suse.de> and
          <frederic.jolly@bull.ext.net>.  Manpage by Greg Banks
          <gnb@melbourne.sgi.com>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  5 Jul 2006                    rpcdebug(8)

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
