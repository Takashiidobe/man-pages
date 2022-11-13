.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

poll(3p) — Linux manual page
============================

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

   POLL(3P)                POSIX Programmer's Manual               POLL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          poll — input/output multiplexing


---------------------------------------------------------

::

          #include <poll.h>

          int poll(struct pollfd fds[], nfds_t nfds, int timeout);


---------------------------------------------------------------

::

          The poll() function provides applications with a mechanism for
          multiplexing input/output over a set of file descriptors. For
          each member of the array pointed to by fds, poll() shall examine
          the given file descriptor for the event(s) specified in events.
          The number of pollfd structures in the fds array is specified by
          nfds.  The poll() function shall identify those file descriptors
          on which an application can read or write data, or on which
          certain events have occurred.

          The fds argument specifies the file descriptors to be examined
          and the events of interest for each file descriptor. It is a
          pointer to an array with one member for each open file descriptor
          of interest. The array's members are pollfd structures within
          which fd specifies an open file descriptor and events and revents
          are bitmasks constructed by OR'ing a combination of the following
          event flags:

          POLLIN      Data other than high-priority data may be read
                      without blocking.

                      For STREAMS, this flag is set in revents even if the
                      message is of zero length. This flag shall be
                      equivalent to POLLRDNORM | POLLRDBAND.

          POLLRDNORM  Normal data may be read without blocking.

                      For STREAMS, data on priority band 0 may be read
                      without blocking. This flag is set in revents even if
                      the message is of zero length.

          POLLRDBAND  Priority data may be read without blocking.

                      For STREAMS, data on priority bands greater than 0
                      may be read without blocking. This flag is set in
                      revents even if the message is of zero length.

          POLLPRI     High-priority data may be read without blocking.

                      For STREAMS, this flag is set in revents even if the
                      message is of zero length.

          POLLOUT     Normal data may be written without blocking.

                      For STREAMS, data on priority band 0 may be written
                      without blocking.

          POLLWRNORM  Equivalent to POLLOUT.

          POLLWRBAND  Priority data may be written.

                      For STREAMS, data on priority bands greater than 0
                      may be written without blocking. If any priority band
                      has been written to on this STREAM, this event only
                      examines bands that have been written to at least
                      once.

          POLLERR     An error has occurred on the device or stream. This
                      flag is only valid in the revents bitmask; it shall
                      be ignored in the events member.

          POLLHUP     A device has been disconnected, or a pipe or FIFO has
                      been closed by the last process that had it open for
                      writing. Once set, the hangup state of a FIFO shall
                      persist until some process opens the FIFO for writing
                      or until all read-only file descriptors for the FIFO
                      are closed. This event and POLLOUT are mutually-
                      exclusive; a stream can never be writable if a hangup
                      has occurred. However, this event and POLLIN,
                      POLLRDNORM, POLLRDBAND, or POLLPRI are not mutually-
                      exclusive. This flag is only valid in the revents
                      bitmask; it shall be ignored in the events member.

          POLLNVAL    The specified fd value is invalid. This flag is only
                      valid in the revents member; it shall ignored in the
                      events member.

          The significance and semantics of normal, priority, and high-
          priority data are file and device-specific.

          If the value of fd is less than 0, events shall be ignored, and
          revents shall be set to 0 in that entry on return from poll().

          In each pollfd structure, poll() shall clear the revents member,
          except that where the application requested a report on a
          condition by setting one of the bits of events listed above,
          poll() shall set the corresponding bit in revents if the
          requested condition is true. In addition, poll() shall set the
          POLLHUP, POLLERR, and POLLNVAL flag in revents if the condition
          is true, even if the application did not set the corresponding
          bit in events.

          If none of the defined events have occurred on any selected file
          descriptor, poll() shall wait at least timeout milliseconds for
          an event to occur on any of the selected file descriptors. If the
          value of timeout is 0, poll() shall return immediately. If the
          value of timeout is -1, poll() shall block until a requested
          event occurs or until the call is interrupted.

          Implementations may place limitations on the granularity of
          timeout intervals. If the requested timeout interval requires a
          finer granularity than the implementation supports, the actual
          timeout interval shall be rounded up to the next supported value.

          The poll() function shall not be affected by the O_NONBLOCK flag.

          The poll() function shall support regular files, terminal and
          pseudo-terminal devices, FIFOs, pipes, sockets and STREAMS-based
          files.  The behavior of poll() on elements of fds that refer to
          other types of file is unspecified.

          Regular files shall always poll TRUE for reading and writing.

          A file descriptor for a socket that is listening for connections
          shall indicate that it is ready for reading, once connections are
          available.  A file descriptor for a socket that is connecting
          asynchronously shall indicate that it is ready for writing, once
          a connection has been established.

          Provided the application does not perform any action that results
          in unspecified or undefined behavior, the value of the fd and
          events members of each element of fds shall not be modified by
          poll().


-----------------------------------------------------------------

::

          Upon successful completion, poll() shall return a non-negative
          value. A positive value indicates the total number of pollfd
          structures that have selected events (that is, those for which
          the revents member is non-zero). A value of 0 indicates that the
          call timed out and no file descriptors have been selected. Upon
          failure, poll() shall return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The poll() function shall fail if:

          EAGAIN The allocation of internal data structures failed but a
                 subsequent request may succeed.

          EINTR  A signal was caught during poll().

          EINVAL The nfds argument is greater than {OPEN_MAX}, or one of
                 the fd members refers to a STREAM or multiplexer that is
                 linked (directly or indirectly) downstream from a
                 multiplexer.

          The following sections are informative.


---------------------------------------------------------

::

      Checking for Events on a Stream
          The following example opens a pair of STREAMS devices and then
          waits for either one to become writable. This example proceeds as
          follows:

           1. Sets the timeout parameter to 500 milliseconds.

           2. Opens the STREAMS devices /dev/dev0 and /dev/dev1, and then
              polls them, specifying POLLOUT and POLLWRBAND as the events
              of interest.

              The STREAMS device names /dev/dev0 and /dev/dev1 are only
              examples of how STREAMS devices can be named; STREAMS naming
              conventions may vary among systems conforming to the
              POSIX.1‐2008.

           3. Uses the ret variable to determine whether an event has
              occurred on either of the two STREAMS. The poll() function is
              given 500 milliseconds to wait for an event to occur (if it
              has not occurred prior to the poll() call).

           4. Checks the returned value of ret.  If a positive value is
              returned, one of the following can be done:

               a. Priority data can be written to the open STREAM on
                  priority bands greater than 0, because the POLLWRBAND
                  event occurred on the open STREAM (fds[0] or fds[1]).

               b. Data can be written to the open STREAM on priority-band
                  0, because the POLLOUT event occurred on the open STREAM
                  (fds[0] or fds[1]).

           5. If the returned value is not a positive value, permission to
              write data to the open STREAM (on any priority band) is
              denied.

           6. If the POLLHUP event occurs on the open STREAM (fds[0] or
              fds[1]), the device on the open STREAM has disconnected.

              #include <stropts.h>
              #include <poll.h>
              ...
              struct pollfd fds[2];
              int timeout_msecs = 500;
              int ret;
                  int i;

              /* Open STREAMS device. */
              fds[0].fd = open("/dev/dev0", ...);
              fds[1].fd = open("/dev/dev1", ...);
              fds[0].events = POLLOUT | POLLWRBAND;
              fds[1].events = POLLOUT | POLLWRBAND;

              ret = poll(fds, 2, timeout_msecs);

              if (ret > 0) {
                  /* An event on one of the fds has occurred. */
                  for (i=0; i<2; i++) {
                      if (fds[i].revents & POLLWRBAND) {
                      /* Priority data may be written on device number i. */
              ...
                      }
                      if (fds[i].revents & POLLOUT) {
                      /* Data may be written on device number i. */
              ...
                      }
                      if (fds[i].revents & POLLHUP) {
                      /* A hangup has occurred on device number i. */
              ...
                      }
                  }
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The POLLHUP event does not occur for FIFOs just because the FIFO
          is not open for writing. It only occurs when the FIFO is closed
          by the last writer and persists until some process opens the FIFO
          for writing or until all read-only file descriptors for the FIFO
          are closed.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.6, STREAMS, getmsg(3p), pselect(3p), putmsg(3p),
          read(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, poll.h(0p),
          stropts.h(0p)


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

   IEEE/The Open Group               2017                          POLL(3P)

--------------

Pages that refer to this page: `poll.h(0p) <../man0/poll.h.0p.html>`__, 
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`connect(3p) <../man3/connect.3p.html>`__, 
`getmsg(3p) <../man3/getmsg.3p.html>`__, 
`ioctl(3p) <../man3/ioctl.3p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`putmsg(3p) <../man3/putmsg.3p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__

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
