.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

svcgssd(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rpc.svcgssd(8)           System Manager's Manual          rpc.svcgssd(8)

NAME
-------------------------------------------------

::

          rpc.svcgssd - server-side rpcsec_gss daemon


---------------------------------------------------------

::

          rpc.svcgssd [-n] [-v] [-r] [-i] [-f] [-p principal]


---------------------------------------------------------------

::

          The rpcsec_gss protocol gives a means of using the gss-api
          generic security api to provide security for protocols using rpc
          (in particular, nfs).  Before exchanging any rpc requests using
          rpcsec_gss, the rpc client must first establish a security
          context with the rpc server.  The linux kernel's implementation
          of rpcsec_gss depends on the userspace daemon rpc.svcgssd to
          handle context establishment on the rpc server.  The daemon uses
          files in the proc filesystem to communicate with the kernel.


-------------------------------------------------------

::

          -f     Runs rpc.svcgssd in the foreground and sends output to
                 stderr (as opposed to syslogd)

          -v     Increases the verbosity of the output (can be specified
                 multiple times).

          -r     If the rpcsec_gss library supports setting debug level,
                 increases the verbosity of the output (can be specified
                 multiple times).

          -i     If the nfsidmap library supports setting debug level,
                 increases the verbosity of the output (can be specified
                 multiple times).

          -p     Use principal instead of the default nfs/FQDN@REALM.

          -n     Use the system default credentials (host/FQDN@REALM)
                 rather than the default nfs/FQDN@REALM.


-----------------------------------------------------------------------------

::

          Some of the options that can be set on the command line can also
          be controlled through values set in the [svcgssd] section of the
          /etc/nfs.conf configuration file.  Values recognized include:

          principal
                 If set to system this is equivalent to the -n option.  If
                 set to any other value, that is used like the -p option.


---------------------------------------------------------

::

          rpc.gssd(8),


-------------------------------------------------------

::

          Dug Song <dugsong@umich.edu>
          Andy Adamson <andros@umich.edu>
          Marius Aamodt Eriksen <marius@umich.edu>
          J. Bruce Fields <bfields@umich.edu>

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

                                  12 Jan 2007                rpc.svcgssd(8)

--------------

Pages that refer to this page: `nfs(5) <../man5/nfs.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`gssd(8) <../man8/gssd.8.html>`__

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
