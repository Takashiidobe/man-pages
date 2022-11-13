.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_compile(3pcap) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_COMPILE(3PCAP)                                  PCAP_COMPILE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_compile - compile a filter expression


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_compile(pcap_t *p, struct bpf_program *fp,
                  const char *str, int optimize, bpf_u_int32 netmask);


---------------------------------------------------------------

::

          pcap_compile() is used to compile the string str into a filter
          program.  See pcap-filter(7) for the syntax of that string.
          program is a pointer to a bpf_program struct and is filled in by
          pcap_compile().  optimize controls whether optimization on the
          resulting code is performed.  netmask specifies the IPv4 netmask
          of the network on which packets are being captured; it is used
          only when checking for IPv4 broadcast addresses in the filter
          program.  If the netmask of the network on which packets are
          being captured isn't known to the program, or if packets are
          being captured on the Linux "any" pseudo-interface that can
          capture on more than one network, a value of PCAP_NETMASK_UNKNOWN
          can be supplied; tests for IPv4 broadcast addresses will fail to
          compile, but all other tests in the filter program will be OK.

          NOTE: in libpcap 1.8.0 and later, pcap_compile() can be used in
          multiple threads within a single process.  However, in earlier
          versions of libpcap, it is not safe to use pcap_compile() in
          multiple threads in a single process without some form of mutual
          exclusion allowing only one thread to call it at any given time.


-----------------------------------------------------------------

::

          pcap_compile() returns 0 on success and PCAP_ERROR on failure. If
          PCAP_ERROR is returned, pcap_geterr(3PCAP) or pcap_perror(3PCAP)
          may be called with p as an argument to fetch or display the error
          text.


-------------------------------------------------------------------------------------

::

          The PCAP_NETMASK_UNKNOWN constant became available in libpcap
          release 1.1.0.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_setfilter(3PCAP), pcap_freecode(3PCAP)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libpcap (packet capture library)
          project.  Information about the project can be found at 
          ⟨http://www.tcpdump.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.tcpdump.org/#patches⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨https://github.com/the-tcpdump-group/libpcap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                22 August 2018          PCAP_COMPILE(3PCAP)

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
