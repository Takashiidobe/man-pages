.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

putmsg(3p) — Linux manual page
==============================

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

   PUTMSG(3P)              POSIX Programmer's Manual             PUTMSG(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          putmsg, putpmsg — send a message on a STREAM (STREAMS)


---------------------------------------------------------

::

          #include <stropts.h>

          int putmsg(int fildes, const struct strbuf *ctlptr,
              const struct strbuf *dataptr, int flags);
          int putpmsg(int fildes, const struct strbuf *ctlptr,
              const struct strbuf *dataptr, int band, int flags);


---------------------------------------------------------------

::

          The putmsg() function shall create a message from a process
          buffer(s) and send the message to a STREAMS file. The message may
          contain either a data part, a control part, or both. The data and
          control parts are distinguished by placement in separate buffers,
          as described below. The semantics of each part are defined by the
          STREAMS module that receives the message.

          The putpmsg() function is equivalent to putmsg(), except that the
          process can send messages in different priority bands.  Except
          where noted, all requirements on putmsg() also pertain to
          putpmsg().

          The fildes argument specifies a file descriptor referencing an
          open STREAM. The ctlptr and dataptr arguments each point to a
          strbuf structure.

          The ctlptr argument points to the structure describing the
          control part, if any, to be included in the message. The buf
          member in the strbuf structure points to the buffer where the
          control information resides, and the len member indicates the
          number of bytes to be sent. The maxlen member is not used by
          putmsg().  In a similar manner, the argument dataptr specifies
          the data, if any, to be included in the message. The flags
          argument indicates what type of message should be sent and is
          described further below.

          To send the data part of a message, the application shall ensure
          that dataptr is not a null pointer and the len member of dataptr
          is 0 or greater. To send the control part of a message, the
          application shall ensure that the corresponding values are set
          for ctlptr.  No data (control) part shall be sent if either
          dataptr(ctlptr) is a null pointer or the len member of
          dataptr(ctlptr) is set to -1.

          For putmsg(), if a control part is specified and flags is set to
          RS_HIPRI, a high priority message shall be sent. If no control
          part is specified, and flags is set to RS_HIPRI, putmsg() shall
          fail and set errno to [EINVAL].  If flags is set to 0, a normal
          message (priority band equal to 0) shall be sent.  If a control
          part and data part are not specified and flags is set to 0, no
          message shall be sent and 0 shall be returned.

          For putpmsg(), the flags are different. The flags argument is a
          bitmask with the following mutually-exclusive flags defined:
          MSG_HIPRI and MSG_BAND. If flags is set to 0, putpmsg() shall
          fail and set errno to [EINVAL].  If a control part is specified
          and flags is set to MSG_HIPRI and band is set to 0, a high-
          priority message shall be sent. If flags is set to MSG_HIPRI and
          either no control part is specified or band is set to a non-zero
          value, putpmsg() shall fail and set errno to [EINVAL].  If flags
          is set to MSG_BAND, then a message shall be sent in the priority
          band specified by band.  If a control part and data part are not
          specified and flags is set to MSG_BAND, no message shall be sent
          and 0 shall be returned.

          The putmsg() function shall block if the STREAM write queue is
          full due to internal flow control conditions, with the following
          exceptions:

           *  For high-priority messages, putmsg() shall not block on this
              condition and continues processing the message.

           *  For other messages, putmsg() shall not block but shall fail
              when the write queue is full and O_NONBLOCK is set.

          The putmsg() function shall also block, unless prevented by lack
          of internal resources, while waiting for the availability of
          message blocks in the STREAM, regardless of priority or whether
          O_NONBLOCK has been specified. No partial message shall be sent.


-----------------------------------------------------------------

::

          Upon successful completion, putmsg() and putpmsg() shall return
          0; otherwise, they shall return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The putmsg() and putpmsg() functions shall fail if:

          EAGAIN A non-priority message was specified, the O_NONBLOCK flag
                 is set, and the STREAM write queue is full due to internal
                 flow control conditions; or buffers could not be allocated
                 for the message that was to be created.

          EBADF  fildes is not a valid file descriptor open for writing.

          EINTR  A signal was caught during putmsg().

          EINVAL An undefined value is specified in flags, or flags is set
                 to RS_HIPRI or MSG_HIPRI and no control part is supplied,
                 or the STREAM or multiplexer referenced by fildes is
                 linked (directly or indirectly) downstream from a
                 multiplexer, or flags is set to MSG_HIPRI and band is non-
                 zero (for putpmsg() only).

          ENOSR  Buffers could not be allocated for the message that was to
                 be created due to insufficient STREAMS memory resources.

          ENOSTR A STREAM is not associated with fildes.

          ENXIO  A hangup condition was generated downstream for the
                 specified STREAM.

          EPIPE or EIO
                 The fildes argument refers to a STREAMS-based pipe and the
                 other end of the pipe is closed. A SIGPIPE signal is
                 generated for the calling thread.

          ERANGE The size of the data part of the message does not fall
                 within the range specified by the maximum and minimum
                 packet sizes of the topmost STREAM module. This value is
                 also returned if the control part of the message is larger
                 than the maximum configured size of the control part of a
                 message, or if the data part of a message is larger than
                 the maximum configured size of the data part of a message.

          In addition, putmsg() and putpmsg() shall fail if the STREAM head
          had processed an asynchronous error before the call. In this
          case, the value of errno does not reflect the result of putmsg()
          or putpmsg(), but reflects the prior error.

          The following sections are informative.


---------------------------------------------------------

::

      Sending a High-Priority Message
          The value of fd is assumed to refer to an open STREAMS file. This
          call to putmsg() does the following:

           1. Creates a high-priority message with a control part and a
              data part, using the buffers pointed to by ctrlbuf and
              databuf, respectively.

           2. Sends the message to the STREAMS file identified by fd.

              #include <stropts.h>
              #include <string.h>
              ...
              int fd;
              char *ctrlbuf = "This is the control part";
              char *databuf = "This is the data part";
              struct strbuf ctrl;
              struct strbuf data;
              int ret;

              ctrl.buf = ctrlbuf;
              ctrl.len = strlen(ctrlbuf);

              data.buf = databuf;
              data.len = strlen(databuf);

              ret = putmsg(fd, &ctrl, &data, MSG_HIPRI);

      Using putpmsg()
          This example has the same effect as the previous example. In this
          example, however, the putpmsg() function creates and sends the
          message to the STREAMS file.

              #include <stropts.h>
              #include <string.h>
              ...
              int fd;
              char *ctrlbuf = "This is the control part";
              char *databuf = "This is the data part";
              struct strbuf ctrl;
              struct strbuf data;
              int ret;

              ctrl.buf = ctrlbuf;
              ctrl.len = strlen(ctrlbuf);

              data.buf = databuf;
              data.len = strlen(databuf);

              ret = putpmsg(fd, &ctrl, &data, 0, MSG_HIPRI);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The putmsg() and putpmsg() functions may be removed in a future
          version.


---------------------------------------------------------

::

          Section 2.6, STREAMS, getmsg(3p), poll(3p), read(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, stropts.h(0p)


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

   IEEE/The Open Group               2017                        PUTMSG(3P)

--------------

Pages that refer to this page:
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`getmsg(3p) <../man3/getmsg.3p.html>`__, 
`ioctl(3p) <../man3/ioctl.3p.html>`__, 
`poll(3p) <../man3/poll.3p.html>`__

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
