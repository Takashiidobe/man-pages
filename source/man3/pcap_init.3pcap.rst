.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_init(3pcap) — Linux manual page
====================================

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

   PCAP_INIT(3PCAP)                                        PCAP_INIT(3PCAP)

NAME
-------------------------------------------------

::

          pcap_init - initialize the library


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          char errbuf[PCAP_ERRBUF_SIZE];

          int pcap_init(unsigned int opts, char *errbuf);


---------------------------------------------------------------

::

          pcap_init() is used to initialize the Packet Capture library.
          opts specifies options for the library; currently, the options
          are:

          PCAP_CHAR_ENC_LOCAL
                 Treat all strings supplied as arguments, and return all
                 strings to the caller, as being in the local character
                 encoding.

          PCAP_CHAR_ENC_UTF_8
                 Treat all strings supplied as arguments, and return all
                 strings to the caller, as being in UTF-8.

          On UNIX-like systems, the local character encoding is assumed to
          be UTF-8, so no character encoding transformations are done.

          On Windows, the local character encoding is the local ANSI code
          page.

          If pcap_init() is not called, strings are treated as being in the
          local ANSI code page on Windows, pcap_lookupdev(3PCAP) will
          succeed if there is a device on which to capture, and
          pcap_create(3PCAP) makes an attempt to check whether the string
          passed as an argument is a UTF-16LE string - note that this
          attempt is unsafe, as it may run past the end of the string - to
          handle pcap_lookupdev() returning a UTF-16LE string. Programs
          that don't call pcap_init() should, on Windows, call
          pcap_wsockinit() to initialize Winsock; this is not necessary if
          pcap_init() is called, as pcap_init() will initialize Winsock
          itself on Windows.


-----------------------------------------------------------------

::

          pcap_init() returns 0 on success and -1 on failure.  If -1 is
          returned, errbuf is filled in with an appropriate error message.
          errbuf is assumed to be able to hold at least PCAP_ERRBUF_SIZE
          chars.


-------------------------------------------------------------------------------------

::

          This function became available in libpcap release 1.10.0.  In
          previous releases, on Windows, all strings supplied as arguments,
          and all strings returned to the caller, are in the local
          character encoding.


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

                                 11 April 2020             PCAP_INIT(3PCAP)

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
