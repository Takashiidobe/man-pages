.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-htb(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SHAPING                          |                                   |
| ALGORITHM <#SHAPING_ALGORITHM>`__ |                                   |
| \|                                |                                   |
| `CL                               |                                   |
| ASSIFICATION <#CLASSIFICATION>`__ |                                   |
| \|                                |                                   |
| `LINK SHARING ALGOR               |                                   |
| ITHM <#LINK_SHARING_ALGORITHM>`__ |                                   |
| \| `QDISC <#QDISC>`__ \|          |                                   |
| `CLASSES <#CLASSES>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HTB(8)                            Linux                           HTB(8)

NAME
-------------------------------------------------

::

          HTB - Hierarchy Token Bucket


---------------------------------------------------------

::

          tc qdisc ... dev dev ( parent classid | root) [ handle major: ]
          htb [ default minor-id ] [ r2q divisor ] [ offload ]

          tc class ... dev dev parent major:[minor] [ classid major:minor ]
          htb rate rate [ ceil rate ] burst bytes [ cburst bytes ] [ prio
          priority ] [ quantum bytes ]


---------------------------------------------------------------

::

          HTB is meant as a more understandable and intuitive replacement
          for the CBQ qdisc in Linux. Both CBQ and HTB help you to control
          the use of the outbound bandwidth on a given link. Both allow you
          to use one physical link to simulate several slower links and to
          send different kinds of traffic on different simulated links. In
          both cases, you have to specify how to divide the physical link
          into simulated links and how to decide which simulated link to
          use for a given packet to be sent.

          Unlike CBQ, HTB shapes traffic based on the Token Bucket Filter
          algorithm which does not depend on interface characteristics and
          so does not need to know the underlying bandwidth of the outgoing
          interface.


---------------------------------------------------------------------------

::

          Shaping works as documented in tc-tbf(8).


---------------------------------------------------------------------

::

          Within the one HTB instance many classes may exist. Each of these
          classes contains another qdisc, by default tc-pfifo(8).

          When enqueueing a packet, HTB starts at the root and uses various
          methods to determine which class should receive the data.

          In the absence of uncommon configuration options, the process is
          rather easy.  At each node we look for an instruction, and then
          go to the class the instruction refers us to. If the class found
          is a barren leaf-node (without children), we enqueue the packet
          there. If it is not yet a leaf node, we do the whole thing over
          again starting from that node.

          The following actions are performed, in order at each node we
          visit, until one sends us to another node, or terminates the
          process.

          (i)    Consult filters attached to the class. If sent to a
                 leafnode, we are done.  Otherwise, restart.

          (ii)   If none of the above returned with an instruction, enqueue
                 at this node.

          This algorithm makes sure that a packet always ends up somewhere,
          even while you are busy building your configuration.


-------------------------------------------------------------------------------------

::

          FIXME


---------------------------------------------------

::

          The root of a HTB qdisc class tree has the following parameters:

          parent major:minor | root
                 This mandatory parameter determines the place of the HTB
                 instance, either at the root of an interface or within an
                 existing class.

          handle major:
                 Like all other qdiscs, the HTB can be assigned a handle.
                 Should consist only of a major number, followed by a
                 colon. Optional, but very useful if classes will be
                 generated within this qdisc.

          default minor-id
                 Unclassified traffic gets sent to the class with this
                 minor-id.

          r2q divisor
                 Divisor used to calculate quantum values for classes.
                 Classes divide rate by this number.  Default value is 10.

          offload
                 Offload the HTB algorithm to hardware (requires driver and
                 device support).


-------------------------------------------------------

::

          Classes have a host of parameters to configure their operation.

          parent major:minor
                 Place of this class within the hierarchy. If attached
                 directly to a qdisc and not to another class, minor can be
                 omitted. Mandatory.

          classid major:minor
                 Like qdiscs, classes can be named. The major number must
                 be equal to the major number of the qdisc to which it
                 belongs. Optional, but needed if this class is going to
                 have children.

          prio priority
                 In the round-robin process, classes with the lowest
                 priority field are tried for packets first.

          rate rate
                 Maximum rate this class and all its children are
                 guaranteed. Mandatory.

          ceil rate
                 Maximum rate at which a class can send, if its parent has
                 bandwidth to spare.  Defaults to the configured rate,
                 which implies no borrowing

          burst bytes
                 Amount of bytes that can be burst at ceil speed, in excess
                 of the configured rate.  Should be at least as high as the
                 highest burst of all children.

          cburst bytes
                 Amount of bytes that can be burst at 'infinite' speed, in
                 other words, as fast as the interface can transmit them.
                 For perfect evening out, should be equal to at most one
                 average packet. Should be at least as high as the highest
                 cburst of all children.

          quantum bytes
                 Number of bytes to serve from this class before the
                 scheduler moves to the next class.  Default value is rate
                 divided by the qdisc r2q parameter.  If specified, r2q is
                 ignored.


---------------------------------------------------

::

          Due to Unix timing constraints, the maximum ceil rate is not
          infinite and may in fact be quite low. On Intel, there are 100
          timer events per second, the maximum rate is that rate at which
          'burst' bytes are sent each timer tick.  From this, the minimum
          burst size for a specified rate can be calculated. For i386, a
          10mbit rate requires a 12 kilobyte burst as 100*12kb*8 equals
          10mbit.


---------------------------------------------------------

::

          tc(8)

          HTB website: http://luxik.cdi.cz/~devik/qos/htb/


-----------------------------------------------------

::

          Martin Devera <devik@cdi.cz>. This manpage maintained by bert
          hubert <ahu@ds9a.nl>

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

   iproute2                     10 January 2002                      HTB(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-cake(8) <../man8/tc-cake.8.html>`__, 
`tc-drr(8) <../man8/tc-drr.8.html>`__, 
`tc-pedit(8) <../man8/tc-pedit.8.html>`__

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
