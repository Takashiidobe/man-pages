.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-trap(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DEVLINK-TRAP(8)                   Linux                  DEVLINK-TRAP(8)

NAME
-------------------------------------------------

::

          devlink-trap - devlink trap configuration


---------------------------------------------------------

::

          devlink [ OPTIONS ] trap { COMMAND | help }

          OPTIONS := { -v[erbose] | -s[tatistics] }

          devlink trap show [ DEV trap TRAP ]

          devlink trap set DEV trap TRAP [ action { trap | drop | mirror }
                  ]

          devlink trap group show [ DEV group GROUP ]

          devlink trap group set DEV group GROUP [ action { trap | drop |
                  mirror } ]
                  [ policer POLICER ] [ nopolicer ]

          devlink trap policer set DEV policer POLICER [ rate RATE ] [
                  burst BURST ]

          devlink trap help


---------------------------------------------------------------

::

      devlink trap show - display available packet traps and their
          attributes
          DEV - specifies the devlink device from which to show packet
          traps.  If this argument is omitted all packet traps of all
          devices are listed.

          trap TRAP - specifies the packet trap.  Only applicable if a
          devlink device is also specified.

      devlink trap set - set attributes of a packet trap
          DEV - specifies the devlink device the packet trap belongs to.

          trap TRAP - specifies the packet trap.

          action { trap | drop | mirror }
                 packet trap action.

                 trap - the sole copy of the packet is sent to the CPU.

                 drop - the packet is dropped by the underlying device and
                 a copy is not sent to the CPU.

                 mirror - the packet is forwarded by the underlying device
                 and a copy is sent to the CPU.

      devlink trap group show - display available packet trap groups and
          their attributes
          DEV - specifies the devlink device from which to show packet trap
          groups.  If this argument is omitted all packet trap groups of
          all devices are listed.

          group GROUP - specifies the packet trap group.  Only applicable
          if a devlink device is also specified.

      devlink trap group set - set attributes of a packet trap group
          DEV - specifies the devlink device the packet trap group belongs
          to.

          group GROUP - specifies the packet trap group.

          action { trap | drop | mirror }
                 packet trap action. The action is set for all the packet
                 traps member in the trap group. The actions of non-drop
                 traps cannot be changed and are thus skipped.

          policer POLICER
                 packet trap policer. The policer to bind to the packet
                 trap group. A value of "0" will unbind the currently bound
                 policer.

          nopolicer
                 Unbind packet trap policer from the packet trap group.

      devlink trap policer set - set attributes of packet trap policer
          DEV - specifies the devlink device the packet trap policer
          belongs to.

          policer POLICER - specifies the packet trap policer.

          rate RATE - packet trap policer rate in packets per second.

          burst BURST - packet trap policer burst size in packets.


---------------------------------------------------------

::

          devlink trap show
              List available packet traps.

          devlink trap group show
              List available packet trap groups.

          devlink -vs trap show pci/0000:01:00.0 trap
          source_mac_is_multicast
              Show attributes and statistics of a specific packet trap.

          devlink -s trap group show pci/0000:01:00.0 group l2_drops
              Show attributes and statistics of a specific packet trap
              group.

          devlink trap set pci/0000:01:00.0 trap source_mac_is_multicast
          action trap
              Set the action of a specific packet trap to 'trap'.

          devlink trap policer show
              List available packet trap policers.

          devlink -s trap policer show pci/0000:01:00.0 policer 1
              Show attributes and statistics of a specific packet trap
              policer.

          devlink trap policer set pci/0000:01:00.0 policer 1 rate 1000
          burst 128
              Set the rate and burst size of a specific packet trap
              policer.


---------------------------------------------------------

::

          devlink(8), devlink-dev(8), devlink-monitor(8),


-----------------------------------------------------

::

          Ido Schimmel <idosch@mellanox.com>

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

   iproute2                      2 August 2019              DEVLINK-TRAP(8)

--------------

Pages that refer to this page: `devlink(8) <../man8/devlink.8.html>`__, 
`devlink-monitor(8) <../man8/devlink-monitor.8.html>`__

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
