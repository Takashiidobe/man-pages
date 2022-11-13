.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mii-tool(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MII-TOOL(8)        Linux System Administrator's Manual       MII-TOOL(8)

NAME
-------------------------------------------------

::

          mii-tool - view, manipulate media-independent interface status


---------------------------------------------------------

::

          mii-tool [-v, --verbose] [-V, --version] [-R, --reset] [-r,
          --restart] [-w, --watch] [-l, --log] [-A, --advertise=media,...]
          [-F, --force=media] [-p, --phy=addr] interface ...


---------------------------------------------------------------

::

          This utility checks or sets the status of a network interface's
          Media Independent Interface (MII) unit.  Most fast ethernet
          adapters use an MII to autonegotiate link speed and duplex
          setting.

          Most intelligent network devices use an autonegotiation protocol
          to communicate what media technologies they support, and then
          select the fastest mutually supported media technology.  The -A
          or --advertise options can be used to tell the MII to only
          advertise a subset of its capabilities.  Some passive devices,
          such as single-speed hubs, are unable to autonegotiate.  To
          handle such devices, the MII protocol also allows for
          establishing a link by simply detecting either a 10baseT or
          100baseT link beat.  The -F or --force options can be used to
          force the MII to operate in one mode, instead of autonegotiating.
          The -A and -F options are mutually exclusive.

          The default short output reports the negotiated link speed and
          link status for each interface.


-------------------------------------------------------

::

          -v, --verbose
                 Display more detailed MII status information.  If used
                 twice, also display raw MII register contents.
                 Alert: If used three times, will force reading all MII
                 registers, including non standard ones. It's not
                 guaranteed any valid answer from PHY while PHY
                 communication can even hang.  With driver e1000e will fail
                 while reading register 0x07.

          -V, --version
                 Display program version information.

          -R, --reset
                 Reset the MII to its default configuration.

          -r, --restart
                 Restart autonegotiation.

          -w, --watch
                 Watch interface(s) and report changes in link status.  The
                 MII interfaces are polled at one second intervals.

          -l, --log
                 Used with -w, records link status changes in the system
                 log instead of printing on standard output.

          -F media, --force=media
                 Disable autonegotiation, and force the MII to either
                 100baseTx-FD, 100baseTx-HD, 10baseT-FD, or 10baseT-HD
                 operation.

          -A media,..., --advertise=media,...
                 Enable and restart autonegotiation, and advertise only the
                 specified media technologies.  Multiple technologies
                 should be separated by commas.  Valid media are 100baseT4,
                 100baseTx-FD, 100baseTx-HD, 10baseT-FD, and 10baseT-HD.

          -p addr, --phy=addr
                 Override the MII address provided by kernel with value
                 addr.


---------------------------------------------------------------

::

          SIOCGMIIPHY on 'eth?' failed: Invalid argument
                 If the interface is not running (up), kernel will refuse
                 to report its link state.

          SIOCGMIIPHY on 'eth?' failed: Operation not permitted
                 Most kernels restrict access to root.

          SIOCGMIIPHY on 'eth?' failed: No such device
                 This error is shown, if the kernel does not know about the
                 named device.

          SIOCGMIIPHY on 'eth?' failed: Operation not supported
                 The interface in question does not support MII queries.
                 Most likely, it does not have MII transceivers, at all.


-------------------------------------------------------

::

          David Hinds - dhinds@pcmcia.sourceforge.org
          Donald Becker - becker@scyld.com
          Bernd Eckenfels - net-tools@lina.inka.de


---------------------------------------------------------

::

          http://net-tools.sourceforge.net - Homepage of the net-tools
          project

COLOPHON
---------------------------------------------------------

::

          This page is part of the net-tools (networking utilities)
          project.  Information about the project can be found at 
          ⟨http://net-tools.sourceforge.net/⟩.  If you have a bug report for
          this manual page, see ⟨http://net-tools.sourceforge.net/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/net-tools/code⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-22.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   net-tools                      2013-02-15                    MII-TOOL(8)

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
