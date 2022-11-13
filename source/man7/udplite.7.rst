.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udplite(7) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UDPLITE(7)              Linux Programmer's Manual             UDPLITE(7)

NAME
-------------------------------------------------

::

          udplite - Lightweight User Datagram Protocol


---------------------------------------------------------

::

          #include <sys/socket.h>

          sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDPLITE);


---------------------------------------------------------------

::

          This is an implementation of the Lightweight User Datagram
          Protocol (UDP-Lite), as described in RFC 3828.

          UDP-Lite is an extension of UDP (RFC 768) to support variable-
          length checksums.  This has advantages for some types of
          multimedia transport that may be able to make use of slightly
          damaged datagrams, rather than having them discarded by lower-
          layer protocols.

          The variable-length checksum coverage is set via a setsockopt(2)
          option.  If this option is not set, the only difference from UDP
          is in using a different IP protocol identifier (IANA number 136).

          The UDP-Lite implementation is a full extension of udp(7)—that
          is, it shares the same API and API behavior, and in addition
          offers two socket options to control the checksum coverage.

      Address format
          UDP-Litev4 uses the sockaddr_in address format described in
          ip(7).  UDP-Litev6 uses the sockaddr_in6 address format described
          in ipv6(7).

      Socket options
          To set or get a UDP-Lite socket option, call getsockopt(2) to
          read or setsockopt(2) to write the option with the option level
          argument set to IPPROTO_UDPLITE.  In addition, all IPPROTO_UDP
          socket options are valid on a UDP-Lite socket.  See udp(7) for
          more information.

          The following two options are specific to UDP-Lite.

          UDPLITE_SEND_CSCOV
                 This option sets the sender checksum coverage and takes an
                 int as argument, with a checksum coverage value in the
                 range 0..2^16-1.

                 A value of 0 means that the entire datagram is always
                 covered.  Values from 1-7 are illegal (RFC 3828, 3.1) and
                 are rounded up to the minimum coverage of 8.

                 With regard to IPv6 jumbograms (RFC 2675), the UDP-Litev6
                 checksum coverage is limited to the first 2^16-1 octets,
                 as per RFC 3828, 3.5.  Higher values are therefore
                 silently truncated to 2^16-1.  If in doubt, the current
                 coverage value can always be queried using getsockopt(2).

          UDPLITE_RECV_CSCOV
                 This is the receiver-side analogue and uses the same
                 argument format and value range as UDPLITE_SEND_CSCOV.
                 This option is not required to enable traffic with partial
                 checksum coverage.  Its function is that of a traffic
                 filter: when enabled, it instructs the kernel to drop all
                 packets which have a coverage less than the specified
                 coverage value.

                 When the value of UDPLITE_RECV_CSCOV exceeds the actual
                 packet coverage, incoming packets are silently dropped,
                 but may generate a warning message in the system log.


-----------------------------------------------------

::

          All errors documented for udp(7) may be returned.  UDP-Lite does
          not add further errors.


---------------------------------------------------

::

          /proc/net/snmp
                 Basic UDP-Litev4 statistics counters.

          /proc/net/snmp6
                 Basic UDP-Litev6 statistics counters.


---------------------------------------------------------

::

          UDP-Litev4/v6 first appeared in Linux 2.6.20.


-------------------------------------------------

::

          Where glibc support is missing, the following definitions are
          needed:

              #define IPPROTO_UDPLITE     136
              #define UDPLITE_SEND_CSCOV  10
              #define UDPLITE_RECV_CSCOV  11


---------------------------------------------------------

::

          ip(7), ipv6(7), socket(7), udp(7)

          RFC 3828 for the Lightweight User Datagram Protocol (UDP-Lite).

          Documentation/networking/udplite.txt in the Linux kernel source
          tree

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     UDPLITE(7)

--------------

Pages that refer to this page: `ip(7) <../man7/ip.7.html>`__, 
`udp(7) <../man7/udp.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/udplite.7.license.html>`__

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
