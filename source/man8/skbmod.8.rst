.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-skbmod(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   skbmod action in tc(8)            Linux           skbmod action in tc(8)

NAME
-------------------------------------------------

::

          skbmod - user-friendly packet editor action


---------------------------------------------------------

::

          tc ... action skbmod { set SETTABLE | swap SWAPPABLE  } [ CONTROL
                  ] [ index INDEX ]

          SETTABLE :=  [ dmac DMAC ]  [ smac SMAC ]  [ etype ETYPE ]

          SWAPPABLE := mac

          CONTROL := { reclassify | pipe | drop | shot | continue | pass }


---------------------------------------------------------------

::

          The skbmod action is intended as a usability upgrade to the
          existing pedit action. Instead of having to manually edit 8-,
          16-, or 32-bit chunks of an ethernet header, skbmod allows
          complete substitution of supported elements.


-------------------------------------------------------

::

          dmac DMAC
                 Change the destination mac to the specified address.

          smac SMAC
                 Change the source mac to the specified address.

          etype ETYPE
                 Change the ethertype to the specified value.

          mac    Used to swap mac addresses.

          CONTROL
                 The following keywords allow to control how the tree of
                 qdisc, classes, filters and actions is further traversed
                 after this action.

                 reclassify
                        Restart with the first filter in the current list.

                 pipe   Continue with the next action attached to the same
                        filter.

                 drop
                 shot   Drop the packet.

                 continue
                        Continue classification with the next filter in
                        line.

                 pass   Finish classification process and return to calling
                        qdisc for further packet processing. This is the
                        default.


---------------------------------------------------------

::

          To start, observe the following filter with a pedit action:

                 tc filter add dev eth1 parent 1: protocol ip prio 10 \
                      u32 match ip protocol 1 0xff flowid 1:2 \
                      action pedit munge offset -14 u8 set 0x02 \
                      munge offset -13 u8 set 0x15 \
                      munge offset -12 u8 set 0x15 \
                      munge offset -11 u8 set 0x15 \
                      munge offset -10 u16 set 0x1515 \
                      pipe

          Using the skbmod action, this command can be simplified to:

                 tc filter add dev eth1 parent 1: protocol ip prio 10 \
                      u32 match ip protocol 1 0xff flowid 1:2 \
                      action skbmod set dmac 02:15:15:15:15:15 \
                      pipe

          Complexity will increase if source mac and ethertype are also
          being edited as part of the action. If all three fields are to be
          changed with skbmod:

                 tc filter add dev eth5 parent 1: protocol ip prio 10 \
                      u32 match ip protocol 1 0xff flowid 1:2 \
                      action skbmod \
                      set etype 0xBEEF \
                      set dmac 02:12:13:14:15:16 \
                      set smac 02:22:23:24:25:26

          Finally, swap the destination and source mac addresses in the
          header:

                 tc filter add dev eth3 parent 1: protocol ip prio 10 \
                      u32 match ip protocol 1 0xff flowid 1:2 \
                      action skbmod \
                      swap mac

          However, trying to set and swap in a single skbmod command will
          cause undefined behavior.


---------------------------------------------------------

::

          tc(8), tc-u32(8), tc-pedit(8)

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

   iproute2                       21 Sep 2016        skbmod action in tc(8)

--------------

Pages that refer to this page:
`tc-actions(8) <../man8/tc-actions.8.html>`__

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
