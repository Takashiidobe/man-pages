.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tracepath(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SECURITY <#SECURITY>`__ \|       |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TRACEPATH(8)                     iputils                    TRACEPATH(8)

NAME
-------------------------------------------------

::

          tracepath - traces path to a network host discovering MTU along
          this path


---------------------------------------------------------

::

          tracepath [-4] [-6] [-n] [-b] [-l pktlen] [-m max_hops] [-p port]
                    [-V] {destination}


---------------------------------------------------------------

::

          It traces the network path to destination discovering MTU along
          this path. It uses UDP port port or some random port. It is
          similar to traceroute. However, it does not require superuser
          privileges and has no fancy options.

          tracepath -6 is a good replacement for traceroute6 and classic
          example of application of Linux error queues. The situation with
          IPv4 is worse, because commercial IP routers do not return enough
          information in ICMP error messages. Probably, it will change,
          when they are updated. For now it uses Van Jacobson's trick,
          sweeping a range of UDP ports to maintain trace history.


-------------------------------------------------------

::

          -4
              Use IPv4 only.

          -6
              Use IPv6 only.

          -n
              Print primarily IP addresses numerically.

          -b
              Print both: Host names and IP addresses.

          -l
              Sets the initial packet length to pktlen instead of 65535 for
              IPv4 or 128000 for IPv6.

          -m
              Set maximum hops (or maximum TTLs) to max_hops instead of 30.

          -p
              Sets the initial destination port to use.

          -V
              Print version and exit.


-----------------------------------------------------

::

              root@mops:~ # tracepath -6 3ffe:2400:0:109::2
               1?: [LOCALHOST]                              pmtu 1500
               1:  dust.inr.ac.ru                   0.411ms
               2:  dust.inr.ac.ru        asymm  1   0.390ms pmtu 1480
               2:  3ffe:2400:0:109::2               463.514ms reached
                   Resume: pmtu 1480 hops 2 back 2

          The first column shows the TTL of the probe, followed by colon.
          Usually the value of TTL is obtained from the reply from the
          network, but sometimes it does not contain the necessary
          information and we have to guess it. In this case the number is
          followed by ?.

          The second column shows the network hop which replied to the
          probe. It is either the address of the router or the word
          [LOCALHOST], if the probe was not sent to the network.

          The rest of the line shows miscellaneous information about the
          path to the corresponding network hop. It contains the value of
          RTT, and additionally it can show Path MTU when it changes. If
          the path is asymmetric or the probe finishes before it reaches
          the prescribed hop, the difference between number of hops in
          forward and return direction is shown next to the keyword
          "async". This information is not reliable, e.g. the third line
          shows asymmetry of 1. This is because the first probe with TTL of
          2 was rejected at the first hop due to Path MTU Discovery.

          The last line summarizes information about all the paths to the
          destination. It shows detected Path MTU, amount of hops to the
          destination and our guess about the number of hops from the
          destination to us, which can be different when the path is
          asymmetric.


---------------------------------------------------------

::

          traceroute(8), traceroute6(8), ping(8).


-----------------------------------------------------

::

          tracepath was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.


---------------------------------------------------------

::

          No security issues.

          This lapidary deserves to be elaborated.  tracepath is not a
          privileged program, unlike traceroute, ping and other beasts of
          their kind.  tracepath may be executed by everyone who has enough
          access to the network to send UDP datagrams to the desired
          destination using the given port.


-----------------------------------------------------------------

::

          tracepath is part of iputils package.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iputils (IP utilities) project.
          Information about the project can be found at 
          ⟨http://www.skbuff.net/iputils/⟩.  If you have a bug report for
          this manual page, send it to yoshfuji@skbuff.net,
          netdev@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/iputils/iputils.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iputils 20210722                                            TRACEPATH(8)

--------------

Pages that refer to this page: `ip(7) <../man7/ip.7.html>`__, 
`arping(8) <../man8/arping.8.html>`__, 
`clockdiff(8) <../man8/clockdiff.8.html>`__

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
