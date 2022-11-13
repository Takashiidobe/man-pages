.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

arping(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SECURITY <#SECURITY>`__ \|       |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARPING(8)                        iputils                       ARPING(8)

NAME
-------------------------------------------------

::

          arping - send ARP REQUEST to a neighbour host


---------------------------------------------------------

::

          arping [-AbDfhqUV] [-c count] [-w deadline] [-i interval]
                 [-s source] [-I interface] {destination}


---------------------------------------------------------------

::

          Ping destination on device interface by ARP packets, using source
          address source.


-------------------------------------------------------

::

          -A
              The same as -U, but ARP REPLY packets used instead of ARP
              REQUEST.

          -b
              Send only MAC level broadcasts. Normally arping starts from
              sending broadcast, and switch to unicast after reply
              received.

          -c count
              Stop after sending count ARP REQUEST packets. With deadline
              option, instead wait for count ARP REPLY packets, or until
              the timeout expires.

          -D
              Duplicate address detection mode (DAD). See RFC2131, 4.4.1.
              Returns 0, if DAD succeeded i.e. no replies are received.

          -f
              Finish after the first reply confirming that target is alive.

          -I interface
              Name of network device where to send ARP REQUEST packets.

          -h
              Print help page and exit.

          -q
              Quiet output. Nothing is displayed.

          -s source
              IP source address to use in ARP packets. If this option is
              absent, source address is:

                  • In DAD mode (with option -D) set to 0.0.0.0.

                  • In Unsolicited ARP mode (with options -U or -A) set to
                  destination.

                  • Otherwise, it is calculated from routing tables.

          -U
              Unsolicited ARP mode to update neighbours' ARP caches. No
              replies are expected.

          -V
              Print version of the program and exit.

          -w deadline
              Specify a timeout, in seconds, before arping exits regardless
              of how many packets have been sent or received. In this case
              arping does not stop after count packet are sent, it waits
              either for deadline expire or until count probes are
              answered.

          -i interval
              Specify an interval, in seconds, between packets.


---------------------------------------------------------

::

          ping(8), clockdiff(8), tracepath(8).


-----------------------------------------------------

::

          arping was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.


---------------------------------------------------------

::

          arping requires CAP_NET_RAW capability to be executed. It is not
          recommended to be used as set-uid root, because it allows user to
          modify ARP caches of neighbour hosts.


-----------------------------------------------------------------

::

          arping is part of iputils package.

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

   iputils 20210722                                               ARPING(8)

--------------

Pages that refer to this page:
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
