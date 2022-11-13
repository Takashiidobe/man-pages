.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_setnonblock(3pcap) — Linux manual page
===========================================

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

   PCAP_SETNONBLOCK(3PCAP)                          PCAP_SETNONBLOCK(3PCAP)

NAME
-------------------------------------------------

::

          pcap_setnonblock, pcap_getnonblock - set or get the state of non-
          blocking mode on a capture device


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          char errbuf[PCAP_ERRBUF_SIZE];

          int pcap_setnonblock(pcap_t *p, int nonblock, char *errbuf);
          int pcap_getnonblock(pcap_t *p, char *errbuf);


---------------------------------------------------------------

::

          pcap_setnonblock() puts a capture handle into ``non-blocking''
          mode, or takes it out of ``non-blocking'' mode, depending on
          whether the nonblock argument is non-zero or zero.  It has no
          effect on ``savefiles''.  If there is an error, PCAP_ERROR is
          returned and errbuf is filled in with an appropriate error
          message; otherwise, 0 is returned.

          In ``non-blocking'' mode, an attempt to read from the capture
          descriptor with pcap_dispatch(3PCAP) and pcap_next_ex(3PCAP)
          will, if no packets are currently available to be read, return 0
          immediately rather than blocking waiting for packets to arrive.

          pcap_loop(3PCAP) will loop forever, consuming CPU time when no
          packets are currently available; pacp_dispatch() should be used
          instead.  pcap_next(3PCAP) will return NULL if there are no
          packets currently available to read; this is indistinguishable
          from an error, so pcap_next_ex() should be used instead.

          When first activated with pcap_activate(3PCAP) or opened with
          pcap_open_live(3PCAP), a capture handle is not in ``non-blocking
          mode''; a call to pcap_setnonblock() is required in order to put
          it into ``non-blocking'' mode.


-----------------------------------------------------------------

::

          pcap_getnonblock() returns the current ``non-blocking'' state of
          the capture descriptor; it always returns 0 on ``savefiles''.  If
          there is an error, PCAP_ERROR is returned and errbuf is filled in
          with an appropriate error message.

          errbuf is assumed to be able to hold at least PCAP_ERRBUF_SIZE
          chars.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_next_ex(3PCAP), pcap_geterr(3PCAP)

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

                                 25 July 2018       PCAP_SETNONBLOCK(3PCAP)

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
