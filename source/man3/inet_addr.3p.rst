.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inet_addr(3p) — Linux manual page
=================================

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

   INET_ADDR(3P)           POSIX Programmer's Manual          INET_ADDR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          inet_addr, inet_ntoa — IPv4 address manipulation


---------------------------------------------------------

::

          #include <arpa/inet.h>

          in_addr_t inet_addr(const char *cp);
          char *inet_ntoa(struct in_addr in);


---------------------------------------------------------------

::

          The inet_addr() function shall convert the string pointed to by
          cp, in the standard IPv4 dotted decimal notation, to an integer
          value suitable for use as an Internet address.

          The inet_ntoa() function shall convert the Internet host address
          specified by in to a string in the Internet standard dot
          notation.

          The inet_ntoa() function need not be thread-safe.

          All Internet addresses shall be returned in network order (bytes
          ordered from left to right).

          Values specified using IPv4 dotted decimal notation take one of
          the following forms:

          a.b.c.d   When four parts are specified, each shall be
                    interpreted as a byte of data and assigned, from left
                    to right, to the four bytes of an Internet address.

          a.b.c     When a three-part address is specified, the last part
                    shall be interpreted as a 16-bit quantity and placed in
                    the rightmost two bytes of the network address. This
                    makes the three-part address format convenient for
                    specifying Class B network addresses as "128.net.host".

          a.b       When a two-part address is supplied, the last part
                    shall be interpreted as a 24-bit quantity and placed in
                    the rightmost three bytes of the network address. This
                    makes the two-part address format convenient for
                    specifying Class A network addresses as "net.host".

          a         When only one part is given, the value shall be stored
                    directly in the network address without any byte
                    rearrangement.

          All numbers supplied as parts in IPv4 dotted decimal notation may
          be decimal, octal, or hexadecimal, as specified in the ISO C
          standard (that is, a leading 0x or 0X implies hexadecimal;
          otherwise, a leading '0' implies octal; otherwise, the number is
          interpreted as decimal).


-----------------------------------------------------------------

::

          Upon successful completion, inet_addr() shall return the Internet
          address. Otherwise, it shall return (in_addr_t)(-1).

          The inet_ntoa() function shall return a pointer to the network
          address in Internet standard dot notation.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The return value of inet_ntoa() may point to static data that may
          be overwritten by subsequent calls to inet_ntoa().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          endhostent(3p), endnetent(3p)

          The Base Definitions volume of POSIX.1‐2017, arpa_inet.h(0p)


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

   IEEE/The Open Group               2017                     INET_ADDR(3P)

--------------

Pages that refer to this page:
`arpa_inet.h(0p) <../man0/arpa_inet.h.0p.html>`__, 
`endservent(3p) <../man3/endservent.3p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__, 
`inet_ntop(3p) <../man3/inet_ntop.3p.html>`__

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
