.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_activate(3pcap) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_ACTIVATE(3PCAP)                                PCAP_ACTIVATE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_activate - activate a capture handle


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_activate(pcap_t *p);


---------------------------------------------------------------

::

          pcap_activate() is used to activate a packet capture handle to
          look at packets on the network, with the options that were set on
          the handle being in effect.


-----------------------------------------------------------------

::

          pcap_activate() returns 0 on success without warnings, a non-zero
          positive value on success with warnings, and a negative value on
          error.  A non-zero return value indicates what warning or error
          condition occurred.

          The possible warning values are:

          PCAP_WARNING_PROMISC_NOTSUP
                 Promiscuous mode was requested, but the capture source
                 doesn't support promiscuous mode.

          PCAP_WARNING_TSTAMP_TYPE_NOTSUP
                 The time stamp type specified in a previous
                 pcap_set_tstamp_type(3PCAP) call isn't supported by the
                 capture source (the time stamp type is left as the
                 default),

          PCAP_WARNING
                 Another warning condition occurred; pcap_geterr(3PCAP) or
                 pcap_perror(3PCAP) may be called with p as an argument to
                 fetch or display a message describing the warning
                 condition.

          The possible error values are:

          PCAP_ERROR_ACTIVATED
                 The handle has already been activated.

          PCAP_ERROR_NO_SUCH_DEVICE
                 The capture source specified when the handle was created
                 doesn't exist.

          PCAP_ERROR_PERM_DENIED
                 The process doesn't have permission to open the capture
                 source.

          PCAP_ERROR_PROMISC_PERM_DENIED
                 The process has permission to open the capture source but
                 doesn't have permission to put it into promiscuous mode.

          PCAP_ERROR_RFMON_NOTSUP
                 Monitor mode was specified but the capture source doesn't
                 support monitor mode.

          PCAP_ERROR_IFACE_NOT_UP
                 The capture source device is not up.

          PCAP_ERROR
                 Another error occurred.  pcap_geterr() or pcap_perror()
                 may be called with p as an argument to fetch or display a
                 message describing the error.

          If PCAP_WARNING_PROMISC_NOTSUP, PCAP_ERROR_NO_SUCH_DEVICE, or
          PCAP_ERROR_PERM_DENIED is returned, pcap_geterr() or
          pcap_perror() may be called with p as an argument to fetch or
          display an message giving additional details about the problem
          that might be useful for debugging the problem if it's
          unexpected.

          Additional warning and error codes may be added in the future; a
          program should check for positive, negative, and zero return
          codes, and treat all positive return codes as warnings and all
          negative return codes as errors.  pcap_statustostr(3PCAP) can be
          called, with a warning or error code as an argument, to fetch a
          message describing the warning or error code.

          If pcap_activate() fails, the pcap_t * is not closed and freed;
          it should be closed using pcap_close().


---------------------------------------------------------

::

          pcap(3PCAP)

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

                               24 November 2019        PCAP_ACTIVATE(3PCAP)

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
