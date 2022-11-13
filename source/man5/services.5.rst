.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

services(5) — Linux manual page
===============================

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

   SERVICES(5)             Linux Programmer's Manual            SERVICES(5)

NAME
-------------------------------------------------

::

          services - Internet network services list


---------------------------------------------------------------

::

          services is a plain ASCII file providing a mapping between human-
          friendly textual names for internet services, and their
          underlying assigned port numbers and protocol types.  Every
          networking program should look into this file to get the port
          number (and protocol) for its service.  The C library routines
          getservent(3), getservbyname(3), getservbyport(3), setservent(3),
          and endservent(3) support querying this file from programs.

          Port numbers are assigned by the IANA (Internet Assigned Numbers
          Authority), and their current policy is to assign both TCP and
          UDP protocols when assigning a port number.  Therefore, most
          entries will have two entries, even for TCP-only services.

          Port numbers below 1024 (so-called "low numbered" ports) can be
          bound to only by root (see bind(2), tcp(7), and udp(7)).  This is
          so clients connecting to low numbered ports can trust that the
          service running on the port is the standard implementation, and
          not a rogue service run by a user of the machine.  Well-known
          port numbers specified by the IANA are normally located in this
          root-only space.

          The presence of an entry for a service in the services file does
          not necessarily mean that the service is currently running on the
          machine.  See inetd.conf(5) for the configuration of Internet
          services offered.  Note that not all networking services are
          started by inetd(8), and so won't appear in inetd.conf(5).  In
          particular, news (NNTP) and mail (SMTP) servers are often
          initialized from the system boot scripts.

          The location of the services file is defined by _PATH_SERVICES in
          <netdb.h>.  This is usually set to /etc/services.

          Each line describes one service, and is of the form:

                 service-name   port/protocol   [aliases ...]

          where:

          service-name
                 is the friendly name the service is known by and looked up
                 under.  It is case sensitive.  Often, the client program
                 is named after the service-name.

          port   is the port number (in decimal) to use for this service.

          protocol
                 is the type of protocol to be used.  This field should
                 match an entry in the protocols(5) file.  Typical values
                 include tcp and udp.

          aliases
                 is an optional space or tab separated list of other names
                 for this service.  Again, the names are case sensitive.

          Either spaces or tabs may be used to separate the fields.

          Comments are started by the hash sign (#) and continue until the
          end of the line.  Blank lines are skipped.

          The service-name should begin in the first column of the file,
          since leading spaces are not stripped.  service-names can be any
          printable characters excluding space and tab.  However, a
          conservative choice of characters should be used to minimize
          compatibility problems.  For example, a-z, 0-9, and hyphen (-)
          would seem a sensible choice.

          Lines not matching this format should not be present in the file.
          (Currently, they are silently skipped by getservent(3),
          getservbyname(3), and getservbyport(3).  However, this behavior
          should not be relied on.)

          This file might be distributed over a network using a network-
          wide naming service like Yellow Pages/NIS or BIND/Hesiod.

          A sample services file might look like this:

              netstat         15/tcp
              qotd            17/tcp          quote
              msp             18/tcp          # message send protocol
              msp             18/udp          # message send protocol
              chargen         19/tcp          ttytst source
              chargen         19/udp          ttytst source
              ftp             21/tcp
              # 22 - unassigned
              telnet          23/tcp


---------------------------------------------------

::

          /etc/services
                 The Internet network services list

          <netdb.h>
                 Definition of _PATH_SERVICES


---------------------------------------------------------

::

          listen(2), endservent(3), getservbyname(3), getservbyport(3),
          getservent(3), setservent(3), inetd.conf(5), protocols(5),
          inetd(8)

          Assigned Numbers RFC, most recently RFC 1700, (AKA STD0002).

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-04-11                    SERVICES(5)

--------------

Pages that refer to this page:
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`getservent(3) <../man3/getservent.3.html>`__, 
`getservent_r(3) <../man3/getservent_r.3.html>`__, 
`nscd(8) <../man8/nscd.8.html>`__, 
`rpc.rquotad(8) <../man8/rpc.rquotad.8.html>`__, 
`rsyslogd(8) <../man8/rsyslogd.8.html>`__

--------------

`Copyright and license for this manual
page <../man5/services.5.license.html>`__

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
