.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_datalink_val_to_name(3pcap) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_DATALINK_VAL_TO_NAME(3PCAP)        PCAP_DATALINK_VAL_TO_NAME(3PCAP)

NAME
-------------------------------------------------

::

          pcap_datalink_val_to_name, pcap_datalink_val_to_description,
          pcap_datalink_val_to_description_or_dlt - get a name or
          description for a link-layer header type value


---------------------------------------------------------

::

          #include <pcap.h>

          const char *pcap_datalink_val_to_name(int dlt);
          const char *pcap_datalink_val_to_description(int dlt);
          const char *pcap_datalink_val_to_description_or_dlt(int dlt);


---------------------------------------------------------------

::

          pcap_datalink_val_to_name() translates a link-layer header type
          value to the corresponding link-layer header type name, which is
          the DLT_ name for the link-layer header type value with the DLT_
          removed.  NULL is returned if the type value does not correspond
          to a known DLT_ value.

          pcap_datalink_val_to_description() translates a link-layer header
          type value to a short description of that link-layer header type.
          NULL is returned if the type value does not correspond to a known
          DLT_ value.

          pcap_datalink_val_to_description_or_dlt() translates a link-layer
          header type value to a short description of that link-layer
          header type just like pcap_datalink_val_to_description().  If the
          type value does not correspond to a known DLT_ value, the string
          "DLT n" is returned, where n is the value of the dlt argument.


-------------------------------------------------------------------------------------

::

          The pcap_datalink_val_to_description_or_dlt() function first
          became available in libpcap release 1.10.0.  In previous
          releases, pcap_datalink_val_to_description() would have to be
          called and, if it returned NULL, a default string would have to
          be constructed.


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

                                 15 April 20P1C9AP_DATALINK_VAL_TO_NAME(3PCAP)

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
