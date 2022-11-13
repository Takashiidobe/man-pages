.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rarp(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `WARNING <#WARNING>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RARP(8)            Linux System Administrator's Manual           RARP(8)

NAME
-------------------------------------------------

::

          rarp - manipulate the system RARP table


---------------------------------------------------------

::

          rarp [-V] [--version] [-h] [--help]
          rarp -a
          rarp [-v] -d hostname ...
          rarp [-v] [-t type] -s hostname hw_addr


-------------------------------------------------

::

          This program is obsolete.  From version 2.3, the Linux kernel no
          longer contains RARP support.  For a replacement RARP daemon, see
          ftp://ftp.dementia.org/pub/net-tools


---------------------------------------------------------------

::

          Rarp manipulates the kernel's RARP table in various ways.  The
          primary options are clearing an address mapping entry and
          manually setting up one.  For debugging purposes, the rarp
          program also allows a complete dump of the RARP table.


-------------------------------------------------------

::

          -V     Display the version of RARP in use.

          -v     Tell the user what is going on by being verbose.

          -t type
                 When setting or reading the RARP table, this optional
                 parameter tells rarp which class of entries it should
                 check for.  The default value of this parameter is ether
                 (i.e. hardware code 0x01 for IEEE 802.3 10Mbps Ethernet .
                 Other values might include network technologies such as
                 AX.25 (ax25) and NET/ROM (netrom).

          -a

          --list Lists the entries in the RARP table.

          -d hostname

          --delete hostname
                 Remove all RARP entries for the specified host.

          -s hostname hw_addr

          --set hostname hw_addr
                 Create a RARP address mapping entry for host hostname with
                 hardware address set to hw_addr.  The format of the
                 hardware address is dependent on the hardware class, but
                 for most classes one can assume that the usual
                 presentation can be used.  For the Ethernet class, this is
                 6 bytes in hexadecimal, separated by colons.


-------------------------------------------------------

::

          Some systems (notably older Suns) assume that the host replying
          to a RARP query can also provide other remote boot services.
          Therefore never gratuitously add rarp entries unless you wish to
          meet the wrath of the network administrator.


---------------------------------------------------

::

          /proc/net/rarp,


---------------------------------------------------------

::

          arp(8), route(8), ifconfig(8), netstat(8)


-------------------------------------------------------

::

          Ross D. Martin, <martin@trcsun3.eas.asu.edu>
          Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
          Phil Blundell, <Philip.Blundell@pobox.com>

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

   net-tools                      2008-10-03                        RARP(8)

--------------

Pages that refer to this page: `ethers(5) <../man5/ethers.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `arp(8) <../man8/arp.8.html>`__, 
`ifconfig(8) <../man8/ifconfig.8.html>`__, 
`route(8) <../man8/route.8.html>`__

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
