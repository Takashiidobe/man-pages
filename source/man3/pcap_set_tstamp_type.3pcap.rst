.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_set_tstamp_type(3pcap) — Linux manual page
===============================================

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

   PCAP_SET_TSTAMP_TYPE(3PCAP)                  PCAP_SET_TSTAMP_TYPE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_set_tstamp_type - set the time stamp type to be used by a
          capture device


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_set_tstamp_type(pcap_t *p, int tstamp_type);


---------------------------------------------------------------

::

          pcap_set_tstamp_type() sets the type of time stamp desired for
          packets captured on the pcap descriptor to the type specified by
          tstamp_type.  It must be called on a pcap descriptor created by
          pcap_create(3PCAP) that has not yet been activated by
          pcap_activate(3PCAP).  pcap_list_tstamp_types(3PCAP) will give a
          list of the time stamp types supported by a given capture device.
          See pcap-tstamp(7) for a list of all the time stamp types.


-----------------------------------------------------------------

::

          pcap_set_tstamp_type() returns 0 on success if the specified time
          stamp type is expected to be supported by the capture device,
          PCAP_WARNING_TSTAMP_TYPE_NOTSUP if the specified time stamp type
          is not supported by the capture device, PCAP_ERROR_ACTIVATED if
          called on a capture handle that has been activated, and
          PCAP_ERROR_CANTSET_TSTAMP_TYPE if the capture device doesn't
          support setting the time stamp type (only older versions of
          libpcap will return that; newer versions will always allow the
          time stamp type to be set to the default type).


-------------------------------------------------------------------------------------

::

          This function became available in libpcap release 1.2.1.  In
          previous releases, the time stamp type cannot be set; only the
          default time stamp type offered by a capture source is available.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_tstamp_type_name_to_val(3PCAP)

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

                               8 September 2019 PCAP_SET_TSTAMP_TYPE(3PCAP)

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
