.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pppoe-discovery(8) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PPPOE-DISCOVERY(8)       System Manager's Manual      PPPOE-DISCOVERY(8)

NAME
-------------------------------------------------

::

          pppoe-discovery - perform PPPoE discovery


---------------------------------------------------------

::

          pppoe-discovery [ options ]
          pppoe-discovery { -V | -h }


---------------------------------------------------------------

::

          pppoe-discovery performs the same discovery process as pppoe, but
          does not initiate a session.  It sends a PADI packet and then
          prints the names of access concentrators in each PADO packet it
          receives.


-------------------------------------------------------

::

          -I interface
                 The -I option specifies the Ethernet interface to use.
                 Under Linux, it is typically eth0 or eth1.  The interface
                 should be “up” before you start pppoe-discovery, but
                 should not be configured to have an IP address.  The
                 default interface is eth0.

          -D file_name
                 The -D option causes every packet to be dumped to the
                 specified file_name.  This is intended for debugging only.

          -U
                 Causes pppoe-discovery to use the Host-Uniq tag in its
                 discovery packets.  This lets you run multiple instances
                 of pppoe-discovery and/or pppoe without having their
                 discovery packets interfere with one another.  You must
                 supply this option to all instances that you intend to run
                 simultaneously.

          -S service_name
                 Specifies the desired service name.  pppoe-discovery will
                 only accept access concentrators which can provide the
                 specified service.  In most cases, you should not specify
                 this option.  Use it only if you know that there are
                 multiple access concentrators or know that you need a
                 specific service name.

          -C ac_name
                 Specifies the desired access concentrator name.
                 pppoe-discovery will only accept the specified access
                 concentrator.  In most cases, you should not specify this
                 option.  Use it only if you know that there are multiple
                 access concentrators.  If both the -S and -C options are
                 specified, they must both match.

          -A
                 This option is accepted for compatibility with pppoe, but
                 has no effect.

          -V | -h
                 Either of these options causes pppoe-discovery to print
                 its version number and usage information, then exit.


-------------------------------------------------------

::

          pppoe-discovery was written by Marco d'Itri <md@linux.it>, based
          on pppoe by David F. Skoll <dfs@roaringpenguin.com>.


---------------------------------------------------------

::

          pppoe(8), pppoe-sniff(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the ppp (An implementation of the Point-to-
          Point Protocol (PPP)) project.  Information about the project can
          be found at ⟨https://ppp.samba.org/⟩.  If you have a bug report
          for this manual page, see
          ⟨https://github.com/paulusmack/ppp/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/paulusmack/ppp⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-07.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                         PPPOE-DISCOVERY(8)

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
