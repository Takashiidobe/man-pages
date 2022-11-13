.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

protocols(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PROTOCOLS(5)            Linux Programmer's Manual           PROTOCOLS(5)

NAME
-------------------------------------------------

::

          protocols - protocols definition file


---------------------------------------------------------------

::

          This file is a plain ASCII file, describing the various DARPA
          internet protocols that are available from the TCP/IP subsystem.
          It should be consulted instead of using the numbers in the ARPA
          include files, or, even worse, just guessing them.  These numbers
          will occur in the protocol field of any IP header.

          Keep this file untouched since changes would result in incorrect
          IP packages.  Protocol numbers and names are specified by the
          IANA (Internet Assigned Numbers Authority).

          Each line is of the following format:

                 protocol number aliases ...

          where the fields are delimited by spaces or tabs.  Empty lines
          are ignored.  If a line contains a hash mark (#), the hash mark
          and the part of the line following it are ignored.

          The field descriptions are:

          protocol
                 the native name for the protocol.  For example ip, tcp, or
                 udp.

          number the official number for this protocol as it will appear
                 within the IP header.

          aliases
                 optional aliases for the protocol.

          This file might be distributed over a network using a network-
          wide naming service like Yellow Pages/NIS or BIND/Hesiod.


---------------------------------------------------

::

          /etc/protocols
                 The protocols definition file.


---------------------------------------------------------

::

          getprotoent(3)

          ⟨http://www.iana.org/assignments/protocol-numbers⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2012-08-05                   PROTOCOLS(5)

--------------

Pages that refer to this page:
`getsockopt(2) <../man2/getsockopt.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`getprotoent(3) <../man3/getprotoent.3.html>`__, 
`getprotoent_r(3) <../man3/getprotoent_r.3.html>`__, 
`services(5) <../man5/services.5.html>`__

--------------

`Copyright and license for this manual
page <../man5/protocols.5.license.html>`__

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
