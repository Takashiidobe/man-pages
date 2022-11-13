.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umad_recv(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UMAD_RECV(3)           OpenIB Programmer's Manual           UMAD_RECV(3)

NAME
-------------------------------------------------

::

          umad_recv - receive umad


---------------------------------------------------------

::

          #include <infiniband/umad.h>

          int umad_recv(int portid, void *umad, int *length, int timeout_ms);


---------------------------------------------------------------

::

          umad_recv() waits up to timeout_ms milliseconds for an incoming
          MAD message to be received from the port specified by portid.

          A MAD "message" consists of a single MAD packet or a coalesced
          multipacket RMPP transmission.  In the RMPP case the header of
          the first RMPP packet is returned as the header of the buffer and
          the buffer data contains the coalesced data section of each
          subsequent RMPP MAD packet within the transmission.  Thus all the
          RMPP headers except the first are not copied to user space from
          the kernel.

          The message is copied to the umad buffer if there is sufficient
          room and the received length is indicated.  If the buffer is not
          large enough, the size of the umad buffer needed is returned in
          length.  A negative timeout_ms makes the function block until a
          packet is received. A timeout_ms parameter of zero indicates a
          non blocking read.

          Note length is a pointer to the length of the data portion of the
          umad buffer.  This means that umad must point to a buffer at
          least umad_size() + *length bytes long.

          Note also that *length must be >= 256 bytes.  This length allows
          for at least a single MAD packet to be returned.


-----------------------------------------------------------------

::

          umad_recv() on success return the agentid; on error, errno is set
          and a negative value is returned as follows:
           -EINVAL      invalid port handle or agentid or *length is less
          than the minimum supported
           -EIO         receive operation failed
           -EWOULDBLOCK non blocking read can't be fulfilled
           -ENOSPC      The provided buffer is not long enough for the
          complete message.


---------------------------------------------------------

::

          umad_poll(3)


-----------------------------------------------------

::

          Hal Rosenstock <halr@voltaire.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the rdma-core (RDMA Core Userspace Libraries
          and Daemons) project.  Information about the project can be found
          at ⟨https://github.com/linux-rdma/rdma-core⟩.  If you have a bug
          report for this manual page, send it to
          linux-rdma@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/linux-rdma/rdma-core.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-18.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenIB                        May 11, 2007                  UMAD_RECV(3)

--------------

Pages that refer to this page:
`umad_poll(3) <../man3/umad_poll.3.html>`__

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
