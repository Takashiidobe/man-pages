.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ether_aton(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ETHER_ATON(3)           Linux Programmer's Manual          ETHER_ATON(3)

NAME
-------------------------------------------------

::

          ether_aton, ether_ntoa, ether_ntohost, ether_hostton, ether_line,
          ether_ntoa_r, ether_aton_r - Ethernet address manipulation
          routines


---------------------------------------------------------

::

          #include <netinet/ether.h>

          char *ether_ntoa(const struct ether_addr *addr);
          struct ether_addr *ether_aton(const char *asc);

          int ether_ntohost(char *hostname, const struct ether_addr *addr);
          int ether_hostton(const char *hostname, struct ether_addr *addr);

          int ether_line(const char *line, struct ether_addr *addr,
                         char *hostname);

          /* GNU extensions */
          char *ether_ntoa_r(const struct ether_addr *addr, char *buf);

          struct ether_addr *ether_aton_r(const char *asc,
                                          struct ether_addr *addr);


---------------------------------------------------------------

::

          ether_aton() converts the 48-bit Ethernet host address asc from
          the standard hex-digits-and-colons notation into binary data in
          network byte order and returns a pointer to it in a statically
          allocated buffer, which subsequent calls will overwrite.
          ether_aton() returns NULL if the address is invalid.

          The ether_ntoa() function converts the Ethernet host address addr
          given in network byte order to a string in standard hex-digits-
          and-colons notation, omitting leading zeros.  The string is
          returned in a statically allocated buffer, which subsequent calls
          will overwrite.

          The ether_ntohost() function maps an Ethernet address to the
          corresponding hostname in /etc/ethers and returns nonzero if it
          cannot be found.

          The ether_hostton() function maps a hostname to the corresponding
          Ethernet address in /etc/ethers and returns nonzero if it cannot
          be found.

          The ether_line() function parses a line in /etc/ethers format
          (ethernet address followed by whitespace followed by hostname;
          '#' introduces a comment) and returns an address and hostname
          pair, or nonzero if it cannot be parsed.  The buffer pointed to
          by hostname must be sufficiently long, for example, have the same
          length as line.

          The functions ether_ntoa_r() and ether_aton_r() are reentrant
          thread-safe versions of ether_ntoa() and ether_aton()
          respectively, and do not use static buffers.

          The structure ether_addr is defined in <net/ethernet.h> as:

              struct ether_addr {
                  uint8_t ether_addr_octet[6];
              }


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────────────────┬───────────────┬───────────┐
          │Interface                           │ Attribute     │ Value     │
          ├────────────────────────────────────┼───────────────┼───────────┤
          │ether_aton(), ether_ntoa()          │ Thread safety │ MT-Unsafe │
          ├────────────────────────────────────┼───────────────┼───────────┤
          │ether_ntohost(), ether_hostton(),   │ Thread safety │ MT-Safe   │
          │ether_line(), ether_ntoa_r(),       │               │           │
          │ether_aton_r()                      │               │           │
          └────────────────────────────────────┴───────────────┴───────────┘


-------------------------------------------------------------------

::

          4.3BSD, SunOS.


-------------------------------------------------

::

          In glibc 2.2.5 and earlier, the implementation of ether_line() is
          broken.


---------------------------------------------------------

::

          ethers(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                  ETHER_ATON(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__

--------------

`Copyright and license for this manual
page <../man3/ether_aton.3.license.html>`__

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
