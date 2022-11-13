.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_list_tstamp_types(3pcap) — Linux manual page
=================================================

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

   PCAP_LIST_TSTAMP_TYPES(3PCAP)              PCAP_LIST_TSTAMP_TYPES(3PCAP)

NAME
-------------------------------------------------

::

          pcap_list_tstamp_types, pcap_free_tstamp_types - get a list of
          time stamp types supported by a capture device, and free that
          list


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_list_tstamp_types(pcap_t *p, int **tstamp_typesp);
          void pcap_free_tstamp_types(int *tstamp_types);


---------------------------------------------------------------

::

          pcap_list_tstamp_types() is used to get a list of the supported
          time stamp types of the interface associated with the pcap
          descriptor.  pcap_list_tstamp_types() allocates an array to hold
          the list and sets *tstamp_typesp to point to the array.  See
          pcap-tstamp(7) for a list of all the time stamp types.

          The caller is responsible for freeing the array with
          pcap_free_tstamp_types(), which frees the list pointed to by
          tstamp_types.


-----------------------------------------------------------------

::

          pcap_list_tstamp_types() returns the number of time stamp types
          in the array on success and PCAP_ERROR on failure.  A return
          value of one means that the only time stamp type supported is the
          one in the list, which is the capture device's default time stamp
          type.  A return value of zero means that the only time stamp type
          supported is PCAP_TSTAMP_HOST, which is the capture device's
          default time stamp type (only older versions of libpcap will
          return that; newer versions will always return one or more
          types).  If PCAP_ERROR is returned, pcap_geterr(3PCAP) or
          pcap_perror(3PCAP) may be called with p as an argument to fetch
          or display the error text.


-------------------------------------------------------------------------------------

::

          These functions became available in libpcap release 1.2.1.  In
          previous releases, the time stamp type cannot be set; only the
          default time stamp type offered by a capture source is available.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_tstamp_type_val_to_name(3PCAP), pcap-tstamp(7)

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

                               8 September 2019PCAP_LIST_TSTAMP_TYPES(3PCAP)

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
