.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_get_required_select_timeout(3pcap) — Linux manual page
===========================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \|                                |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_GET_REQUIRED_SELECT_TIMEOUT(3PCAP)ET_REQUIRED_SELECT_TIMEOUT(3PCAP)

NAME
-------------------------------------------------

::

          pcap_get_required_select_timeout - get a timeout to be used when
          doing select() for a live capture


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          const struct timeval *pcap_get_required_select_timeout(pcap_t *p);


---------------------------------------------------------------

::

          pcap_get_required_select_timeout() returns, on UNIX, a pointer to
          a struct timeval containing a value that must be used as the
          minimum timeout in select(2), poll(2), epoll_wait(2), and
          kevent(2) calls, or NULL if there is no such timeout.  If a non-
          NULL value is returned, it must be used regardless of whether
          pcap_get_selectable_fd(3PCAP) returns -1 for any descriptor on
          which those calls are being done.
          pcap_get_required_select_timeout() should be called for all
          pcap_ts before a call to select(), poll(), epoll_wait(), or
          kevent(), and any timeouts used for those calls should be updated
          as appropriate given the new value of the timeout.

          For kevent(), one EVFILT_TIMER filter per selectable descriptor
          can be used, rather than using the timeout argument to kevent();
          if the EVFILT_TIMER event for a particular selectable descriptor
          signals an event, pcap_dispatch(3PCAP) should be called for the
          corresponding pcap_t.

          On Linux systems with timerfd_create(2), one timer object created
          by timerfd_create() per selectable descriptor can be used, rather
          than using the timeout argument to epoll_wait(); if the timer
          object for a particular selectable descriptor signals an event,
          pcap_dispatch(3PCAP) should be called for the corresponding
          pcap_t.

          Otherwise, a timeout value no larger than the smallest of all
          timeouts returned by pcap_get_required_select_timeout() for
          devices from which packets will be captured and any other
          timeouts to be used in the call should be used as the timeout for
          the call, and, when the call returns, pcap_dispatch(3PCAP) should
          be called for all pcap_ts for which a non-NULL timeout was
          returned, regardless of whether it's indicated as having anything
          to read from it or not.

          All devices with a non-NULL timeout must be put in non-blocking
          mode with pcap_setnonblock(3PCAP).

          Note that a device on which a read can be done without blocking
          may, on some platforms, not have any packets to read if the
          packet buffer timeout has expired.  A call to pcap_dispatch() or
          pcap_next_ex(3PCAP) will return 0 in this case, but will not
          block.

          pcap_get_required_select_timeout() is not available on Windows.


-----------------------------------------------------------------

::

          A pointer to a struct timeval is returned if the timeout is
          required; otherwise NULL is returned.


-------------------------------------------------------------------------------------

::

          This function became available in libpcap release 1.9.0.  In
          previous releases, select(), poll(), epoll_wait(), and kevent()
          cannot be used on any capture source for which
          pcap_get_selectable_fd() returns -1.

          In libpcap release 1.10.0 and later, the timeout value can change
          from call to call, so pcap_get_required_select_timeout() must be
          called before each call to select(), poll(), epoll_wait(), or
          kevent(), and the new value must be used to calculate timeouts
          for the call.  Code that does that will also work with libpcap
          1.9.x releases, so code using pcap_get_required_select_timeout()
          should be changed to call it for each call to select(), poll(),
          epoll_wait(), or kevent() even if the code must also work with
          libpcap 1.9.x.

.. _backward-compatibility-top-1:


-------------------------------------------------------------------------------------

::

          This function became available in libpcap release 1.9.0.  In
          previous releases, select(), poll(), epoll_wait(), and kevent()
          could not be used for devices that don't provide a selectable
          file descriptor.


---------------------------------------------------------

::

          pcap(3PCAP), pcap_get_selectable_fd(3PCAP), select(2), poll(2),
          epoll_wait(2), kqueue(2)

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

                                29 JaPnCuAaPr_yGE2T0_2R0EQUIRED_SELECT_TIMEOUT(3PCAP)

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
