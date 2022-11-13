.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inet_ntop(3p) — Linux manual page
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

   INET_NTOP(3P)           POSIX Programmer's Manual          INET_NTOP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          inet_ntop, inet_pton — convert IPv4 and IPv6 addresses between
          binary and text form


---------------------------------------------------------

::

          #include <arpa/inet.h>

          const char *inet_ntop(int af, const void *restrict src,
              char *restrict dst, socklen_t size);
          int inet_pton(int af, const char *restrict src, void *restrict dst);


---------------------------------------------------------------

::

          The inet_ntop() function shall convert a numeric address into a
          text string suitable for presentation. The af argument shall
          specify the family of the address. This can be AF_INET or
          AF_INET6.  The src argument points to a buffer holding an IPv4
          address if the af argument is AF_INET, or an IPv6 address if the
          af argument is AF_INET6; the address must be in network byte
          order. The dst argument points to a buffer where the function
          stores the resulting text string; it shall not be NULL. The size
          argument specifies the size of this buffer, which shall be large
          enough to hold the text string (INET_ADDRSTRLEN characters for
          IPv4, INET6_ADDRSTRLEN characters for IPv6).

          The inet_pton() function shall convert an address in its standard
          text presentation form into its numeric binary form. The af
          argument shall specify the family of the address. The AF_INET and
          AF_INET6 address families shall be supported. The src argument
          points to the string being passed in. The dst argument points to
          a buffer into which the function stores the numeric address; this
          shall be large enough to hold the numeric address (32 bits for
          AF_INET, 128 bits for AF_INET6).

          If the af argument of inet_pton() is AF_INET, the src string
          shall be in the standard IPv4 dotted-decimal form:

              ddd.ddd.ddd.ddd

          where "ddd" is a one to three digit decimal number between 0 and
          255 (see inet_addr(3p)).  The inet_pton() function does not
          accept other formats (such as the octal numbers, hexadecimal
          numbers, and fewer than four numbers that inet_addr() accepts).

          If the af argument of inet_pton() is AF_INET6, the src string
          shall be in one of the following standard IPv6 text forms:

           1. The preferred form is "x:x:x:x:x:x:x:x", where the 'x's are
              the hexadecimal values of the eight 16-bit pieces of the
              address.  Leading zeros in individual fields can be omitted,
              but there shall be one to four hexadecimal digits in every
              field.

           2. A string of contiguous zero fields in the preferred form can
              be shown as "::".  The "::" can only appear once in an
              address. Unspecified addresses ("0:0:0:0:0:0:0:0") may be
              represented simply as "::".

           3. A third form that is sometimes more convenient when dealing
              with a mixed environment of IPv4 and IPv6 nodes is
              "x:x:x:x:x:x:d.d.d.d", where the 'x's are the hexadecimal
              values of the six high-order 16-bit pieces of the address,
              and the 'd's are the decimal values of the four low-order
              8-bit pieces of the address (standard IPv4 representation).

          Note:
              A more extensive description of the standard representations
              of IPv6 addresses can be found in RFC 2373.


-----------------------------------------------------------------

::

          The inet_ntop() function shall return a pointer to the buffer
          containing the text string if the conversion succeeds, and NULL
          otherwise, and set errno to indicate the error.

          The inet_pton() function shall return 1 if the conversion
          succeeds, with the address pointed to by dst in network byte
          order. It shall return 0 if the input is not a valid IPv4 dotted-
          decimal string or a valid IPv6 address string, or -1 with errno
          set to [EAFNOSUPPORT] if the af argument is unknown.


-----------------------------------------------------

::

          The inet_ntop() and inet_pton() functions shall fail if:

          EAFNOSUPPORT
                 The af argument is invalid.

          ENOSPC The size of the inet_ntop() result buffer is inadequate.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

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

   IEEE/The Open Group               2017                     INET_NTOP(3P)

--------------

Pages that refer to this page:
`arpa_inet.h(0p) <../man0/arpa_inet.h.0p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__, 
`getnameinfo(3p) <../man3/getnameinfo.3p.html>`__

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
