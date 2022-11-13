.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sockatmark(3p) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SOCKATMARK(3P)          POSIX Programmer's Manual         SOCKATMARK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sockatmark — determine whether a socket is at the out-of-band
          mark


---------------------------------------------------------

::

          #include <sys/socket.h>

          int sockatmark(int s);


---------------------------------------------------------------

::

          The sockatmark() function shall determine whether the socket
          specified by the descriptor s is at the out-of-band data mark
          (see Section 2.10.12, Socket Out-of-Band Data State).  If the
          protocol for the socket supports out-of-band data by marking the
          stream with an out-of-band data mark, the sockatmark() function
          shall return 1 when all data preceding the mark has been read and
          the out-of-band data mark is the first element in the receive
          queue. The sockatmark() function shall not remove the mark from
          the stream.


-----------------------------------------------------------------

::

          Upon successful completion, the sockatmark() function shall
          return a value indicating whether the socket is at an out-of-band
          data mark. If the protocol has marked the data stream and all
          data preceding the mark has been read, the return value shall be
          1; if there is no mark, or if data precedes the mark in the
          receive queue, the sockatmark() function shall return 0.
          Otherwise, it shall return a value of -1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          The sockatmark() function shall fail if:

          EBADF  The s argument is not a valid file descriptor.

          ENOTTY The file associated with the s argument is not a socket.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The use of this function between receive operations allows an
          application to determine which received data precedes the out-of-
          band data and which follows the out-of-band data.

          There is an inherent race condition in the use of this function.
          On an empty receive queue, the current read of the location might
          well be at the ``mark'', but the system has no way of knowing
          that the next data segment that will arrive from the network will
          carry the mark, and sockatmark() will return false, and the next
          read operation will silently consume the mark.

          Hence, this function can only be used reliably when the
          application already knows that the out-of-band data has been seen
          by the system or that it is known that there is data waiting to
          be read at the socket (via SIGURG or select()).  See Section
          2.10.11, Socket Receive Queue, Section 2.10.12, Socket Out-of-
          Band Data State, Section 2.10.14, Signals, and pselect() for
          details.


-----------------------------------------------------------

::

          The sockatmark() function replaces the historical SIOCATMARK
          command to ioctl() which implemented the same functionality on
          many implementations. Using a wrapper function follows the
          adopted conventions to avoid specifying commands to the ioctl()
          function, other than those now included to support XSI STREAMS.
          The sockatmark() function could be implemented as follows:

              #include <sys/ioctl.h>

              int sockatmark(int s)
              {
                  int val;
                  if (ioctl(s,SIOCATMARK,&val)==-1)
                      return(-1);
                  return(val);
              }

          The use of [ENOTTY] to indicate an incorrect descriptor type
          matches the historical behavior of SIOCATMARK.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.10.12, Socket Out-of-Band Data State, pselect(3p),
          recv(3p), recvmsg(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_socket.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                    SOCKATMARK(3P)

--------------

Pages that refer to this page:
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__

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
