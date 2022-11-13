.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_set_immediate_mode(3pcap) — Linux manual page
==================================================

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

   PCAP_SET_IMMEDIATE_MODE(3PCAP)            PCAP_SET_IMMEDIATE_MODE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_set_immediate_mode - set immediate mode for a not-yet-
          activated capture handle


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_set_immediate_mode(pcap_t *p, int immediate_mode);


---------------------------------------------------------------

::

          pcap_set_immediate_mode() sets whether immediate mode should be
          set on a capture handle when the handle is activated.  In
          immediate mode, packets are always delivered as soon as they
          arrive, with no buffering.  If immediate_mode is non-zero,
          immediate mode will be set, otherwise it will not be set.


-----------------------------------------------------------------

::

          pcap_set_immediate_mode() returns 0 on success or
          PCAP_ERROR_ACTIVATED if called on a capture handle that has been
          activated.


-------------------------------------------------------------------------------------

::

          This function became available in libpcap release 1.5.0.  In
          previous releases, if immediate delivery of packets is required:

                 on FreeBSD, NetBSD, OpenBSD, DragonFly BSD, macOS, and
                 Solaris 11, immediate mode must be turned on with a
                 BIOCIMMEDIATE ioctl(2), as documented in bpf(4), on the
                 descriptor returned by pcap_fileno(3PCAP), after
                 pcap_activate(3PCAP) is called;

                 on Solaris 10 and earlier versions of Solaris, immediate
                 mode must be turned on by using a read timeout of 0 when
                 opening the device (this will not provide immediate
                 delivery of packets on other platforms, so don't assume
                 it's sufficient);

                 on Digital UNIX/Tru64 UNIX, immediate mode must be turned
                 on by doing a BIOCMBIC ioctl, as documented in
                 packetfilter(7), to clear the ENBATCH flag on the
                 descriptor returned by pcap_fileno(3PCAP), after
                 pcap_activate(3PCAP) is called;

                 on Windows, immediate mode must be turned on by calling
                 pcap_setmintocopy() with a size of 0.

          On Linux, with previous releases of libpcap, capture devices are
          always in immediate mode; however, in 1.5.0 and later, they are,
          by default, not in immediate mode, so if
          pcap_set_immediate_mode() is available, it should be used.

          On other platforms, capture devices are always in immediate mode.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_create(3PCAP), pcap_activate(3PCAP)

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

                                23 August 2018PCAP_SET_IMMEDIATE_MODE(3PCAP)

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
