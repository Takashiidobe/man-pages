.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-macsec(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-MACSEC(8)                      Linux                     IP-MACSEC(8)

NAME
-------------------------------------------------

::

          ip-macsec - MACsec device configuration


---------------------------------------------------------

::

          ip link add link DEVICE name NAME type macsec [ [ address
          <lladdr> ] port PORT | sci <u64> ] [ cipher { default | gcm-
          aes-128 | gcm-aes-256"}][" icvlen ICVLEN ] [ encrypt { on | off }
          ] [ send_sci { on | off } ] [ end_station { on | off } ] [ scb {
          on | off } ] [ protect { on | off } ] [ replay { on | off } ] [
          window WINDOW ] [ validate { strict | check | disabled } ] [
          encodingsa SA ] [ offload { off | phy | mac } ]

          ip macsec add DEV tx sa { 0..3 } [ OPTS ] key ID KEY
          ip macsec set DEV tx sa { 0..3 } [ OPTS ]
          ip macsec del DEV tx sa { 0..3 }

          ip macsec add DEV rx SCI [ on | off ]
          ip macsec set DEV rx SCI [ on | off ]
          ip macsec del DEV rx SCI

          ip macsec add DEV rx SCI sa { 0..3 } [ OPTS ] key ID KEY
          ip macsec set DEV rx SCI sa { 0..3 } [ OPTS ]
          ip macsec del DEV rx SCI sa { 0..3 }

          ip macsec offload DEV { off | phy | mac }

          ip macsec show [ DEV ]

          OPTS := [ pn { 1..2^32-1 } ] [ on | off ]
          SCI := { sci <u64> | port PORT address <lladdr> }
          PORT := { 1..2^16-1 }


---------------------------------------------------------------

::

          The ip macsec commands are used to configure transmit secure
          associations and receive secure channels and their secure
          associations on a MACsec device created with the ip link add
          command using the macsec type.


---------------------------------------------------------

::

      Create a MACsec device on link eth0 (offload is disabled by default)
          # ip link add link eth0 macsec0 type macsec port 11 encrypt on

      Configure a secure association on that device
          # ip macsec add macsec0 tx sa 0 pn 1024 on key 01 81818181818181818181818181818181

      Configure a receive channel
          # ip macsec add macsec0 rx port 1234 address c6:19:52:8f:e6:a0

      Configure a receive association
          # ip macsec add macsec0 rx port 1234 address c6:19:52:8f:e6:a0 sa 0 pn 1 on key 00 82828282828282828282828282828282

      Display MACsec configuration
          # ip macsec show

      Configure offloading on an interface
          # ip macsec offload macsec0 phy

      Configure offloading upon MACsec device creation
          # ip link add link eth0 macsec0 type macsec port 11 encrypt on offload mac


---------------------------------------------------

::

          This tool can be used to configure the 802.1AE keys of the
          interface. Note that 802.1AE uses GCM-AES with a initialization
          vector (IV) derived from the packet number. The same key must not
          be used with the same IV more than once. Instead, keys must be
          frequently regenerated and distributed.  This tool is thus mostly
          for debugging and testing, or in combination with a user-space
          application that reconfigures the keys. It is wrong to just
          configure the keys statically and assume them to work
          indefinitely. The suggested and standardized way for key
          management is 802.1X-2010, which is implemented by
          wpa_supplicant.


---------------------------------------------------------

::

          ip-link(8) wpa_supplicant(8)


-----------------------------------------------------

::

          Sabrina Dubroca <sd@queasysnail.net>

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute                        07 Mar 2016                  IP-MACSEC(8)

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
