.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_breakloop(3pcap) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_BREAKLOOP(3PCAP)                              PCAP_BREAKLOOP(3PCAP)

NAME
-------------------------------------------------

::

          pcap_breakloop - force a pcap_dispatch() or pcap_loop() call to
          return


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          void pcap_breakloop(pcap_t *);


---------------------------------------------------------------

::

          pcap_breakloop() sets a flag that will force pcap_dispatch(3PCAP)
          or pcap_loop(3PCAP) to return rather than looping; they will
          return the number of packets that have been processed so far, or
          PCAP_ERROR_BREAK if no packets have been processed so far.

          This routine is safe to use inside a signal handler on UNIX or a
          console control handler on Windows, as it merely sets a flag that
          is checked within the loop.

          The flag is checked in loops reading packets from the OS - a
          signal by itself will not necessarily terminate those loops - as
          well as in loops processing a set of packets returned by the OS.
          Note that if you are catching signals on UNIX systems that
          support restarting system calls after a signal, and calling
          pcap_breakloop() in the signal handler, you must specify, when
          catching those signals, that system calls should NOT be restarted
          by that signal.  Otherwise, if the signal interrupted a call
          reading packets in a live capture, when your signal handler
          returns after calling pcap_breakloop(), the call will be
          restarted, and the loop will not terminate until more packets
          arrive and the call completes.

          Note also that, in a multi-threaded application, if one thread is
          blocked in pcap_dispatch(), pcap_loop(), pcap_next(3PCAP), or
          pcap_next_ex(3PCAP), a call to pcap_breakloop() in a different
          thread will not unblock that thread.  You will need to use
          whatever mechanism the OS provides for breaking a thread out of
          blocking calls in order to unblock the thread, such as thread
          cancellation or thread signalling in systems that support POSIX
          threads, or SetEvent() on the result of pcap_getevent() on a
          pcap_t on which the thread is blocked on Windows.  Asynchronous
          procedure calls will not work on Windows, as a thread blocked on
          a pcap_t will not be in an alertable state.

          Note that pcap_next() and pcap_next_ex() will, on some platforms,
          loop reading packets from the OS; that loop will not necessarily
          be terminated by a signal, so pcap_breakloop() should be used to
          terminate packet processing even if pcap_next() or pcap_next_ex()
          is being used.

          pcap_breakloop() does not guarantee that no further packets will
          be processed by pcap_dispatch() or pcap_loop() after it is
          called; at most one more packet might be processed.

          If PCAP_ERROR_BREAK is returned from pcap_dispatch() or
          pcap_loop(), the flag is cleared, so a subsequent call will
          resume reading packets.  If a positive number is returned, the
          flag is not cleared, so a subsequent call will return
          PCAP_ERROR_BREAK and clear the flag.


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

                                 25 July 2018         PCAP_BREAKLOOP(3PCAP)

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
